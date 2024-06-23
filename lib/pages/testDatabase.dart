// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:nike_shop/models/allshoe.dart';
// import 'detailPage.dart';

// class test extends StatefulWidget {
//   const test({Key? key}) : super(key: key);

//   @override
//   State<test> createState() => _testState();
// }

// final CollectionReference shoesCollection =
//     FirebaseFirestore.instance.collection('shoe');

// class _testState extends State<test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: shoesCollection.snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData) {
//             return Center(child: Text("No data available"));
//           }

//           final shoeList = snapshot.data!.docs
//               .map((doc) =>
//                   Shoe.fromFirestore(doc.data() as Map<String, dynamic>))
//               .toList();

//           return GridView.builder(
//             itemCount: shoeList.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.75,
//             ),
//             itemBuilder: (context, index) {
//               final shoe = shoeList[index];
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               return Container(
//                 padding: EdgeInsets.all(5.0),
//                 child: GestureDetector(
//                   child: Column(
//                     children: [
//                       Container(
//                           color: Colors.amber,
//                           child: Column(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 child: Image.network(
//                                   shoe.pic,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Text(
//                                 shoe.name,
//                                 style: GoogleFonts.lato(
//                                   textStyle: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 shoe.type,
//                                 style: GoogleFonts.getFont(
//                                   'Kanit',
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                               Text(
//                                 "\$" + NumberFormat('#,##0').format(shoe.price),
//                                 style: TextStyle(fontWeight: FontWeight.w600),
//                               ),
//                             ],
//                           )),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
