import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AFind Age",
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var age = 0;
  var selectedYear;

  //Function For Show Date Picker
  void _showPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime(2022),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((dt) {
      //If Click On Cancel Button
      if (dt == null) return;

      //If Click On OK Button
      setState(() {
        selectedYear = dt.year;
      });
      //Calculate Age
      calculateAge();
    });
  }

  //Method Of Calculate Age
  void calculateAge() {
    setState(() {
      age = (DateTime.now().year - selectedYear).toInt();
    });
  }

  @override
  //Function For Calculate Age
  Widget build(BuildContext context) {
    //Scaffold Material
    return Scaffold(
      appBar: AppBar(
        title: const Text("AFind Age"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Your Age Is $age",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Padding(
              padding: const EdgeInsets.all(14),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(170, 48),
                      backgroundColor: Colors.black),
                  onPressed: _showPicker,
                  child: Text(
                      selectedYear != null
                          ? selectedYear.toString()
                          : "Select Year",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
