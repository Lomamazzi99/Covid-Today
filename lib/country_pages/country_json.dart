class CountryData {
  String day;
  String month;
  String year;
  String cases;
  String deaths;
  String alpha3Code;
  String continent;
  String name;

  CountryData(this.day, this.month, this.year, this.cases, this.deaths,
      this.alpha3Code, this.continent);
  CountryData.fromJson(Map<String, dynamic> json) {
    day = json['day'].toString();
    month = json['month'].toString();
    year = json['year'].toString();
    cases = json['cases'].toString();
    deaths = json['deaths'].toString();
    name = json['countriesAndTerritories'].toString();
    alpha3Code = json['countryterritoryCode'].toString();
    continent = json['continentExp'].toString();
  }
}
