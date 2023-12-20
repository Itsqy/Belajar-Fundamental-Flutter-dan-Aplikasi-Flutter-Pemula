import 'package:flutter/material.dart';
import 'package:helloflutter/gen/fonts.gen.dart';
import 'package:helloflutter/model/restaurant.dart';
import 'package:helloflutter/screen/detail_screen.dart';

class ItemResto extends StatelessWidget {
  const ItemResto({
    super.key,
    required this.screenSize,
    required this.restaurant,
  });

  final Size screenSize;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, DetailScreen.routeName,
          arguments: restaurant),
      child: SizedBox(
        width: screenSize.width.toDouble(),
        child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image.network(
                      restaurant.imageUrl,
                      width: 78,
                      height: 67,
                      errorBuilder: (context, error, stackTrace) =>
                          const Text("Your connection not stable"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("rate : ${restaurant.rating}"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
