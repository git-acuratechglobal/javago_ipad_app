import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:java_go/config/async_widget.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';

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
      backgroundColor: Color(0xFFF5F3F0),
      body: RefreshIndicator(
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
              final completedOrders = orders.where((order) => order.orderCompleted == 1).toList();

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

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            ref.invalidate(todayOrdersProvider);
                          },
                          icon: Icon(Icons.refresh)),
                    ),
                  ),
                  for (final order in completedOrders)
                    CompletedOrderwidget(
                       customerName: order.isIndividualOrder == 1
                          ? (order.name ?? '')
                          : (order.requestCreatedByName ?? ''),
                      orderNumber: (order.isIndividualOrder == 1)
                          ? order.orderNumber ?? ''
                          : order.requestUniqueId ?? '',
                      peopleCount: order.isIndividualOrder == 1
                          ? '1'
                          : (order.orderNumber?.length.toString() ?? '1'),
                 
                      total: order.totalAmount ?? '0.00',
                     
                 
                    ),
                  150.verticalSpace,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CompletedOrderwidget extends StatefulWidget {
  final String customerName;
  final String orderNumber;
  final String peopleCount;
  final String total;

  CompletedOrderwidget(
      {required this.customerName,
      required this.orderNumber,
      required this.peopleCount,
      required this.total});

  @override
  State<CompletedOrderwidget> createState() => _CompletedOrderwidgetState();
}

class _CompletedOrderwidgetState extends State<CompletedOrderwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 37),
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
                Expanded(
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
    );
  }
}
