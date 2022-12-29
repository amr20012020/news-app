import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/categoryData.dart';
import 'package:newsapp/screens/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../provider/myProvider.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategorySelect;
  CategoriesScreen(this.onCategorySelect);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var categories = getCategories(context);
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.pick,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
              ),
              itemBuilder: (BuildContext context, int index) {
                 return InkWell(
                    onTap: (){
                      onCategorySelect(categories[index]);
                    },
                     child: CategoryItem(categories[index], index));
              },),
          ),
        ],
      ),
    );
  }
}
