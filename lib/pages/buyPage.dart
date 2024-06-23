import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_shop/widgets/drawerPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_shop/widgets/horizonScrollDB.dart';

class buyPage extends StatefulWidget {
  const buyPage({super.key});

  @override
  State<buyPage> createState() => _buyPageState();
}

class _buyPageState extends State<buyPage> {
  TextStyle thaiFont = GoogleFonts.kanit();
  String fullName = "Thanawat Sodkaew";
  String shortName = "Thanawat";
  String pageName = "หน้าแรก";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text('เลือกซื้อ', style: thaiFont),
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      "ผู้ชาย",
                      style: thaiFont,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "ผู้หญิง",
                      style: thaiFont,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "เด็ก",
                      style: thaiFont,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Jordan",
                      style: thaiFont,
                    ),
                  ),
                ],
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                // Sets the indicator size to match the tab label
              ),
            ),
            drawer: drawerPage(),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          horizonScrollDB(),
                          SizedBox(
                            height: 20,
                          ),
                          horizonScrollDB()
                        ],
                      ),
                    )
                  ],
                ),
                ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          horizonScrollDB(),
                          SizedBox(
                            height: 20,
                          ),
                          horizonScrollDB()
                        ],
                      ),
                    )
                  ],
                ),
                ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          horizonScrollDB(),
                          SizedBox(
                            height: 20,
                          ),
                          horizonScrollDB()
                        ],
                      ),
                    )
                  ],
                ),
                ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          horizonScrollDB(),
                          SizedBox(
                            height: 20,
                          ),
                          horizonScrollDB()
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )));
  }
}
