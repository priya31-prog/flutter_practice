import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isolates_mixins/common_files/route_navigation.dart';
import 'package:isolates_mixins/mixins/hero%20widget/common_functions.dart';
import 'package:isolates_mixins/state_management/state_provider.dart';
// import 'providers.dart';

mixin DrawerMixin {
  Widget drawerWidget({
    required BuildContext context,
    required WidgetRef ref,
    required List<String> titles,
    List<String>? subtitles,
    List<IconData>? iconsList,
  }) {
    final isExpandable = ref.watch(expandProvider);

    return StatefulBuilder(
      builder: (context, setState) {
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textIconButton(icon: Icons.onetwothree, text: titles[0]),
                  IconButton(
                    onPressed: () {
                      // use river pod to handle state management here..
                      ref.read(expandProvider.notifier).state = !isExpandable;
                    },
                    icon:
                        isExpandable
                            ? Icon(Icons.arrow_drop_up)
                            : Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
              subtitle:
                  isExpandable && iconsList != null
                      ? Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return textIconButton(
                              icon: iconsList[index],
                              text: subtitles![index],
                              iconBtnPress: () {
                                CommonUtils.heroWigetNav(
                                  context: context,
                                  page: subtitles[index],
                                );
                              },
                              iconColor: Colors.blueAccent,
                              iconSize: 15,
                              textStyle: TextStyle(color: Colors.blueGrey),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10);
                          },
                          itemCount: 3,
                        ),
                      )
                      : SizedBox.shrink(),
            ),
            ListTile(
              title: textIconButton(icon: Icons.onetwothree, text: titles[1]),
            ),
            ListTile(
              title: textIconButton(icon: Icons.onetwothree, text: titles[2]),
            ),
            ListTile(
              title: textIconButton(icon: Icons.onetwothree, text: titles[3]),
            ),
          ],
        );
      },
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
  Color? iconColor,
}) {
  return InkWell(
    onTap: iconBtnPress,
    child: Row(
      children: [
        Icon(icon, size: iconSize, color: iconColor),
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
