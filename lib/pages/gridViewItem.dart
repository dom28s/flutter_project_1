import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nike_shop/models/itemClass.dart';
import 'package:nike_shop/pages/detailPage.dart';

class gridViewItem extends StatefulWidget {
  final List<allitem> item;

  gridViewItem({required this.item});

  @override
  State<gridViewItem> createState() => _gridViewItemState();
}

class _gridViewItemState extends State<gridViewItem> {
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item[0].type,
          style: GoogleFonts.getFont('Kanit', fontWeight: FontWeight.w400),
        ),
      ),
      body: GridView.builder(
          itemCount: widget.item.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, Index) {
            return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(selectItem: widget.item[Index]))),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // PIC
                      Stack(
                        children: [
                          ClipRRect(
                            child: Image.network(
                              widget.item[Index].pic,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          // Positioned(
                          //     top: 1,
                          //     right: 1,
                          //     child: FloatingActionButton(
                          //       onPressed: () {
                          //         setState(() {
                          //           isPress = !isPress;
                          //         });
                          //       },
                          //       child: Icon(
                          //         isPress
                          //             ? Icons.favorite_sharp
                          //             : Icons.favorite_border_sharp,
                          //         color: Colors.black,
                          //       ),
                          //       tooltip: 'Change Icon',
                          //       mini: true,
                          //       backgroundColor: Colors.white,
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(50)),
                          //     ))
                        ],
                      ),

                      // DETAIL
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // name
                              Text(
                                widget.item[Index].name,
                                maxLines: 2,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              // type
                              Text(widget.item[Index].itemType),
                              SizedBox(height: 10),
                              // price
                              Text(
                                NumberFormat.currency(
                                        symbol: '\$', decimalDigits: 0)
                                    .format(widget.item[Index].price),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.filter_alt_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
