import 'package:flutter/material.dart';
import '../../database/auth_service.dart';
import '../../database/read_write.dart';
import 'pet_room.dart';

class LoginScreenTest extends StatelessWidget {
  final AuthService _authService = AuthService();

  LoginScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign in with Google'),
          onPressed: () async {
            final user = await _authService.signInWithGoogle();

            if (user != null) {
              String uid = user.uid;
              print('Successfully logged in! User ID: $uid');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Successfully signed in"),
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PetRoom()),
              );
              //using adduser function in read_write.dart
              bool exists = addUser(uid);
              if (!exists) {
                
              }


            } else {
              print('Sign in failed or canceled.');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Sign in failed or canceled"),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
