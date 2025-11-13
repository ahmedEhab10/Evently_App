import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/Models/User_Model.dart';
import 'package:myeventlyapp/Models/category_model.dart';

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

  static Future<UserCredential?> loginwithgoogle() async {}

  // static Future<void> addusertofirestore(UserModel userModel) {
  //   CollectionReference<Map<String, dynamic>> usersCollection =
  //       FirebaseFirestore.instance.collection('Users');

  //   DocumentReference<Map<String, dynamic>> userDocument = usersCollection.doc(
  //     userModel.id,
  //   );

  //   return userDocument.set(userModel.tojason());
  // }

  static Future<void> addusertofirestore(UserModel userModel) {
    CollectionReference<UserModel> usersCollection = FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (userModel, _) => userModel.tojason(),
        );

    return usersCollection.doc(userModel.id).set(userModel);
  }

  // static Future<UserModel> getuserfromfirestore(String id) async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   CollectionReference<Map<String, dynamic>> usersCollection = db.collection(
  //     'Users',
  //   );
  //   DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
  //       await usersCollection.doc(id).get();
  //   var jasondata = documentSnapshot.data();
  //   return UserModel.fromJson(jasondata!);
  // }
  static CollectionReference<UserModel> getusercollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (userModel, _) => userModel.tojason(),
        );
  }

  static Future<UserModel> getuserfromfirestore(String id) async {
    CollectionReference<UserModel> usersCollection = getusercollection();
    DocumentSnapshot<UserModel> documentSnapshot = await usersCollection
        .doc(id)
        .get();
    return documentSnapshot.data()!;
  }

  static Future<void> addEventToFirestore(EventModel event) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> Eventcollection = db
        .collection('Events')
        .withConverter<EventModel>(
          fromFirestore: (json, _) => EventModel.fromJson(json.data()!),
          toFirestore: (event, _) => event.tojson(),
        );
    DocumentReference<EventModel> documentReference = Eventcollection.doc();
    event.id = documentReference.id;
    return documentReference.set(event);
  }

  static Future<List<EventModel>> getEventFromFirestore({
    CategoryModel? category,
  }) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    Query<EventModel> Eventcollection = db
        .collection('Events')
        .withConverter<EventModel>(
          fromFirestore: (json, _) => EventModel.fromJson(json.data()!),
          toFirestore: (event, _) => event.tojson(),
        );

    QuerySnapshot<EventModel> querySnapshot = await Eventcollection.get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }

  static Stream<List<EventModel>> getEventFromFirestorerealtime({
    CategoryModel? category,
  }) async* {
    FirebaseFirestore db = FirebaseFirestore.instance;
    Query<EventModel> Eventcollection = db
        .collection('Events')
        .withConverter<EventModel>(
          fromFirestore: (json, _) => EventModel.fromJson(json.data()!),
          toFirestore: (event, _) => event.tojson(),
        )
        .where(
          'categoryid',
          isEqualTo: category!.id == '0' ? null : category.id,
        )
        .orderBy('date');
    Stream<QuerySnapshot<EventModel>> querySnapshots =
        Eventcollection.snapshots();

    yield* querySnapshots.map(
      (Query) => Query.docs.map((e) => e.data()).toList(),
    );
  }

  static void removeEventfromfirebase(String eventid) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    Query<EventModel> Eventcollection = db
        .collection('Events')
        .withConverter<EventModel>(
          fromFirestore: (json, _) => EventModel.fromJson(json.data()!),
          toFirestore: (event, _) => event.tojson(),
        );

    QuerySnapshot<EventModel> querySnapshot = await Eventcollection.get();
    querySnapshot.docs.forEach((element) {
      if (element.data().id == eventid) {
        element.reference.delete();
      }
    });
  }

  static Future<void> addEventstofavorite(EventModel event) {
    UserModel currentuser = UserModel.currentUser!;
    currentuser.FavoritesEventsid.add(event.id!);
    CollectionReference<UserModel> usersCollection = getusercollection();
    DocumentReference<UserModel> currentuserdoc = usersCollection.doc(
      currentuser.id,
    );
    return currentuserdoc.set(currentuser);
  }

  static Future<void> removeEventstofavorite(EventModel event) {
    UserModel currentuser = UserModel.currentUser!;
    currentuser.FavoritesEventsid.remove(event.id!);
    CollectionReference<UserModel> usersCollection = getusercollection();
    DocumentReference<UserModel> currentuserdoc = usersCollection.doc(
      currentuser.id,
    );
    return currentuserdoc.set(currentuser);
  }

  static Future<List<EventModel>> getFavoriteEvents() async {
    List<EventModel> events = await getEventFromFirestore();
    List<EventModel> favouriteEvents = events
        .where(
          (event) =>
              UserModel.currentUser!.FavoritesEventsid.contains(event.id),
        )
        .toList();
    return favouriteEvents;
    // return getEventFromFirestorerealtime().map((allEvents) {
    //   return allEvents
    //       .where(
    //         (event) =>
    //             UserModel.currentUser!.FavoritesEventsid.contains(event.id),
    //       )
    //       .toList();
    // });
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