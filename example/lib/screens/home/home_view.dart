import 'package:example/routing/routes.dart';
import 'package:example/theme_mode_provider.dart';
import 'package:example/utils/diacritics.dart';
import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent_icons.dart';
import 'package:fluent2ui/fluent2ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final diacritics = Diacritics();
  String queryString = "";

  final cards = <CardComponentPage>[
    CardComponentPage(
      title: "Fluent List",
      description: "Lists organize data in rows",
      route: Routes.fluentListView,
      previewIcon: FluentIcons.list_20_regular,
    ),
    CardComponentPage(
      title: "Fluent Button",
      description: "Lists organize data in rows",
      route: Routes.fluentButtonView,
      previewIcon: FluentIcons.button_20_regular,
    ),
    CardComponentPage(
      title: "Fluent FAB",
      description:
          "A floating action button (FAB) performs the primary, or most common, action on a screen.",
      route: Routes.fluentFabView,
      previewIcon: FluentIcons.add_circle_24_regular,
    ),
    CardComponentPage(
      title: "Fluent Avatar",
      description:
          "An avatar shows an image or text to represent a person or group as well as gives additional information like their status and activity.",
      route: Routes.fluentAvatarView,
      previewIcon: FluentIcons.person_circle_20_regular,
    ),
    CardComponentPage(
      description:
          "Cards are flexible containers that group related content and actions together. They reveal more information upon interaction.",
      title: "Fluent Card",
      route: Routes.fluentCardView,
      previewIcon: FluentIcons.card_ui_24_regular,
    ),
    CardComponentPage(
      description: "Show only for peristent notifications until completion",
      title: "Fluent Banner",
      route: Routes.fluentBannerView,
      previewIcon: FluentIcons.rectangle_landscape_12_filled,
    ),
    CardComponentPage(
      description:
          "Sheets help enable a simple task that people can complete before returning to the parent view",
      title: "Fluent Sheet",
      route: Routes.fluentSheetView,
      previewIcon: FluentIcons.document_24_regular,
    ),
    CardComponentPage(
      description:
          "Toast notifications can be dismissed automatically or after the user performs the action/cancel.",
      title: "Fluent Toast",
      route: Routes.fluentToastView,
      previewIcon: FluentIcons.square_shadow_12_regular,
    ),
    CardComponentPage(
      description:
          "Assistive texts, icons and suffixes are optional and hidden by default in the text fields components.",
      title: "Fluent Text Field",
      route: Routes.fluentTextFieldView,
      previewIcon: FluentIcons.text_field_16_filled,
    ),
    CardComponentPage(
      description:
          "Use activity indicators and progress bars to let people know your app isn’t stalled and to give them some idea of how long they’ll be waiting.",
      title: "Fluent Progress Bar",
      route: Routes.fluentProgressIndicatorsView,
      previewIcon: FluentIcons.line_horizontal_1_24_regular,
    ),
    CardComponentPage(
      title: "Fluent Controls",
      description: 'Fluent Controls Components',
      route: Routes.fluentControlsView,
      previewIcon: FluentIcons.checkbox_2_20_regular,
    ),
    CardComponentPage(
      title: "Popover",
      description: 'Popover Components',
      route: Routes.fluentPopoverView,
      previewIcon: FluentIcons.square_24_regular,
    ),
    CardComponentPage(
      title: "Presence Badges",
      description:
          "Presence badges indicate availability and are overlaid on avatars.",
      route: Routes.fluentPresenceBadgesView,
      previewIcon: FluentIcons.presence_available_12_filled,
    ),
    CardComponentPage(
      title: "Fluent Nav Bar",
      description:
          "Nav bars expose four title variants: left/center, with or without subtitle.",
      route: Routes.fluentNavBarView,
      previewIcon: FluentIcons.line_horizontal_3_20_regular,
    ),
    CardComponentPage(
      title: "Fluent Tab Bar",
      description:
          "Tab bars support bottom label, no label and right label item variants.",
      route: Routes.fluentTabBarView,
      previewIcon: FluentIcons.tabs_20_regular,
    ),
    CardComponentPage(
      title: "Inner Aspect Ratio",
      description:
          "Enforces an aspect ratio relative to the child's longest side.",
      route: Routes.innerAspectRatioView,
      previewIcon: FluentIcons.crop_20_regular,
    ),
  ];

  final designTokens = <DesignTokenItem>[
    DesignTokenItem(
      title: "Shadow",
      route: Routes.shadowView,
      leadingIcon: FluentIcons.square_shadow_12_regular,
    ),
    DesignTokenItem(
      title: "Size",
      route: Routes.sizeView,
      leadingIcon: FluentIcons.slide_size_20_regular,
    ),
    DesignTokenItem(
      title: "Typography",
      route: Routes.typographyView,
      leadingIcon: FluentIcons.text_12_regular,
    ),
    DesignTokenItem(
      title: "Shapes",
      route: Routes.shapesView,
      leadingIcon: FluentIcons.shapes_16_regular,
    )
  ];

  List<Widget> returnComponents() {
    if (queryString.trim().length == 0) {
      return cards
          .map((card) => Container(
                height: 192,
                margin: EdgeInsets.only(bottom: FluentSize.size120.value),
                child: FluentCard(
                  leading: Icon(FluentIcons.puzzle_cube_piece_20_filled),
                  text: card.title,
                  subText: card.description,
                  coverImage: FluentIcon.outlinedPrimaryIcon(
                    card.previewIcon,
                    cornerRadius: FluentCornerRadius.none,
                    iconSize: FluentSize.size560.value,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(card.route);
                  },
                ),
              ))
          .toList();
    } else {
      final lowerQueryString =
          queryString.toLowerCase().withoutDiacritics(diacritics);
      List<CardComponentPage> filteredComponentsList = cards.where((element) {
        final title = element.title.toLowerCase().withoutDiacritics(diacritics);

        return title.contains(lowerQueryString);
      }).toList();

      if (filteredComponentsList.length == 0) {
        print("LISTA VAZIA");
        return [
          Center(
            child: FluentText("Nenhum componente corresponde a pesquisa"),
          )
        ];
      } else {
        print("LISTA COM ITEMS");

        return filteredComponentsList
            .map((card) => Container(
                  height: 192,
                  margin: EdgeInsets.only(bottom: FluentSize.size120.value),
                  child: FluentCard(
                    leading: Icon(FluentIcons.puzzle_cube_piece_20_filled),
                    text: card.title,
                    subText: card.description,
                    coverImage: FluentIcon.outlinedPrimaryIcon(
                      card.previewIcon,
                      cornerRadius: FluentCornerRadius.none,
                      iconSize: FluentSize.size560.value,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(card.route);
                    },
                  ),
                ))
            .toList();
      }
    }
  }

  void clearQueryString() {
    setState(() {
      queryString = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProviderState = ThemeModeProvider.of(context);
    final colorMode = createColorMode(Theme.of(context).brightness);

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent 2 UI",
          subtitle: "Developed by Graund Tech",
        ),
        themeColorVariation: FluentThemeColorVariation.brand,
        actions: [
          FluentSwitchToggle(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                if (themeModeProviderState.themeMode == ThemeMode.dark) {
                  themeModeProviderState.themeMode = ThemeMode.light;
                } else {
                  themeModeProviderState.themeMode = ThemeMode.dark;
                }
              })
        ],
        child: FluentSearchBar.leftAligned(
          themeColorVariation: FluentThemeColorVariation.brand,
          hintText: "Search",
          onEmpty: clearQueryString,
          trailingIcon: FluentTooltip(
            message: "Tooltip",
            child: Icon(FluentIcons.question_20_regular),
          ),
          onSearch: (value) async {
            await Future.delayed(
              Duration(seconds: 1),
            );
            setState(() {
              queryString = value;
            });
          },
          onClearOperation: clearQueryString,
          onCancelOperation: clearQueryString,
        ),
      ),
      drawer: FluentLeftNav(
        headerAvatar: FluentAvatar(
          size: FluentAvatarSize.size36,
          strokeStyle: colorMode(
            null,
            FluentStrokeStyle(
              thickness: FluentStrokeThickness.strokeWidth20,
              color: FluentDarkColors.neutralBackground1Rest,
            ),
          ),
          child: FluentInitials(
            name: "Krystal McKinney",
          ),
        ),
        header: FluentListItemMultiLine(
          text: "Krystal McKinney",
          subtext: "l.mckinney@schoolofineart.com",
          leading: FluentAvatar(
            size: FluentAvatarSize.size40,
            child: FluentIcon.outlinedPrimaryIcon(
              FluentIcons.person_12_filled,
            ),
          ),
        ),
        body: Column(
          children: [
            ...designTokens.map(
              (value) => FluentListItemOneLine(
                leading: Icon(value.leadingIcon),
                text: value.title,
                onTap: () {
                  Navigator.of(context).pushNamed(value.route);
                },
              ),
            )
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: FluentContainer(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: FluentSize.size240.value),
              child: Column(
                children: [
                  ...returnComponents(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardComponentPage {
  final String description;
  final String title;
  final String route;
  final IconData previewIcon;

  CardComponentPage({
    required this.description,
    required this.title,
    required this.route,
    required this.previewIcon,
  });
}

class DesignTokenItem {
  final String title;
  final String route;
  final IconData leadingIcon;

  DesignTokenItem({
    required this.title,
    required this.route,
    required this.leadingIcon,
  });
}
