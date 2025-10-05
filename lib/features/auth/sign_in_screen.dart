import 'package:dark_light/app/assets_links.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisisble = false;

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
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 34,
              ),
            ),
            Text(
              'We\'ve already met!',
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
                    obscureText: _isPasswordVisisble,
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
                            _isPasswordVisisble = !_isPasswordVisisble;
                          });
                        },
                        icon: _isPasswordVisisble
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
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
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
                            'Sign In',
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
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
