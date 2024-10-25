import 'package:dit_assessment/features/battery_info/channels/my_method_channels.dart';
import 'package:dit_assessment/features/battery_info/models/battery_info_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryInfoNotifier extends StateNotifier<BatteryInfoStateModel> {
  BatteryInfoNotifier() : super(BatteryInfoStateModel());

  static const _fullBatteryThreshold = 80;
  static const _halfBatteryThreshold = 50;
  static const _lowBatteryThreshold = 20;

  static const _chargingColor = Colors.green;
  static const _dischargingColor = Colors.red;
  static const _fullBatteryColor = Colors.blue;

  static const String _chargingState = 'Charging';
  static const String _dischargingState = 'Discharging';
  static const String _fullState = 'Full';
  static const String _notChargingState = 'Not charging';
  static const String _unknownState = 'Unknown';

  static final platform = MethodChannel(MyMethodChannels.batteryChannel);

  Future<void> getBatteryInfo() async {
    try {
      final result = await platform.invokeMethod<Map<dynamic, dynamic>>(
          MyMethodChannels.batteryInfoInvokeMethod);

      if (result != null) {
        int batteryLevel = result['batteryLevel'];
        String batteryStatus = result['status'];

        state = BatteryInfoStateModel(
          batteryLevel: _formatBatteryLevel(batteryLevel),
          batteryStatus: batteryStatus,
          batteryLevelIcon: _getBatteryLevelIcon(batteryLevel),
          batteryChargingColor: _getBatteryChargingColor(batteryStatus),
        );
      }
    } on PlatformException catch (e) {
      state = BatteryInfoStateModel(
        errorMessage: "Failed to get battery info: '${e.message}'",
      );
    }
  }

  String _formatBatteryLevel(int batteryLevel) {
    return '$batteryLevel%';
  }

  String _getBatteryLevelIcon(int batteryLevel) {
    if (batteryLevel >= _fullBatteryThreshold) {
      return 'assets/icons/battery_full_icon.svg';
    } else if (batteryLevel >= _halfBatteryThreshold) {
      return 'assets/icons/battery_half_icon.svg';
    } else if (batteryLevel >= _lowBatteryThreshold) {
      return 'assets/icons/battery_low_icon.svg';
    } else {
      return 'assets/icons/battery_empty_icon.svg';
    }
  }

  Color _getBatteryChargingColor(String status) {
    switch (status) {
      case _chargingState:
        return _chargingColor;
      case _dischargingState:
        return _dischargingColor;
      case _fullState:
        return _fullBatteryColor;
      default:
        return Colors.grey;
    }
  }
}
