import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nike_shop/main.dart';
import 'package:nike_shop/pages/detailPage.dart';

import 'package:nike_shop/models/itemClass.dart';
import 'package:nike_shop/pages/gridViewItem.dart';
import 'package:nike_shop/service/firebase.dart';

class horizonScrollDB extends StatefulWidget {
  const horizonScrollDB({super.key});
  //  final String genderFilter;
  // const horizonScrollDB({Key? key, required this.genderFilter}) : super(key: key);

  @override
  State<horizonScrollDB> createState() => _horizonScrollDBState();
}

var fmt = NumberFormat.decimalPattern();
Set setCol = {};
List<String> itemCol = [];
String itemTypeSel = '';
firebaseService firebaseItem = firebaseService();

class _horizonScrollDBState extends State<horizonScrollDB> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firebaseItem.getItem(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("ERROR"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData == null) {
            print(snapshot);
            return Center(child: Text('Null maybe'));
          }

          final itemlist = snapshot.data!.docs
              .map((doc) =>
                  allitem.fromFirestore(doc.data() as Map<String, dynamic>))
              .toList();

          for (var item in itemlist) {
            if (!setCol.contains(item.type)) {
              setCol.add(item.type);
              itemCol.add(item.type);
            }
          }

          var ran = Random();
          int ranIndex = ran.nextInt(itemCol.length);
          String typeToShow = itemCol[ranIndex];

          List<allitem> listToShow =
              itemlist.where((item) => item.type == typeToShow).toList();

          return Container(
            child: Column(
              children: [
                // title
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //left
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              typeToShow,
                              style: GoogleFonts.getFont('Kanit',
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            // Text('down')
                            Text(
                              "สินค้าแนะนำ",
                              style: GoogleFonts.getFont('Kanit',
                                  fontSize: 20, color: Colors.grey),
                            ),
                          ])),
                      //right
                      GestureDetector(
                          child: Text('ดูทั้งหมด',
                              style: GoogleFonts.getFont('Kanit',
                                  color: Colors.grey)),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => gridViewItem(
                                        item: listToShow,
                                      ))))
                    ],
                  ),
                ),
                SizedBox(height: 5),
                // list view
                Container(
                  height: 280,
                  child: ListView.builder(
                      itemCount: listToShow.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, Index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      selectItem: listToShow[Index]))),
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                //image
                                Container(
                                  height: 175,
                                  width: 165,
                                  child: Stack(children: [
                                    Center(child: CircularProgressIndicator()),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        listToShow[Index].pic,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ]),
                                ),
                                //detail
                                Container(
                                  width: 160,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Name
                                      Text(
                                        listToShow[Index].name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      // Item Type
                                      Text(
                                        listToShow[Index].itemType,
                                        style: GoogleFonts.getFont('Kanit',
                                            fontWeight: FontWeight.w300),
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Price
                                      Text(
                                        "\$" +
                                            fmt.format(listToShow[Index].price),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
