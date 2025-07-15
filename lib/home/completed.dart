import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';

import 'package:java_go/config/async_widget.dart';
import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';
import 'package:java_go/home/orders_detail.dart';

class CompletedScreen extends ConsumerStatefulWidget {
  const CompletedScreen({super.key});

  @override
  ConsumerState<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends ConsumerState<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    final completedState = ref.watch(todayOrdersProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5F3F0),
      body: RefreshIndicator(
        color: Color(0xFFC0987C),
        onRefresh: () async {
          ref.invalidate(todayOrdersProvider);
        },
        child: SingleChildScrollView(
          child: AsyncWidget(
            onRetry: () {
              ref.invalidate(todayOrdersProvider);
            },
            value: completedState,
            data: (data) {
              final orders = data.getCombinedUniqueOrders;
              final completedOrders = orders
                  .where((order) =>
                      order.orderCompleted == 1 ||
                      order.refundStatus != null ||
                      order.fullOrderCancelled != 0)
                  .toList()
                ..sort((a, b) {
                  final aDateTime = a.orderPlacedAtDate ??
                      DateTime.fromMillisecondsSinceEpoch(0);
                  final bDateTime = b.orderPlacedAtDate ??
                      DateTime.fromMillisecondsSinceEpoch(0);
                  return bDateTime.compareTo(aDateTime);
                });

              if (completedOrders.isEmpty) {
                return Column(
                  children: [
                    180.verticalSpace,
                    const Center(child: Text("No Completed orders")),
                    IconButton(
                        onPressed: () {
                          ref.invalidate(todayOrdersProvider);
                        },
                        icon: Icon(Icons.refresh)),
                  ],
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            ref.invalidate(todayOrdersProvider);
                          },
                          icon: Icon(Icons.refresh),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 48),
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.72,
                          crossAxisSpacing: 50,
                          mainAxisSpacing: 22,
                        ),
                        itemCount: completedOrders.length,
                        itemBuilder: (context, index) {
                          final order = completedOrders[index];
                          return CompletedOrderwidget(
                            customerName: order.isIndividualOrder == 1
                                ? (order.name ?? '')
                                : (order.requestCreatedByName ?? ''),
                            orderNumber: (order.isIndividualOrder == 1)
                                ? order.orderNumber ?? ''
                                : order.requestUniqueId ?? '',
                            peopleCount: order.isIndividualOrder == 1
                                ? "1"
                                : '${data.groupCoffeeRunOrders?[order.requestUniqueId ?? ""]?.length ?? 0}',
                            total: order.totalAmount ?? '0.00',
                            order: order,
                          );
                        },
                      ),
                    ),
                    150.verticalSpace,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CompletedOrderwidget extends ConsumerStatefulWidget {
  final String customerName;
  final String orderNumber;
  final String peopleCount;
  final GetOrder order;
  final String total;

  CompletedOrderwidget(
      {required this.customerName,
      required this.order,
      required this.orderNumber,
      required this.peopleCount,
      required this.total});

  @override
  ConsumerState<CompletedOrderwidget> createState() =>
      _CompletedOrderwidgetState();
}

class _CompletedOrderwidgetState extends ConsumerState<CompletedOrderwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3F0),
      body: Padding(
        padding: EdgeInsets.only(left: 30, top: 7),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 10,
          ),
          width: 264.w,
          decoration: ShapeDecoration(
            color: Color(0xFF461C10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.customerName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    18.horizontalSpace,
                    Flexible(
                      child: Text(
                        'Order Number: ${widget.orderNumber}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xFFA0A0A0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.peopleCount} people',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '15:30',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Total: ${widget.total}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                29.verticalSpace,
                SizedBox(
                  width: 198.w,
                  height: 34.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD7AE92),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    onPressed: () {
                      final id = widget.order.isIndividualOrder == 1
                          ? widget.order.id.toString()
                          : (widget.order.requestUniqueId ?? '');

                      context.navigateTo(OrderScreen(
                        id: id,
                        isIndividualOrder:
                            widget.order.isIndividualOrder == 1 ? 1 : 0,
                      ));
                      // context.navigateTo(OrderScreen(orderId: order.id));
                    },
                    child: Text(
                      'View Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
