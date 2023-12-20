import 'package:flutter/material.dart';
import 'package:helloflutter/gen/fonts.gen.dart';
import 'package:helloflutter/model/restaurant.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = "/detailRestaurant";
  final Restaurant restaurant;
  const DetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: restaurant.imageUrl,
                child: Image.network(
                  restaurant.imageUrl,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text("Your connection not stable"),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                        fontSize: 30,
                        fontFamily: FontFamily.poppins,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.map_outlined),
                      Text(
                        restaurant.city,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star),
                      Text(restaurant.rating.toString()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      restaurant.description,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
