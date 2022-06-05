class OnBoardingModel {
  final String images;
  final String title;

  OnBoardingModel({
    required this.images,
    required this.title,
  });
}


  List<OnBoardingModel> data = [
    OnBoardingModel(
      images: 'assets/images/onboard-one.png',
      title: 'Cari Trainer Fitness\ndengan mudah disini',
    ),
    OnBoardingModel(
      images: 'assets/images/onboard-two.png',
      title: 'Pesan tempat Gym \nkapanpun dan dimana pu',
    ),
    OnBoardingModel(
      images: 'assets/images/onboard-three.png',
      title: 'Join membership untuk\nharga yang lebih terjangkau',
    ),
  ];