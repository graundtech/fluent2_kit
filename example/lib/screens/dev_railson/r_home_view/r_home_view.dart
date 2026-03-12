import 'package:example/screens/dev_railson/r_home_view/r_activity_indicator_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_home_controller.dart';
import 'package:example/screens/dev_railson/r_home_view/r_inputs_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_lawless_land_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_progress_bar_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_progress_indicator_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_toast_and_banner_page.dart';
import 'package:flutter/material.dart';

import 'package:fluent2ui/fluent2ui.dart';

class RHomeView extends StatefulWidget {
  const RHomeView({super.key});

  @override
  State<RHomeView> createState() => _RHomeViewState();
}

class _RHomeViewState extends State<RHomeView> with TickerProviderStateMixin {
  late final RHomeController controller;
  Widget? rootBottomSheet;

  @override
  void initState() {
    super.initState();
    controller = RHomeController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final rootBottomSheet = this.rootBottomSheet;
    return Stack(
      children: [
        Positioned.fill(
          child: FluentScaffold(
            // bottomSheet: Text("UMA MESSAGEM LEGAL EMBAIXO. TIPO PROMOCA, CLICK AQUI"),

            body: AnimatedBuilder(
              animation: controller.tabController,
              builder: (BuildContext context, Widget? child) {
                switch (controller.tabController.index) {
                  case 0:
                    return RToastAndBannerPage();
                  case 1:
                    return RProgressIndicatorPage();
                  case 2:
                    return RActivityIndicatorPage();
                  case 3:
                    return RProgressBarPage();
                  case 4:
                    return RLawlessLand(
                      openTheRootBottomSheet: () {
                        setState(() {
                          this.rootBottomSheet = _MyBottomSheet(
                            onClose: () {
                              setState(() {
                                this.rootBottomSheet = null;
                              });
                            },
                          );
                        });
                      },
                    );
                  case 5:
                    return RInputsPage();
                }
                return Placeholder();
              },
            ),
            // bottomSheet: SafeArea(
            //   child: FluentBanner(
            //     bannerColor: color,
            //     text: '${color}: Closing soon',
            //   ),
            // ),
            bottomNavigationBar: FluentTabBar.bottomLabel(
              controller: controller.fluentTabBarController,
              onChanged: (value) {},
              items: [
                FluentTabBarItemBottomLabel(
                  label: 'Toast & Banner',
                  icon: Icon(Icons.one_k),
                  showBadge: false,
                ),
                FluentTabBarItemBottomLabel(
                  label: "ProgressIndicator",
                  icon: Icon(Icons.two_k),
                ),
                FluentTabBarItemBottomLabel(
                  label: "HUD",
                  icon: Icon(Icons.three_k),
                  showBadge: true,
                  tooltip: "I have tooltip",
                ),
                FluentTabBarItemBottomLabel(
                  label: "ProgressBar",
                  icon: Icon(Icons.four_k),
                ),
                FluentTabBarItemBottomLabel(
                  label: "Terra sem lei",
                  icon: Icon(Icons.five_k),
                ),
                FluentTabBarItemBottomLabel(
                  label: "Inputs",
                  icon: Icon(Icons.six_k),
                ),
              ],
            ),
          ),
        ),
        if (rootBottomSheet != null) Positioned.fill(child: rootBottomSheet)
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _MyBottomSheet extends StatefulWidget {
  final VoidCallback onClose;

  const _MyBottomSheet({
    required this.onClose,
  });

  @override
  State<_MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<_MyBottomSheet> {
  final FluentSheetController controller = FluentSheetController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.draggableScrollableController.animateTo(1,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FluentSheet.bottom(
      controller: controller,
      headerTitle: Text("This is my root bottomSheet"),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "It opens independently, not because it is in root, it's because it also have an initialization code",
            ),
            FluentButton(
              title: "Close",
              onPressed: () {
                controller.draggableScrollableController
                    .animateTo(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut)
                    .whenComplete(() {
                  if (mounted) {
                    widget.onClose();
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
