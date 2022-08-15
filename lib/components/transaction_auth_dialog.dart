import 'package:flutter/material.dart';

import '../components/components.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  TransactionAuthDialog({
    @required this.onConfirm,
  });

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(border: OutlineInputBorder()),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 64, letterSpacing: 24),
      ),
      actions: <Widget>[
        ElevatedButton.icon(
          icon: Icon(Icons.close),
          style: styleButton(Colors.red.shade400),
          onPressed: () => Navigator.pop(context),
          label: Text('Cancel'),
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.check),
          style: styleButton(Colors.blue.shade400),
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
          label: Text('Confirm'),
        ),
      ],
    );
  }

}
