import 'package:dit_assessment/features/battery_info/models/battery_info_state_model.dart';
import 'package:dit_assessment/features/battery_info/notifiers/battery_info_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final batteryInfoProvider =
    StateNotifierProvider<BatteryInfoNotifier, BatteryInfoStateModel>((ref) {
  return BatteryInfoNotifier();
});
