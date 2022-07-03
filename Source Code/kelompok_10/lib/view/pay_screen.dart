import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kelompok_10/theme/theme.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  FToast fToast = FToast();
  static List<String> subtitle = [
    'Setelah memasukkan kartu ATM dan nomor PIN, pilih menu Transaksi Lainnya',
    'Pilih menu Transfer.',
    'Pilih menu Ke Rek Bank Lain.',
    'Masukan Kode Bank Tujuan : BRI (Kode Bank : 002) lalu klik Benar.',
    'Masukkan jumlah pembayaran sesuai tagihan.',
    'Masukan Nomor Virtual Account 121350000xxxx174.',
  ];

  final List<Item> itemsPanduan = [
    Item(
      header: 'Transfer melalui ATM',
      body: subtitle,
    ),
    Item(
      header: 'Transfer melalui Internet Banking',
      body: subtitle,
    ),
    Item(
      header: 'Transfer melalui Mobile Banking',
      body: subtitle,
    ),
  ];

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  String nomorRekening = '';
  Widget membership() {
    return Container(
      width: displayWidth(context),
      height: 157.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: greyTwoColor.withOpacity(0.15),
            spreadRadius: 1,
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selesaikan dalam',
                style: blackTextStyle.copyWith(
                  fontSize: 18.0,
                  fontWeight: semiBold,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 20.0,
                    width: 20.0,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '00',
                        style: whiteTextStyle.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    ':',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12.0,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '00',
                        style: whiteTextStyle.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    ':',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12.0,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '00',
                        style: whiteTextStyle.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 14.0,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 44.0,
                    width: 44.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blueTwoColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/ic-card.svg',
                      color: primaryColor,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  Text(
                    'Pilih membership',
                    style: blackTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: semiBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ],
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 44.0,
                            width: 44.0,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueTwoColor,
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/ic-card.svg',
                              color: primaryColor,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 14.0,
                          ),
                          Text(
                            item,
                            style: blackTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              icon: SvgPicture.asset('assets/svg/ic-dropdown.svg'),
              iconSize: 14,
              iconEnabledColor: primaryColor,
              iconDisabledColor: blackColor,
              buttonHeight: 75,
              buttonWidth: displayWidth(context),
              buttonPadding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 16.0,
              ),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: blueColor,
              ),
              buttonElevation: 0,
              itemHeight: 75,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 241,
              dropdownWidth: displayWidth(context) - 77.0,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: blueColor,
              ),
              dropdownElevation: 0,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 2,
              scrollbarAlwaysShow: true,
              offset: const Offset(0, 0),
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
        ],
      ),
    );
  }

  Widget detailTransfer() {
    return Container(
      width: displayWidth(context),
      margin: EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: greyTwoColor.withOpacity(0.15),
            spreadRadius: 1,
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lakukan Transfer ke',
            style: blackTextStyle.copyWith(
              fontSize: 18.0,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 44.0,
                child: Image.asset(
                  'assets/images/logo-bri.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Text(
                  'BRI Virtual Account',
                  style: blackTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            width: displayWidth(context),
            padding: const EdgeInsets.all(
              16.0,
            ),
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '730 0012 1108 2404',
                    style: blackTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: semiBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                GestureDetector(
                  onTap: () {
                    nomorRekening = '730 0012 1108 2404';
                    Clipboard.setData(ClipboardData(text: nomorRekening));
                    _showToast();
                  },
                  child: SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: SvgPicture.asset(
                      'assets/svg/ic-copy.svg',
                      color: primaryColor,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Text(
            'Total pembayaran',
            style: blackTextStyle.copyWith(
              fontSize: 18.0,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            width: displayWidth(context),
            padding: const EdgeInsets.all(
              16.0,
            ),
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            child: SizedBox(
              height: 24.0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rp. 20.000',
                  style: blackTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget panduanPembayaran() {
    return Container(
      width: displayWidth(context),
      margin: EdgeInsets.symmetric(
        vertical: defaultMargin,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: whiteColor,
        border: Border.all(
          color: greyFourColor,
          width: 1,
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ExpansionPanelList.radio(
          expandedHeaderPadding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 0.0,
          ),
          elevation: 0,
          children: itemsPanduan
              .map(
                (item) => ExpansionPanelRadio(
                  canTapOnHeader: true,
                  value: item,
                  headerBuilder: (context, isExpanded) => ListTile(
                    dense: true,
                    contentPadding:
                        const EdgeInsets.only(left: 0.0, right: 0.0),
                    title: Text(
                      item.header,
                      style: blackTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: item.body
                          .map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //get number of index
                                Text(
                                  '${item.body.indexOf(e) + 1}. ',
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14.0,
                                    fontWeight: regular,
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 4.0,
                                    ),
                                    child: Text(
                                      e,
                                      style: greyTextStyle.copyWith(
                                        fontSize: 14.0,
                                        fontWeight: regular,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList()),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: defaultMargin,
          ),
          membership(),
          detailTransfer(),
          panduanPembayaran(),
        ],
      ),
    );
  }

  _showToast() {
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: greyFiveColor,
        boxShadow: [
          BoxShadow(
            color: greyTwoColor.withOpacity(0.15),
            spreadRadius: 3,
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Disalin Ke Papan Klip Anda!',
            style: whiteTextStyle.copyWith(
              fontSize: 14.0,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}

String? selectedValue;
final List<String> items = [
  'Paket membership Silver',
  'Paket membership Gold',
  'Paket membership Platinum',
];

class Item {
  Item({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });

  String header;
  List<String> body;
  bool isExpanded;
}
