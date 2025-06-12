import 'package:basic_ecommerce_app/screens/promo_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withAlpha(200),
                        ),

                        hintStyle: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withAlpha(200),
                        ),
                        fillColor: Theme.of(
                          context,
                        ).colorScheme.secondary.withAlpha(50),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withAlpha(50),
                    ),
                    child: Icon(Icons.person_2_outlined),
                  ),
                ],
              ),

              Row(
                children: [PromoCard(title: 'Summer Tech Sale upto 30% off')],
              ),

              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.secondary.withAlpha(50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text('Data $index'), // You can vary the text here
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
