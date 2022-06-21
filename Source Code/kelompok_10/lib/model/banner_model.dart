class BannerModel {
  final String image;
  final String title;
  final String discount;
  final String date;

  BannerModel({
    required this.image,
    required this.title,
    required this.discount,
    required this.date,
  });
}

List<BannerModel> bannerList = [
  BannerModel(
    image: 'assets/images/banner-one.png',
    title: 'Spesial Discount',
    discount: '10%',
    date: 'Berlaku sampai 30 Juni 2020',
  ),
  BannerModel(
    image: 'assets/images/banner-one.png',
    title: 'Spesial Discount',
    discount: '50%',
    date: 'Berlaku sampai 30 Juni 2020',
  ),
  BannerModel(
    image: 'assets/images/banner-one.png',
    title: 'Spesial Discount',
    discount: '30%',
    date: 'Berlaku sampai 30 Juni 2020',
  ),
];
