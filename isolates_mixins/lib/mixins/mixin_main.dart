import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isolates_mixins/mixins/left_drawer_menu.dart';

// ignore: must_be_immutable
class CustomWidget extends ConsumerWidget with DrawerMixin {
  CustomWidget({super.key});

  List<String> subtitles = ['Sliders', 'Pagination', 'Hero Widget'];
  List<IconData> iconsList = [
    Icons.slideshow_sharp,
    Icons.pages_outlined,
    Icons.animation_outlined,
  ];
  List<String> titles = [
    'Hero Widget',
    'Grid View',
    'Layout Builder',
    'Animations',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      endDrawer: Drawer(
        // backgroundColor: Theme.of(context).primaryColor.withAlpha(40),
        child: drawerWidget(
          context: context,
          ref: ref,
          titles: titles,
          subtitles: subtitles,
          iconsList: iconsList,
        ),
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
