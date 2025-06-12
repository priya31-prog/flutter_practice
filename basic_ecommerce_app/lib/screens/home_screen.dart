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
                        ).colorScheme.secondary.withAlpha(30),
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
                      ).colorScheme.secondary.withAlpha(30),
                    ),
                    child: Icon(Icons.person_2_outlined),
                  ),
                ],
              ),

              PromoCard(title: 'Summer Tech Sale upto 30% off'),
            ],
          ),
        ),
      ),
    );
  }
}
