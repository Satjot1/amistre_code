import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/error.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/common/loader.dart';
import 'package:whatsapp_ui/features/landing/screens/landing_sreens.dart';
import 'package:whatsapp_ui/firebase_options.dart';
import 'package:whatsapp_ui/router.dart';
import 'package:whatsapp_ui/screens/mobile_layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amistre',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileLayoutScreen();
            },
            error: (err, trace) {
              return const ErrorScreen(
                  error:
                      'The service is currently unavalible. \nPlease Try after Sometime. GIVE US SOMETIME TO FIX IT. \nTIP :- \nCheck your internet connection.');
            },
            loading: () => const Loader(),
          ),
    );
    // 4:35:25 time is done next
    // https://www.youtube.com/watch?v=yqwfP2vXWJQ&t=16525s
  }
}
