
import 'package:contador_dias/banco_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'banco_de_dados.dart';

class DataManager extends ChangeNotifier{

  DataManager({this.date}){
    calculaDias();
  }

  DateTime date;
  String _dataFormatada;
  String _lastData;

  String _dayCount;
  String get dayCount => _dayCount;
  set dayCount(String days) {
    _dayCount = days;
    notifyListeners();
  }
  String _hourCount;
  String _minutesCount;

  String get hourCount => _hourCount;

  set hourCount(String value) {
    _hourCount = value;
    notifyListeners();
  }

  String get dataFormatada => _dataFormatada;
  set dataFormatada(String value) {
    _dataFormatada = value;
    notifyListeners();
  }

  String convertDate(DateTime date) =>
      dataFormatada = DateFormat('dd/MM/yyyy - kk:mm').format(date);

  String _dataAtual;
  String get dataAtual => _dataAtual;
  set dataAtual(String data){
    _dataAtual = data;
    lastData = data;
    calculaDias();
  }

  String get pegaDataAtual => dataAtual = DateTime.now().toString();

  String get lastData => _lastData;
  set lastData(String value) {
    _lastData = value;
    _dataFormatada = convertDate(DateTime.parse(value));
    notifyListeners();
  }

  salvaData() async {
    var value = DateTime.now().toString();
    BancoDeDados dataAtual = BancoDeDados(
        data: value
    );
    lastData = value;
    BancoManager().insertDados(dataAtual);

    await calculaDias();

  }

  Future<String> ultimaData() async {
    try {
      var lista = await BancoManager().listAll();
      if (lista.isNotEmpty) {
        final lastValue = lista.length - 1;
        print(lista[lastValue].data);
        return lastData = '${lista[lastValue].data}';
      } else {
        return lastData = 'Sem data';
      }
    } catch(e){
      print('Erro: $e');
    }
  }

  Future<void> calculaDias() async {
    await ultimaData();
    DateTime lastDate = DateTime.parse(lastData);
    DateTime now = DateTime.now();
    hourCount = (now.difference(lastDate).inHours).toString();
    minutesCount = (now.difference(lastDate).inMinutes).toString();
    dayCount = (now.difference(lastDate).inDays).toString();
  }

  String get minutesCount => _minutesCount;

  set minutesCount(String value) {
    _minutesCount = value;
    notifyListeners();
  }
}