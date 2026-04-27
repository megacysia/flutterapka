import 'package:flutter/material.dart';
import 'package:flutterapka/views/pages/home_page.dart';
import 'package:flutterapka/views/pages/profile_page.dart';

import 'widgets/navbar_widget.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Mapp'), centerTitle: true
      ),
      body: pages.elementAt(1),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
