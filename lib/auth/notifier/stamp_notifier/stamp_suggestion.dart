
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../service/auth_service.dart';
import '../../model/stamp_suggestion.dart';
part 'stamp_suggestion.g.dart';
@riverpod
Future<StampSuggestion> getStampSuggestion(Ref ref,) async {
  return await ref.read(authServiceProvider).stampSuggestion();
}