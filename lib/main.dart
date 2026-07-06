import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


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

comment is a lie as we want green for the app now
----------------------------------------------*/ 

import 'ui/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Seed a light color scheme with a pleasant green accent
    const Color seedGreen = Color(0xFF3EB869);
    final colorScheme = ColorScheme.fromSeed(seedColor: seedGreen, brightness: Brightness.light);

    final baseTheme = ThemeData.from(colorScheme: colorScheme, textTheme: GoogleFonts.nunitoTextTheme(), useMaterial3: true).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: GoogleFonts.nunito(textStyle: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: seedGreen, foregroundColor: Colors.white),
      ),
      iconTheme: const IconThemeData(color: seedGreen),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: seedGreen),
    );

    return MaterialApp(
      title: 'TetherUs',
      theme: baseTheme,
      home: const WelcomeScreen(),
    );
  }
}
