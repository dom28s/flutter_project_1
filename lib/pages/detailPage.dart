import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nike_shop/widgets/horizonScrollDB.dart';

import '../models/itemClass.dart';

class DetailPage extends StatelessWidget {
  final allitem selectItem;

  DetailPage({required this.selectItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(selectItem.name),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.network(selectItem.pic),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          selectItem.name,
                          style: GoogleFonts.getFont(
                            'Kanit',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(symbol: '\$', decimalDigits: 0)
                            .format(selectItem.price),
                        style: GoogleFonts.getFont('Kanit',
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    selectItem.description,
                    style: GoogleFonts.getFont('Kanit', fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  horizonScrollDB()
                ],
              ),
            ),
          ),
        ));
  }
}
