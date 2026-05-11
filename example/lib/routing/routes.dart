import 'package:example/screens/components_example_view/fluent_avatar_view.dart';
import 'package:example/screens/components_example_view/fluent_banner_view.dart';
import 'package:example/screens/components_example_view/fluent_button_view.dart';
import 'package:example/screens/components_example_view/fluent_card_view.dart';
import 'package:example/screens/components_example_view/fluent_controls_view.dart';
import 'package:example/screens/components_example_view/fluent_list_view/clear_search_history_view.dart';
import 'package:example/screens/components_example_view/fluent_list_view/fluent_list_example_view.dart';
import 'package:example/screens/components_example_view/fluent_nav_bar_view.dart';
import 'package:example/screens/components_example_view/fluent_popover_view.dart';
import 'package:example/screens/components_example_view/fluent_presence_badges_view.dart';
import 'package:example/screens/components_example_view/fluent_progress_indicators_view.dart';
import 'package:example/screens/components_example_view/fluent_sheet_view.dart';
import 'package:example/screens/components_example_view/fluent_tab_bar_view.dart';
import 'package:example/screens/components_example_view/fluent_text_field_view.dart';
import 'package:example/screens/components_example_view/fluent_toast_view.dart';
import 'package:example/screens/components_example_view/inner_aspect_ratio_view.dart';
import 'package:example/screens/design_tokens_view/shadow_view.dart';
import 'package:example/screens/design_tokens_view/shapes_view.dart';
import 'package:example/screens/design_tokens_view/size_view.dart';
import 'package:example/screens/design_tokens_view/typography_view.dart';
import 'package:example/screens/home/test_home_view.dart';
import 'package:flutter/cupertino.dart';

/// Routes
abstract final class Routes {
  static const home = "/home";
  static const fluentListView = "/fluentListView";
  static const fluentAvatarView = "/fluentAvatarView";
  static const fluentBannerView = "/fluentBannerView";
  static const fluentSheetView = "/fluentSheetView";
  static const fluentButtonView = "/fluentButtonView";
  static const fluentCardView = "/fluentCardView";
  static const fluentToastView = "/fluentToastView";
  static const fluentTextFieldView = "/fluentTextField";
  static const fluentProgressIndicatorsView = "/fluentProgressIndicatorsView";
  static const fluentControlsView = "/fluentControlsView";
  static const fluentPopoverView = "/fluentPopoverView";
  static const fluentPresenceBadgesView = "/fluentPresenceBadgesView";
  static const fluentNavBarView = "/fluentNavBarView";
  static const fluentTabBarView = "/fluentTabBarView";
  static const innerAspectRatioView = "/innerAspectRatioView";
  static const clearSearchHistoryView = "/clearSearchHistoryView";

  static const shadowView = "/shadowView";
  static const shapesView = "/shapesView";
  static const sizeView = "/sizeView";
  static const typographyView = "/typographyView";

  static Map<String, WidgetBuilder> get routingTable => {
        Routes.home: (_) {
          return TestHomeView();
        },
        Routes.fluentListView: (_) {
          return FluentListView();
        },
        Routes.fluentAvatarView: (_) {
          return FluentAvatarView();
        },
        Routes.fluentBannerView: (_) {
          return FluentBannerView();
        },
        Routes.fluentSheetView: (_) {
          return FluentSheetView();
        },
        Routes.fluentButtonView: (_) {
          return FluentButtonView();
        },
        Routes.fluentCardView: (_) {
          return FluentCardView();
        },
        Routes.fluentToastView: (_) {
          return FluentToastView();
        },
        Routes.fluentTextFieldView: (_) {
          return FluentTextFieldView();
        },
        Routes.fluentProgressIndicatorsView: (_) {
          return FluentProgressIndicatorsView();
        },
        Routes.fluentControlsView: (_) {
          return FluentControlsView();
        },
        Routes.fluentPopoverView: (_) {
          return FluentPopoverView();
        },
        Routes.fluentPresenceBadgesView: (_) {
          return FluentPresenceBadgesView();
        },
        Routes.fluentNavBarView: (_) {
          return FluentNavBarView();
        },
        Routes.fluentTabBarView: (_) {
          return FluentTabBarView();
        },
        Routes.innerAspectRatioView: (_) {
          return InnerAspectRatioView();
        },
        Routes.clearSearchHistoryView: (_) {
          return ClearSearchHistoryView();
        },
        Routes.shadowView: (_) {
          return ShadowView();
        },
        Routes.shapesView: (_) {
          return ShapesView();
        },
        Routes.sizeView: (_) {
          return SizeView();
        },
        Routes.typographyView: (_) {
          return TypographyView();
        }
      };
}
