import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'menu_info_state.g.dart';

class MenuInfoState {
  final int? id;
  final int tabIndex;

  MenuInfoState({this.id, required this.tabIndex});
  MenuInfoState copyWith({int? id, int? tabIndex}) {
    return MenuInfoState(tabIndex: tabIndex ?? this.tabIndex, id: id ?? this.id);
  }
}

@Riverpod(keepAlive: true)
class MenuInfoTabState extends _$MenuInfoTabState {
  @override
  MenuInfoState build() {
    return MenuInfoState(tabIndex: 0);
  }

  void updateMenuTab(
    int tabIndex, [
    int? id,
  ]) {
    state = MenuInfoState(tabIndex: tabIndex,id: id);

    print('Updated state: tabIndex=${state.tabIndex}, id=${state.id}');
  }
}
