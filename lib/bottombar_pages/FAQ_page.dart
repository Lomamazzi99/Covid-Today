import 'package:flip_card/flip_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayFAQPage extends StatefulWidget {
  @override
  DisplayFAQPageState createState() => DisplayFAQPageState();
}

final List<String> questions = <String>[
  "Q: Where do the data come from?",
  "Q: How is the data collected?",
  "Q: Are you associated with the ECDC?",
  "Q: Does the App collects any information?",
  "Q: Is the App's code publicly avaiable?",
  "Q: My country isn't listed, what can I do? ",
  "Q: How can I report an issue?",
  "Q: Can I make a suggestion?",
];

final List<String> answers = <String>[
  "All the data come from the European Centre for Disease Prevention and Control (ECDC). For more information you can check the ECDC's website ",
  "All the information about how the ECDC collects and processes Covid-19 data can be found ",
  "No. I am not part of the ECDC nor am I associated with them at all. I'm an indipendent university student from Italy.",
  "No. The App doesn't collect any user's information.",
  "Yes. The App's code can be found ",
  "If your country is not listed,fell free to contact me  ",
  "if you have found a problem, fell free to contact me  ",
  "If you want to make a suggestion,fell free to to do so by contacting me  ",
];

String link = "here";

class DisplayFAQPageState extends State<DisplayFAQPage> {
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 35,
      childAspectRatio: 17.5 / 10,
      children: <Widget>[
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              child: Center(
                child: Text(questions[0],
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
          back: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.teal[200],
              child: Center(
                  child: RichText(
                      text: new TextSpan(children: [
                TextSpan(text: answers[0], style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: link,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final url = 'https://www.ecdc.europa.eu/en';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }),
                TextSpan(text: ".")
              ])))),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              child: Center(
                child: Text(questions[1],
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
          back: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.teal[200],
              child: Center(
                  child: RichText(
                      text: new TextSpan(children: [
                TextSpan(text: answers[1], style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: link,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            'https://www.ecdc.europa.eu/en/covid-19/data-collection';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }),
                TextSpan(text: ".")
              ])))),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              child: Center(
                child: RichText(
                  text: new TextSpan(children: [
                    TextSpan(
                        text: questions[2], style: TextStyle(fontSize: 20)),
                  ]),
                ),
              )),
          back: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.teal[200],
              child: Center(
                  child: Text(answers[2],
                      style: TextStyle(color: Colors.white, fontSize: 20)))),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              child: Center(
                child: Text(questions[3],
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
          back: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.teal[200],
              child: Center(
                  child: Text(answers[3],
                      style: TextStyle(color: Colors.white, fontSize: 20)))),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              child: Center(
                child: Text(questions[4],
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
          back: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.teal[200],
              child: Center(
                  child: RichText(
                      text: new TextSpan(children: [
                TextSpan(text: answers[4], style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: link,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            'https://github.com/Lomamazzi99/Covid-Today';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }),
                TextSpan(text: ".")
              ])))),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              child: Center(
                child: Text(questions[5],
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
          back: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.teal[200],
              child: Center(
                  child: RichText(
                      text: new TextSpan(children: [
                TextSpan(text: answers[5], style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: link,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            'mailto:covid.today.app@gmail.com?subject=test%20subject&body=test%20body';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }),
                TextSpan(text: "."),
                TextSpan(
                    text: " You can also open an issue ",
                    style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: link,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            'https://github.com/Lomamazzi99/Covid-Today/issues';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }),
                TextSpan(text: "."),
              ])))),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              child: Center(
                child: Text(questions[6],
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
          back: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.teal[200],
              child: Center(
                  child: RichText(
                      text: new TextSpan(children: [
                TextSpan(text: answers[6], style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: link,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            'mailto:covid.today.app@gmail.com?subject=test%20subject&body=test%20body';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }),
                TextSpan(text: "."),
                TextSpan(
                    text: "You can also open an issue ",
                    style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: link,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            'https://github.com/Lomamazzi99/Covid-Today/issues';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }),
                TextSpan(text: "."),
              ])))),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              child: Center(
                child: Text(questions[7],
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
          back: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              color: Colors.teal[200],
              child: Center(
                  child: RichText(
                      text: new TextSpan(children: [
                TextSpan(text: answers[7], style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: link,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            'mailto:covid.today.app@gmail.com?subject=test%20subject&body=test%20body';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }),
                TextSpan(text: "."),
                TextSpan(
                    text: "You can also open an issue ",
                    style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: link,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            'https://github.com/Lomamazzi99/Covid-Today/pulls';
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                          );
                        }
                      }),
                TextSpan(text: "."),
              ])))),
        ),
      ],
    );
  }
}
