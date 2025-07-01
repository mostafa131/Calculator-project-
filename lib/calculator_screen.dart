import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController num1 = TextEditingController();

  TextEditingController num2 = TextEditingController();

  double result = 0;

  void calculate(String x) {
    double numOne = double.tryParse(num1.text) ?? 0;
    double numTwo = double.tryParse(num2.text) ?? 0;

    setState(() {
      if (x == "+") {
        result = numOne + numTwo;
      } else if (x == "-"){
        result = numOne - numTwo;
      } else if (x == "*"){
        result = numOne * numTwo;
      }else if (x == "/"){
        result = numOne != 0 ? numOne / numTwo : 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal[700],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: num1,
                        decoration: InputDecoration(
                          labelText: "Num1",
                          labelStyle: TextStyle(color: Colors.black26),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      TextField(
                        controller: num2,
                        decoration: InputDecoration(
                          labelText: "Num2",
                          labelStyle: TextStyle(color: Colors.black26),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 30,
                  color: Colors.teal[800],
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    height: 150,
                    width: 350,
                    child: Center(child: Text("Result = $result")),
                  ),
                ),
                Container(
                  width: 50,
                  height: 30,
                  color: Colors.teal[800],
                ),
              ],
            ),

          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal[700],
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        calculate("+");
                      },
                      child: Text("+"),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        calculate("-");
                      },
                      child: Text("-"),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        calculate("*");
                      },
                      child: Text("x"),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        calculate("/");
                      },
                      child: Text("/"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
