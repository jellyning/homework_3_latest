import 'package:flutter/material.dart';

class PinLoGO extends StatelessWidget {
  const PinLoGO({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.security, size: 60,),
            Text("PIN LOGIN", style: TextStyle(color: Colors.black, fontSize: 25)),
            PinInput(),
          ],
        ),
      ),
    );
  }
}

class PinInput extends StatefulWidget {
  @override
  _PinInputState createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  String enteredPin = "";

  void onNumberPressed(String number, String label) {
    setState(() {
      if (enteredPin.length < 6) {
        enteredPin += number;
      }
    });
  }

  void onDeletePressed() {
    setState(() {
      if (enteredPin.isNotEmpty) {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      }
    });
  }

  void onClearPressed() {
    setState(() {
      enteredPin = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          enteredPin.isEmpty
              ? "______"
              : enteredPin + "______".substring(enteredPin.length),
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        PinPad(onNumberPressed: onNumberPressed),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onClearPressed,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(child: Icon(Icons.clear)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16.0),
            PinButton(
              text: "0",
              label: 'Zero',
              onPressed: () => onNumberPressed("0", 'Zero'),
            ),
            SizedBox(width: 16.0),
            GestureDetector(
              onTap: onDeletePressed,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(child: Icon(Icons.backspace)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PinButton extends StatelessWidget {
  final String text;
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;

  PinButton({
    required this.text,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 70.0,
        height: 70.0,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            if (icon != null)
              Icon(
                icon,
                size: 20.0,
                color: Colors.grey,
              ),
            SizedBox(height: 4.0),
            Text(
              label,
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class PinPad extends StatelessWidget {
  final void Function(String, String) onNumberPressed;

  PinPad({required this.onNumberPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int row = 1; row <= 3; row++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = (row - 1) * 3 + 1; i <= row * 3; i++)
                PinButton(
                  text: i.toString(),
                  label: getLabel(i),
                  onPressed: () => onNumberPressed(i.toString(), getLabel(i)),
                ),
            ],
          ),
      ],
    );
  }

  String getLabel(int number) {
    switch (number) {
      case 1:
        return 'one';
      case 2:
        return 'two';
      case 3:
        return 'three';
      case 4:
        return 'four';
      case 5:
        return 'five';
      case 6:
        return 'six';
      case 7:
        return 'seven';
      case 8:
        return 'eight';
      case 9:
        return 'nine';
      default:
        return '';
    }
  }
}