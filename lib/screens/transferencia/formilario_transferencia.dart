import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../models/models.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: _controladorCampoNumeroConta,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                    labelText: _rotuloCampoNumeroConta,
                    hintText: _dicaCampoNumeroConta,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                TextField(
                  controller: _controladorCampoValor,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                    labelText: _rotuloCampoValor,
                    hintText: _dicaCampoValor,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Container(
                      height: 45.0,
                      child: ElevatedButton.icon(
                        style: styleButton(primaryColor),
                        icon: Icon(Icons.transform_outlined),
                        label: Text(_textoBotaoConfirmar),
                        onPressed: () => _criaTransferencia(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (_validaTransferencia(context, numeroConta, valor)) {
      final novaTransferencia = Transferencia(valor, numeroConta);
      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    } else {
      _showFailureMessage(context, message: 'Parece que você não tem saldos.');
    }
  }

  _validaTransferencia(BuildContext context, int numeroConta, double valor) {
    final _camposValidos = numeroConta != null && valor != null;
    final _saldoSuficiente = valor <=
        Provider.of<Saldo>(
          context,
          listen: false,
        ).valor;
    return _camposValidos && _saldoSuficiente;
  }

  _atualizaEstado(
      BuildContext context, Transferencia novaTransferencia, double valor) {
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).subtrai(valor);
  }

  void _showFailureMessage(BuildContext context,
      {String message = 'Unknown error'}) {
    showDialog(
        context: context,
        builder: (_) => NetworkGiffyDialog(
              key: Key('_networkGiffyDialog'),
              image: Image.network(
                'https://c.tenor.com/e_6G20pCUj0AAAAj/hereisrae-raexsamlo.gif',
                fit: BoxFit.cover,
              ),
              entryAnimation: EntryAnimation.TOP,
              title: Text(
                'OPS!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
              ),
              onlyCancelButton: true,
              buttonCancelColor: Colors.blue.shade300,
              buttonCancelText: Text(
                'Fechar',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
              ),
              onCancelButtonPressed: () {
                Navigator.of(context).pop();
              },
            ));
  }
}
