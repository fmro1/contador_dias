
import 'package:contador_dias/data_manager.dart';
import 'package:contador_dias/mostra_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => DataManager(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Contador de Dias",
        theme: ThemeData(
          primaryColor: Colors.orange,
        ),
        home: Home(),
       ),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Contador de dias', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              MostraData(),
              SizedBox(height: 40,),
              Categories(),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                        ),
                        color: Colors.orange,
                        onPressed: () {
                          context.read<DataManager>().salvaData();
                        },
                        child: Text(
                          'RESET',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                    ),
                  ),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      color: Colors.orange,
                      onPressed: () async {
                        await context.read<DataManager>().calculaDias();
                      },
                      child: Text(
                        'UPDATE',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                  ),
                ],
              ),
              ]
          ),
      ),
    );
  }


}








