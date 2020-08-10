import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayDonationsPage extends StatefulWidget {
  @override
  DisplayDonationsPageState createState() => DisplayDonationsPageState();
}

class DisplayDonationsPageState extends State<DisplayDonationsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "If you want to support the fight against COVID-19, feel free to do so by selecting an organization and donating to it by cliking the icon below.",
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  )),
              /*SizedBox(
                height: 20,
              ),
              Text("W.H.O = World Health Organization"),
              Text(
                  "UNICEF = United Nations International Children's Emergency Fund"),
              Text("M.S.F = Medicins Sans Frontiere (Medics Without Borders)"),*/
              SizedBox(
                height: 50,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox.fromSize(
                      size: Size(100, 100), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.orange, // button color
                          child: InkWell(
                            splashColor: Colors.green, // splash color
                            onTap: () async {
                              final url = 'https://covid19responsefund.org/en/';
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  forceSafariVC: false,
                                );
                              }
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.local_hospital), // icon
                                Text("W.H.O",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size(100, 100), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.orange, // button color
                          child: InkWell(
                            splashColor: Colors.green, // splash color
                            onTap: () async {
                              final url = 'https://www.unicef.org/take-action';
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  forceSafariVC: false,
                                );
                              }
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.local_hospital), // icon
                                Text("UNICEF",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size(100, 100), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.orange, // button color
                          child: InkWell(
                            splashColor: Colors.green, // splash color
                            onTap: () async {
                              final url = 'https://www.msf.org/donate';
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  forceSafariVC: false,
                                );
                              }
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.local_hospital), // icon
                                Text(
                                  "M.S.F",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(
                height: 50,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "If you want to support this project, fell free to do so by buying me a coffee by cliking the icon below.",
                    style: TextStyle(
                        //fontWeight: FontWeight.w400,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox.fromSize(
                size: Size(100, 100), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.orange, // button color
                    child: InkWell(
                      splashColor: Colors.green, // splash color
                      onTap: () async {
                        final url = 'https://www.buymeacoffee.com/loma';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.local_cafe), // icon
                          Text("Thanks!"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]));
  }
}
