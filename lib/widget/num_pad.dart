import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;

  const NumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: '1',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number:'2',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: '3',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: '4',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: '5',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: '6',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: '7',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: '8',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number:'9',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             NumberButton(
                number: '*',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: '0',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
              NumberButton(
                number: '#',
                size: buttonSize,
                color: buttonColor,
                controller: controller,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// define NumberButton widget
// its shape is round
class NumberButton extends StatelessWidget {
  final String number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size / 2),
          ),
        ),
        onPressed: () {
          controller.text += number.toString();
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0), fontSize: 50),
          ),
        ),
      ),
    );
  }
}