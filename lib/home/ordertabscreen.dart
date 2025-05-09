import 'package:flutter/material.dart';
import 'package:java_go/home/orderhistoryscreen.dart';

import 'package:java_go/home/statsscreen.dart';
import 'package:java_go/home/tabbar_widget.dart';

class OrderTabScreen extends StatefulWidget {
  const OrderTabScreen({super.key});

  @override
  State<OrderTabScreen> createState() => _OrderTabScreenState();
}

class _OrderTabScreenState extends State<OrderTabScreen> {
  @override
void initState() {
  super.initState();
  selectedIndex = 1;
}
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1, 
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: CustomTabBar(
              title: selectedIndex == 0
                  ? 'Stats'
                  : selectedIndex == 1
                      ? 'Order detail'
                      : 'Order history',
              onTap: (int val) {
                setState(() {
                  print(val);
                  selectedIndex = val;
                });
              }, 
            )),
        backgroundColor: Color(0xFFF5F3F0),
        body: TabBarView(children: [
       //   Homescreen(),
          StatsScreen(),
          // Orders(isEdited: false,),
          OrderHistoryScreen()
        ]),
      ),
    );
  }
}
