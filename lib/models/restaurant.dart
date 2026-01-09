import 'restaurant_type.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<String> comments;
 
  Restaurant({required this.name, required this.address, required this.type, this.comments = const []});
}
