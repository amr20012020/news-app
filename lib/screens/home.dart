import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/categoryData.dart';
import 'package:newsapp/screens/tab_controller.dart';

import '../models/SourcesResponse.dart';
import '../shared/network/remote/api_manager.dart';

class home extends StatelessWidget {
  CategoryData categoryData;
  home(this.categoryData);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(categoryData.id ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if ((snapshot.hasError)) {
          return Text('Wrong');
        }
        if (snapshot.data?.sources == 'ok') {
          return Center(child: Text(snapshot.data!.message!));
        }
        var sources = snapshot.data?.sources ?? [];
        return TabControllerScreen(sources);
      },
    );
  }
}
