import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../screens/restaurant_comments_form.dart';
import '../theme.dart';

class RestaurantDetailView extends StatefulWidget {
  const RestaurantDetailView({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailViewState();
}

class _RestaurantDetailViewState extends State<RestaurantDetailView> {

  void onCreate() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const RestaurantCommentsForm(),
    );

    if (result != null && result.containsKey('feedback')) {
      setState(() {
        widget.restaurant.comments.add(result['feedback'] as String);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Restaurant Detail'),
      ),

      // Floating Add button
      floatingActionButton: FloatingActionButton(
        onPressed: onCreate,
        backgroundColor: AppColors.main,
        child: const Icon(Icons.add),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: AppColors.main,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(widget.restaurant.address),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.restaurant.type.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.restaurant.type.name.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.star, size: 16),
                          SizedBox(width: 4),
                          Text('4.7'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: widget.restaurant.comments.isEmpty
                ? const Center(
                    child: Text('No comments yet'),
                  )
                : ListView.builder(
                    itemCount: widget.restaurant.comments.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          widget.restaurant.comments[index],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
