import 'package:flutter/material.dart';
import 'package:kerkom/home.dart';

class PinPage extends StatefulWidget {
  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String pin = '';

  void _addNumber(int number) {
    setState(() {
      if (pin.length < 4) {
        pin += number.toString();
      }
    });
  }

  void _removeNumber() {
    setState(() {
      if (pin.isNotEmpty) {
        pin = pin.substring(0, pin.length - 1);
      }
    });
  }

  void _submitPin() {
    // Tambahkan logika disini untuk memeriksa PIN
    if (pin == '0123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      print('PIN entered is incorrect!');
    }
  }

  void _resetPin() {
    // Tambahkan logika disini untuk mereset PIN
    setState(() {
      pin = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your PIN',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildPinDot(pin.length >= 1),
                  _buildPinDot(pin.length >= 2),
                  _buildPinDot(pin.length >= 3),
                  _buildPinDot(pin.length >= 4),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNumberButton(1),
                _buildNumberButton(2),
                _buildNumberButton(3),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNumberButton(4),
                _buildNumberButton(5),
                _buildNumberButton(6),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNumberButton(7),
                _buildNumberButton(8),
                _buildNumberButton(9),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 70.0),
                _buildNumberButton(0),
                SizedBox(width: 70.0),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _removeNumber,
                  child: Text('Erase'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: _resetPin,
                  child: Text('Reset'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: _submitPin,
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinDot(bool filled) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? Colors.redAccent : Colors.transparent,
        border: Border.all(color: Colors.blue),
      ),
    );
  }

  Widget _buildNumberButton(int number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _addNumber(number);
        },
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
