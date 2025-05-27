import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
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
    );
  }
}
