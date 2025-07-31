import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Proceed', style: TextStyle(color: Colors.white)),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size(double.infinity, 52)),
        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 36, 108, 167),
        ),
      ),
    );
  }
}
