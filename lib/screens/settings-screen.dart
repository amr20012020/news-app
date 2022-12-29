import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/provider/myProvider.dart';
import 'package:newsapp/shared/style/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../shared/style/LanguageBottomSheet.dart';
import '../shared/style/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
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
          title: Text(AppLocalizations.of(context)!.settings,),
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
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
              AppLocalizations.of(context)!.settings,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: colorBlack, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showLanguageSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorGreen),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                      pro.languageCode == 'en'?AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }
}
