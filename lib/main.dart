import 'package:flutter/material.dart';
import 'package:tab_app/tabbar/my_tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('自定义tab'),),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin{
  List<String> mList = [
    "你好",
    "测试内容",
    "钢铁侠",
    "中国",
    "澳大利亚",
    "Macbook Pro",
    "嘿嘿",
    "捉迷藏",
    "BB",
    "321",
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: mList.length,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.only(left: 6,right: 6),
            labelStyle: TextStyle(fontSize: 16),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blue,
            controller: _tabController,
            indicatorSize: MyTabBarIndicatorSize.fixed,
            tabs: getTabs(mList),
          ),
          Expanded(
            child: TabBarView(
              children: getTabViews(mList),
              controller: _tabController,),
          ),
        ],
      ),
    );
  }

  List<Widget> getTabs(List<String> mList){
    List<Widget> list = [];
    mList.forEach((element) {
      list.add(MyTab(text: element,tabHeight: 30,));
    });
    return list;
  }

  List<Widget> getTabViews(List<String> mList){
    List<Widget> list = [];
    mList.forEach((element) {
      list.add(Container(
      ));
    });
    return list;
  }
}

