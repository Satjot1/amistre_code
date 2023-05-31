import 'dart:io';

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:whatsapp_ui/features/auth/repositry/auth_repo.dart';
import 'package:whatsapp_ui/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepositry = ref.watch(authRepositryProvider);
  return AuthController(authRepositry, ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController {
  final AuthRepositry authRepositry;
  final ProviderRef ref;

  AuthController(this.authRepositry, this.ref);

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepositry.getCurrentUserData();
    return user;
  }

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepositry.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepositry.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRepositry.saveUserDataToFirebase(
      name: name,
      profilePic: profilePic,
      ref: ref,
      context: context,
    );
  }

  Stream<UserModel> userDataById(String userId) {
    return authRepositry.userData(userId);
  }

  void setUserState(bool isOnline) {
    authRepositry.setUserState(isOnline);
  }
}
