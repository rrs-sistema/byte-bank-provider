import 'package:alura_crashlytics/models/models.dart';
import 'package:flutter/cupertino.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> _transferencia = [];

  List<Transferencia> get transferencias => _transferencia;

  adiciona(Transferencia novaTransferencia) {
    _transferencia.add(novaTransferencia);
    notifyListeners();
  }
  
}