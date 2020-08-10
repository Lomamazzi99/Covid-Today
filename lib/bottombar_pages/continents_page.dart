import 'package:flutter/material.dart';
import '../country_pages/All_countries_page.dart';
import '../country_pages/country_json.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DisplayContinentsPage extends StatefulWidget {
  @override
  DisplayContinentsPageState createState() => DisplayContinentsPageState();
}

class DisplayContinentsPageState extends State<DisplayContinentsPage> {
  final List<String> entries = [
    "Africa",
    "America",
    "Asia",
    "Europe",
    "Oceania"
  ];

  final List<Color> colorNames = [
    Colors.pink[600],
    Colors.amber[600],
    Colors.greenAccent,
    Colors.lightBlue[600],
    Colors.cyan[800]
  ];
  List<CountryData> _countriesData = [];

  bool isLoading = true;
  // ignore: unused_element
  var countriesData = List<CountryData>();
  Future<List<CountryData>> _getValues() async {
    var data = await http
        .get("https://opendata.ecdc.europa.eu/covid19/casedistribution/json");

    var jsonData = json.decode(data.body);

    for (var i in jsonData["records"].toList()) {
      countriesData.add(CountryData.fromJson(i));
    }
    //print(countriesData.length);
    return countriesData;
  }

  @override
  void initState() {
    _getValues().then((value) {
      setState(() {
        isLoading = false;
        _countriesData = countriesData;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? continentsPage()
        : Center(
            heightFactor: 17, child: CircularProgressIndicator(strokeWidth: 8));
  }

  Widget continentsPage() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            //color: Colors.black,
            height: 120,
            child: InkWell(
              child: Card(
                color: colorNames[index],
                child: Center(
                    child: Text(
                  '${entries[index]}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DisplayAllCountriesPage(
                        entries[index], _countriesData, colorNames[index])));
              },
            ),
          );
        });
  }
}
