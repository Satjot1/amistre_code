import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/select_contacts/screens/select_contacts_screens.dart';
import 'package:whatsapp_ui/features/chat/widgets/contacts_list.dart';

class MobileLayoutScreen extends ConsumerStatefulWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends ConsumerState<MobileLayoutScreen>
    with WidgetsBindingObserver {
  int index = 1;
  final screens = [
    const SelectContactsScreen(),
    const ContactsList(),
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        ref.read(authControllerProvider).setUserState(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          height: 60,
          backgroundColor: Colors.blueAccent,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            setState(() => this.index = index);
          },
          items: const <Widget>[
            Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            Icon(
              Icons.home,
              color: Colors.black,
              size: 20,
            ),
            Icon(
              Icons.settings,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
        body: screens[index],
      ),
    );
  }
}
