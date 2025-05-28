import 'package:flutter/material.dart';
import 'package:isolates_mixins/mixins/left_drawer_menu.dart';

class CustomWidget extends StatelessWidget with DrawerMixin {
  CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        // backgroundColor: Theme.of(context).primaryColor.withAlpha(40),
        child: drawerWidget(context),
      ),
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: Text('Mixin Example'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          // leading: Builder(builder: (context) =>
          Builder(
            builder:
                (context) => IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor.withAlpha(40),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Open the right drawer to \n see different widgets'),
            IconButton(
              icon: Icon(Icons.arrow_right_alt_outlined),
              onPressed: () {
                // Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
