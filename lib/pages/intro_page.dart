import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 179, 47, 37),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25),
              //shop name
              Text(
                'Sushi Shop',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 26, color: Colors.white),
              ),

              SizedBox(height: 25),
              // icon
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset(
                  'lib/images/bentosushi.png',
                ),
              ),

              SizedBox(height: 25),
              //title
              Text(
                'Experience the best of Japan in Abuja',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 25),
              //subtitle
              Text(
                'Feel the taste of Japan in every bite, from Japan to Abuja',
                style: GoogleFonts.dmSerifDisplay(
                  color: const Color.fromARGB(255, 238, 232, 232),
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 25),

              //get started button
              Button(
                  color: const Color.fromARGB(255, 237, 152, 146),
                  text: 'Get Started',
                  onTap: () {
                    // go to the menu page
                    Navigator.pushNamed(context, '/menupage');
                  }),
            ],
          ),
        ));
  }
}
