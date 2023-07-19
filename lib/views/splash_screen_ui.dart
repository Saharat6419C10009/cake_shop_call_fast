// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cake_shop_call_fast/views/show_shop_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  Timer? _timer;
  @override
  void initState() {
    // หน่วงหน้าจอ
    // Future.delayed(
    //   Duration(seconds: 5),
    //   (){
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => ShowShopUI(),
    //       ),
    //     );
    //   },
    // );
    //------------------------or-----------------------------
    _timer = Timer(
      Duration(seconds: 5),
      (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ShowShopUI(),
          ),
        );
      },
    );

    super.initState();
  }

  @override

  void dispose() {
    // ยกเลิก Timer
    _timer!.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_welcome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.25,
              ),
              Text(
                'CAKE SHOP FOR FAST',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                ),
              ),
              Text(
                'สายด่วนชวนกินเค้ก',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Text(
                  'Cake shops in Thailand that deliver delicious and gorgeously decorated birthday cakes for your special day.',
                  style: GoogleFonts.kanit(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    //เปิดไปหน้า Show_Shop() แบบย้อนกลับไม่ได้ 
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowShopUI(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.cake,
                  ),
                  label: Text(
                    "Let's Go! สั่งกันเลย",
                    style: GoogleFonts.kanit(),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.6,
                      MediaQuery.of(context).size.width * 0.15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: Colors.pink,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
