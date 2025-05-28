import 'package:flutter/material.dart';

mixin DrawerMixin {
  Widget drawerWidget(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(40),
          ),
          child: textIconButton(
            icon: Icons.menu,
            text: 'Menu Bar',
            iconBtnPress: () => Navigator.pop(context),
          ),
        ),

        ListTile(
          title: textIconButton(icon: Icons.onetwothree, text: 'Hero Widget'),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 25, top: 15),
            child: Column(
              spacing: 10,
              children: [
                textIconButton(
                  icon: Icons.slideshow_rounded,
                  text: 'Slider',
                  iconSize: 15,
                ),
                textIconButton(
                  icon: Icons.pages_outlined,
                  text: 'Pagination',
                  iconSize: 15,
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: textIconButton(icon: Icons.onetwothree, text: 'Grid View'),
        ),
        ListTile(
          title: textIconButton(
            icon: Icons.onetwothree,
            text: 'Layout builder',
          ),
        ),
        ListTile(
          title: textIconButton(icon: Icons.onetwothree, text: 'Animations'),
        ),
      ],
    );

    // Column(
    //   mainAxisSize: MainAxisSize.min,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Container(
    //       padding: EdgeInsets.all(15),
    //       // alignment: Alignment.bottomRight,
    //       color: Theme.of(context).primaryColor.withAlpha(40),
    //       child: textIconButton(
    //         icon: Icons.menu_book_outlined,
    //         text: 'Example 1',
    //         iconBtnPress: () {
    //           Navigator.pop(context);
    //         },
    //       ),
    //     ),

    //     Column(children: [Container()]),
    //     // Container(
    //     //   height: 400,
    //     //   child: ListView.builder(
    //     //     itemBuilder: (BuildContext context, int index) {
    //     //       return textIconButton(
    //     //         icon: Icons.access_alarm,
    //     //         text: 'Hero Widget',
    //     //       );
    //     //     },
    //     //     itemCount: 4,
    //     //   ),
    //     // ),

    //     // IconButton(onPressed: () {}, icon: Icon(Icons.one_k_plus_outlined)),
    //   ],
    // );
  }
}

Widget textIconButton({
  VoidCallback? iconBtnPress,
  required IconData icon,
  required String text,
  TextStyle? textStyle,
  double? iconSize,
}) {
  return InkWell(
    onTap: iconBtnPress,
    child: Row(
      children: [
        Icon(icon, size: iconSize),
        SizedBox(width: 8),
        Text(text, style: textStyle),
      ],
    ),
  );
}

// Widget textIconButton({
//   required IconData icon,
//   required String text,
//   VoidCallback? iconBtnPress,
//   TextStyle? style,
// }) {
//   return TextButton.icon(
//     onPressed: iconBtnPress, // Provide an onPressed callback
//     icon: Icon(icon),
//     label: Text(text, style: style),
//   );
// }
