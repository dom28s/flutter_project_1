import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_shop/pages/buyPage.dart';
import 'package:nike_shop/pages/detailPage.dart';
import 'package:nike_shop/pages/gridViewItem.dart';
import 'package:nike_shop/pages/homePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_shop/pages/massagePage.dart';
import 'package:nike_shop/pages/testDatabase.dart';
import 'package:nike_shop/widgets/horizonScrollDB.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

String fullName = "Test";
String shortName = "Test";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: const Color.fromARGB(255, 0, 0, 0))),
      home: MyHomePage(),
      routes: {
        '/buyPage': (context) => buyPage(),
        // '/gridVIewItem': (context) => gridViewItem(),
        // '/detailPage': (context) => detailPage(),
      },
    );
  }
}
