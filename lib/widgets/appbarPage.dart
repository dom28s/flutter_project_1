import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appbarPage extends StatefulWidget {
  const appbarPage({super.key});

  @override
  State<appbarPage> createState() => _appbarPageState();
}

class _appbarPageState extends State<appbarPage> {
  TextStyle thaiFont = GoogleFonts.kanit();
  String fullName = "Thanawat Sodkaew";
  String shortName = "Thanawat";
  String pageName = "เลือกซื้อ";
  final List<String> items = List.generate(20, (index) => 'Item $index');
  List<String> shoe = List.generate(50, (index) => 'show $index');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(pageName, style: thaiFont),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {
              setState(() {
                AlertDialog(
                  title: Text("data"),
                );
              });
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                AlertDialog(
                  title: Text("data"),
                );
              });
            },
            icon: Icon(Icons.shopping_bag),
          ),
        ],
      ),
    );
  }
}
