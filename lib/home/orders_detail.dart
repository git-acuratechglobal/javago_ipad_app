import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/home/account.dart';
import 'package:java_go/home/model/order_detail.dart';
import 'package:java_go/home/notifiers/order_details_provider.dart';

class OrderScreen extends ConsumerStatefulWidget {
  final String id;
  final int isIndividualOrder;

  const OrderScreen({
    super.key,
    required this.id,
    required this.isIndividualOrder,
  });

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final orderState = 
    // ref.read(getOrderDetailsProvider).getOrderDetail(widget.id, widget.isIndividualOrder);
    ref.watch(getOrderDetailsProvider(widget.id, widget.isIndividualOrder));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          myOrders: false,
          title: 'All Orders',
        ),
      ),
      body: AsyncWidget(value: orderState, data: (data) {
          print('Order data: $data'); 
    final orders = data.orders ?? [];
    if (orders.isEmpty) {
      print('No orders found.');
    }
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              _menuOrderTable(orders),
            ],
          ),
        );
      }),
    );
  }

  Widget _menuOrderTable(List<Order> items) {
    if (items.isEmpty) {
      return const Text("No menu items in this order.");
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(const Color(0xFF9B6842)),
        columns: const [
          DataColumn(label: Text('No.', style: TextStyle(color: Colors.white, fontSize: 16))),
          DataColumn(label: Text('Icon', style: TextStyle(color: Colors.white, fontSize: 16))),
          DataColumn(label: Text('Item Name', style: TextStyle(color: Colors.white, fontSize: 16))),
          DataColumn(label: Text('Category', style: TextStyle(color: Colors.white, fontSize: 16))),
          DataColumn(label: Text('Price', style: TextStyle(color: Colors.white, fontSize: 16))),
          DataColumn(label: Text('Description', style: TextStyle(color: Colors.white, fontSize: 16))),
          DataColumn(label: Text('Type', style: TextStyle(color: Colors.white, fontSize: 16))),
          DataColumn(label: Text('Size', style: TextStyle(color: Colors.white, fontSize: 16))),
          DataColumn(label: Text('Quantity', style: TextStyle(color: Colors.white, fontSize: 16))),
          DataColumn(label: Text('Addons', style: TextStyle(color: Colors.white, fontSize: 16))),
        ],
        rows: List.generate(items.length, (i) {
          final item = items[i];
          return DataRow(cells: [
            DataCell(Center(child: Text('${i + 1}'))),
            DataCell(Center(
              child: item.itemImage != null
                  ? Image.network(
                      item.itemImage ?? '',
                      width: 24,
                      height: 24,
                      errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
                    )
                  : const Icon(Icons.fastfood),
            )),
            DataCell(Text(item.itemName ?? '-')),
            DataCell(Text(item.itemCategory ?? '-')),
            DataCell(Center(child: Text(item.itemAmount?.toString() ?? '-'))),
            DataCell(Text(item.itemDescription ?? '-')),
            DataCell(Text(item.itemType ?? '-')),
            DataCell(Center(child: Text(item.itemSize ?? '-'))),
            DataCell(Center(child: Text(item.itemQuantity?.toString() ?? '-'))),
            DataCell(Text(
              (item.addonSizes == null || item.addonSizes!.isEmpty)
                  ? '-'
                  : item.addonSizes!
                      .map((addon) =>
                          '${addon.addonName ?? ''} (${addon.addonSizeName ?? ''}, ₹${addon.addonSizePrice ?? ''})')
                      .join(', '),
            )),
          ]);
        }),
      ),
    );
  }
}
