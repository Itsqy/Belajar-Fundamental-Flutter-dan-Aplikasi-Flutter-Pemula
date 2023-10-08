import 'package:flutter/material.dart';
import 'package:helloflutter/components/card_good_morning.dart';
import 'package:helloflutter/components/card_dashboard_info.dart';
import 'package:helloflutter/model/news_model.dart';
import '../gen/fonts.gen.dart';

class DashboardScreen extends StatelessWidget {
  final String user;

  const DashboardScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final List<int> totalCard = [
      1,
      2,
      3,
      4,
      5,
      5,
      5,
      5,
      5,
    ];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              Image.asset(
                "images/background_app.png",
                fit: BoxFit.fitWidth,
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
              padding: EdgeInsets.all(25),
              child: Text(
                "Recently News",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff59981A)),
              ),
            ),
            Container(
              height: 500,
              width: screenSize.width,
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: ListView.builder(
                itemCount: newsModel.length,
                itemBuilder: (context, index) {
                  final NewsModel news = newsModel[index];
                  return SizedBox(
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
                            const ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Image(
                                image: AssetImage("images/item_padi.png"),
                                width: 78,
                                height: 67,
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
                                      news.judul,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    const Text("12 Hours ago"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
