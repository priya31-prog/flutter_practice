import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isolates_mixins/API/users_api.dart';
// import 'package:isolates_mixins/API/users_model.dart';
import 'package:isolates_mixins/state_management/state_provider.dart';

class ScrollViewPagination extends ConsumerStatefulWidget {
  const ScrollViewPagination({super.key});

  @override
  ConsumerState<ScrollViewPagination> createState() =>
      _ScrollViewPaginationState();
}

class _ScrollViewPaginationState extends ConsumerState<ScrollViewPagination> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchData(); //to avoid unnecessary rebuilds
    });

    _controller.addListener(() {
      if (_controller.position.pixels >=
              _controller.position.maxScrollExtent - 100 &&
          !ref.read(loadingNextScroll)) {
        _fetchData();
      }
    });
  }

  void _fetchData() async {
    ref.read(loadingNextScroll.notifier).state = true;
    // log('logging is loading ${ref.watch(loadingNextScroll)}');

    await Future.delayed(Duration(seconds: 3));

    UserApi().fetchUsers().then((value) {
      // userData = value;
      ref.read(singlePageItem.notifier).state = List.generate(
        ref.watch(scrollItemsPerPage),
        (index) =>
            value[index +
                ref.watch(scrollPages) * ref.watch(scrollItemsPerPage)],
      );
      ref.read(loadingNextScroll.notifier).state = false;

      ref.read(userData.notifier).state.addAll(ref.watch(singlePageItem));
      ref.read(scrollPages.notifier).state++;

      // log('logging users userdate ${userData}');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(loadingNextScroll);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ScrollViewPagination',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _buildList(context, isLoading: isLoading),
    );
  }

  Widget _buildList(BuildContext context, {required bool isLoading}) {
    final users = ref.watch(userData);
    return ListView.builder(
      controller: _controller,
      itemCount: users.length,
      itemBuilder: (context, index) {
        // return ListTile(title: Text('item 56'));
        if (index < users.length - 1 && users.isNotEmpty) {
          return ListTile(
            leading: Icon(Icons.people_alt_rounded),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${users[index].firstName} ${users[index].lastName}'),
                Text('${users[index].companyId} - ${users[index].countryCode}'),
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
