import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class RLawlessLand extends StatefulWidget {
  final VoidCallback openTheRootBottomSheet;

  const RLawlessLand({
    super.key,
    required this.openTheRootBottomSheet,
  });

  @override
  State<RLawlessLand> createState() => _RLawlessLandState();
}

class _RLawlessLandState extends State<RLawlessLand> {
  bool value = false;
  late Timer timer;
  bool isBottomSheetSpawned = false;
  Widget? globalBottomSheet = null;

  void onChanged(bool value) {
    setState(() {
      this.value = value;
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      final banner = FluentBanner(
        text: 'Banner periodico',
        bannerColor: FluentBannerColor.accent,
      );
      final messenger = FluentScaffoldMessenger.of(context);
      messenger.addBanner(banner);
      await Future.delayed(Duration(seconds: 2));
      messenger.removeBanner(banner);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      // fluentBottomSheet: FluentSheet.bottom(
      //   headerHeight: 40,
      // ),
      bottomNavigationBar: Container(
        color: Colors.green,
        height: 20,
      ),
      appBar: FluentNavBar(
        themeColorVariation: FluentThemeColorVariation.neutral,
        title: NavLeftSubtitle(
          title: "Terra sem lei",
          subtitle: "Railson > Terra sem lei",
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("👉Switch Toggle👈"),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FluentSwitchToggle(
                      value: value,
                      onChanged: onChanged,
                    ),
                    FluentSwitchToggle(
                      value: false,
                      onChanged: null,
                    ),
                    FluentSwitchToggle(
                      value: true,
                      onChanged: null,
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: DraggableScrollableSheet(
                      minChildSize: 0.1,
                      initialChildSize: 0.8,
                      maxChildSize: 1,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          color: Colors.red.withAlpha((0.3 * 255).round()),
                          child: ListView.builder(
                              controller: scrollController,
                              itemCount: 25,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(title: Text("Item $index"));
                              }),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FluentCard(
                    text: "My Card",
                    onPressed: () {
                      print("asd");
                    },
                  ),
                ),
                FluentStrokeDivider(
                  style: FluentStrokeStyle(
                    color: Colors.red,
                    thickness: FluentStrokeThickness.strokeWidth20,
                    dashArray: [4, 8, 2, 8],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FluentContainer(
                    strokeStyle: FluentStrokeStyle(
                      thickness: FluentStrokeThickness.strokeWidth20,
                      color: Colors.red,
                      dashArray: [4, 8, 2, 8],
                    ),
                    cornerRadius: FluentCornerRadius.large,
                    padding: EdgeInsets.all(20),
                    child: FluentText("This is a bordered container"),
                  ),
                ),
                FluentTextField(),
                if (isBottomSheetSpawned)
                  SizedBox(
                    width: 300,
                    height: 150,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: FluentSheet.bottom(
                        headerTitle: Text("This is a BottomSheet"),
                        child: FluentButton(
                          title: "Open the root one",
                          onPressed: widget.openTheRootBottomSheet,
                        ),
                        onMinExtent: () {
                          setState(() {
                            isBottomSheetSpawned = false;
                          });
                        },
                      ),
                    ),
                  )
                else
                  FluentButton(
                    title: "Spawn a BottomSheet",
                    onPressed: () {
                      setState(() {
                        isBottomSheetSpawned = true;
                      });
                    },
                  ),
              ],
            ),
          ),
          Positioned.fill(
            child: FluentSheet.bottom(
              overlayBuilder: (_, size) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Opacity(
                    opacity: max(0, size * 1.4 - 0.4),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FluentButton(
                        isFullWidget: true,
                        size: FluentButtonSize.large,
                        onPressed: () {},
                        title: "Action",
                      ),
                    ),
                  ),
                );
              },
              headerHeight: 20,
              headerLeading: Text("Leading"),
              headerTitle: Text("Title"),
              headerTrailing: Text("Trailing"),
              child: Container(
                color: Colors.red,
                child: Column(
                  children: [
                    Text("This is a child"),
                    FluentButton(
                      title: "Content Button",
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              onMaxExtent: () {
                print("max extent");
              },
              onMinExtent: () {
                print("min extent");
              },
            ),
          )
        ],
      ),
      // bottomSheet: FluentSheet.bottom(
      //   headerHeight: 50,
      // ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
