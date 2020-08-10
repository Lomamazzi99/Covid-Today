import 'package:flutter/material.dart';
import './country_json.dart';
import 'package:number_display/number_display.dart';

// ignore: camel_case_types
class displayCountryPage extends StatefulWidget {
  final Color color;
  final List<CountryData> countriesData;
  displayCountryPage(this.countriesData, this.color);
  @override
  displayCountryPageState createState() =>
      displayCountryPageState(countriesData, color);
}

// ignore: camel_case_types
class displayCountryPageState extends State<displayCountryPage> {
  Color color;
  List<CountryData> countriesData;
  bool isLoading = true;
  displayCountryPageState(this.countriesData, this.color);

  final List<String> numberOf = <String>[
    "Total cases",
    "Today's cases",
    "Cases this week vs last week",
    "Cases this month vs last month",
    "Total deaths",
    "Today's deaths",
    "Deaths this week vs last week",
    "Deaths this month vs last month",
    "Month with most cases",
    "Month with most deaths"
  ];

  final List<String> months = <String>[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "Dicember",
  ];

  List<int> valueOf = <int>[];
  List<String> percentageOf = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: Text(countriesData[0].name.replaceAll("_", " ") + "'s Data"),
        ),
        body: builder());
  }

  Widget builder() {
    final display = createDisplay(length: 6);
    findValues(countriesData);
    return ListView.separated(
      itemCount: numberOf.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            child: Card(
          color: Colors.amber[200],
          child: Padding(
            padding: const EdgeInsets.only(
                top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      '${numberOf[index]} : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    index <= 7
                        ? Text(
                            display(valueOf[index]) +
                                '  ${percentageOf[index]}',
                            style: TextStyle(
                                fontSize: 18,
                                color: valueOf[index] > 0
                                    ? Colors.red
                                    : Colors.green),
                          )
                        : Text(
                            months[valueOf[index] - 1] +
                                " :  " +
                                display(valueOf[index + 2]),
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          )
                  ],
                ),
              ],
            ),
          ),
        ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  void findValues(List<CountryData> inputData) {
    DateTime today = DateTime.now();

    int totalCases = 0,
        totalDeaths = 0,
        currentCases = 0,
        previousCases = 0,
        currentDeaths = 0,
        previousDeaths = 0,
        maxCases = 0,
        maxDeaths = 0,
        currentMonth = 1;
    int maxCMonth = 1, maxDMonth = 1;

    for (int i = inputData.length - 1; i >= 0; i--) {
      totalCases += int.parse(inputData[i].cases);
      totalDeaths += int.parse(inputData[i].deaths);

      int thisMonth = int.parse(inputData[i].month);
      if (thisMonth != currentMonth) {
        currentMonth = thisMonth;
        if (maxCases < previousCases) {
          maxCases = previousCases;
          maxCMonth = thisMonth;
        }
        if (maxDeaths < previousDeaths) {
          maxDeaths = previousDeaths;
          maxDMonth = thisMonth;
        }
        previousCases = int.parse(inputData[i].cases);
        previousDeaths = int.parse(inputData[i].deaths);
      } else {
        if (thisMonth == today.month) {
          currentCases += int.parse(inputData[i].cases);
          currentDeaths += int.parse(inputData[i].deaths);
        }
        previousCases += int.parse(inputData[i].cases);
        previousDeaths += int.parse(inputData[i].deaths);
      }
    }

    valueOf.insert(0, totalCases); //totali
    valueOf.insert(1, int.parse(inputData[0].cases)); //oggi
    valueOf.insert(2, 0); //sett
    valueOf.insert(3, currentCases - previousCases); // mese
    valueOf.insert(4, totalDeaths);
    valueOf.insert(5, int.parse(inputData[0].deaths));
    valueOf.insert(6, 0);
    valueOf.insert(7, currentDeaths - previousDeaths);
    valueOf.insert(8, maxCMonth);
    valueOf.insert(9, maxDMonth);
    valueOf.insert(10, maxCases);
    valueOf.insert(11, maxDeaths);

    if (valueOf[0] == 0) {
      percentageOf.insert(0, "(0%)");
    } else {
      String val =
          (int.parse(inputData[0].cases) / valueOf[0] * 100).toStringAsFixed(2);
      percentageOf.insert(0, "(" + val + "%)");
    }

    percentageOf.insert(1, "");
    percentageOf.insert(2, "");
    if (currentCases == 0) {
      percentageOf.insert(3, "(0%)");
    } else {
      percentageOf.insert(
          3, "(" + (valueOf[3] / currentCases * 100).toStringAsFixed(2) + "%)");
    }
    //deaths
    if (valueOf[4] == 0) {
      percentageOf.insert(4, "(0%)");
    } else {
      String val = (int.parse(inputData[0].deaths) / valueOf[4] * 100)
          .toStringAsFixed(2);
      percentageOf.insert(4, "(" + val + "%)");
    }

    percentageOf.insert(5, "");
    percentageOf.insert(6, "");
    if (currentDeaths == 0) {
      percentageOf.insert(7, "(0%)");
    } else {
      percentageOf.insert(7,
          "(" + (valueOf[7] / currentDeaths * 100).toStringAsFixed(2) + "%)");
    }

    currentCases = 0;
    currentDeaths = 0;
    previousCases = 0;
    previousDeaths = 0;
    for (int i = 0; i < today.weekday + 7; i++) {
      if (i < today.weekday) {
        currentCases += int.parse(inputData[i].cases);
        currentDeaths += int.parse(inputData[i].deaths);
      } else if (i >= today.weekday && i < today.weekday + 7) {
        previousCases += int.parse(inputData[i].cases);
        previousDeaths += int.parse(inputData[i].deaths);
      }
    }

    valueOf[2] = currentCases - previousCases;
    valueOf[6] = currentDeaths - previousDeaths;
    if (currentCases == 0) {
      percentageOf[2] = "(0%)";
    } else {
      percentageOf[2] =
          "(" + (valueOf[2] / currentCases * 100).toStringAsFixed(2) + "%)";
    }
    if (currentDeaths == 0) {
      percentageOf[6] = "(0%)";
    } else {
      percentageOf[6] =
          "(" + (valueOf[6] / currentDeaths * 100).toStringAsFixed(2) + "%)";
    }
  }
}
