// ignore: file_names
import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
      menus: Menus.fromJson(json['menus']),
    );
  }
}

class Menus {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: (json['foods'] as List<dynamic>)
          .map((food) => MenuItem.fromJson(food))
          .toList(),
      drinks: (json['drinks'] as List<dynamic>)
          .map((drink) => MenuItem.fromJson(drink))
          .toList(),
    );
  }
}

class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
    );
  }
}

List<Restaurant> parsingDataRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
