import 'package:flutter/material.dart';
import 'package:koolkwiz/marketplace/marketplace.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            color: Marketplace.theme.colorScheme.onSecondary,
            width: 2,
          ),
        ),
      ),
      child: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        animationDuration: const Duration(milliseconds: 1000),
        destinations: const <Widget>[
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.all(14),
              child: Icon(
                Icons.home,
                size: 32,
              ),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.all(14),
              child: Icon(
                Icons.format_list_bulleted,
                size: 32,
              ),
            ),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.all(14),
              child: Icon(
                Icons.search,
                size: 32,
              ),
            ),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.all(14),
              child: Icon(
                Icons.person,
                size: 32,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
