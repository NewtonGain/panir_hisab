import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panir_hisab/user.dart';

Future<List<User>> fetchUsers() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').orderBy('timestamp').get();
  return querySnapshot.docs.map((doc) => User.fromFirestore(doc)).toList();
}
