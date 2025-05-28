import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/button.dart';

import 'package:java_go/home/completed.dart';
import 'package:java_go/home/inprogress.dart';
import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/home/notifiers/accept_orders.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';

final unavailableItemsProvider = StateProvider<List<String>>((ref) => []);

class ItemAvailabilityScreen extends ConsumerStatefulWidget {
  final TabController? tabController;

  const ItemAvailabilityScreen({super.key, this.tabController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemAvailabilityScreenState();
}

class _ItemAvailabilityScreenState extends ConsumerState<ItemAvailabilityScreen> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(acceptOrdersProvider, (previous, next) {
      if (next?.message != null && next!.message!.isNotEmpty) {
        if (next.message == "Order marked processed successfully!" ||
            next.message == "Order marked completed successfully!") {
          context.pop();
          ref.invalidate(todayOrdersProvider);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.message.toString()),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        } else if (next.message == "Refund processed and notifications sent.") {
          context.pop();
        } else if (next.message == "Menu item status updated successfully!") {
          context.pop();
        } else if (next.message == "Order cannot be processed as some items are not available!") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: OrderUnaviableDialog(
                  unavailableItems: next.unavailableItems ?? [],
                  orderId: next.orderId ?? "",
                  isIndividualOrder: next.isIndividual ?? 1,
                ),
              );
            },
          );
        } else if (next.message == "Refund processed and notifications sent.") {
          context.pop();
        }
      }

      // if (next?.error != null && next!.error!.isNotEmpty) {

      //   // context.navigateTo(
      //   //   Orders(
      //   //   isEdited: true,
      //   //   orderId: int.parse(next.orderId ?? "0"),
      //   //   isIndividualOrder: next.isIndividual ?? 0,
      //   // )
      //   // );
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(next.error.toString()),
      //       backgroundColor: Colors.red,
      //       duration: Duration(seconds: 3),
      //     ),
      //   );
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: const Color(0xFFF5F3F0),
      body: Column(
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
            unselectedLabelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
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
              children: const [ InProgressScreen(), CompletedScreen()],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderUnaviableDialog extends ConsumerStatefulWidget {
  const OrderUnaviableDialog({
    super.key,
    required this.unavailableItems,
    required this.orderId,
    required this.isIndividualOrder,
  });
  final List<UnaviableItems> unavailableItems;
  final String orderId;
  final int isIndividualOrder;
  @override
  ConsumerState<OrderUnaviableDialog> createState() => _OrderUnaviableDialogState();
}

class _OrderUnaviableDialogState extends ConsumerState<OrderUnaviableDialog> {
  @override
  Widget build(BuildContext context) {
    final orderRefund = ref.watch(acceptOrdersProvider);
    final makeAvailable = ref.watch(acceptOrdersProvider);

    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.4,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Items Unavailable",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Some items in your order are unavailable",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Items:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 0),
                shrinkWrap: true,
                itemCount: widget.unavailableItems.length,
                itemBuilder: (context, index) {
                  final item = widget.unavailableItems[index];
                  final itemName = item.itemName ?? "";

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(itemName)),
                      Checkbox(
                        value: item.isSelected,
                        activeColor: Colors.brown,
                        checkColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.brown,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (_) {
                          // final current = ref.read(unavailableItemsProvider.notifier).state;
                          // if (isSelected) {
                          //   ref.read(unavailableItemsProvider.notifier).state =
                          //       current.where((name) => name != itemName).toList();
                          // } else {
                          //   ref.read(unavailableItemsProvider.notifier).state = [
                          //     ...current,
                          //     itemName,
                          //   ];
                          // }
                          setState(() {
                            item.toggleSelection();
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 50.h,
                    child: PrimaryButton(
                      isLoading: makeAvailable!.isMakingAvailable,
                      onClick: () {
                        final selectedItems =
                            widget.unavailableItems.where((e) => e.isSelected == true).map((e) {
                          e.status = 1;
                          return e;
                        }).toList();

                        ref.read(acceptOrdersProvider.notifier).makeAvailable(selectedItems);
                        // ref.read(acceptOrdersProvider.notifier).makeAvailable(
                        //       widget.unavailableItems.where((e) => e.isSelected == true).toList(),
                        //     );
                      },
                      title: "Make Available",
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                    height: 50.h,
                    child: PrimaryButton(
                      isLoading:
                          orderRefund!.isRefunding && orderRefund.unavailableItems!.isNotEmpty,
                      onClick: () {
                        // ref
                        //     .read(acceptOrdersProvider.notifier)
                        //     .refundOrder(widget.orderId, widget.isIndividualOrder);
                      },
                      title: "Refund",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
