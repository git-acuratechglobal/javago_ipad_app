import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/widgets/page_loading_widget.dart';
import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/home/model/order_detail.dart';
import 'package:java_go/home/notifier/order_notifier/order_notifier.dart';
import 'package:java_go/home/notifiers/order_details_provider.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';

final itemStatusProvider =
    StateProvider.autoDispose<Map<String, String>>((ref) => {});

class Orders extends ConsumerStatefulWidget {
  final bool isEdited;
  final String? orderId;
  final int isIndividualOrder;
  const Orders(
      {super.key,
      required this.isEdited,
      required this.orderId,
      required this.isIndividualOrder});

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
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedOrders = ref.watch(GetOrderDetailsProvider(
        widget.orderId ?? '', widget.isIndividualOrder));
    final isLoading = ref.watch(orderNotifierProvider).isLoading;
    return Stack(
      children: [
        AsyncWidget(
            value: ref.watch(todayOrdersProvider),
            data: (data) {
              final inProgressOrders = data.getCombinedUniqueOrders
                  .where((order) => order.orderCompleted != 1)
                  .toList()
                  .length;
              return Scaffold(
                resizeToAvoidBottomInset: false,
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
                                    'Orders: ${inProgressOrders}',
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
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 82, right: 82),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                              ],
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
                            order.first.requestUniqueId != null
                                ? Wrap(
                                    spacing: 50,
                                    direction: Axis.horizontal,
                                    children: data
                                        .groupOrdersByCustomer()
                                        .entries
                                        .map((entry) {
                                      final customerName = entry.key;
                                      final customerOrders = entry.value;
                                      return detailedContainer(
                                        name:
                                            customerOrders.first.customerName ??
                                                '',
                                        price:
                                            "Total amount: £ ${order.first.itemAmount.toString()}",
                                        orderList: customerOrders,
                                      );
                                    }).toList(),
                                  )
                                : detailedContainer(
                                    name: order.first.customerName ?? '',
                                    price:
                                        ("Total amount: £ ${order.first.itemAmount.toString()}"),
                                    orderList: order,
                                  ),
                            200.verticalSpace,
                          ],
                        );
                      }),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: AsyncWidget(
                    value: ref.watch(GetOrderDetailsProvider(
                        widget.orderId ?? '', widget.isIndividualOrder)),
                    data: (data) {
                      final statusMap = ref.watch(itemStatusProvider);
                      final isButtonEnabled = data.orders?.every((order) =>
                              statusMap.containsKey(order.itemName) &&
                              (statusMap[order.itemName] == "complete" ||
                                  statusMap[order.itemName] ==
                                      "unavailable")) ??
                          false;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 40.h),
                        child: InkWell(
                          onTap: isButtonEnabled
                              ? () async {
                                  final values = statusMap.values;
                                  final hasUnavailable =
                                      values.contains("unavailable");
                                  if (hasUnavailable) {
                                    _showDialog(context);
                                  } else {
                                    ref
                                        .read(orderNotifierProvider.notifier)
                                        .makeOrderComplete(
                                            widget.orderId.toString(),
                                            widget.isIndividualOrder,
                                            1);
                                  }
                                }
                              : null,
                          child: Container(
                            width: 288.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: isButtonEnabled
                                  ? const Color(0xFF5CF97F)
                                  : const Color(0xFFE0E0E0),
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
                                'Process Order',
                                style: TextStyle(
                                  color: const Color(0xFF414141),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }),
        if (isLoading) PageLoadingWidget()
      ],
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
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 68,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24),
          width: 350.w,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
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
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        name ?? '',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    if (orderList != null && orderList.isNotEmpty)
                      Text(
                        'Total amount : £ ${orderList.fold(0, (sum, item) => sum + (item.itemAmount ?? 0))}',
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
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final order = orderList[index];

                    return OrderDetailCard(
                      index: index,
                      order: order,
                      unavailableItems: [],
                      label: order.itemName ?? '',
                      label2: (order.addonSizes != null &&
                              order.addonSizes!.isNotEmpty)
                          ? order.addonSizes!.first.addonSizeName ?? ""
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
      ),
    ],
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
  final List<UnaviableItems> unavailableItems;
  final Order? order;
  final int index;
  OrderDetailCard(
      {super.key,
      required this.label,
      required this.label2,
      this.label3,
      required this.unavailableItems,
      this.order,
      this.index = 0});

  @override
  ConsumerState<OrderDetailCard> createState() => _OrderDetailCardState();
}

class _OrderDetailCardState extends ConsumerState<OrderDetailCard> {
  late String itemName;

  @override
  void initState() {
    super.initState();
    itemName = widget.order?.itemName ?? widget.label;
  }

  void _updateSelection(String status) {
    final statusMap = ref.read(itemStatusProvider);
    ref.read(itemStatusProvider.notifier).state = {
      ...statusMap,
      itemName: status,
    };
  }

  @override
  Widget build(BuildContext context) {
    final statusMap = ref.watch(itemStatusProvider);
    final selectedStatus = statusMap[itemName];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              21.verticalSpace,
              SizedBox(
                width: 0.19.sw,
                child: Row(
                  children: [
                    Text("${widget.order?.itemQuantity} x "),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 0.08.sw),
                      child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          "${widget.label} ",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400)),
                    ),
                    if (widget.order?.itemSize != null &&
                        widget.order!.itemSize!.isNotEmpty)
                      Text("(${widget.order?.itemSize ?? ""})"),
                    Text(" £ ${widget.order?.itemAmount}")
                  ],
                ),
              ),
              18.verticalSpace,
              if (widget.order!.addonSizes!.isNotEmpty) ...[
                Text("Additional option:",
                    style: TextStyle(
                        fontSize: 11.sp, fontWeight: FontWeight.w400)),
                ...widget.order!.addonSizes!.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "${e.addonSizeName} (${e.addonName})",
                      style: TextStyle(fontSize: 10),
                    ),
                  );
                }),
              ]
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  "Process",
                  style: TextStyle(fontSize: 10),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor:
                        Colors.grey, // Color when not selected
                    radioTheme: RadioThemeData(
                      fillColor:
                          WidgetStateProperty.resolveWith<Color>((states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.red; // Selected color
                        }
                        return Colors.grey; // Unselected color
                      }),
                      overlayColor: WidgetStateProperty.all(Colors.red),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  child: Radio<String>(
                    value: "complete",
                    groupValue: selectedStatus,
                    onChanged: (val) {
                      if (val != null) _updateSelection(val);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Unavailable",
                  style: TextStyle(fontSize: 10),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor:
                        Colors.grey, // Color when not selected
                    radioTheme: RadioThemeData(
                      fillColor:
                          WidgetStateProperty.resolveWith<Color>((states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.red; // Selected color
                        }
                        return Colors.grey; // Unselected color
                      }),
                      overlayColor: WidgetStateProperty.all(Colors.red),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  child: Radio<String>(
                    value: "unavailable",
                    groupValue: selectedStatus,
                    onChanged: (val) {
                      if (val != null) _updateSelection(val);
                    },
                  ),
                ),
              ],
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
    final orderRefund = ref.watch(orderNotifierProvider);
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
                isLoading: orderRefund.isLoading,
                onClick: () {
                  final allOrders = ref
                          .read(GetOrderDetailsProvider(
                              orderId, isIndividualOrder))
                          .value
                          ?.orders ??
                      [];

                  final statusMap = ref.read(itemStatusProvider);

                  final unavailableItemIds = allOrders
                      .asMap()
                      .entries
                      .where((entry) => statusMap[entry.value.itemName] == 'unavailable')
                      .map((entry) => entry.value.itemId)
                      .whereType<int>()
                      .toList();
                  final hasAllUnavailable = statusMap.values
                      .every((status) => status == "unavailable");
                  if (hasAllUnavailable) {
                    ref.read(orderNotifierProvider.notifier).makeOrderRefund(
                        orderId, isIndividualOrder, 1, unavailableItemIds);
                  } else {
                    ref
                        .read(orderNotifierProvider.notifier)
                        .makeOrderRefundOrComplete(
                            orderId, isIndividualOrder, 1, unavailableItemIds);
                  }

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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
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
