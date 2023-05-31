import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  static const routeName = '/otp-screen';
  final String verificationId;
  const OTPScreen({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authControllerProvider).verifyOTP(
          context,
          verificationId,
          userOTP,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: 550,
          width: 300,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(
                  10,
                  0,
                ),
                blurRadius: 20.0,
                color: Colors.white,
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 3, 244, 55),
                Color.fromARGB(255, 3, 244, 55),
                Color.fromARGB(255, 250, 187, 0),
                Color.fromARGB(255, 250, 187, 0),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Amistre Verify",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Buddy we had sent you an OTP on you enterd.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    if (val.length == 6) {
                      verifyOTP(ref, context, val.trim());
                    }
                  },
                  maxLength: 6,
                  decoration: const InputDecoration(
                      hintText: 'XXXXXX',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      fillColor: Colors.black,
                      filled: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
