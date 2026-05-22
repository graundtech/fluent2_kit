import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:fluent2_kit/src/components/fluent_components/fluent_banner/fluent_banner.dart';

extension FluentBannerMaterialExtension on FluentBanner {
  PersistentBottomSheetController showBottomSheet(
      {required BuildContext context, required Future<void> future}) {
    final controller = material.showBottomSheet(
      context: context,
      enableDrag: false,
      builder: (_) {
        return MediaQuery(
          data: MediaQuery.of(context),
          child: this,
        );
      },
    );
    future.whenComplete(controller.close);
    return controller;
  }
}
