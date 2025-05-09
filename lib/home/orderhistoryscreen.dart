import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/home/notifiers/home_notifier.dart';
import 'package:java_go/home/orders_detail.dart';

class OrderHistoryScreen extends ConsumerStatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  ConsumerState<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends ConsumerState<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(homeNotifierProvider);
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            62.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 57),
              child: _buildSearchAndDropdown(),
            ),
            12.verticalSpace,
            _buildHeaderRow(),
            AsyncWidget(
              onRetry: () {
                ref.invalidate(homeNotifierProvider);
              },
              value: homeState,
              data: (data) {
                final ordersResponses = data?.ordersResponse?.getCombinedUniqueOrders;
                ordersResponses!.sort((a, b) {
                  final aDate = a.orderPlacedAtDate ?? DateTime.fromMillisecondsSinceEpoch(0);
                  final bDate = b.orderPlacedAtDate ?? DateTime.fromMillisecondsSinceEpoch(0);
                  return bDate.compareTo(aDate);
                });
                if (ordersResponses.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 57),
                    child: Column(
                      children: ordersResponses.map((displayOrder) {
                        return buildOrderRow(
                          context,
                          displayOrder,
                          isIndividual: displayOrder.isIndividualOrder == 0 ? false : true,
                          groupId: displayOrder.requestUniqueId,
                        );
                      }).toList(),
                    ),
                  );
                } else {
                  return const Center(child: Text("No orders available."));
                }
              },
            ),
            200.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'RESULTS :',
              style: TextStyle(
                color: const Color(0xFF848484),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            12.horizontalSpace,
            Container(
              height: 54.h,
              width: 110.w,
              child: Dropdown('10', Color(0xFF4C2F27)),
            ),
          ],
        ),
        SizedBox(
          width: 212.26.w,
          height: 42.48.h,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Color(0xFF4C2F27),
              ),
              hintText: "Search",
              hintStyle: TextStyle(
                color: const Color(0xFF7B7B7B),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              fillColor: Color(0xFFF5F3F0),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF4C2F27),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17),
        width: 1076.w,
        height: 59.h,
        decoration: const BoxDecoration(color: Color(0xFF9B6842)),
        child: Row(
          children: [
            _buildHeaderItem('Customer Name'),
            _buildHeaderItem('Order ID'),
            _buildHeaderItem('Order Time'),
            _buildHeaderItem('Order Date'),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderItem(String label) {
    return SizedBox(
      width: 229.w,
      child: ReviewItembarname(
        label: label,
        color: Colors.white,
        fontSize: 16.sp,
      ),
    );
  }

  Widget buildOrderRow(BuildContext context, GetOrder order,
      {String? groupId, required bool? isIndividual}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      width: 1076.w,
      child: Column(
        children: [
          19.verticalSpace,
          Row(
            children: [
              _buildOrderDetails(
                  isIndividual == true ? order.name : order.requestCreatedByName ?? order.name),
              _buildOrderDetails(groupId ?? order.orderNumber),
              _buildOrderDetails(order.orderTime),
              _buildOrderDetails(order.orderDate),
              const Spacer(),
              InkWell(
                onTap: () {
                  final id = isIndividual == true ? (order.id.toString()) : (groupId ?? '');
                  context.navigateTo(OrderScreen(
                    id: id,
                    isIndividualOrder: isIndividual == true ? 1 : 0,
                  ));
                },
                child: Image.asset(
                  'assets/images/ic_order_view.png',
                  width: 29.48,
                  height: 29.48,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color(0xFFC0987C),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetails(String? detail) {
    return SizedBox(
      width: 229.w,
      child: ReviewItembarname(
        label: detail ?? '',
        color: const Color(0xFF1B0701),
        fontSize: 16.sp,
      ),
    );
  }
}

class DisplayOrder {
  final GetOrder order;
  final String? groupId;
  final bool? isIndividualOrder;

  DisplayOrder({
    required this.order,
    this.groupId,
    this.isIndividualOrder,
  });
}
