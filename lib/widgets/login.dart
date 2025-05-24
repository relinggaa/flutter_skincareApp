import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gabriela_app/widgets/register.dart'; // Import halaman login

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background biru yang memenuhi layar
          Positioned.fill(
            child: Container(
              color: Color(0xFF1A64AF), // Blue background
            ),
          ),
          // Form di atas background biru
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ), // Spasi untuk form agar tidak tertutup oleh bagian atas
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 800,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Log in to unmask skincare truths!",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 30),

                      // Input text "Email"
                      _buildTextField("Email", TextInputType.emailAddress),
                      SizedBox(height: 20),
                      // Input text "Password"
                      _buildPasswordField("Password"),
                      SizedBox(height: 40),

                      // Input text "Confirm password"
                      Text(
                        "────────── Or Login with ──────────",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      // Social media buttons
                      SizedBox(height: 20),
                      _buildSocialButtons(),
                      SizedBox(height: 80),
                      // Login button
                      _buildLoginButton(),
                      SizedBox(height: 60),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                              text: "Register",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const Register(),
                                        ),
                                      );
                                    },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build text fields
  Widget _buildTextField(String label, TextInputType inputType) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: inputType,
    );
  }

  // Function to build password fields
  Widget _buildPasswordField(String label) {
    return TextField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }

  // Function to build social media buttons
  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton('assets/images/facebook.png', 40, 24),
        SizedBox(width: 20),
        _buildSocialButton('assets/images/google.png', 30, 24),
        SizedBox(width: 20),
        _buildSocialButton('assets/images/apple.png', 40, 24),
      ],
    );
  }

  // Helper function to create social media buttons
  Widget _buildSocialButton(String asset, double width, double height) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        side: BorderSide(color: Colors.grey),
        backgroundColor: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(asset, width: width, height: height),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  // Function to create the Login button
  Widget _buildLoginButton() {
    return Container(
      width: 370,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF1A64AF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Register()),
          );
        },
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
