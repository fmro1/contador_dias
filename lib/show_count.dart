import 'package:contador_dias/categories.dart';
import 'package:contador_dias/data_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowCount extends StatelessWidget {
  ShowCount(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      child: Align(
                        child: Text(
                          index==0 ?
                          '${context.watch<DataManager>().dayCount??'0'}'
                              : index == 1 ?
                          '${context.watch<DataManager>().hourCount??'0'}'
                              : index == 2 ?
                          '${context.watch<DataManager>().minutesCount??'0'}'
                              : '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color: Colors.orange
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
