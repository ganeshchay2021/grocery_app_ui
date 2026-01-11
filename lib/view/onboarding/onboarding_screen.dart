import 'package:flutter/material.dart';
import 'package:grocery_app_ui/constant/assets.dart';
import 'package:grocery_app_ui/view/home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

        //unboarding images
          ClipPath(
            clipper: ClipPathOnboard(),
            child: SizedBox(
              height: size.height * 0.6,
              width: size.width,
              child: Padding(
                padding: EdgeInsetsGeometry.only(top: 50),
                child: Image.asset(Assets.onboardingProfile, fit: BoxFit.cover),
              ),
            ),
          ),

          //Informative Text
          SizedBox(
            height: size.height * 0.4,
            child: Column(
              children: [
                SizedBox(height: 25),
                Text(
                  "By Groceries\nEasily With Us",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 30),

                //some texts
                Text(
                  "Listen podcast and open your\nworld with this application",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 30),

                //Get started button
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathOnboard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 70,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
