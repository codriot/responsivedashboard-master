import 'package:flutter/material.dart';
import 'package:responsivedashboard/Product/services/web_scraper_service.dart';
import 'package:responsivedashboard/util/about_me_box.dart';
import 'package:responsivedashboard/util/my_tile.dart';
import '../constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            myDrawer,
            // first half of page
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(height: 800, child: ListViewGithub()),
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

class ListViewGithub extends StatelessWidget {
  const ListViewGithub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: WebScraperService().fetchRepos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return MyTile(
                maintitle: snapshot.data![index].name ?? '',
                subtitle: snapshot.data![index].description ?? '',
                url: snapshot.data![index].htmlUrl ?? '',
              );
            },
          );
        }
      },
    );
  }
}
