import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nike_shop/main.dart';
import 'package:nike_shop/pages/testDatabase.dart';
import 'package:nike_shop/service/firebase.dart';
import 'package:nike_shop/widgets/drawerPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_shop/widgets/horizonScrollDB.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle thaiFont = GoogleFonts.kanit();

  String pageName = "หน้าแรก";
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  TextEditingController textCon = TextEditingController();
  final firebaseService store = firebaseService();

  void floatingbuttonClick() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textCon,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      store.addMassage(textCon.text);
                      textCon.clear();
                      Navigator.pop(context);
                    },
                    child: Text('data')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error' + '$snapshot')),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Row(children: [
                Text(pageName, style: thaiFont),
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                AlertDialog(title: Text("data")));
                      });
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('data'),
                            );
                          });
                    });
                  },
                  icon: Icon(Icons.shopping_bag),
                )
              ]),
            ),
            drawer: drawerPage(),
            body: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('สวัสดีตอน $shortName',
                                      style: GoogleFonts.getFont(
                                        'Kanit',
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('นี่คือบทสรุปรายวันของคุณ',
                                      style: GoogleFonts.getFont(
                                        'Kanit',
                                        fontSize: 23,
                                        color: Colors.grey,
                                      ))
                                ]),
                            SizedBox(height: 20),
                            horizonScrollDB(),
                            SizedBox(height: 20),
                            horizonScrollDB()
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {
              floatingbuttonClick();
            }),
          );
        }
      },
    );
  }
}
