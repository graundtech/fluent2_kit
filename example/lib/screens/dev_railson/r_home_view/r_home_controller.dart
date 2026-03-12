import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class RHomeController {
  late final TabController tabController;
  final FluentTabBarController fluentTabBarController =
      FluentTabBarController();

  RHomeController({
    required TickerProvider vsync,
  }) : tabController = TabController(length: 6, vsync: vsync) {
    tabController.addListener(tabControllerListener);
    fluentTabBarController.addListener(fluentTabBarControllerListener);
  }

  void tabControllerListener() {
    fluentTabBarController.value = tabController.index;
  }

  void fluentTabBarControllerListener() {
    tabController.index = fluentTabBarController.value;
  }

  void dispose() {
    tabController.dispose();
    fluentTabBarController.dispose();
  }
}
