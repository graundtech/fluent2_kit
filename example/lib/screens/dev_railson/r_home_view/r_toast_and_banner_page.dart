import 'dart:math';

import 'package:example/screens/dev_railson/r_delivery_view/r__delivery_view.dart';
import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class RToastAndBannerPage extends StatefulWidget {
  const RToastAndBannerPage({super.key});

  @override
  State<RToastAndBannerPage> createState() => _RToastAndBannerPageState();
}

class _RToastAndBannerPageState extends State<RToastAndBannerPage> {
  void showToast() {
    FluentToast(
      toastColor: FluentToastColor.danger,
      title: FluentText("Text"),
      text: FluentText("Subtext"),
      icon: Icon(Icons.card_giftcard),
      action: Builder(
        builder: (context) {
          return TextButton(
            onPressed: () {
              FluentToast.showToast(
                context: context,
                text: FluentText("Novo Toast"),
                action: FluentToastDismissButton(),
                duration: Duration(seconds: 5),
              );
              FluentToastOverlayEntry.of(context).remove();
            },
            child: Text("Open"),
          );
        },
      ),
    ).show(
      context: context,
      duration: null,
      onDismissed: () {},
    );
  }

  void showBanner(BuildContext context) {
    final index = Random().nextInt(3);
    final color1 = FluentBannerColor.values[index];
    final color2 = FluentBannerColor.values[(index + 1) % 2];
    final banner1 = FluentBanner(
      bannerColor: color1,
      text: '${color1}: Closing soon',
    );

    final fluentScaffoldMessenger = FluentScaffoldMessenger.of(context);
    fluentScaffoldMessenger.addBanner(
      banner1,
    );

    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      final banner2 = FluentBanner(
        bannerColor: color2,
        text: "Outro banner",
      );
      fluentScaffoldMessenger.addBanner(
        banner2,
      );

      Future.delayed(Duration(seconds: 1)).whenComplete(() {
        fluentScaffoldMessenger.removeBanner(banner2);
      });
    });
    Future.delayed(Duration(seconds: 5)).whenComplete(() {
      fluentScaffoldMessenger.removeBanner(banner1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        themeColorVariation: FluentThemeColorVariation.brand,
        title: NavLeftSubtitle(
          title: "Toast & Banner",
          subtitle: "Railson > Toast & Banner",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showToast,
        tooltip: 'Showa Toast',
        child: const Icon(Icons.open_in_browser),
      ), //
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("👇👇👇👇"),
            Text("Banner e Toast"),
            Text("👆👆👆👆"),
            FluentStrokeDivider(height: 10),
            FluentButton(
              variant: FluentButtonVariant.outlineAccent,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return RDelivery();
                  },
                ));
              },
              title: "Ir para Delivery",
            ),
            Text("Page 1"),
            SizedBox(height: 100),
            FluentChip.person(
              chipColor: FluentChipColor.brand,
              avatar: Image.network(
                "https://www.acasadocogumelo.com/wp-content/uploads/2020/06/Crash-Bandicoot.jpg",
                fit: BoxFit.cover,
              ),
              text: "Crash",
              chipColorsStyle: FluentChipColorStyle.tint,
            ),
            SizedBox(height: 10),
            FluentChip.person(
              chipColor: FluentChipColor.brand,
              avatar: Image.network(
                "https://www.acasadocogumelo.com/wp-content/uploads/2020/06/Crash-Bandicoot.jpg",
                fit: BoxFit.cover,
              ),
              text: "Crash",
              chipColorsStyle: FluentChipColorStyle.disabled,
            ),
            SizedBox(height: 10),
            FluentChip.icon(
              chipColor: FluentChipColor.neutral,
              icon: Icon(Icons.ac_unit),
              text: "My Icon",
              chipColorsStyle: FluentChipColorStyle.tint,
            ),
            SizedBox(height: 10),
            FluentChip.icon(
              chipColor: FluentChipColor.neutral,
              icon: Icon(Icons.ac_unit),
              text: "My Icon",
              chipColorsStyle: FluentChipColorStyle.disabled,
            ),
            SizedBox(height: 10),
            FluentChip.none(
              chipColor: FluentChipColor.success,
              text: "Only text",
              chipColorsStyle: FluentChipColorStyle.filled,
            ),
            SizedBox(height: 10),
            FluentChip.none(
              chipColor: FluentChipColor.success,
              text: "Only text",
              chipColorsStyle: FluentChipColorStyle.disabled,
            ),
            SizedBox(height: 10),
            Text("👇 Scroll down"),
            SizedBox(
              height: 800,
            ),
            Builder(
              builder: (context) {
                return FluentButton(
                  variant: FluentButtonVariant.outline,
                  onPressed: () => showBanner(context),
                  title: "Abrir banner",
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
