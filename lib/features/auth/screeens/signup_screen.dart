import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/utils/utils.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final phoneController = TextEditingController();
  Country selectorCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: "IN",
    e164Key: '',
  );

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (phoneNumber.isNotEmpty) {
      ref.read(authControllerProvider).signInWithPhone(
          context, "+${selectorCountry.phoneCode}$phoneNumber");
    } else {
      showSnackBar(context: context, content: "Fill the Feild");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Center(
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
                  Color.fromARGB(255, 244, 3, 176),
                  Color.fromARGB(255, 0, 62, 250),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Register Yourself Here",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Enter your phone number with country code. So that we can regiter you.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width * 0.78,
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: const Color.fromARGB(255, 0, 0, 0),
                      hintText: "Enter Your Phone Number",
                      filled: true,
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              showPhoneCode: true,
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),

                                textStyle: const TextStyle(
                                    fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight:
                                    500, // Optional. Country list modal height
                                //Optional. Sets the border radius for the bottomsheet.
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                //Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                              onSelect: (value) {
                                setState(() {
                                  selectorCountry = value;
                                });
                              },
                            );
                          },
                          child: Text(
                            "${selectorCountry.flagEmoji}+${selectorCountry.phoneCode}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: sendPhoneNumber,
                    child: const Text("Send OTP"),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      foregroundColor: MaterialStatePropertyAll(Colors.black),
                      elevation: MaterialStatePropertyAll(10),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
