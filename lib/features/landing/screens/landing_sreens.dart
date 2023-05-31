import 'package:flutter/material.dart';
import 'package:whatsapp_ui/features/auth/screeens/signup_screen.dart';
import 'package:whatsapp_ui/features/landing/screens/termsofapp.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 550,
            width: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlue,
                  Color.fromARGB(255, 0, 62, 250),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Amistre",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Image(
                  image: AssetImage("assets/applogo.png"),
                ),
                const Text(
                  "Amistre \n Connect and collect.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Termsandcond(),
                        ),
                      );
                    },
                    child: const Text(
                      "Our terms and contitions.",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.routeName);
                    },
                    child: const Text("Continue.."),
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(10),
                      foregroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 255, 255)),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
