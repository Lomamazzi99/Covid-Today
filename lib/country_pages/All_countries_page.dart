import 'package:flutter/material.dart';
import './All_countries_body.dart';
import './country_json.dart';
import './country_name.dart';

// ignore: must_be_immutable
class DisplayAllCountriesPage extends StatefulWidget {
  final String continentPressed;
  final List<CountryData> countriesData;
  final Color color;
  DisplayAllCountriesPage(
      this.continentPressed, this.countriesData, this.color);
  @override
  DisplayAllCountriesPageState createState() =>
      DisplayAllCountriesPageState(continentPressed, countriesData, color);
}

class DisplayAllCountriesPageState extends State<DisplayAllCountriesPage> {
  Color color;
  String continentPressed;
  List<CountryData> countriesData;
  DisplayAllCountriesPageState(
      this.continentPressed, this.countriesData, this.color);
  bool isSearching = false;

  List<String> names = [];

  Icon currIcon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('All Countries of: ' + continentPressed),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _filterState(names);
                showSearch(
                    context: context,
                    delegate: DataSearch(
                        names,
                        color,
                        countriesData
                            .where((element) =>
                                element.continent.contains(continentPressed))
                            .toList(),
                        continentPressed));
              });
            },
          )
        ],
      ),
      body: AllCountriesBodyState(
              countriesData
                  .where(
                      (element) => element.continent.contains(continentPressed))
                  .toList(),
              color)
          .build(context),
    );
  }

  void _filterState(List<String> names) {
    List<CountryData> listofState = countriesData
        .where((element) => element.continent.contains(continentPressed))
        .toList();

    for (int i = 0; i < listofState.length; i++) {
      if (!names.contains(listofState[i].name)) {
        names.add(listofState[i].name);
      }
    }
  }
}

class DataSearch extends SearchDelegate<String> {
  List<String> entries;
  Color color;
  List<CountryData> countries;
  String continent;
  DataSearch(this.entries, this.color, this.countries, this.continent);
  List<String> recentSearch = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of appbar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (!recentSearch.contains(query) && query != "") recentSearch.add(query);
    if (query.isEmpty) {
      return Container(
          child: Center(
        child: Text(""),
      ));
    }

    return displayCountryPageState(
            countries
                .where((element) => (element.name.toLowerCase())
                    .startsWith(query.toLowerCase()))
                .toList(),
            color)
        .builder();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when smn searches for something

    List<String> suggestionList = query.isEmpty
        ? recentSearch
        : entries
            .where((element) => element.toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
        primaryColor: color,
        primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
        primaryColorBrightness: Brightness.light,
        primaryTextTheme: theme.textTheme
        //TextTheme().apply(decorationColor: Colors.white),
        );
  }
}
