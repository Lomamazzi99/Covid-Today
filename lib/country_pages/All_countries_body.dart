import 'package:flutter/material.dart';
import './country_name.dart';
import './country_json.dart';
//import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AllCountriesBody extends StatefulWidget {
  Color color;

  List<CountryData> countriesData;
  AllCountriesBody(countriesData, color);
  @override
  AllCountriesBodyState createState() =>
      AllCountriesBodyState(this.countriesData, this.color);
}

class AllCountriesBodyState extends State<AllCountriesBody> {
  Color color;
  List filteredlist = [];
  List<CountryData> countriesData;
  AllCountriesBodyState(this.countriesData, this.color);

  Widget build(BuildContext context) {
    List<String> names = [];
    List<String> codes = [];
    _filterState(names, codes);
    return Container(
        child: ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    displayCountryPage(findState(codes[index]), color)));
          },
          child: Card(
              elevation: 20,
              child: Row(
                children: <Widget>[
                  new Expanded(
                      child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                              child: Text(
                            names[index].replaceAll("_", " "),
                            style: TextStyle(fontSize: 30),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                          )),
                        ],
                      )
                    ],
                  ))
                ],
              )),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ));
  }

  List<CountryData> findState(String code) {
    List<CountryData> elements = [];
    var index = countriesData.length;
    for (int i = 0; i < index; i++) {
      if (countriesData[i].alpha3Code == (code)) {
        elements.add((countriesData[i]));
      }
    }

    return elements;
  }

  void _filterState(List<String> names, List<String> codes) {
    for (int i = 0; i < countriesData.length; i++) {
      if (!names.contains(countriesData[i].name)) {
        names.add(countriesData[i].name);
        codes.add(countriesData[i].alpha3Code);
      }
    }
  }
}
