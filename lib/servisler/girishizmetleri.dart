// ignore_for_file: unused_local_variable, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uv_protection/baslangicekranlari/girisekrani.dart';

class girisHizmetleri {
  final firebaseAuth = FirebaseAuth.instance;

  Future misafirgirisifonksiyonu() async {
    try {
      final sonuc = await firebaseAuth.signInAnonymously();
      return sonuc.user;
    } catch (e) {
      return "Hata";
    }
  }

  cikisyap() async {
    displayName = "Guest User";
    emailaddress = "No Email Address";
    photoURL = "notFill";
    return await firebaseAuth.signOut();
  }

  hesapac(email, password) async {
    var result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future sifreyenile(controller) async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: controller);
  }
}
