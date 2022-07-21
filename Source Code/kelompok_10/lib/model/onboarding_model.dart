class OnBoardingModel {
  final String images;
  final String title;

  OnBoardingModel({
    required this.images,
    required this.title,
  });
}

List<OnBoardingModel> dataOnboard = [
  OnBoardingModel(
    images: 'assets/images/img-onboard-one.png',
    title: 'Cari Trainer Fitness\nDengan Mudah Disini',
  ),
  OnBoardingModel(
    images: 'assets/images/img-onboard-two.png',
    title: 'Pesan Tempat Gym \nKapanpun Dan Dimanapun',
  ),
  OnBoardingModel(
    images: 'assets/images/img-onboard-three.png',
    title: 'Join Membership Untuk\nHarga Yang Lebih Terjangkau',
  ),
];
