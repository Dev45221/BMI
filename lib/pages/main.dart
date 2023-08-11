import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'SplashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weight_controller = TextEditingController();
  var feet_controller = TextEditingController();
  var inch_controller = TextEditingController();
  var result = "";
  var msg = "";
  var txtColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.deepPurple.shade50,
        child:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 40,),
              const Text("     BMI \nCalculator", style: TextStyle( fontSize: 30, fontWeight: FontWeight.w700, color: Colors.deepPurple, letterSpacing: 3 ),),
              const SizedBox(height: 50,),
              SizedBox(
                width: 220,
                child: TextField(
                  controller: weight_controller,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter Weight"),
                    suffixText: "kg",
                    prefixIcon: Icon(Icons.monitor_weight_outlined, color: Colors.deepPurple,),
                  ),
                ),
              ),
              SizedBox(
                width: 220,
                child: TextField(
                  controller: feet_controller,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter Height (in feet)"),
                    suffixText: "feet",
                    prefixIcon: Icon(Icons.height, color: Colors.deepPurple,),
                  ),
                ),
              ),
              SizedBox(
                width: 220,
                child: TextField(
                  controller: inch_controller,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter Height (in inch)"),
                    suffixText: "inch",
                    prefixIcon: Icon(Icons.height, color: Colors.deepPurple,),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan( text: "$msg \n", style: TextStyle( fontSize: 22, color: txtColor )),
                    TextSpan( text: result, style: const TextStyle( fontSize: 18, color: Colors.deepPurple ) )
                  ]
                ),
              )
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    var wt = weight_controller.text.toString();
                    var ft = feet_controller.text.toString();
                    var inch = inch_controller.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      // BMI Calculation
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt*12) + iInch;
                      var tCm = tInch*2.54;
                      var tM = tCm/100;
                      var bmi = iWt/(tM*tM);

                      if (bmi > 25) {
                        msg = "you're Over Weight 😟";
                        txtColor = Colors.orange.shade900;
                      } else if (bmi < 18) {
                        msg = "You're Under Weight 😟";
                        txtColor = Colors.red;
                      } else {
                        msg = "You're Healthy 😎";
                        txtColor = Colors.green;
                      }

                      setState(() {
                        msg;
                        txtColor;
                        result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                      });

                    } else {
                      setState(() {
                        result = "Please fill all fields";
                      });
                    }

                  }, child: const Text("Calculate", style: TextStyle( fontSize: 20 ),)),
              const SizedBox(height: 8,),
              InkWell(
                onTap: () {
                  weight_controller.clear();
                  feet_controller.clear();
                  inch_controller.clear();
                  setState(() {
                    result = "";
                    msg = "";
                  });
                  // bgColor = Colors.white;
                },
                  child: const Text("Clear", style: TextStyle( fontSize: 18, color: Colors.deepPurple, decoration: TextDecoration.underline ),)
              ),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      )
    );
  }
}
