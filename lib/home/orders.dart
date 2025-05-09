import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/button.dart';
import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/home/model/order_detail.dart';
import 'package:java_go/home/notifiers/accept_orders.dart';
import 'package:java_go/home/notifiers/order_details_provider.dart';

final selectedOrdersProvider = StateProvider<List<String>>((ref) => []);
final unavailableItemsProvider = StateProvider<List<String>>((ref) => []);

class Orders extends ConsumerStatefulWidget {
  final bool isEdited;
  final String? orderId;
  final int isIndividualOrder;
  const Orders(
      {super.key, required this.isEdited, required this.orderId, required this.isIndividualOrder});

  @override
  ConsumerState<Orders> createState() => _OrdersState();
}

class _OrdersState extends ConsumerState<Orders> {
  void _showDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: Container(
                  height: 265.h,
                  width: 528.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: RefundPopWidget(
                    orderId: widget.orderId ?? '',
                    isIndividualOrder: widget.isIndividualOrder,
                  )),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ).then((_) {
      ref.read(selectedOrdersProvider.notifier).state = [];
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    final selectedOrders =
        ref.watch(GetOrderDetailsProvider(widget.orderId ?? '', widget.isIndividualOrder));
    return Scaffold(
      backgroundColor: Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF5F3F0),
        leading: widget.isEdited
            ? InkWell(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  'assets/images/ic_left_arrow.png',
                  color: Color(0xFF461C10),
                  height: 55.h,
                  width: 55.w,
                ))
            : null,
        title: widget.isEdited
            ? Text(
                'Complete Order',
                style: TextStyle(
                  color: const Color(0xFF461C10),
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              )
            : null,
        centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 57),
              child: widget.isEdited
                  ? Container(
                      width: 158.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF5CF97F),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Order 1',
                          style: TextStyle(
                            color: const Color(0xFF414141),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    )
                  : null)
        ],
      ),
      body: SingleChildScrollView(
        child: AsyncWidget(
            value: selectedOrders,
            data: (data) {
              final order = data.orders;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  43.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 82, right: 82),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order!.first.customerName ?? '',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Order Number: ${order.first.requestUniqueId ?? order.first.orderNumber} ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: Divider(
                      thickness: 1,
                      color: Color(0xFFA0A0A0),
                    ),
                  ),
                  26.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: order.first.requestUniqueId != null
                        ? SizedBox(
                            width: 444.w,
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: order.length,
                              padding: EdgeInsets.all(0),
                              itemBuilder: (context, index) {
                                final currentOrder = order[index];

                                return detailedContainer(
                                  order: currentOrder,
                                  name: currentOrder.customerName ?? '',
                                  price: ("TotalAmount: ${currentOrder.itemAmount.toString()}"),
                                  label: currentOrder.itemName,
                                  label2: currentOrder.addonSizes?.isNotEmpty == true
                                      ? currentOrder.addonSizes!.first.addonName
                                      : '',
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return 50.verticalSpace;
                              },
                            ),
                          )
                        : detailedContainer(
                            name: order.first.customerName ?? '',
                            price: ("TotalAmount: ${order.first.itemAmount.toString()}"),
                            orderList: order,
                          ),
                  ),
                  23.verticalSpace,
                ],
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: InkWell(
          onTap: () {
            _showDialog(context);
          },
          child: Container(
            width: 288.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: Color(0xFF5CF97F),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 2,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Order complete',
                style: TextStyle(
                  color: const Color(0xFF414141),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget detailedContainer(
    {String? name,
    String? price,
    String? label,
    String? label2,
    Order? order,
    List<Order>? orderList}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 68,
    ),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      width: 300.w,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          4.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name ?? '',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (orderList != null && orderList.isNotEmpty)
                  Text(
                    'Total amount : ${orderList.fold(0, (sum, item) => sum + (item.itemAmount ?? 0))}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                else
                  Text(
                    price ?? '',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 4, left: 24),
            child: Divider(
              thickness: 1,
              color: const Color(0xFFA0A0A0),
            ),
          ),
          if (orderList != null && orderList.isNotEmpty)
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final order = orderList[index];
                print(order.addonSizes);
                return OrderDetailCard(
                  order: order,
                  unavailableItems: [],
                  label: order.itemName ?? '',
                  label2: (order.addonSizes != null && order.addonSizes!.isNotEmpty)
                      ? order.addonSizes!.first.addonName ?? ""
                      : '',
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: orderList.length,
            )
          else
            OrderDetailCard(
              order: order,
              unavailableItems: [],
              label: label ?? '',
              label2: label2 ?? '',
            ),
        ],
      ),
    ),
  );
}

class CustomElevetedButton extends StatefulWidget {
  final String label;
  const CustomElevetedButton({super.key, required this.label});
  @override
  State<CustomElevetedButton> createState() => _CustomElevetedButtonState();
}

class _CustomElevetedButtonState extends State<CustomElevetedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 244.w,
      height: 51.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFC0987C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              )),
          onPressed: () {},
          child: Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )),
    );
  }
}

class OrderDetailCard extends ConsumerStatefulWidget {
  final String label;
  final String label2;
  final String? label3;
  List<UnaviableItems> unavailableItems;
  final Order? order;
  OrderDetailCard(
      {super.key,
      required this.label,
      required this.label2,
      this.label3,
      required this.unavailableItems,
      this.order});
  @override
  ConsumerState<OrderDetailCard> createState() => _OrderDetailCardState();
}

class _OrderDetailCardState extends ConsumerState<OrderDetailCard> {
  void _toggleSelection(bool? value) {
    final selected = ref.read(selectedOrdersProvider.notifier);
    final label = widget.label;

    if (value == true && !selected.state.contains(label)) {
      selected.state = [...selected.state, label];
      final selectedItems = widget.unavailableItems.map((e) {
        e.isSelected = true;
        e.status = 0;
        return e;
      }).toList();

      // ref.read(acceptOrdersProvider.notifier).makeAvailable(selectedItems);
    } else if (value == false && selected.state.contains(label)) {
      selected.state = selected.state.where((item) => item != label).toList();

      final selectedItems = widget.unavailableItems.map((e) {
        e.isSelected = true;
        e.status = 1;
        return e;
      }).toList();

      // ref.read(acceptOrdersProvider.notifier).makeAvailable(selectedItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedOrders = ref.watch(selectedOrdersProvider);
    final isChecked = selectedOrders.contains(widget.label);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              21.verticalSpace,
              Text(widget.label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400)),
              18.verticalSpace,
              Text(widget.label2, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),

              // if (widget.label3 != null) ...[
              //   8.verticalSpace,
              //   Text(widget.label3!,
              //       style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)
              // ),
              // ],
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Checkbox(
                activeColor: const Color(0xFF7B7B7B),
                checkColor: const Color(0xFFF5F3F0),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    _toggleSelection(!isChecked);
                  });
                  if (value == true) {
                    ref
                        .read(acceptOrdersProvider.notifier)
                        .makeUnAvailable(widget.order?.itemId ?? 0, 0);
                  }
                }),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                isChecked ? 'Unavailable' : '',
                style: TextStyle(
                  color: const Color(0xFFE23131),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RefundPopWidget extends ConsumerWidget {
  final String orderId;
  final int isIndividualOrder;

  const RefundPopWidget({
    super.key,
    required this.orderId,
    required this.isIndividualOrder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRefund = ref.watch(acceptOrdersProvider);
    return Column(
      children: [
        26.verticalSpace,
        Text(
          'Offer Refund?',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        43.verticalSpace,
        SizedBox(
          width: 333,
          height: 50,
          child: Text(
            'Would you like to offer a refund due to being unable to process order?',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
        32.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 200.w,
              height: 50.h,
              child: PrimaryButton(
                isLoading: orderRefund!.isRefunding,
                onClick: () {
                  ref.read(acceptOrdersProvider.notifier).refundOrder(
                        orderId,
                        isIndividualOrder,
                      );
                  // ref.read(acceptOrdersProvider.notifier).refundOrder(orderId, isIndividualOrder);
                },
                title: "Refund",
              ),
            ),
            SizedBox(
              width: 110.w,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Undo',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
