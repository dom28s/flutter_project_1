import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nike_shop/main.dart';
import 'package:nike_shop/models/itemClass.dart';
import 'package:nike_shop/service/firebase.dart';
import 'package:nike_shop/widgets/drawerPage.dart';

class massagePage extends StatefulWidget {
  const massagePage({Key? key});

  @override
  State<massagePage> createState() => _massagePageState();
}

class _massagePageState extends State<massagePage> {
  firebaseService firebase = firebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Massage Page'),
        ),
        drawer: drawerPage(),
        body: StreamBuilder<QuerySnapshot>(
          stream: firebase.getItem(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            final massageWord = snapshot.data?.docs
                .map((doc) =>
                    massage.fromeFirestore(doc.data() as Map<String, dynamic>))
                .toList();

            print(Timestamp.now());

            return ListView.builder(
              itemBuilder: (context, index) {},
            );
          },
        ));
  }
}
