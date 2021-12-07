import 'package:flutter/material.dart';
import 'package:soundex_converter/Algos/to_soundex.dart';
import 'package:soundex_converter/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String entry = "";
  String response = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Soundex Generator"),
          centerTitle: true,
          actions: [
            RawMaterialButton(
                child: Image.asset(
                    choosenLanguage == "fr" ? 'assets/fr.png' : 'assets/en.png',
                    height: 20),
                onPressed: () {
                  setState(() {
                    choosenLanguage == "fr"
                        ? choosenLanguage = "en"
                        : choosenLanguage = "fr";
                    Soundex soundex = Soundex(rowStr: entry.toUpperCase());
                    soundex.fullProcess();
                    response = soundex.convertedStr;
                  });
                })
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  maxLines: null,
                  onChanged: (String str) {
                    entry = str;
                    setState(() {
                      Soundex soundex = Soundex(rowStr: entry.toUpperCase());
                      soundex.fullProcess();
                      response = soundex.convertedStr;
                    });
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: choosenLanguage == "fr"
                        ? "Écrivez les mots à convertir"
                        : "Write words to convert",
                  ),
                ),
                const SizedBox(height: 20),
                Text(response),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
