import 'package:contador_dias/data_manager.dart';
import 'package:contador_dias/show_count.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<String> categories =['Days', 'Hours' ,'Minutes'];
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: SizedBox(
            height: 25,
            child: Align(
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategory(index)
              ),
            ),
          ),
        ),
        ShowCount(selectedIndex),
      ],
    );
  }

  Widget buildCategory(int index){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
          padding: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  color: selectedIndex == index ? Colors.deepOrange : Colors.grey),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 25,
              color: selectedIndex == index ? Colors.deepOrange : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
