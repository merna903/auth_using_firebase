import 'package:auth_using_firebase/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed:()=> AuthService().singOutFromGoogle(context),
             icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Center(
            child: Text('Hi ${snapshot.data?.email}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
          );
        }
      )
    );
  }
}