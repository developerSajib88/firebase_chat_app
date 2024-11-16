

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollections {

  static CollectionReference get users => FirebaseFirestore.instance.collection("users");



}