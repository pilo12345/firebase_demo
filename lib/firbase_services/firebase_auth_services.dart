import '../constant.dart';

class FireBaseAuthServices {
  static Future<bool> registerUser({String? email, String? password}) async {
    await kFirebaseAuth
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .catchError(
      (e) {
        print("ERROR ====>>>>$e");
      },
    );

    return true;
  }

  // static Future<bool> login({String? email, String? password}) async {
  //   await kFirebaseAuth.signInWithEmailAndPassword(
  //       email: email!, password: password!);
  //   //     .catchError((e) {
  //   //   print("ERROR ====>>>>$e");
  //   // });
  //   return true;
  // }

  //static Future logout() async {
  //  await kFirebaseAuth.signOut();
  //}
}
