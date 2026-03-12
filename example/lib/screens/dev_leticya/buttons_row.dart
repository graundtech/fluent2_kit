import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: FluentSize.size80.value,
          vertical: FluentSize.size120.value),
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: FluentSize.size200.value,
            horizontal: FluentSize.size120.value,
          ),
          decoration: BoxDecoration(
            color: colorMode(
              FluentColors.neutralBackground2Rest,
              FluentDarkColors.neutralBackground2Rest,
            ),
            borderRadius: BorderRadius.circular(
              FluentCornerRadius.xLarge.value,
            ),
          ),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Text('Accent',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: FluentColors.neutralForeground3Rest)),
                  ),
                  FluentButton(
                    title: 'Text',
                    size: FluentButtonSize.large,
                    onPressed: null,
                    icon: Icon(Icons.heart_broken_rounded),
                  ),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                    title: 'Text',
                    size: FluentButtonSize.large,
                    onPressed: () {},
                    icon: Icon(Icons.heart_broken_rounded),
                  ),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                      title: 'Text',
                      size: FluentButtonSize.medium,
                      onPressed: () {},
                      icon: Icon(Icons.heart_broken_rounded)),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                      title: 'Text',
                      size: FluentButtonSize.small,
                      onPressed: () {},
                      icon: Icon(Icons.heart_broken_rounded)),
                ],
              ),
              SizedBox(width: FluentSize.size120.value),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Text('Outline Accent',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: FluentColors.neutralForeground3Rest)),
                  ),
                  FluentButton(
                    title: 'Text',
                    variant: FluentButtonVariant.outlineAccent,
                    size: FluentButtonSize.large,
                    onPressed: null,
                    icon: Icon(Icons.heart_broken_rounded),
                  ),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                    title: 'Text',
                    variant: FluentButtonVariant.outlineAccent,
                    size: FluentButtonSize.large,
                    onPressed: () {},
                    icon: Icon(Icons.heart_broken_rounded),
                  ),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                      title: 'Text',
                      variant: FluentButtonVariant.outlineAccent,
                      size: FluentButtonSize.medium,
                      onPressed: () {},
                      icon: Icon(Icons.heart_broken_rounded)),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                      title: 'Text',
                      variant: FluentButtonVariant.outlineAccent,
                      size: FluentButtonSize.small,
                      onPressed: () {},
                      icon: Icon(Icons.heart_broken_rounded)),
                ],
              ),
              SizedBox(width: FluentSize.size120.value),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    child: Text('Outline',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: FluentColors.neutralForeground3Rest)),
                    padding: EdgeInsets.symmetric(vertical: 7),
                  ),
                  FluentButton(
                    title: 'Text',
                    variant: FluentButtonVariant.outline,
                    size: FluentButtonSize.large,
                    onPressed: null,
                    icon: Icon(Icons.heart_broken_rounded),
                  ),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                    title: 'Text',
                    variant: FluentButtonVariant.outline,
                    size: FluentButtonSize.large,
                    onPressed: () {},
                    icon: Icon(Icons.heart_broken_rounded),
                  ),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                      title: 'Text',
                      variant: FluentButtonVariant.outline,
                      size: FluentButtonSize.medium,
                      onPressed: () {},
                      icon: Icon(Icons.heart_broken_rounded)),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                      title: 'Text',
                      variant: FluentButtonVariant.outline,
                      size: FluentButtonSize.small,
                      onPressed: () {},
                      icon: Icon(Icons.heart_broken_rounded)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: FluentSize.size240.value,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: FluentSize.size200.value,
            horizontal: FluentSize.size120.value,
          ),
          decoration: BoxDecoration(
            color: colorMode(
              FluentColors.neutralBackground2Rest,
              FluentDarkColors.neutralBackground2Rest,
            ),
            borderRadius: BorderRadius.circular(
              FluentCornerRadius.xLarge.value,
            ),
          ),
          child: Column(
            children: [
              Text(
                'Subtle',
                textAlign: TextAlign.center,
                style: TextStyle(color: FluentColors.neutralForeground3Rest),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FluentButton(
                    title: 'Text',
                    variant: FluentButtonVariant.subtle,
                    size: FluentButtonSize.large,
                    onPressed: null,
                    icon: Icon(Icons.heart_broken_rounded),
                  ),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                    title: 'Text',
                    variant: FluentButtonVariant.subtle,
                    size: FluentButtonSize.large,
                    onPressed: () {},
                    icon: Icon(Icons.heart_broken_rounded),
                  ),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                      title: 'Text',
                      variant: FluentButtonVariant.subtle,
                      size: FluentButtonSize.medium,
                      onPressed: () {},
                      icon: Icon(Icons.heart_broken_rounded)),
                  SizedBox(height: FluentSize.size80.value),
                  FluentButton(
                      title: 'Text',
                      variant: FluentButtonVariant.subtle,
                      size: FluentButtonSize.small,
                      onPressed: () {},
                      icon: Icon(Icons.heart_broken_rounded)),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
