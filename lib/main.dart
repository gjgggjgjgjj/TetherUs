import 'package:flutter/material.dart';


/* gonna make some ui colors base off the primary #c997373 so redish 
50:   FBF5F5
100:  F7E9E9 
200:  E7BABA  
300:  E7BABA  
400:  D89191  
500:  C97373 
600:  B15151 
700:  944141  
800:  7B3939  
900:  683434 
950:  371818 

----------------------------------------------*/ 

import 'ui/screens/home_screen.dart';
import 'ui/screens/first_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Pet',
      theme: ThemeData.dark(),
      home: const WelcomeScreen(),
    );
  }
}
