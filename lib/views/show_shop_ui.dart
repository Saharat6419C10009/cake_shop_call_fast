// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_interpolation_to_compose_strings

import 'package:cake_shop_call_fast/models/cake_shop.dart';
import 'package:cake_shop_call_fast/views/show_shop_detail_ui.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowShopUI extends StatefulWidget {
  const ShowShopUI({super.key});

  @override
  State<ShowShopUI> createState() => _ShowShopUIState();
}

class _ShowShopUIState extends State<ShowShopUI> {
  // ตัวแปรเก็บข้อมูลรูป
  List<String> _imgCakeShop = [
    'assets/images/ck01.png',
    'assets/images/ck02.png',
    'assets/images/ck03.png',
    'assets/images/ck04.png',
    'assets/images/ck05.png',
    'assets/images/ck06.png',
    'assets/images/ck07.png',
  ];

  // ตัวแปรเก็บข้อมูลของร้านแต่ละร้าน
  List<CakeShop> _cakeShop = [
    CakeShop(
      name: 'Yellow Spoon Pastry',
      address: 'โครงการเอกมัย คอมเพล็กซ์ (ระหว่างเอกมัย 19 และ 21)',
      phone: '0854822842',
      image1: 's11.jpg',
      image2: 's12.jpg',
      image3: 's13.jpg',
      description:
          'คาเฟ่ขนมหวานที่มีเบเกอรี่โฮมเมดสูตรน้ำตาลน้อยเสิร์ฟเป็นทางเลือกให้กับคนที่ไม่ชอบรสหวานจนเกินไป โดยเมนูขนมมีให้เลือกอิ่มอร่อยกันแบบนับไม่ถ้วน ไม่ว่าจะเป็น ชีสเค้ก, ทาร์ต, บานอฟฟี่, ช็อทเค้ก, ครัมเบิ้ล และอีกมากมาย รวมถึงเค้กวันเกิดแสนอร่อย ก็มีให้เลือกทั้งแบบชิ้นและปอนด์ หลากหลายแบบ และรสชาติใหม่ๆ ที่มีชิมไม่ซ้ำร้านไหน',
      openCloseTime: 'ทุกวัน 10.00-20.00 น.',
      website: 'https://www.yellowspoonpastry.com/',
      facebook: 'https://www.facebook.com/yspastry',
      latitude: '13.736634',
      longitude: '100.587512',
    ),
    CakeShop(
      name: 'Vista Cafe by Verasu',
      address: 'อาคารวีรสุ ถนนวิทยุ',
      phone: '022548100',
      image1: 's21.jpg',
      image2: 's22.jpg',
      image3: 's23.jpg',
      description:
          'Vista Cafe by Verasu ร้านเบเกอรี่เพื่อคนรักสุขภาพอย่างแท้จริง ที่คัดสรรวัตถุดิบชั้นดีที่สดและสะอาด เพื่อรังสรรค์เมนูขนมต่างๆ โดยแป้งที่ทางร้านใช้จะเป็นแป้งสเปลท์ออร์แกนิกกลูเตนต่ำที่ดีต่อสุขภาพ และทุกเมนูยังปราศจากไขมันไม่ดี ซึ่งเป็นสาเหตุที่ทำให้อ้วน ดังนั้นมั่นใจได้ว่าทานเบเกอรี่ร้านนี้หุ่นไม่พังแน่นอน',
      openCloseTime: 'ทุกวัน 09.00-19.00 น',
      website: 'http://www.vistacafe.co.th/',
      facebook: 'https://www.facebook.com/vistacafe',
      latitude: '13.7403',
      longitude: '100.547417',
    ),
    CakeShop(
      name: 'Sweet Spell',
      address: 'สี่แยกเหม่งจ๋าย ประชาอุทิศ19',
      phone: '0846666828',
      image1: 's31.jpg',
      image2: 's32.jpg',
      image3: 's33.jpg',
      description:
          'ร้านเค้กเล็กๆ ที่ความอร่อยไม่เล็ก เปิดบริการครั้งแรกเมื่อปี 2009 ที่ท่าพระจันทร์ ก่อนจะย้ายมาปักหลักอยู่ที่สี่แยกเหม่งจ๋าย แต่ยังคงไว้ซึ่งคุณภาพของรสชาติความอร่อยที่ไม่เปลี่ยนแปลงโดยเมนูเค้กและเบเกอรี่ของ Sweet Spell มีให้เลือกเติมความหวานกันแบบหลากหลายชนิด อาทิ เค้ก เครปเค้ก ชูครีม บานอฟฟี่ ชีสพาย และอีกมากมาย',
      openCloseTime: 'ทุกวัน 10.00-20.00 น. \n(หยุดทุกวันที่ 15 ของเดือน)',
      website: 'http://www.sweetspell.com/dessert-menu/',
      facebook: 'https://www.facebook.com/sweetspellcafe',
      latitude: '13.771741',
      longitude: '100.586662',
    ),
    CakeShop(
      name: 'Larna House',
      address: 'พัฒนาการ 61',
      phone: '023215995',
      image1: 's41.jpg',
      image2: 's42.jpg',
      image3: 's43.jpg',
      description:
          'คิดถึงเค้กช็อกโกแลต ต้องนึกถึง Larna House เพราะร้านนี้มีจุดเด่นอยู่ที่เค้กช็อกโกแลตสุดเข้มข้นสูตรต้นตำรับจากสิงคโปร์ ที่คัดสรรวัตถุดิบหลักอย่างโกโก้จากแหล่งผลิตชั้นยอด ผสานการใส่ใจทุกขั้นตอนและประสบการณ์ของทางร้านกว่า 20 ปีในการสร้างสรรค์เค้กวันเกิด ทำให้ได้เค้กที่มีรสชาติหอม นุ่มละมุน ชุ่มฉ่ำเนื้อช็อกโกแลตทุกคำ',
      openCloseTime: 'ทุกวัน 09.00-21.00 น.',
      website: 'https://larnahouse.com/',
      facebook: 'https://www.facebook.com/%20larnahouse',
      latitude: '13.730245',
      longitude: '100.658385',
    ),
    CakeShop(
      name: 'I bake & You take',
      address: 'วิภาวดีรังสิต 60',
      phone: '0934499447',
      image1: 's51.jpg',
      image2: 's52.jpg',
      image3: 's53.jpg',
      description:
          'ร้านเค้กโฮมเมดสูตรดั้งเดิมต้นตำรับฝรั่งเศส ที่เน้นความสดใหม่และวัตถุดิบชั้นดี โดยรูปแบบของร้านจะเป็นแบบ Made to order ที่รับสั่งเค้กวันเกิด คัพเค้ก คุกกี้ และ บราวนี่ พร้อมทั้งมีบริการจัดส่งครอบคลุมพื้นที่เกือบทุกเขตในกรุงเทพฯ',
      openCloseTime: 'ทุกวัน 07.30-19.30 น.',
      website: 'https://ibakeyoutake.com/',
      facebook: 'https://www.facebook.com/Ibakeyoutakebysine',
      latitude: '13.864575',
      longitude: '100.5823',
    ),
    CakeShop(
      name: 'Coffee bean by dao',
      address: 'ชั้น G สยามพารากอน',
      phone: '026109702',
      image1: 's61.jpg',
      image2: 's62.jpg',
      image3: 's63.jpg',
      description:
          'Coffee bean by dao ร้านเค้กแสนอร่อย ที่สาวกเค้กน้อยคนจะไม่เคยลิ้มลอง ด้วยเมนูเค้กที่มีให้เลือกชิมหลากหลายอย่าง อีกทั้งรสชาติยังถูกปาก ไม่หวานจนเกินไป ราคาต่อชิ้นเริ่มต้นที่ 125 บาทเท่านั้น อาทิ เรนโบว์เค้ก (125 บาท), ช็อกโกแลตมูสเค้ก (140 บาท), เค้กนมสด (150 บาท) และอีกไม่นับถ้วนที่ล้วนแล้วแต่น่ากินสุดๆ',
      openCloseTime: 'ทุกวัน 10.00-22.00 น.',
      website: 'http://www.coffeebeans.co.th/',
      facebook: 'https://www.facebook.com/CoffeeBeansbyDao',
      latitude: '13.7469267',
      longitude: '100.5349883',
    ),
    CakeShop(
      name: 'Bake Ministry',
      address: 'สุขุมวิท 26',
      phone: ' 089-154-0474',
      image1: 's71.jpg',
      image2: 's72.jpg',
      image3: 's73.jpg',
      description:
          'ร้านเค้กสไตล์โฮมเมดที่เริ่มจาก Made to order ก่อนขยับขยายมาเปิดหน้าร้านที่ซอยสุขุมวิท 26 และคงยังสร้างสรรค์เค้กรสชาติดีในรูปแบบต่างๆ หลากหลายสไตล์ไม่ว่าจะเป็น คัพเค้ก เค้กวันเกิด เค้กแต่งงาน หรือเค้กฉลองครบรอบวันสำคัญต่างๆ รวมถึงเบเกอรี่อื่นๆ อย่างคุกกี้ มาการอง ฯลฯ',
      openCloseTime: '10.00-18.00 น. \n(หยุดวันอาทิตย์)',
      website: 'http://www.bakeministry.net/',
      facebook: 'https://www.facebook.com/bakeministry',
      latitude: '13.7281129',
      longitude: '100.5705757',
    ),
  ];
  //ตัวแปรเก็บ INDEX เริ่มต้นของ carousel
  int _carouselCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'CAKE SHOP CALL FAST',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            CarouselSlider.builder(
              itemCount: _imgCakeShop.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.40,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(
                  seconds: 3,
                ),
                onPageChanged: (index, reason) {
                  setState(() {
                    _carouselCurrentIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_imgCakeShop[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            DotsIndicator(
              dotsCount: _imgCakeShop.length,
              position: _carouselCurrentIndex,
              decorator: DotsDecorator(
                activeColor: Colors.pink,
                activeSize: Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: Alignment.center,
              child: Text(
                "สั่งเค้กกันเถอะ",
                style: GoogleFonts.kanit(
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.pink,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.01,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[700],
                  );
                },
                itemCount: _cakeShop.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowShopDetailUI(
                            cakeShop : _cakeShop[index]
                          ),
                        ),
                      );
                    },
                    leading: Image.asset(
                      'assets/images/' + _cakeShop[index].image1!,
                    ),
                    title: Text(
                      _cakeShop[index].name!,
                      style: GoogleFonts.kanit(),
                    ),
                    subtitle: Text(
                      'เวลาทำการ' + _cakeShop[index].openCloseTime!,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.pink,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
