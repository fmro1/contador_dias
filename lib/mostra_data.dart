import 'package:contador_dias/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MostraData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (_, dataManager, __){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last reset:',
              style: TextStyle(
                  color: Colors.deepOrange,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                  '${dataManager.dataFormatada}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.deepOrange
                  ),
              ),
            ),
          ],
        );
      }
    );
  }
}
