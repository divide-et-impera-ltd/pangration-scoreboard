import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:pangration_score/app/models/admin.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthService({FirebaseAuth firebaseAuth})
  : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // Admin userFromFirebase(Firebase user) {
  //
  // }

}