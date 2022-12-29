import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/settings-screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerScreen extends StatelessWidget {
  Function onDrawerSelected;
  DrawerScreen(this.onDrawerSelected);
  static const int CATEGORIES = 1;
  static const int SETTINGS = 1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(AppLocalizations.of(context)!.appTitle, style: TextStyle(fontSize: 30, color: Colors.white),textAlign: TextAlign.center,),
          ),
          InkWell(
            onTap: (){
              onDrawerSelected(CATEGORIES);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                   Icon(Icons.category),
                  SizedBox(width: 10,),
                  Text(AppLocalizations.of(context)!.categories, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              onDrawerSelected(SETTINGS);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsScreen()));

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10,),
                  Text(AppLocalizations.of(context)!.settings, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
