import 'package:flutter/material.dart';

import 'Authentications/FirebaseAuth.dart';
import 'Authentications/LogIn.dart';

class userDashboard extends StatelessWidget {
  const userDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('User dashboard'),
            const SizedBox(height: 25,),
            FloatingActionButton(
              onPressed: () {
                FirebaseAuthentication().signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              backgroundColor: Colors.teal,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child:
                  const Icon(Icons.logout_rounded, color: Colors.white, size: 20),
            ),
          ],
        )
      ),
    );
  }
}