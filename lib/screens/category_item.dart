import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/categoryData.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;
  CategoryItem(this.categoryData, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryData.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomLeft: index.isEven ? Radius.circular(25) : Radius.zero,
          bottomRight: index.isOdd ? Radius.circular(25) : Radius.zero,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            categoryData.image ?? "Error",
            height: 110,
          ),
          Expanded(
            child: Container(
                child: Center(
                    child: Text(
              categoryData.title ?? "Error",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ))),
          ),
        ],
      ),
    );
  }
}
