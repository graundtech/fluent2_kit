import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentBannerView extends StatefulWidget {
  const FluentBannerView({super.key});

  @override
  State<FluentBannerView> createState() => _FluentBannerViewState();
}

class _FluentBannerViewState extends State<FluentBannerView> {
  bool isLoading = false;

  final banner1 = const FluentBanner(
    bannerColor: FluentBannerColor.accent,
    text: "It's me Mario",
  );

  final banner2 = const FluentBanner(
    bannerColor: FluentBannerColor.accent,
    text: "Sem conexão com a internet.",
  );

  final banner3 = const FluentBanner(
    bannerColor: FluentBannerColor.accent,
    text: "Conexão restaurada.",
  );

  void showBanner(BuildContext context) async {
    final fluentScaffoldMessenger = FluentScaffoldMessenger.of(context);

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    fluentScaffoldMessenger.addBanner(banner2);

    await Future.delayed(Duration(seconds: 2));

    fluentScaffoldMessenger.removeBanner(banner2);
    fluentScaffoldMessenger.addBanner(banner3);

    await Future.delayed(Duration(seconds: 2));

    fluentScaffoldMessenger.removeBanner(banner3);
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Banner",
          subtitle: "Components > Fluent Banner",
        ),
      ),
      body: Column(
        children: [
          FluentSectionDescription(
            description:
                "Show only for peristent notifications until completion.",
          ),
          FluentStrokeDivider(height: FluentSize.size480.value),
          FluentSectionHeader(
            title: "Example 1",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FluentButton(
                  title: "Abrir Banner",
                  onPressed: () async {
                    FluentScaffoldMessenger.of(context).addBanner(banner1);
                  },
                ),
                SizedBox(width: FluentSize.size80.value),
                FluentButton(
                  title: "Fechar Banner",
                  onPressed: () async {
                    FluentScaffoldMessenger.of(context).removeBanner(banner1);
                  },
                )
              ],
            ),
          ),
          FluentSectionHeader(
            title: "Example 2",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: isLoading
                ? CircularProgressIndicator()
                : FluentButton(
                    title: "Carregar",
                    onPressed: () => showBanner(context),
                  ),
          ),
          FluentSectionDescription(
            description: "Example of persistent until connection returns.",
          )
        ],
      ),
    );
  }
}
