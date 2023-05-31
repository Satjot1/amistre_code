import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/utils/utils.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  static const String routName = '/user-info';
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      ref.read(authControllerProvider).saveUserDataToFirebase(
            context,
            name,
            image,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange[800],
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
                Colors.lightBlue,
                Color.fromARGB(255, 0, 62, 250),
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    image == null
                        ? const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://i.ibb.co/VSyKtPw/Png-Item-64355-2.png"),
                            backgroundColor: Colors.white,
                            radius: 64,
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(image!),
                            backgroundColor: Colors.white,
                            radius: 64,
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.76,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(hintText: "Enter Your Name"),
                      ),
                    ),
                    IconButton(
                      onPressed: storeUserData,
                      icon: const Icon(Icons.done),
                    ),
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
