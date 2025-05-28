import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/cafeinformationscreen.dart';
import 'package:java_go/home/clickandcollect2screen.dart';
import 'package:java_go/home/loyalitycardscreen.dart';
import 'package:java_go/home/menuinfoscreen.dart';
import 'package:java_go/home/tabbar_widget.dart';

import '../auth/pages/sign_up/menu.dart';

class CafeInfoTabScreen extends ConsumerStatefulWidget {
  const CafeInfoTabScreen({super.key});

  @override
  ConsumerState<CafeInfoTabScreen> createState() => _CafeInfoTabScreenState();
}

class _CafeInfoTabScreenState extends ConsumerState<CafeInfoTabScreen> {
  int initialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                initialIndex = val;
              });
            },
          ),
        ),
        backgroundColor: Color(0xFFF5F3F0),
        body: TabBarView(children: [
          CafeInformationScreen(),
          MenuInfoScreen(),
          ClickandCollect2Screen(),
          LoyalityCardScreen2()
        ]),
      ),
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


final cafeInfoTabScreenProvider=StateProvider.autoDispose((ref)=>2);



class CafeInfoAddTabScreen extends ConsumerStatefulWidget {
  const CafeInfoAddTabScreen({super.key});

  @override
  ConsumerState<CafeInfoAddTabScreen> createState() => _CafeInfoAddTabScreenState();
}

class _CafeInfoAddTabScreenState extends ConsumerState<CafeInfoAddTabScreen> {
  @override
  Widget build(BuildContext context) {
    final cafeIntoTab=ref.watch(cafeInfoTabScreenProvider);
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: CustomTabBarCafeInfo(
            onBackPress: true,
            title: cafeIntoTab == 0
                ? 'Cafe Information'
                : cafeIntoTab == 1
                    ? 'Add Items'
                    : cafeIntoTab == 2
                        ? 'Click and Collect'
                        : 'Loyality Card',
            onTap: (int val) {
            ref.read(cafeInfoTabScreenProvider.notifier).update((_)=>val);
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
