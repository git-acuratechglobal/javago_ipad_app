import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/config/widgets/common_message_popup.dart';
import 'package:java_go/home/cafeinfotabscreen.dart';
import 'package:java_go/home/completed.dart';
import 'package:java_go/home/inprogress.dart';
import 'package:java_go/home/notifier/order_notifier/order_notifier.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';
import 'package:java_go/home/state/order_state/order_state.dart';

import 'bottombar.dart';

final unavailableItemsProvider = StateProvider<List<String>>((ref) => []);

class ItemAvailabilityScreen extends ConsumerStatefulWidget {
  final TabController? tabController;

  const ItemAvailabilityScreen({super.key, this.tabController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ItemAvailabilityScreenState();
}

class _ItemAvailabilityScreenState
    extends ConsumerState<ItemAvailabilityScreen> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(orderNotifierProvider, (previous, next) {
      switch (next) {
        case AsyncData<OrderState?> data when data.value != null:
          if (data.value != null) {
            if (data.value?.orderEvent == OrderEvent.orderRefundOrComplete) {
              ref.invalidate(todayOrdersProvider);
              context.pop();
              context.pop();
              context.showSnackBar(data.value?.response ?? "");
              CommonPopUp.showMessageDialog(context,
                  message: "Please update your item availability",
                  onPressed: () {
                context.pop();
                ref.read(bottomBarTabProvider.notifier).update((_) => 0);
                ref.read(cafeInfoTabIndexProvider.notifier).update((_) => 1);
              });
              return;
            }
            if (data.value?.orderEvent == OrderEvent.orderComplete) {
              ref.invalidate(todayOrdersProvider);
              context.pop();
              context.showSnackBar(data.value?.response ?? "");
            }
          }

        case AsyncError error:
          context.showSnackBar(error.error.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF5F3F0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBar(
            onTap: (index) {},
            controller: widget.tabController,
            tabAlignment: TabAlignment.fill,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: const Color(0xFF461C10),
            unselectedLabelColor: const Color(0xFFC0987C),
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            unselectedLabelStyle:
                TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            tabs: const [
              Tab(child: Text('In progress')),
              Tab(child: Text('Completed')),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 83),
            child: Divider(
              thickness: 2,
              color: Color(0xFFA0A0A0),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: widget.tabController,
              children: const [
                InProgressScreen(),
                CompletedScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

