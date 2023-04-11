import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color/pallete.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
              'assets/images/clover-leaf.png',
              height: 220,
            ),
            SizedBox(height: 25,),
            Text("Try Your Luck!!",
            style: GoogleFonts.craftyGirls(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500
              )
            ),)
            ],
          ),
        ),
      ),
    );
  }
}
