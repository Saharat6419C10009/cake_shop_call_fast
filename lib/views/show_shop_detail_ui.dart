// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_element, unused_import

import 'package:cake_shop_call_fast/models/cake_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ShowShopDetailUI extends StatefulWidget {
  CakeShop? cakeShop;

  ShowShopDetailUI({super.key, this.cakeShop});

  @override
  State<ShowShopDetailUI> createState() => _ShowShopDetailUIState();
}

//เปิดเว็บ
class _ShowShopDetailUIState extends State<ShowShopDetailUI> {
  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

//โทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'CAKE SHOP CALL FAST (DETAIL)',
        ),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icon.arrow_back_ios,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Text(
                  widget.cakeShop!.name!.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 233, 2, 137),
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(108, 255, 255, 255),
                ),
                child: Text(
                  widget.cakeShop!.description!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 95, 95, 95),
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/${widget.cakeShop!.image1!}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/${widget.cakeShop!.image2!}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/${widget.cakeShop!.image3!}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.width * 0.06,
                ),
                child: Column(
                  children: [
                    //show phone number, facebook, website
                    ListTile(
                      onTap: () {
                        _makePhoneCall(widget.cakeShop!.phone!);
                      },
                      leading: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 3, 204, 127),
                      ),
                      title: Text(
                        widget.cakeShop!.phone!,
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(
                            color: Colors.grey[700],
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        _launchInBrowser(widget.cakeShop!.facebook!);
                      },
                      leading: Icon(
                        Icons.facebook,
                        color: Color.fromARGB(255, 50, 97, 224),
                      ),
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          widget.cakeShop!.facebook!,
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        _launchInBrowser(widget.cakeShop!.website!);
                      },
                      leading: Icon(
                        Icons.web,
                        color: Color.fromARGB(255, 110, 2, 233),
                      ),
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          widget.cakeShop!.website!,
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        MapsLauncher.launchCoordinates(
                            double.parse(widget.cakeShop!.latitude!),
                            double.parse(widget.cakeShop!.longitude!),
                            widget.cakeShop!.address!);
                      },
                      leading: Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          widget.cakeShop!.address!,
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
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
}
