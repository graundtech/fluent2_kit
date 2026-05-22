import 'package:flutter/cupertino.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentColors {
  static const Color controlsSegmentForeground2Rest = Color(0xFF616161);
  static const Color controlsSegmentForeground2Pressed = Color(0xFF242424);
  static const Color controlsSegmentForeground2Selected = Color(0xFF242424);
  static const Color controlsSegmentForeground2Disabled = Color(0xFFBDBDBD);

  static const Color controlsSegmentForeground3Rest = Color(0xFFFFFFFF);

  static const Color controlsSegmentBackground2Rest = Color(0xFFF0F0F0);
  static const Color controlsSegmentBackground2Pressed = Color(0xFFD1D1D1);
  static const Color controlsSegmentBackground2Selected = Color(0xFFDBDBDB);
  static const Color controlsSegmentBackground2Disabled = Color(0xFFF0F0F0);

  static const Color controlsNavBarForeground1Rest = Color(0xFFFFFFFF);
  static const Color controlsNavBarForeground2Rest = Color(0xFFFFFFFF);

  static const Color controlsHudForeground1Rest = Color(0xFF3D3D3D);
  static const Color controlsHudForeground2Rest = Color(0xFF8F8F8F);

  static const Color neutralForeground1Rest = Color(0xFF242424);
  static const Color neutralForeground2Rest = Color(0xFF616161);
  static const Color neutralForeground3Rest = Color(0xFF808080);
  static const Color neutralForegroundStaticLightRest = Color(0xFFFFFFFF);

  static const Color neutralForegroundDisabled1Rest = Color(0xFFBDBDBD);
  static const Color neutralForegroundDisabled2Rest = Color(0xFFFFFFFF);

  static const Color neutralBackground1Rest = Color(0xFFFFFFFF);
  static const Color neutralBackground1Pressed = Color(0xFFE0E0E0);
  static const Color neutralBackground1Selected = Color(0xFFEBEBEB);

  static const Color neutralBackground2Rest = Color(0xFFFFFFFF);
  static const Color neutralBackground2Pressed = Color(0xFFE0E0E0);
  static const Color neutralBackground2Selected = Color(0xFFEBEBEB);

  static const Color neutralBackground3Rest = Color(0xFFFFFFFF);
  static const Color neutralBackground3Pressed = Color(0xFFE0E0E0);
  static const Color neutralBackground3Selected = Color(0xFFEBEBEB);

  static const Color neutralBackground4Rest = Color(0xFFFAFAFA);
  static const Color neutralBackground4Pressed = Color(0xFFDBDBDB);
  static const Color neutralBackground4Selected = Color(0xFFE6E6E6);

  static const Color neutralBackground5Rest = Color(0xFFF0F0F0);
  static const Color neutralBackground5Pressed = Color(0xFFD1D1D1);
  static const Color neutralBackground5Selected = Color(0xFFDBDBDB);

  static const Color neutralBackground6Rest = Color(0xFFD1D1D1);

  static const Color neutralBackgroundCanvasRest = Color(0xFFF5F5F5);
  static const Color neutralBackgroundInvertedRest = Color(0xFF757575);
  static const Color neutralBackgroundStaticDarkRest = Color(0xFF242424);

  static const Color neutralBackgroundStaticLightRest = Color(0xFFFFFFFF);
  static const Color neutralBackgroundStaticLightDisabledRest =
      Color(0xFFFFFFFF);

  static const Color neutralBackgroundDisabledRest = Color(0xFFE0E0E0);
  static const Color neutralBackgroundStencil1Rest = Color(0xFFE6E6E6);
  static const Color neutralBackgroundStencil2Rest = Color(0xFFFAFAFA);

  static const Color neutralStroke1Rest = Color(0xFFD1D1D1);
  static const Color neutralStroke1Pressed = Color(0xFFB3B3B3);

  static const Color neutralStroke2Rest = Color(0xFFE0E0E0);

  static const Color neutralStrokeAccessibleRest = Color(0xFF616161);

  static const Color neutralStrokeDisabledRest = Color(0xFFE0E0E0);

  static const Color neutralStrokeFocus1Rest = Color(0xFFFFFFFF);

  static const Color neutralStrokeFocus2Rest = Color(0xFF000000);

  static const Color statusDangerBackground1Rest = Color(0xFFFDF3F4);
  static const Color statusDangerBackground2Rest = Color(0xFFC50F1F);
  static const Color statusDangerForeground1Rest = Color(0xFF960B18);
  static const Color statusDangerForeground2Rest = Color(0xFFC50F1F);
  static const Color statusDangerStroke1Rest = Color(0xFFC50F1F);
  static const Color statusDangerStroke2Rest = Color(0xFFC50F1F);

  static const Color statusSuccessBackground1Rest = Color(0xFFF1FAF1);
  static const Color statusSuccessBackground2Rest = Color(0xFF107C10);
  static const Color statusSuccessForeground1Rest = Color(0xFF0E700E);
  static const Color statusSuccessForeground2Rest = Color(0xFF107C10);
  static const Color statusSuccessStroke1Rest = Color(0xFF107C10);

  static const Color statusSevereBackground1Rest = Color(0xFFFDF6F3);
  static const Color statusSevereBackground2Rest = Color(0xFFDA3B01);
  static const Color statusSevereForeground1Rest = Color(0xFFC43501);
  static const Color statusSevereForeground2Rest = Color(0xFFA62D01);
  static const Color statusSevereStroke1Rest = Color(0xFFDE501C);

  static const Color statusWarningBackground1Rest = Color(0xFFFFF9F5);
  static const Color statusWarningBackground2Rest = Color(0xFFF7630C);
  static const Color statusWarningForeground1Rest = Color(0xFFBC4B09);
  static const Color statusWarningForeground2Rest = Color(0xFFBC4B09);
  static const Color statusWarningStroke1Rest = Color(0xFFDA3B01);

  final Color brandBackground1Rest;
  final Color brandBackground1Pressed;
  final Color brandBackground1Selected;
  final Color brandBackground2Rest;
  final Color brandBackground2Pressed;
  final Color brandBackground2Selected;
  final Color brandBackground3Rest;

  final Color brandBackgroundTintRest;
  final Color brandBackgroundDisabledRest;

  final Color brandForeground1Rest;
  final Color brandForeground1Pressed;
  final Color brandForeground1Selected;

  final Color brandForegroundTintRest;
  final Color brandForegroundDisabled1Rest;
  final Color brandForegroundDisabled2Rest;

  final Color brandStroke1Rest;
  final Color brandStroke1Pressed;
  final Color brandStroke1Selected;

  FluentColors({
    required this.brandBackground1Rest,
    required this.brandBackground1Pressed,
    required this.brandBackground1Selected,
    required this.brandBackground2Rest,
    required this.brandBackground2Pressed,
    required this.brandBackground2Selected,
    required this.brandBackground3Rest,
    required this.brandBackgroundTintRest,
    required this.brandBackgroundDisabledRest,
    required this.brandForeground1Rest,
    required this.brandForeground1Pressed,
    required this.brandForeground1Selected,
    required this.brandForegroundTintRest,
    required this.brandForegroundDisabled1Rest,
    required this.brandForegroundDisabled2Rest,
    required this.brandStroke1Rest,
    required this.brandStroke1Pressed,
    required this.brandStroke1Selected,
  });

  static FluentColors? of(BuildContext context) {
    return FluentThemeDataModel.of(context).fluentBrandColors;
  }
}

class FluentDarkColors {
  static const Color controlsSegmentForeground2Rest = Color(0xFFD6D6D6);
  static const Color controlsSegmentForeground2Pressed = Color(0xFFFFFFFF);
  static const Color controlsSegmentForeground2Selected = Color(0xFFFFFFFF);
  static const Color controlsSegmentForeground2Disabled = Color(0xFF5C5C5C);

  static const Color controlsSegmentForeground3Rest = Color(0xFFADADAD);

  static const Color controlsSegmentBackground2Rest = Color(0xFF292929);
  static const Color controlsSegmentBackground2Pressed = Color(0xFF575757);
  static const Color controlsSegmentBackground2Selected = Color(0xFF4D4D4D);
  static const Color controlsSegmentBackground2Disabled = Color(0xFF292929);

  static const Color controlsNavBarForeground1Rest = Color(0xFFFFFFFF);
  static const Color controlsNavBarForeground2Rest = Color(0xFFD6D6D6);

  static const Color controlsHudForeground1Rest = Color(0xFF575757);
  static const Color controlsHudForeground2Rest = Color(0xFFB8B8B8);

  static const Color neutralForeground1Rest = Color(0xFFFFFFFF);
  static const Color neutralForeground2Rest = Color(0xFFD6D6D6);
  static const Color neutralForeground3Rest = Color(0xFFADADAD);
  static const Color neutralForegroundStaticLightRest = Color(0xFFFFFFFF);

  static const Color neutralForegroundDisabled1Rest = Color(0xFF5C5C5C);
  static const Color neutralForegroundDisabled2Rest = Color(0xFF2E2E2E);

  static const Color neutralBackground1Rest = Color(0xFF000000);
  static const Color neutralBackground1Pressed = Color(0xFF2E2E2E);
  static const Color neutralBackground1Selected = Color(0xFF242424);

  static const Color neutralBackground2Rest = Color(0xFF1F1F1F);
  static const Color neutralBackground2Pressed = Color(0xFF4D4D4D);
  static const Color neutralBackground2Selected = Color(0xFF424242);

  static const Color neutralBackground3Rest = Color(0xFF292929);
  static const Color neutralBackground3Pressed = Color(0xFF575757);
  static const Color neutralBackground3Selected = Color(0xFF4D4D4D);

  static const Color neutralBackground4Rest = Color(0xFF333333);
  static const Color neutralBackground4Pressed = Color(0xFF616161);
  static const Color neutralBackground4Selected = Color(0xFF575757);

  static const Color neutralBackground5Rest = Color(0xFF3D3D3D);
  static const Color neutralBackground5Pressed = Color(0xFF6B6B6B);
  static const Color neutralBackground5Selected = Color(0xFF616161);

  static const Color neutralBackground6Rest = Color(0xFF5C5C5C);

  static const Color neutralBackgroundCanvasRest = Color(0xFF141414);
  static const Color neutralBackgroundInvertedRest = Color(0xFFB8B8B8);
  static const Color neutralBackgroundStaticDarkRest = Color(0xFF3D3D3D);

  static const Color neutralBackgroundStaticLightRest = Color(0xFFFFFFFF);
  static const Color neutralBackgroundStaticLightDisabledRest =
      Color(0xFFADADAD);

  static const Color neutralBackgroundDisabledRest = Color(0xFF525252);
  static const Color neutralBackgroundStencil1Rest = Color(0xFF575757);
  static const Color neutralBackgroundStencil2Rest = Color(0xFF333333);

  static const Color neutralStroke1Rest = Color(0xFF4D4D4D);
  static const Color neutralStroke1Pressed = Color(0xFF7A7A7A);

  static const Color neutralStroke2Rest = Color(0xFF3D3D3D);

  static const Color neutralStrokeAccessibleRest = Color(0xFF9E9E9E);

  static const Color neutralStrokeDisabledRest = Color(0xFF424242);

  static const Color neutralStrokeFocus1Rest = Color(0xFF000000);

  static const Color neutralStrokeFocus2Rest = Color(0xFFFFFFFF);

  static const Color statusDangerBackground1Rest = Color(0xFF3B0509);
  static const Color statusDangerBackground2Rest = Color(0xFFB10E1C);
  static const Color statusDangerForeground1Rest = Color(0xFFDC626D);
  static const Color statusDangerForeground2Rest = Color(0xFFDC626D);
  static const Color statusDangerStroke1Rest = Color(0xFFDC626D);
  static const Color statusDangerStroke2Rest = Color(0xFFD33F4C);

  static const Color statusSuccessBackground1Rest = Color(0xFF052505);
  static const Color statusSuccessBackground2Rest = Color(0xFF0E700E);
  static const Color statusSuccessForeground1Rest = Color(0xFF54B054);
  static const Color statusSuccessForeground2Rest = Color(0xFF54B054);
  static const Color statusSuccessStroke1Rest = Color(0xFF54B054);

  static const Color statusSevereBackground1Rest = Color(0xFF411200);
  static const Color statusSevereBackground2Rest = Color(0xFFC43501);
  static const Color statusSevereForeground1Rest = Color(0xFFE9835E);
  static const Color statusSevereForeground2Rest = Color(0xFFE9835E);
  static const Color statusSevereStroke1Rest = Color(0xFFE36537);

  static const Color statusWarningBackground1Rest = Color(0xFF4A1E04);
  static const Color statusWarningBackground2Rest = Color(0xFFDE590B);
  static const Color statusWarningForeground1Rest = Color(0xFFFAA06B);
  static const Color statusWarningForeground2Rest = Color(0xFFFDCFB4);
  static const Color statusWarningStroke1Rest = Color(0xFFFAA06B);
}
