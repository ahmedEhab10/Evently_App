import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<UserCredential> createUser({
    required String emailAddress,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );

    return credential;
  }
}



//try {
  //     final credential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //           email: emailAddress,
  //           password: password,
  //         );
  //     UiUtils.showtoastmassage(
  //       backgroundColor: Colors.green,
  //       message: 'Account created successfully',
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //       UiUtils.showtoastmassage(
  //         backgroundColor: Colors.red,
  //         message: 'The password provided is too weak.',
  //       );
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //       UiUtils.showtoastmassage(
  //         backgroundColor: Colors.red,
  //         message: 'The account already exists for that email.',
  //       );
  //     }
  //   } catch (e) {
  //     print(e);
  //     UiUtils.showtoastmassage(
  //       backgroundColor: Colors.red,
  //       message: e.toString(),
  //     );
  //   }
  // }