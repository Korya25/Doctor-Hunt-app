class FeaturedCardModel {
  final bool isFavorite;
  final double rating;
  final String doctorName;
  final String doctorImage;
  final String priceOfHour;

  FeaturedCardModel({
    required this.isFavorite,
    required this.rating,
    required this.doctorName,
    required this.doctorImage,
    required this.priceOfHour,
  });

  static List<FeaturedCardModel> featuredDoctors = [
    FeaturedCardModel(
      isFavorite: false,
      rating: 3.7,
      doctorName: 'Dr. Crick',
      doctorImage:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      priceOfHour: '\$25.00',
    ),
    FeaturedCardModel(
      isFavorite: true,
      rating: 3,
      doctorName: 'Dr. Strain',
      doctorImage:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      priceOfHour: '\$22.00',
    ),
    FeaturedCardModel(
      isFavorite: false,
      rating: 2.9,
      doctorName: 'Dr. Lachinet',
      doctorImage:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      priceOfHour: '\$29.00',
    ),
    FeaturedCardModel(
      isFavorite: false,
      rating: 3.7,
      doctorName: 'Dr. Crick',
      doctorImage:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      priceOfHour: '\$25.00',
    ),
    FeaturedCardModel(
      isFavorite: true,
      rating: 3,
      doctorName: 'Dr. Strain',
      doctorImage:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      priceOfHour: '\$22.00',
    ),
    FeaturedCardModel(
      isFavorite: false,
      rating: 2.9,
      doctorName: 'Dr. Lachinet',
      doctorImage:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      priceOfHour: '\$29.00',
    ),
  ];
}
