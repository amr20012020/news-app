import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/NewsDataModel.dart';
import 'package:newsapp/screens/news_card.dart';
import 'package:newsapp/screens/tab_item.dart';
import 'package:newsapp/shared/network/remote/api_manager.dart';

import '../models/Sources.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;
  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            indicatorColor: Colors.transparent,
            isScrollable: true,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sources
                .map((source) => Tab(
                    child: TabItem(source,
                        widget.sources.indexOf(source) == selectedIndex)))
                .toList(),
          ),
        ),
        FutureBuilder<NewsDataModel>(
            future:
                ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? "HAS ERROR"),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Try Again'),
                    ),
                  ],
                );
              }
              if (snapshot.data?.status != "ok") {
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? "HAS ERROR"),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Try Again'),
                    ),
                  ],
                );
              }

              var news = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      return NewsCard(news[index]);
                    }),
              );
            }),
      ],
    );
  }
}
