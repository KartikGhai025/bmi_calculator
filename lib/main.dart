import 'package:flutter/material.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double result = 0;

  String message() {
    if(result==0){
      return "Let's Check";
    }
    else if (result >= 25) {
      return 'Greater than usual!! Try to exercise more.';
    } else if (result >= 18.5) {
      return 'All Good, Great job!';
    } else {
      return 'Need to be worry, work harder!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.white
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Container(

          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" \"Your Input Matters\" ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown
                ),),
              SizedBox(height: 100),
              Container(
                width: 500,
                decoration: BoxDecoration(
                  //   color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                //color: Colors.white.withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(),
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'height in cm',
                          icon: Icon(Icons.trending_up, color: Colors.red,),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(

                          labelText: 'weight in kg',
                          icon: Icon(Icons.line_weight, color: Colors.blueAccent,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                  ),
                ),
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: calculate,
              ),
              SizedBox(height: 15),
              Text(
                result.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(message(), style: TextStyle(
                  color: Colors.pinkAccent
              ),),
            ],
          ),
        ),
      ),
    );
  }

  void calculate() {
    double height = double.parse(heightController.text) ;
    double weight = double.parse(weightController.text);
    height= height/100;

    double bmi = weight / (height * height);
    result = bmi;
    setState(() {});
  }
}
