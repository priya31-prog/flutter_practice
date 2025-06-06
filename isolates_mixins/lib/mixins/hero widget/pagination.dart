import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  final ScrollController _controller = ScrollController();
  List<String> itemList = [];
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
    await Future.delayed(Duration(seconds: 3));
    List<String> newData = List.generate(
      itemsPerPage,
      (index) => '${index + page * itemsPerPage}',
    );

    setState(() {
      page++;
      itemList.addAll(newData);
      isLoading = false;
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
        title: Text('Pagination', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        if (index < itemList.length) {
          return ListTile(
            leading: Icon(Icons.data_object_outlined),
            title: Text('Item $index'),
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
