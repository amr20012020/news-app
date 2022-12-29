import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/categoryData.dart';
import 'package:newsapp/screens/categories-screen.dart';
import 'package:newsapp/screens/home.dart';
import 'package:newsapp/screens/search_screen.dart';
import 'package:newsapp/screens/settings-screen.dart';
import 'package:newsapp/screens/splachScreen.dart';
import 'package:newsapp/screens/tab_controller.dart';
import 'package:newsapp/shared/network/remote/api_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/SourcesResponse.dart';
import 'drawer_screen.dart';

class HomeLayout extends StatefulWidget {

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/pattern.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle,),
          backgroundColor: Colors.green,
          elevation: 0.0,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
        ),
        drawer: DrawerScreen(onDrawerSelected),
        body:categoryData == null ?
        CategoriesScreen(onCategorySelected) : home(categoryData!),
      ),
    );
  }

  CategoryData? categoryData = null;

  void onDrawerSelected(number){
    if(number == DrawerScreen.CATEGORIES){
       categoryData = null;
    }else if(number == DrawerScreen.SETTINGS){
      // open settings Screen
      print("Settings");
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SettingsScreen()));

    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void onCategorySelected(categorySelected){
     categoryData = categorySelected;
     setState(() {

     });
  }
}
