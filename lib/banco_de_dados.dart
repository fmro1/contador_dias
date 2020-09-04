import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class BancoDeDados {
  final id;
  String data;

  BancoDeDados({this.id, this.data});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data
    };
  }



 /* @override
  String toString() {
    return 'BancoDeDados{id: $id, data: $data}';
  }*/


}