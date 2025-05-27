import 'package:flutter/material.dart';

mixin DrawerMixin {
  Widget drawerWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          // alignment: Alignment.bottomRight,
          color: Theme.of(context).primaryColor.withAlpha(40),
          child: textIconButton(
            icon: Icons.menu_book_outlined,
            text: 'Example 1',
            iconBtnPress: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          //convert this column into a listview
          child: Column(
            spacing: 20,
            children: [
              // SizedBox(height: 20),
              textIconButton(
                icon: Icons.access_alarm_outlined,
                text: 'Hero widget',
              ),
              // SizedBox(height: 20),
              textIconButton(
                icon: Icons.access_alarm_outlined,
                text: 'Grid View',
              ),
              // SizedBox(height: 20),
              textIconButton(
                icon: Icons.access_alarm_outlined,
                text: 'Animations',
              ),
              // SizedBox(height: 20),
              textIconButton(
                icon: Icons.access_alarm_outlined,
                text: 'List view',
              ),
            ],
          ),
        ),

        // IconButton(onPressed: () {}, icon: Icon(Icons.one_k_plus_outlined)),
      ],
    );
  }
}

Widget textIconButton({
  VoidCallback? iconBtnPress,
  required IconData icon,
  required String text,
  TextStyle? textStyle,
}) {
  return InkWell(
    onTap: iconBtnPress,
    child: Row(
      children: [Icon(icon), SizedBox(width: 8), Text(text, style: textStyle)],
    ),
  );
}
