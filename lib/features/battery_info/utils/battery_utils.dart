import 'package:dit_assessment/features/battery_info/constants/battery_constants.dart';
import 'package:flutter/material.dart';

class BatteryUtils {
  static String formatBatteryLevel(int batteryLevel) {
    return '$batteryLevel%';
  }

  static String getBatteryLevelIcon(int batteryLevel) {
    if (batteryLevel >= BatteryConstants.fullBatteryThreshold) {
      return 'assets/icons/battery_full_icon.svg';
    } else if (batteryLevel >= BatteryConstants.halfBatteryThreshold) {
      return 'assets/icons/battery_half_icon.svg';
    } else if (batteryLevel >= BatteryConstants.lowBatteryThreshold) {
      return 'assets/icons/battery_low_icon.svg';
    } else {
      return 'assets/icons/battery_empty_icon.svg';
    }
  }

  static Color getBatteryChargingColor(String status) {
    switch (status) {
      case BatteryConstants.chargingState:
        return BatteryConstants.chargingColor;
      case BatteryConstants.dischargingState:
        return BatteryConstants.dischargingColor;
      case BatteryConstants.fullState:
        return BatteryConstants.fullBatteryColor;
      default:
        return Colors.grey;
    }
  }
}
