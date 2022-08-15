import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

class SaldoCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => null,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Consumer<Saldo>(builder: (context, valor, child) {
                return Text(
                  valor.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 36.0,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  } 
}
