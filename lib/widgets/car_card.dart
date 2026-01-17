import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../models/car.dart';
import '../theme/app_theme.dart';
import '../screens/car_detail_screen.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final int index;

  const CarCard({super.key, required this.car, required this.index});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: 150 * index),
      duration: const Duration(milliseconds: 800),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 600),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CarDetailScreen(car: car),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var scaleTween = Tween<double>(begin: 0.8, end: 1.0).chain(
                  CurveTween(curve: Curves.easeOutBack),
                );
                var fadeTween = Tween<double>(begin: 0.0, end: 1.0);
                
                return ScaleTransition(
                  scale: animation.drive(scaleTween),
                  child: FadeTransition(
                    opacity: animation.drive(fadeTween),
                    child: child,
                  ),
                );
              },
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 28),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.cardColor,
                AppTheme.surfaceColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    height: 320,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: car.backgroundColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Hero(
                      tag: 'car-${car.imagePath}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                          child: Image.asset(
                            car.imagePath,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    right: 25,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryColor.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 24,
                    child: Row(
                      children: [
                        _infoChip(Icons.flash_on, '${car.hp} HP'),
                        const SizedBox(width: 10),
                        _infoChip(Icons.calendar_today, '${car.year}'),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                car.brand,
                                style: GoogleFonts.poppins(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [AppTheme.accentColor, Colors.blue],
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.accentColor.withOpacity(0.4),
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'Premium',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            car.name,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryColor.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Text(
                        '€${(car.price / 1000).toStringAsFixed(0)}K',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.7),
            AppTheme.surfaceColor.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.accentColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppTheme.accentColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
