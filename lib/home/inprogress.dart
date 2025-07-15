import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';

import 'orders.dart';

class InProgressScreen extends ConsumerStatefulWidget {
  const InProgressScreen({super.key});

  @override
  ConsumerState<InProgressScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends ConsumerState<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final inProgressState = ref.watch(todayOrdersProvider);

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
            value: inProgressState,
            onRetry: () {
              ref.invalidate(todayOrdersProvider);
            },
            data: (data) {
              final orders = data.getCombinedUniqueOrders;
              final inProgressOrders = orders
                  .where((order) =>
                      order.orderCompleted != 1 &&
                      (order.fullOrderCancelled == 0 ||
                          order.refundStatus == null))
                  .toList()
                ..sort((a, b) {
                  final aDateTime = a.orderPlacedAtDate ??
                      DateTime.fromMillisecondsSinceEpoch(0);
                  final bDateTime = b.orderPlacedAtDate ??
                      DateTime.fromMillisecondsSinceEpoch(0);
                  return bDateTime.compareTo(aDateTime);
                });
              if (inProgressOrders.isEmpty) {
                return Column(
                  children: [
                    180.verticalSpace,
                    const Center(child: Text("No InProgress orders")),
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
                    padding: const EdgeInsets.only(
                      right: 70,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            ref.invalidate(todayOrdersProvider);
                          },
                          icon: Icon(Icons.refresh)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 80, top: 0),
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.6,
                        crossAxisSpacing: 70,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: inProgressOrders.length,
                      itemBuilder: (context, index) {
                        final order = inProgressOrders[index];
                        return OrderWidget(
                          customerName: order.isIndividualOrder == 1
                              ? (order.name ?? '')
                              : (order.requestCreatedByName ?? ''),
                          orderNumber: order.isIndividualOrder == 1
                              ? order.orderNumber ?? ''
                              : order.requestUniqueId ?? '',
                          peopleCount: order.isIndividualOrder == 1
                              ? "1"
                              : "${data.groupCoffeeRunOrders?[order.requestUniqueId]?.length??1}",
                          eta: order.estimatedArrivalTime == null
                              ? ""
                              : order.estimatedArrivalTime!,
                          orderId: order.isIndividualOrder == 1
                              ? order.id.toString()
                              : order.requestUniqueId,
                          isIndividualOrder:
                              order.isIndividualOrder == 1 ? 1 : 0,
                          status: order.status,
                        );
                      },
                    ),
                  ),
                  200.verticalSpace,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class OrderWidget extends ConsumerStatefulWidget {
  final String customerName;
  final String orderNumber;
  final String peopleCount;
  final String eta;
  final String? orderId;
  final int isIndividualOrder;
  final int status;

  OrderWidget(
      {required this.customerName,
      required this.orderNumber,
      required this.peopleCount,
      this.orderId,
      required this.isIndividualOrder,
      required this.status,
      required this.eta});

  @override
  ConsumerState<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends ConsumerState<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 7),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 10,
        ),
        width: 264.w,
        decoration: ShapeDecoration(
          color: Colors.white,
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
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                18.horizontalSpace,
                Flexible(
                  child: Text(
                    '${widget.orderNumber}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
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
                    fontWeight: FontWeight.w400,
                  ),
                ),
                widget.eta == ""
                    ? SizedBox.shrink()
                    : Text(
                        'ETA: ${widget.eta}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ],
            ),
            29.verticalSpace,
            SizedBox(
              width: 198.w,
              height: 34.h,
              child: PrimaryButton(
                isLoading: false,
                onClick: () async {
                  if (widget.status == 1) {
                    context.navigateTo(Orders(
                      isEdited: true,
                      isIndividualOrder: widget.isIndividualOrder == 1 ? 1 : 0,
                      orderId: widget.orderId.toString(),
                    ));
                  } else {
                    // ref
                    //     .read(acceptOrdersProvider.notifier)
                    //     .makeOrderComplete(widget.orderId.toString(), widget.isIndividualOrder, 1);
                  }
                },
                title: widget.status == 1 ? 'View Order' : 'Complete Order',
              ),
            )
          ],
        ),
      ),
    );
  }
}
