// ignore_for_file: unused_local_variable, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';

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

  Future kayitlikullanicigirisi(email, password) async {
    try {
      final userresult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return "Hata";
    }
  }

  cikisyap() async {
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
