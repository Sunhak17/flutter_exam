// Widget to disaply a restaurant type chip
import 'package:flutter/material.dart';
import '../../../models/restaurant_type.dart';

class RestaurantTypeChip extends StatelessWidget {
  const RestaurantTypeChip({super.key, required this.type});

  final RestaurantType type;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        type.name.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
      backgroundColor: type.color,
      padding: const EdgeInsets.all(8),
    );
  }
}
