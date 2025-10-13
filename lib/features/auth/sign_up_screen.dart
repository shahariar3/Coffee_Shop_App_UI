import 'package:dark_light/app/assets_links.dart';
import 'package:dark_light/features/auth/sign_in_screen.dart';
import 'package:dark_light/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    heightFactor: .7,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      AssetsLinks.mainCoffeeImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white30,
                          Colors.white24,
                          Colors.white12,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 34,
              ),
            ),
            Text(
              'Let\'s create you an account.',
              style: GoogleFonts.gabarito(
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff55433C),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      label: SizedBox(
                        width: 70,
                        child: Row(
                          children: [
                            Text('EMAIL'),
                            Text(
                              ' *',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: _isPasswordVisible,
                    controller: _passwordController,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff55433C),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      label: SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            Text('PASSWORD'),
                            Text(
                              ' *',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: _isPasswordVisible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: _isPasswordVisible,
                    controller: _passwordController,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff55433C),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      label: SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            Text('RE-PASSWORD'),
                            Text(
                              ' *',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: _isPasswordVisible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 16,
                        color: Color(0xffA97C37),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route route) => false,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 30,
                        top: 8,
                        bottom: 8,
                        right: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff55433C),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Color(0xffA97C37),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xffA97C37),
                            fontSize: 16,
                            color: Color(0xffA97C37),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
