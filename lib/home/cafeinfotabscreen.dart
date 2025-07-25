import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/home/cafeinformationscreen.dart';
import 'package:java_go/home/clickandcollect2screen.dart';
import 'package:java_go/home/loyalitycardscreen.dart';
import 'package:java_go/home/menuinfoscreen.dart';
import 'package:java_go/home/state/cafe_info_state/cafe_info_state.dart';
import 'package:java_go/home/tabbar_widget.dart';

import '../auth/pages/sign_up/connect_strip_web_view.dart';
import '../auth/pages/sign_up/menu.dart';
import 'notifier/cafe_info_notifier/cafe_info_notifier.dart';

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
    ref.listenManual(cafeInfoNotifierProvider, (_, next) {
      switch (next) {
        case AsyncData<CafeInfoState?> data when data.value != null:
          if (data.value?.cafeEvent == CafeEvent.updateCafeInfo) {
            context.showSnackBar(data.value!.response!);
            context.pop();
          } else if (data.value?.cafeEvent == CafeEvent.createSquareAccount) {
            context.navigateTo(CustomWebView(
              title: "Connect Your Square Account",
              initialUrl: data.value?.response ?? "",
            ));
          } else if (data.value?.cafeEvent == CafeEvent.subscriptionPurchase) {
            context.pop();
            context.showSnackBar(
                data.value!.response ?? "Plan purchased successfully");
          } else if (data.value?.cafeEvent == CafeEvent.squareAccountCreated) {
            context.pop();
            context.showSnackBar(data.value!.response!);
          } else if (data.value?.cafeEvent == CafeEvent.syncMenuToSquare) {
            context.showSnackBar(data.value!.response!);
          } else if (data.value?.cafeEvent == CafeEvent.downloadSampleFile) {
            final url = data.value?.response;
            if (url != null) {
              ref.read(cafeInfoNotifierProvider.notifier).launch(url);
            }
          } else {
            context.showSnackBar(data.value!.response!);
          }
        case AsyncError error:
          context.showSnackBar(error.error.toString());
      }
    });
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
        preferredSize: Size.fromHeight(130),
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
      body: TabBarView(controller: _tabController, children: [
        CafeInformationScreen(),
        MenuInfoScreen(),
        ClickandCollect2Screen(),
        LoyalityCardScreen2()
      ]),
    );
  }
}

// class CafeInfoAddTabScreen extends ConsumerStatefulWidget {
//   const CafeInfoAddTabScreen({super.key});
//
//   @override
//   ConsumerState<CafeInfoAddTabScreen> createState() =>
//       _CafeInfoAddTabScreenState();
// }
//
// class _CafeInfoAddTabScreenState extends ConsumerState<CafeInfoAddTabScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   int selectedIndex=0;
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       initialIndex: 1,
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(150),
//           child: CustomTabBarCafeInfo(
//             tabController: _tabController,
//             onBackPress: true,
//             title: selectedIndex == 0
//                 ? 'Cafe Information'
//                 : selectedIndex == 1
//                     ? 'Add Items'
//                     : selectedIndex == 2
//                         ? 'Click and Collect'
//                         : 'Loyality Card',
//             onTap: (int val) {
//            setState(() {
//              selectedIndex=val;
//            });
//             },
//           ),
//         ),
//         backgroundColor: Color(0xFFF5F3F0),
//         body: TabBarView(children: [
//           SizedBox(),
//           MenuScreen(
//             isEditmode: true,
//             fromAdd: true,
//           ),
//           SizedBox(),
//           SizedBox()
//         ]),
//       ),
//     );
//   }
// }
