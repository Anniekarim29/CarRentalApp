import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../models/car.dart';
import '../theme/app_theme.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  car.backgroundColor,
                  AppTheme.backgroundColor,
                  AppTheme.surfaceColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header (Back & Fav)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BounceInLeft(
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                          style: IconButton.styleFrom(
                            backgroundColor: AppTheme.surfaceColor,
                            padding: const EdgeInsets.all(14),
                          ),
                        ),
                      ),
                      BounceInRight(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border, color: Colors.white),
                          style: IconButton.styleFrom(
                            backgroundColor: AppTheme.surfaceColor,
                            padding: const EdgeInsets.all(14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Car Name & Brand
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: FadeInLeft(
                    delay: const Duration(milliseconds: 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                          ).createShader(bounds),
                          child: Text(
                            car.brand.toUpperCase(),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          car.name,
                          style: GoogleFonts.poppins(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Full Screen Car Image with Hero
                Expanded(
                  child: Center(
                    child: Hero(
                      tag: 'car-${car.imagePath}',
                      flightShuttleBuilder: (
                        BuildContext flightContext,
                        Animation<double> animation,
                        HeroFlightDirection flightDirection,
                        BuildContext fromHeroContext,
                        BuildContext toHeroContext,
                      ) {
                        final Hero toHero = toHeroContext.widget as Hero;
                        
                        // Smooth rotation during flight
                        return RotationTransition(
                          turns: Tween<double>(
                            begin: 0.0,
                            end: flightDirection == HeroFlightDirection.push ? 0.05 : -0.05,
                          ).chain(CurveTween(curve: Curves.easeInOutCubic)).animate(animation),
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 1.0, end: 1.1).chain(
                              CurveTween(curve: Curves.easeInOutCubic),
                            ).animate(animation),
                            child: toHero.child,
                          ),
                        );
                      },
                      child: ZoomIn(
                        delay: const Duration(milliseconds: 300),
                        child: Image.asset(
                          car.imagePath,
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.95,
                        ),
                      ),
                    ),
                  ),
                ),

                // Specs & Description Section
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.surfaceColor, AppTheme.cardColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(0.2),
                          blurRadius: 30,
                          offset: const Offset(0, -10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _specItem('Horsepower', '${car.hp} HP', Icons.flash_on),
                            _specItem('Year', '${car.year}', Icons.calendar_today),
                            _specItem('Price', '€${(car.price / 1000).toStringAsFixed(0)}K', Icons.attach_money),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Description',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          car.description,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey[300],
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 35),
                        // Rent Button with Pulse Animation
                        Pulse(
                          infinite: true,
                          duration: const Duration(seconds: 2),
                          child: SizedBox(
                            width: double.infinity,
                            height: 65,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 0,
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.primaryColor.withOpacity(0.6),
                                      blurRadius: 20,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.drive_eta, size: 24),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Rent This Car Now',
                                        style: GoogleFonts.poppins(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _specItem(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.cardColor,
            AppTheme.backgroundColor.withOpacity(0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.accentColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.accentColor, size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.grey[400],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
