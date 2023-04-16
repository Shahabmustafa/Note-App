import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var input = '';
  double? firstNumber;
  double? secondNumber;
  var operator;

  clicOnButton(value){
    // print(value);
    if(value == "AC"){
      input = '';
    }else if(value == "="){}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 250.0,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text('0',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(color: Color(0xFF323232),),
            Column(
              children: [
                Row(
                  children: [
                    RoundedButton(
                      title: 'AC',
                      boxColor: const Color(0xFF323232),
                      textColor: Colors.black,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '+/-',
                      boxColor: const Color(0xFF323232),
                      textColor: Colors.black,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '%',
                      boxColor: const Color(0xFF323232),
                      textColor: Colors.black,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '÷',
                      boxColor: const Color(0xFFf69a02),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    RoundedButton(
                      title: '7',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '8',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '9',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: 'x',
                      boxColor: const Color(0xFFf69a02),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    RoundedButton(
                      title: '4',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '5',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '6',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '-',
                      boxColor: const Color(0xFFf69a02),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    RoundedButton(
                      title: '1',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '2',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '3',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '+',
                      boxColor: const Color(0xFFf69a02),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: RoundedButton(
                        title: '0',
                        boxColor: const Color(0xF9f9f9f),
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '.',
                      boxColor: const Color(0xF9f9f9f),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    RoundedButton(
                      title: '=',
                      boxColor: const Color(0xFFf69a02),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget RoundedButton({title,textColor,boxColor}){
    return InkWell(
      borderRadius: BorderRadius.circular(100.0),
      onTap: (){
        clicOnButton(title);
      },
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Center(child: Text(title,style: TextStyle(color: textColor,fontWeight: FontWeight.normal,fontSize: 40.0),)),
      ),
    );
  }
}



// 9f9f9f
// 323232
// f69a02

