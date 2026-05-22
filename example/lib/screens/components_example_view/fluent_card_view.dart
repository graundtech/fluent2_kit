import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentCardView extends StatelessWidget {
  const FluentCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Card",
          subtitle: "Components > Fluent Card",
        ),
      ),
      body: SafeArea(
        child: FluentContainer(
          width: double.maxFinite,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FluentCard(
                  text: "Card 1 example",
                  subText: "This is a description text",
                  coverImage: Image.asset(
                    "assets/images/cards/card1.jpeg",
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: FluentSize.size160.value,
                ),
                FluentCard(
                  text: "Card 2 example",
                  subText: "This is a description text",
                  coverImage: Image.asset(
                    "assets/images/cards/card2.jpeg",
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: FluentSize.size160.value,
                ),
                FluentCard(
                  text: "Card 3 example",
                  subText: "This is a description text",
                  leading: Image.asset(
                    "assets/images/cards/card3.jpeg",
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                  coverImage: Image.asset(
                    "assets/images/cards/card3.jpeg",
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
