import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final dynamic controler;
  final String hint;

  const MyInput({
    super.key,
    required this.controler,
    required this.hint,
  });

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controler,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87),
            borderRadius: BorderRadius.circular(8)),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hint,
        // hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
