import 'package:cloud_firestore/cloud_firestore.dart';

class firebaseService {
  final CollectionReference firebaseItem =
      FirebaseFirestore.instance.collection('allitem');

  final CollectionReference firebaseMassage =
      FirebaseFirestore.instance.collection('massage');

  Stream<QuerySnapshot> getItem() {
    return firebaseItem.snapshots();
  }

  Future addMassage(String massage) {
    return firebaseMassage
        .add({'massage': massage, 'timestamp': Timestamp.now()});
  }
}
