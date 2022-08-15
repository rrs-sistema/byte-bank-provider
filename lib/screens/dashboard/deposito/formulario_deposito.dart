import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../models/models.dart';

const _tituloAppBar = 'Receber depósito';
const _dicacampoValor = '0.00';
const _rotuloCampoValor = 'Valor';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                    labelText: _rotuloCampoValor,
                    hintText: _dicacampoValor,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
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
                      onPressed: () => _criaDeposito(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _criaDeposito(BuildContext context) {
    final double valor = double.tryParse(_valueController.text);
    final depositoValido = _validaDeposito(valor);
    if (depositoValido) {
      _atualizaEstado(context, valor);
      Navigator.of(context).pop();
    }
  }

  _validaDeposito(valor) {
    return valor != null;
  }

  _atualizaEstado(BuildContext context, double valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
