import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseVendor {
  FirebaseApp _firebaseApp;
  FirebaseApp get firebaseApp => this._firebaseApp;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore get firestore => this._firestore;

  Future<void> init() async {
    this._firebaseApp = await Firebase.initializeApp();
  }
}
