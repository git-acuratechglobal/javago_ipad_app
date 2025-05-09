import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController topTabController;
  late TabController subTabController;

  @override
  void initState() {
    super.initState();
    topTabController = TabController(length: 3, vsync: this); 
    subTabController = TabController(length: 3, vsync: this); 
  }

  @override
  void dispose() {
    topTabController.dispose();
    subTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.brown)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              backgroundColor: Colors.greenAccent,
              label: Text("Orders: 1"),
            ),
          ),
        ],
        centerTitle: true,
        bottom: TabBar(
          controller: topTabController,
          labelColor: Colors.brown,
          unselectedLabelColor: Colors.brown.shade300,
          indicatorColor: Colors.transparent,
          tabs: const [
            Tab(text: 'Stats'),
            Tab(text: 'Item availability'),
            Tab(text: 'Order history'),
          ],
        ),
      ),
      body: TabBarView(
        controller: topTabController,
        children: [
          buildSubTabView("Stats"),
          buildSubTabView("Item availability"),
          buildSubTabView("Order history"),
        ],
      ),
    );
  }

  Widget buildSubTabView(String screenName) {
    return Column(
      children: [
        TabBar(
          controller: subTabController,
          labelColor: Colors.brown,
          unselectedLabelColor: Colors.brown.shade300,
          indicatorColor: Colors.brown,
          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'In progress'),
            Tab(text: 'Completed'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: subTabController,
            children: [
              Center(child: Text('$screenName - Pending')),
              Center(child: Text('$screenName - In progress')),
              Center(child: Text('$screenName - Completed')),
            ],
          ),
        ),
      ],
    );
  }
}
