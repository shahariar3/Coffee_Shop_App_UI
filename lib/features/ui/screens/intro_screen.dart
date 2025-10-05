import 'package:dark_light/app/assets_links.dart';
import 'package:dark_light/features/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            spacing: 4,
            children: [
              Image.asset(AssetsLinks.smallCoffeeImage),
              Text(
                'COFFEE TASTE!',
                style: GoogleFonts.gabarito(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  fontSize: 16,
                ),
              ),
              Stack(
                children: [
                  Image.asset(
                    AssetsLinks.mainCoffeeImage,
                    height: 450,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white30, Colors.white24, Colors.white12],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Text(
                'Find your favorite',
                style: GoogleFonts.gabarito(letterSpacing: 1, fontSize: 28),
              ),
              Text(
                'Coffee Taste!',
                style: GoogleFonts.gabarito(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 34,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: Text(
                  'We\'re coffee shop, beer and wine bar, & even space for performing arts',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Container(
                  width: 200,
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 4,
                    bottom: 4,
                    right: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff55433C),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Color(0xffA97C37),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
