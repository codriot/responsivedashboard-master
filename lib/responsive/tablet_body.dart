import 'package:flutter/material.dart';
import 'package:responsivedashboard/constants.dart';
import '../util/my_tile.dart';
import 'package:responsivedashboard/util/about_me_box.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // first 4 boxes in grid
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 396, // istediğiniz yüksekliği ayarlayın
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/image/Banner.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),

                    // list of previous days
                    const SizedBox(
                      height: 10,
                    ),
                    Text("GITHUB REPOSITORIES",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 24,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        // ! important physics sadece siteye hızlı bakmak için koydum işin bitince kaldır
                        itemCount: 9,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const MyTile(); // TODO: add github link in tile
                        },
                      ),
                    ),
                    // work experience and education
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 396, // istediğiniz yüksekliği ayarlayın
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/image/work_and_edu.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            bottom: 5,
                            left: MediaQuery.of(context).size.width /
                                4, // Stack'ın genişliğinin yarısı
                            right: MediaQuery.of(context).size.width /
                                4, // Stack'ın genişliğinin yarısı

                            child: VerticalDivider(
                              color: Colors.grey[800],
                              thickness: 2,
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Text("WORK EXPERIENCE",
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 20,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 20),
                                    Text(
                                      "Balıkesir University\nIT departmant - intern\n2023 October - nowadays",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Text("EDUCATION",
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 20,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 20),
                                    Text(
                                      "BALIKESIR UNIVERSITY\nCOMPUTER ENGINEERING\n3rd YEAR STUDENT",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 14,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // about me box
                    const AboutMeBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
