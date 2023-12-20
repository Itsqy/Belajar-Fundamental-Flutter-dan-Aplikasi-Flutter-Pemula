import 'package:flutter/material.dart';
import 'package:helloflutter/components/card_good_morning.dart';
import 'package:helloflutter/components/card_dashboard_info.dart';
import 'package:helloflutter/components/item_resto.dart';
import 'package:helloflutter/model/restaurant.dart';
import '../gen/fonts.gen.dart';

class DashboardScreen extends StatelessWidget {
  final String user;
  static const routeName = "/dashboard";

  const DashboardScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              Image.asset(
                "images/background_app.png",
                fit: BoxFit.fill,
                width: screenSize.width.toDouble(),
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CardGoodMorning(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        " $user".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const CardDashboardInfo(),
            ]),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 25, right: 25),
              child: Text(
                "Resto",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff59981A)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "Eauteuy Recomendations",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 49, 94, 2)),
              ),
            ),
            FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/local_restaurant.json'),
              builder: (context, snapshot) {
                final List restaurantData =
                    parsingDataRestaurant(snapshot.data);
                return Container(
                  height: 500,
                  width: screenSize.width,
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: ListView.builder(
                    itemCount: restaurantData.length,
                    itemBuilder: (context, index) {
                      final Restaurant restaurant = restaurantData[index];
                      return ItemResto(
                        screenSize: screenSize,
                        restaurant: restaurant,
                      );
                    },
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
