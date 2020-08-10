import 'package:flutter/material.dart';
import './bottombar_pages/Donations_page.dart';
import './bottombar_pages/FAQ_page.dart';
import './bottombar_pages/continents_page.dart';

class DisplayMainPage extends StatefulWidget {
  @override
  DisplayMainPageState createState() => DisplayMainPageState();
}

class DisplayMainPageState extends State<DisplayMainPage> {
  List<Widget> _widgets = [
    DisplayContinentsPage(),
    DisplayFAQPage(),
    DisplayDonationsPage()
  ];

  int _currentIndex = 0;

  List<Widget> titleIs = [
    Text("Select a Continent "),
    Text("FAQ"),
    Text("Donations")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.blue, title: titleIs[_currentIndex]),
      body: _widgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 18,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_answer),
                title: Text("FAQ"),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on),
                title: Text("Donations"),
                backgroundColor: Colors.blue),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
