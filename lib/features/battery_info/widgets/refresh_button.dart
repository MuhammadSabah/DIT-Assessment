import 'package:dit_assessment/features/battery_info/providers/battery_info_provider.dart';
import 'package:dit_assessment/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RefreshButton extends ConsumerWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: () {
        ref.read(batteryInfoProvider.notifier).getBatteryInfo();
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/refresh_icon.svg',
            height: 24,
            // width: 24,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          const Text(
            "Refresh",
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
      tooltip: 'Refresh',
    );
  }
}
