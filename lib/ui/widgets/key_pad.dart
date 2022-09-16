import 'package:f_currency_converter_template/utils/constants.dart';
import 'package:flutter/material.dart';
import 'one_key.dart';

// en este widget mostramos el keypad y los valores de las monedas
class KeyPad extends StatefulWidget {
  const KeyPad(
      {Key? key,
        required this.textCurrency1,
        required this.textCurrency2,
        required this.rate})
      : super(key: key);

  // estos tres valores son recibidos de converter_page
  final String textCurrency1;
  final String textCurrency2;
  final double rate;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  late double _convertedValue;
  late int _keyPadValue;


  int concatKeyPadValue(int oldValue, int newDigit) {
    String newValue;
    if (oldValue == 0) {
      newValue = '$newDigit';
    } else {
      newValue = '$oldValue$newDigit';
    }
    return int.parse(newValue);
  }

  double convertCurrency() => _keyPadValue * widget.rate;

  void _onPressed(int k) {
    setState(() {
      if (k == 10) {
        _keyPadValue = 0;
        _convertedValue = 0;
      } else {
        _keyPadValue = concatKeyPadValue(_keyPadValue, k);
        _convertedValue = convertCurrency();
      }
    });
  }


  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // aquí garantizamos que cuando el widget refresca el estado va a cero
    _convertedValue = 0;
    _keyPadValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    _keyPadValue.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 35),
                  )
              ),
              Icon(currencyIcons[widget.textCurrency1],
                  color: Theme.of(context).colorScheme.secondary
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${widget.textCurrency1} -> ${widget.textCurrency2}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    num.parse(_convertedValue.toStringAsFixed(4)).toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 35),
                  )
              ),
              Icon(currencyIcons[widget.textCurrency2],
                  color: Theme.of(context).colorScheme.secondary
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OneKey(number: 7, callback: _onPressed),
                  OneKey(number: 8, callback: _onPressed),
                  OneKey(number: 9, callback: _onPressed),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OneKey(number: 4, callback: _onPressed),
                  OneKey(number: 5, callback: _onPressed),
                  OneKey(number: 6, callback: _onPressed),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OneKey(number: 1, callback: _onPressed),
                  OneKey(number: 2, callback: _onPressed),
                  OneKey(number: 3, callback: _onPressed),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: MaterialButton(
                      key: const Key("reset"),
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        _onPressed(10);
                      },
                      child: const Text("Reset",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 24.0,
                            color: Colors.white,
                          ))),
                ),
              ),
              OneKey(number: 0, callback: _onPressed),
            ]),
          )
        ]);
  }
}
