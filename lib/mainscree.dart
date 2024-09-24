import 'package:flutter/material.dart';
import 'package:panir_hisab/fetchuser.dart';
import 'package:panir_hisab/homescreen.dart';
import 'package:panir_hisab/user.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(backgroundColor:Colors.amber ,
    title: const Text('পানির টাকা জমা দেওয়ার লিষ্ট'),
  ),
  drawer: Drawer(
    backgroundColor: const Color.fromARGB(34, 53, 64, 77),
    child: IconButton(onPressed: (){
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  const HomeScreen()),
  );
    }, icon: const Icon(Icons.add))
  ),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Text(user.timestamp.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
