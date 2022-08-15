import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/components.dart';
import '../../screens/screens.dart';
import '../../models/models.dart';

final _titulo = 'Últimas transferências';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Column(
      children: [
        Text(_titulo,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _transferecias = transferencias.transferencias;
          
          final _quantidade = _transferecias.length;
          if(_quantidade == 0) 
            return SemTransferenciaCadastrada();

          final _ultimasTransferencias = _transferecias.reversed.toList();
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _quantidade > 2 ? 2 : _quantidade,
            shrinkWrap: true,
            itemBuilder: (context, indece) {
              return ItemTransferencia(_ultimasTransferencias[indece]);
            }
          );
        }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 45.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ListaTransferencias();
                  }),
                );
              },
              style: styleButton(primaryColor),
              child: Text('Ver todas transferências', style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40.0),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Você ainda não cadastrou nenhuma transferência cadastrada',
          style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}