import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myeventlyapp/Models/User_Model.dart';

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

  static Future<UserCredential> login({
    required String emailAddress,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    return credential;
  }

  static Future<void> addusertofirestore(UserModel userModel) {
    CollectionReference<Map<String, dynamic>> usersCollection =
        FirebaseFirestore.instance.collection('Users');

    DocumentReference<Map<String, dynamic>> userDocument = usersCollection.doc(
      userModel.id,
    );

    return userDocument.set({
      'id': userModel.id,
      'name': userModel.name,
      'email': userModel.email,
    });
  }

  static Future<UserModel> getuserfromfirestore(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> usersCollection = db.collection(
      'Users',
    );
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await usersCollection.doc(id).get();
    var jasondata = documentSnapshot.data();
    return UserModel(
      id: jasondata!['id'],
      name: jasondata['name'],
      email: jasondata['email'],
    );
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