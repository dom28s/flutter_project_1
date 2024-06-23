import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_shop/main.dart';
import 'package:nike_shop/widgets/drawerPage.dart';
import 'package:nike_shop/widgets/horizonScrollDB.dart';

class commuPage extends StatefulWidget {
  const commuPage({super.key});

  @override
  State<commuPage> createState() => _commuPageState();
}

class _commuPageState extends State<commuPage> {
  final TextEditingController textCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ชุมชน',
          style: GoogleFonts.getFont('Kanit'),
        ),
      ),
      drawer: drawerPage(),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.blue[200],
                  width: double.infinity,
                  height: 200,
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: TextField(
                    controller: textCon,
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Icon(Icons.abc),
                        ))
                  ],
                ));
      }),
    );
  }
}
