import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/button.dart';

import 'package:java_go/home/notifiers/accept_orders.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';
import 'package:java_go/home/orders.dart';

class PendingScreen extends ConsumerStatefulWidget {
  const PendingScreen({super.key});

  @override
  ConsumerState<PendingScreen> createState() => _InprogressScreenState();
}

class _InprogressScreenState extends ConsumerState<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    final pendingState = ref.watch(todayOrdersProvider);

    return Scaffold(
      backgroundColor: Color(0xFFF5F3F0),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(todayOrdersProvider);
        },
        child: SingleChildScrollView(
          child: AsyncWidget(
            value: pendingState,
            onRetry: () {
              ref.invalidate(todayOrdersProvider);
            },
            data: (data) {
              final orders = data.getCombinedUniqueOrders;

              final pendingOrders =
                  orders.where((order) => order.status == 1 && order.orderCompleted == 0).toList();

              if (pendingOrders.isEmpty) {
                return Column(
                  children: [
                    180.verticalSpace,
                    const Center(child: Text("No pending orders")),
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
                  for (final order in pendingOrders)
                
                    OrderWidget(
                      onTap: () {
                        context.navigateTo(Orders(
                          isEdited: true,
                          isIndividualOrder: order.isIndividualOrder == 1 ? 1 : 0,
                          orderId: order.requestUniqueId ?? order.id.toString(),
                        ));
                      },
                      orderId: (order.isIndividualOrder == 1) ? order.id : order.requestUniqueId,
                      customerName: order.isIndividualOrder == 1
                          ? (order.name ?? '')
                          : (order.requestCreatedByName ?? ''),
                      orderNumber: (order.isIndividualOrder == 1)
                          ? order.orderNumber ?? ''
                          : order.requestUniqueId ?? '',
                      peopleCount: order.isIndividualOrder == 1
                          ? "1"
                          :'${data.groupCoffeeRunOrders?[order.requestUniqueId ?? ""]?.length ?? 0}',
                      eta: order.orderTime ?? '',
                      isIndividualOrder: order.isIndividualOrder == 1 ? 1 : 0,
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
  final String? orderNumber;
  final String? peopleCount;
  final String? eta;
  final dynamic orderId;
  final Function()? onTap;
  final int isIndividualOrder;

  OrderWidget(
      {required this.customerName,
      required this.orderNumber,
      required this.peopleCount,
      this.onTap,
      this.orderId,
      required this.isIndividualOrder,
      required this.eta});

  @override
  ConsumerState<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends ConsumerState<OrderWidget> {
  // void _showDialog(BuildContext context) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     barrierLabel: "Dismiss",
  //     transitionDuration: const Duration(milliseconds: 300),
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 24),
  //           child: Align(
  //             alignment: Alignment.center,
  //             child: Material(
  //               color: Colors.transparent,
  //               child: Container(
  //                   height: 265.h,
  //                   width: 528.w,
  //                   decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   child: CheckAvabilityWidget()),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //     transitionBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(0.0, 1.0);
  //       const end = Offset.zero;
  //       const curve = Curves.easeIn;
  //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //       var offsetAnimation = animation.drive(tween);

  //       return SlideTransition(position: offsetAnimation, child: child);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(acceptOrdersProvider);
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 37),
      child: InkWell(
        onTap: () {
          widget.onTap?.call();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 5,
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
                  25.horizontalSpace,
                  Expanded(
                    child: Text(
                      'Order Number: ${widget.orderNumber}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        overflow: TextOverflow.ellipsis,
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
                  Text(
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
                  isLoading: orderState!.isLoading! &&
                      widget.orderId.toString() == orderState.orderId &&
                      orderState.unavailableItems == null,
                  onClick: () async {
                    ref
                        .read(acceptOrdersProvider.notifier)
                        .acceptOrder(widget.orderId.toString(), widget.isIndividualOrder);
                  },
                  title: 'Accept',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckAvabilityWidget extends StatefulWidget {
  const CheckAvabilityWidget({super.key});

  @override
  State<CheckAvabilityWidget> createState() => _CheckAvabilityWidgetState();
}

class _CheckAvabilityWidgetState extends State<CheckAvabilityWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        70.verticalSpace,
        Center(
          child: Text(
            '  Please Check \nItem Availability',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        70.verticalSpace,
        SizedBox(
          width: 120.w,
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC0987C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Check',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
