class Car {
  final String name;
  final String brand;
  final double price;
  final int hp;
  final int year;
  final String imagePath;
  final String category;
  final String description;

  Car({
    required this.name,
    required this.brand,
    required this.price,
    required this.hp,
    required this.year,
    required this.imagePath,
    required this.category,
    required this.description,
  });

  static List<Car> cars = [
    Car(
      name: '911 GT3 Cup',
      brand: 'Porsche',
      price: 225000,
      hp: 510,
      year: 2021,
      imagePath: 'assets/porche.png',
      category: 'GT3',
      description: 'The Porsche 911 GT3 Cup is the first race car based on the current 911 model series 992. It is a powerful, high-performance racing machine designed for competition.',
    ),
    Car(
      name: 'M4 Competition',
      brand: 'BMW',
      price: 85000,
      hp: 503,
      year: 2023,
      imagePath: 'assets/bmw.png',
      category: 'Sports',
      description: 'The BMW M4 Competition Coupe is a high-performance sports car that combines track-ready performance with everyday usability.',
    ),
    Car(
      name: 'R8 V10 Performance',
      brand: 'Audi',
      price: 210000,
      hp: 602,
      year: 2022,
      imagePath: 'assets/audi.png',
      category: 'Supercar',
      description: 'The Audi R8 V10 Performance is a masterpiece of engineering, featuring a screaming naturally aspirated V10 engine and striking design.',
    ),
    Car(
      name: 'AMG GT R',
      brand: 'Mercedes-Benz',
      price: 165000,
      hp: 577,
      year: 2020,
      imagePath: 'assets/mercedes.png',
      category: 'Sports',
      description: 'The Mercedes-AMG GT R is developed directly from the GT3 race car, offering incredible grip and precision on both track and road.',
    ),
  ];
}
