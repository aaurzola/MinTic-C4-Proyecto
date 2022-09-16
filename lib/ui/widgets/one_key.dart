import 'package:flutter/material.dart';

class OneKey extends StatelessWidget {
  const OneKey({Key? key, required this.number, required this.callback})
      : super(key: key);

  final int number;
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        child: MaterialButton(
            key: Key(number.toString()),
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
            onPressed: () {
              callback(number);
            },
            child: Text(number.toString(),
                style: const TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                ))),
      ),
    );
  }
}