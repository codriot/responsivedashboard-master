import 'package:flutter/material.dart';
import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/util/about_me_box.dart';
import 'package:responsivedashboard/util/my_tile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400, // istediğiniz yüksekliği ayarlayın
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/Banner.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
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
                child: SizedBox(
                  height: 300,
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
              ),
              const SizedBox(
                height: 20,
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
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.grey[800],
                thickness: 1,
                indent: 2,
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
              ),
              const SizedBox(height: 20),
              const AboutMeBox()
            ],
          ),
        ),
      ),
    );
  }
}
