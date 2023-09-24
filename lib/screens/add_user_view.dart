import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  addUser() {
    users
        .add({
          "name": "Owais",
          "gender": "male",
        })
        .then((value) => print("$value added"))
        .onError((error, stackTrace) => print("owaisAhmed: $error"));
  }

  getUsers() {
    users.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((e) {
        print("Item: $e");
      });
      for (var i = 0; i < querySnapshot.docs.length; i++) {
        print("Item: ${querySnapshot.docs[i]}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                addUser();
              },
              child: const Text("Add User"),
            ),
          ],
        ),
      ),
    );
  }
}
