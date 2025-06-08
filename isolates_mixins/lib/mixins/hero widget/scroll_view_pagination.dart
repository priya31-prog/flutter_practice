import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isolates_mixins/API/users_api.dart';
import 'package:isolates_mixins/API/users_model.dart';

class ScrollViewPagination extends StatefulWidget {
  const ScrollViewPagination({super.key});

  @override
  State<ScrollViewPagination> createState() => _ScrollViewPaginationState();
}

class _ScrollViewPaginationState extends State<ScrollViewPagination> {
  final ScrollController _controller = ScrollController();
  List<UsersModel> userData = [];
  List<UsersModel> itemList = [];
  int page = 1;
  bool isLoading = false;
  final int itemsPerPage = 25;

  @override
  void initState() {
    super.initState();

    _fetchData();

    _controller.addListener(() {
      if (_controller.position.pixels >=
              _controller.position.maxScrollExtent - 100 &&
          !isLoading) {
        _fetchData();
      }
    });
  }

  void _fetchData() async {
    setState(() {
      isLoading = true;
    });
    log('is loading ...${isLoading}');

    await Future.delayed(Duration(seconds: 3));

    UserApi().fetchUsers().then((value) {
      // userData = value;
      itemList = List.generate(
        itemsPerPage,
        (index) => value[index + page * itemsPerPage],
      );
      setState(() {
        userData.addAll(itemList);
        page++;
        isLoading = false;
      });
      log('user data----${itemList[0].firstName}');
      log('is loading ...${isLoading}');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ScrollViewPagination',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: userData.length,
      itemBuilder: (context, index) {
        // return ListTile(title: Text('item 56'));
        if (index < userData.length - 1 && userData.isNotEmpty) {
          return ListTile(
            leading: Icon(Icons.people_alt_rounded),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${userData[index].firstName} ${userData[index].lastName}',
                ),
                Text(
                  '${userData[index].companyId} - ${userData[index].countryCode}',
                ),
              ],
            ),
          );
        } else {
          return isLoading == true
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(color: Colors.purple),
                ),
              )
              : SizedBox.shrink();
        }
      },
    );
  }
}
