import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../screens/restaurant_comments_view.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),

      body: ListView.builder(
        itemCount: widget.restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = widget.restaurants[index];
          final double rating = 3 + (index % 3) * 1.0;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RestaurantDetailView(restaurant: restaurant),
                            ),
                          );
                        },
                        child: StarsChip(rating: rating),
                      ),
                      const SizedBox(width: 8),
                      RestaurantTypeChip(type: restaurant.type),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
