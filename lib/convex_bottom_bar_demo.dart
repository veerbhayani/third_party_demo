import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class ConvexBottomBarDemo extends StatefulWidget {
  const ConvexBottomBarDemo({super.key});

  @override
  State<ConvexBottomBarDemo> createState() => _ConvexBottomBarDemoState();
}

class _ConvexBottomBarDemoState extends State<ConvexBottomBarDemo> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(
            icon: Icons.map,
            title: 'Discovery',
          ),
          TabItem(
            icon: Icons.add,
            title: 'Add',
          ),
          TabItem(
            icon: Icons.message,
            title: 'Message',
          ),
          TabItem(
            icon: Icons.people,
            title: 'Profile',
          ),
        ],
        style: TabStyle.fixedCircle,
        onTap: (index) {
          print('click index=$index');
        },
      ),
    );
  }
}
