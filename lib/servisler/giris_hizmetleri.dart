import 'package:firebase_auth/firebase_auth.dart';
import 'package:uv_protection/baslangicekranlari/giris_ekrani.dart';

class GirisHizmetleri {
  final firebaseAuth = FirebaseAuth.instance;

  Future misafirGirisiFonksiyonu() async {
    try {
      final sonuc = await firebaseAuth.signInAnonymously();
      return sonuc.user;
    } catch (e) {
      return "Hata";
    }
  }

  cikisYap() async {
    displayName = "Guest User";
    emailaddress = "No Email Address";
    photoURL = "notFill";
    return await firebaseAuth.signOut();
  }

  hesapAc(email, password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future sifreYenile(controller) async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: controller);
  }
}
