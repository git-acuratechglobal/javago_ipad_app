import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/cafeinformationscreen.dart';
import 'package:java_go/home/clickandcollect2screen.dart';
import 'package:java_go/home/loyalitycardscreen.dart';
import 'package:java_go/home/menuinfoscreen.dart';
import 'package:java_go/home/tabbar_widget.dart';

import '../auth/pages/sign_up/menu.dart';

final cafeInfoTabIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

class CafeInfoTabScreen extends ConsumerStatefulWidget {
  const CafeInfoTabScreen({super.key});

  @override
  ConsumerState<CafeInfoTabScreen> createState() => _CafeInfoTabScreenState();
}

class _CafeInfoTabScreenState extends ConsumerState<CafeInfoTabScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final initialIndex = ref.read(cafeInfoTabIndexProvider);
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: initialIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Listen to provider and change tab
    ref.listenManual<int>(cafeInfoTabIndexProvider, (prev, next) {
      if (_tabController.index != next) {
        _tabController.animateTo(next);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialIndex = ref.watch(cafeInfoTabIndexProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomTabBarCafeInfo(
          title: initialIndex == 0
              ? 'Cafe Information'
              : initialIndex == 1
                  ? 'Menu'
                  : initialIndex == 2
                      ? 'Click and Collect'
                      : 'Loyality Card',
          onTap: (int val) {
            setState(() {
              print(val);
              ref.read(cafeInfoTabIndexProvider.notifier).update((_) => val);
            });
          },
          tabController: _tabController,
        ),
      ),
      backgroundColor: Color(0xFFF5F3F0),
      body: TabBarView(

          controller: _tabController, children: [
        CafeInformationScreen(),
        MenuInfoScreen(),
        ClickandCollect2Screen(),
        LoyalityCardScreen2()
      ]),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:java_go/home/cafeinformationscreen.dart';
// import 'package:java_go/home/clickandcollect2screen.dart';
// import 'package:java_go/home/loyalitycardscreen.dart';
// import 'package:java_go/home/menuinfoscreen.dart';
// import 'package:java_go/home/tabbar_widget.dart';
// import 'package:java_go/sign_up/menu.dart';
// final showMenuEditScreenProvider = StateProvider<bool>((ref) => false);

// class CafeInfoTabScreen extends ConsumerStatefulWidget {
//   const CafeInfoTabScreen({super.key});

//   @override
//   ConsumerState<CafeInfoTabScreen> createState() => _CafeInfoTabScreenState();
// }

// class _CafeInfoTabScreenState extends ConsumerState<CafeInfoTabScreen>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   int initialIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//     _tabController.addListener(() {
//       if (!_tabController.indexIsChanging) return;
//       setState(() {
//         initialIndex = _tabController.index;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final showMenuEditScreen = ref.watch(showMenuEditScreenProvider);

//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(150),
//           child: CustomTabBarCafeInfo(
//             title: initialIndex == 0
//                 ? 'Cafe Information'
//                 : initialIndex == 1
//                     ? 'Menu'
//                     : initialIndex == 2
//                         ? 'Click and Collect'
//                         : 'Loyality Card',
//             onTap: (int val) {
//               setState(() {
//                 initialIndex = val;
//                 _tabController.index = val;
//               });
//             },
//           ),
//         ),
//         backgroundColor: const Color(0xFFF5F3F0),
//         body: TabBarView(
//           controller: _tabController,
//           children: [
//             const CafeInformationScreen(),
//             showMenuEditScreen
//                 ? MenuScreen(isEditmode: true, fromAdd: true)
//                 : const MenuInfoScreen(),
//             const ClickandCollect2Screen(),
//             const LoyalityCardScreen2(),
//           ],
//         ),
//       ),
//     );
//   }
// }



class CafeInfoAddTabScreen extends ConsumerStatefulWidget {
  const CafeInfoAddTabScreen({super.key});

  @override
  ConsumerState<CafeInfoAddTabScreen> createState() =>
      _CafeInfoAddTabScreenState();
}

class _CafeInfoAddTabScreenState extends ConsumerState<CafeInfoAddTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex=0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: CustomTabBarCafeInfo(
            tabController: _tabController,
            onBackPress: true,
            title: selectedIndex == 0
                ? 'Cafe Information'
                : selectedIndex == 1
                    ? 'Add Items'
                    : selectedIndex == 2
                        ? 'Click and Collect'
                        : 'Loyality Card',
            onTap: (int val) {
           setState(() {
             selectedIndex=val;
           });
            },
          ),
        ),
        backgroundColor: Color(0xFFF5F3F0),
        body: TabBarView(children: [
          SizedBox(),
          MenuScreen(
            isEditmode: true,
            fromAdd: true,
          ),
          SizedBox(),
          SizedBox()
        ]),
      ),
    );
  }
}
