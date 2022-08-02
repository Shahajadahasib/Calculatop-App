import 'package:flutter/material.dart';
import 'package:test_app/const/const.dart';
import 'package:math_expressions/math_expressions.dart';
import 'widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/MyHomePage';
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            size: 32, color: Theme.of(context).colorScheme.primary),
        centerTitle: true,
        title: Text(
          'Calculator',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.right,
                          userInput,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).cardColor),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.right,
                          answer,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).cardColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Row(
          //   children: const [
          //     NumberButton(
          //       text: "1",
          //     ),
          //     NumberButton(
          //       text: "1",
          //     ),
          //     NumberButton(
          //       text: "1",
          //     ),
          //   ],
          // )
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: Consts.button.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return NumberButton(
                      function: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      buttonText: Consts.button[index],
                    );
                  } // +/- button
                  else if (index == 1) {
                    return NumberButton(
                      function: () {},
                      buttonText: Consts.button[index],
                    );
                  }
                  // % Button
                  else if (index == 2) {
                    return NumberButton(
                      function: () {
                        setState(() {
                          userInput += Consts.button[index];
                        });
                      },
                      buttonText: Consts.button[index],
                    );
                  }
                  // Delete Button
                  else if (index == 3) {
                    return NumberButton(
                      function: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: Consts.button[index],
                    );
                  }
                  // Equal_to Button
                  else if (index == 18) {
                    return NumberButton(
                      function: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: Consts.button[index],
                    );
                  }

                  //  other buttons
                  else {
                    return NumberButton(
                      function: () {
                        setState(() {
                          userInput += Consts.button[index];
                        });
                      },
                      buttonText: Consts.button[index],

                      // textColor: isOperator(buttons[index])
                      //     ? Colors.white
                      //     : Colors.black,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({
    Key? key,
    required this.buttonText,
    required this.function,
  }) : super(key: key);
  final String buttonText;
  final function;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TextButton(
        onPressed: function,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
