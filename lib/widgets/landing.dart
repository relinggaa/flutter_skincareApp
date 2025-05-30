import 'package:flutter/material.dart';
import 'package:gabriela_app/widgets/Home.dart';
import 'package:gabriela_app/widgets/register.dart';
import 'package:gabriela_app/widgets/login.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color bc = Color(0xFFE8EFF9);
    // Scaling factor for responsive text size
    double scalingFactor = width / 375; // Example for 375px base width

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox(
            width: width, // Full width
            height: height, // Full height
            child: Image.asset(
              'assets/images/home.png', // Image from assets
              fit: BoxFit.cover, // Fit the image to the screen
            ),
          ),

          // Content on top of the image
          Positioned(
            top: height * 0.4, // Position elements towards the center
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Space above buttons
                  SizedBox(height: height * 0.40),

                  // Create Account Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width * 0.8, 45), // Responsive width
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18 * scalingFactor, // Scalable font size
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Log In Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width * 0.8, 45), // Responsive width
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18 * scalingFactor, // Scalable font size
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
