import 'package:flutter/material.dart';
import 'package:whatsapp_ui/features/auth/screeens/otp_screen.dart';
import 'package:whatsapp_ui/features/auth/screeens/signup_screen.dart';
import 'package:whatsapp_ui/features/auth/user_info_screen.dart';
import 'package:whatsapp_ui/features/select_contacts/screens/select_contacts_screens.dart';
import 'package:whatsapp_ui/features/chat/screens/mobile_chat_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignupScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case UserInfoScreen.routName:
      return MaterialPageRoute(
        builder: (context) => const UserInfoScreen(),
      );
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectContactsScreen(),
      );
    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      return MaterialPageRoute(
        builder: (context) => MobileChatScreen(
          name: name,
          uid: uid,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Text("Error To Show You The App"),
        ),
      );
  }
}
