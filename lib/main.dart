import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  Widget _title() {
    return Text(
      'My Store',
      style: TextStyle(
        fontSize: 40.0,
        color: Colors.pinkAccent,
        fontWeight: FontWeight.bold
      )
    );
}

Widget _adCard(String adText, Image adImage) {
    return
}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _title(),
          const SizedBox( height: 8.0)
        ]
      )
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppBodyState();
}

class AppBodyState extends State<AppBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  var  _pages = <Widget>[
    HomePage(),
    Center(child: Icon(Icons.list),),
    Center(child: Icon(Icons.search),),
    Center(child: Icon(Icons.shopping_cart),),
    Center(child: Icon(Icons.person),),
  ];
  static const _tabs = <Widget>[
    Tab(icon: Icon(Icons.home), text: 'Главная страница'),
    Tab(icon: Icon(Icons.list), text: 'Каталог'),
    Tab(icon: Icon(Icons.search), text: 'Поиск'),
    Tab(icon: Icon(Icons.shopping_cart), text: 'Корзина'),
    Tab(icon: Icon(Icons.person), text: 'Профиль'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _pages
      ),
      bottomNavigationBar: Material(
        color: Colors.pinkAccent,
        child: TabBar(
            controller: _tabController,
            tabs: _tabs
        )
      ),
    );
  }
}

void main() {
  runApp(
      MaterialApp(
          home: AppBody()
      )
  );
}
