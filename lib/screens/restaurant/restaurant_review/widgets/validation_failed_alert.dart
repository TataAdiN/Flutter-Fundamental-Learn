import 'package:flutter/material.dart';

class ValidationFailedAlert extends StatelessWidget {
  const ValidationFailedAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            size: 32,
          ),
          SizedBox(
            height: 8,
          ),
          Text('Failed.'),
        ],
      ),
      content: const Text('Please fill all required form first'),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(166, 166, 166, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        )
      ],
    );
  }
}
