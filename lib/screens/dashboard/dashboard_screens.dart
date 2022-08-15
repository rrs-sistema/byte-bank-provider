import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../screens.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Align(alignment: Alignment.topCenter, child: SaldoCard()),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return FormularioDeposito();
                        }),
                      );
                    },
                    style: styleButton(primaryColor),
                    child: Text('Receber depósito', style: TextStyle(fontSize: 18),),
                  ),
                ),
                SizedBox(
                  height: 45.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return FormularioTransferencia();
                        }),
                      );
                    },
                    style: styleButton(primaryColor),
                    child: Text('Nova transferência', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UltimasTransferencias(),
            ),
          ],
        ),
      ),
    );
  }
}
