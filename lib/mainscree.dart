import 'package:flutter/material.dart';
import 'package:panir_hisab/fetchuser.dart';
import 'package:panir_hisab/homescreen.dart';
import 'package:panir_hisab/user.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(backgroundColor:Colors.amber ,
    title: const Text('পানির টাকা জমা দেওয়ার লিষ্ট'),
  ),
  drawer: Drawer(
    backgroundColor:  Colors.black54,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('তালিকায় যুক্ত করুন',style: TextStyle(fontSize: 30,
        fontWeight: FontWeight.bold,color: Colors.white),)
        ,
        IconButton(onPressed: (){
          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const HomeScreen()),
          );
        }, icon: const Icon(Icons.add,size: 40,color: Colors.white,)),

      ],
    )
  ),
      body: const Futurebuilder(),
    );
  }
}

class Futurebuilder extends StatelessWidget {
  const Futurebuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.deepOrange,
                  child: ListTile(
                    title: Text(user.name,style: const TextStyle(fontSize: 20),),
                    subtitle: Text(user.email,style: const TextStyle(fontSize: 20),),
                    trailing: Text(user.timestamp.toString()),
                    autofocus: true,
                    onTap: (){},
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
