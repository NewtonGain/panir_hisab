import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String email;
  final DateTime timestamp;

  User({required this.name, required this.email, required this.timestamp});

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }
}
