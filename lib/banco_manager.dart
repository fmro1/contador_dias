import 'dart:io';

import 'package:contador_dias/banco_de_dados.dart';
import 'package:contador_dias/data_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class BancoManager{

  BancoManager({this.dados}){
    criaBanco();
  }

  BancoDeDados dados;

  Future<Database> database;

  criaBanco() async {
    return database = openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'contador_database.db'),
      // When the database is first created, create a table to store data.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE datas(id INTEGER PRIMARY KEY autoincrement, data TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertDados(dados) async {
    final Database db = await criaBanco();

    await db.insert(
      'datas',
      dados.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //listar
  Future<List<BancoDeDados>> listAll() async {
    // Get a reference to the database.
    final Database db = await criaBanco();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('datas');

    // Convert the List<Map<String, dynamic> into a List<BancoDeDados>.
    return List.generate(maps.length, (i) {
      return BancoDeDados(
        id: maps[i]['id'],
        data: maps[i]['data'],
      );
    });
  }

  //update
  Future<void> updateDados(BancoDeDados dados) async {
    // Get a reference to the database.
    final db = await criaBanco();

    // Update the given Dog.
    await db.update(
      'datas',
      dados.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dados.id],
    );
  }



}