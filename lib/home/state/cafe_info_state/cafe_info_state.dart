
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/model/cafe_model.dart';

part "cafe_info_state.freezed.dart";

@freezed
abstract class CafeInfoState with _$CafeInfoState {
  const factory CafeInfoState({
    required CafeEvent cafeEvent,
    String? response,
    CafeModel? cafeModel,
  }) = _CafeInfoState;

}

enum CafeEvent {
  addCafeInfo,
  updateClickAndCollect,
  updateCafeInfo,
  updateDisplayName,
  updateProfileImage,
  createStripAccount,
  stripAccountStatus,
  publishCafe,
}