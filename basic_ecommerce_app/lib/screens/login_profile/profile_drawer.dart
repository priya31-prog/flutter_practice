import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:flutter/material.dart';

Widget profileDrawer({
  required BuildContext context,
  required bool isUserLoggedIn,
}) {
  return ListView(
    children: [
      SizedBox(
        height: 100,
        child: DrawerHeader(
          padding: EdgeInsetsGeometry.all(25),
          margin: EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(color: Colors.cyan),
          child: Text('User Name', style: TextStyle(color: Colors.white)),
        ),
      ),
      ListTile(
        title: Text('Order history'),
        leading: Icon(Icons.shopping_cart_sharp),
        onTap: () {
          Navigator.pushNamed(context, RouteNavigations.orderHistory);
        },
      ),
      ListTile(
        title: Text('View Profile'),
        leading: Icon(Icons.manage_accounts_sharp),
        onTap: () {
          if (!isUserLoggedIn) {
            Navigator.pushNamed(context, RouteNavigations.loginPage);
          }
        },
      ),
    ],
  );
}
