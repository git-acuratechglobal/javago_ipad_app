import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../model/menu_item_details.dart';
part 'get_menu_item_details_notifier.g.dart';
@riverpod
Future<MenuItemDetails?> getMenuItemsDetails(Ref ref,{ int ?itemId}) async {
  MenuItemDetails? data;
  if(itemId!=null){
     data= await ref.watch(authServiceProvider).getMenuItemDetails(itemId);
  }
  ref.watch(authServiceProvider).syncMenuCategory().ignore();
return data;

}

