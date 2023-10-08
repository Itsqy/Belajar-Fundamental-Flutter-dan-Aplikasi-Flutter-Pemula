import 'package:flutter/material.dart';
import 'package:helloflutter/components/humidity_card.dart';
import 'package:helloflutter/gen/fonts.gen.dart';

class CardDashboardInfo extends StatelessWidget {
  const CardDashboardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width.toDouble(),
      child: const Card(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 160,
        ),
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.only(left: 19.0, top: 10, right: 19.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            Icon(Icons.location_city),
                            Text(
                              "Surabaya, East Java",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff5C5C5C),
                                  fontWeight: FontWeight.normal,
                                  fontFamily: FontFamily.poppins),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "25",
                            style: TextStyle(
                                fontSize: 36,
                                color: Color(0xff59981A),
                                fontFamily: FontFamily.poppins,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text("°C"), Text("Rain")],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 28, top: 10, bottom: 10),
                    child: Image(
                      image: AssetImage("images/rain_logo.png"),
                      height: 53,
                      width: 53,
                    ),
                  )
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 137, 132, 132),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HumidityCard("HUmidity", "90%"),
                  HumidityCard("UV Index", "Low"),
                  HumidityCard("Wind", "5 km/h"),
                  HumidityCard("Pollen", "none"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
