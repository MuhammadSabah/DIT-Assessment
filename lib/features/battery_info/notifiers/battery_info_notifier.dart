import 'package:dit_assessment/features/battery_info/channels/my_method_channels.dart';
import 'package:dit_assessment/features/battery_info/models/battery_info_state_model.dart';
import 'package:dit_assessment/features/battery_info/utils/battery_utils.dart';
import 'package:flutter/material.dart'; // Import Material package for SnackBar
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryInfoNotifier extends StateNotifier<BatteryInfoStateModel> {
  BatteryInfoNotifier() : super(BatteryInfoStateModel());

  static final platform = MethodChannel(MyMethodChannels.batteryChannel);

  Future<void> getBatteryInfo(BuildContext context) async {
    try {
      final result = await platform.invokeMethod<Map<dynamic, dynamic>>(
          MyMethodChannels.batteryInfoInvokeMethod);

      if (result != null) {
        int batteryLevel = result['batteryLevel'];
        String batteryStatus = result['status'];

        state = BatteryInfoStateModel(
          batteryLevel: BatteryUtils.formatBatteryLevel(batteryLevel),
          batteryStatus: batteryStatus,
          batteryLevelIcon: BatteryUtils.getBatteryLevelIcon(batteryLevel),
          batteryChargingColor:
              BatteryUtils.getBatteryChargingColor(batteryStatus),
        );
      }
    } on PlatformException catch (e) {
      _handleError(e.message, context);
    }
  }

  void _handleError(String? message, BuildContext context) {
    state = BatteryInfoStateModel(
      errorMessage: "Failed to get battery info: '$message'",
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Failed to get battery info: '$message'"),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
