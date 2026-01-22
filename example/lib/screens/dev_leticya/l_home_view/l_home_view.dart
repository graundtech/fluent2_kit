import 'package:example/screens/dev_leticya/buttons_row.dart';
import 'package:example/screens/dev_leticya/example_icons.dart';
import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class LHomeView extends StatefulWidget {
  LHomeView({super.key});

  @override
  State<LHomeView> createState() => _LHomeViewState();
}

class _LHomeViewState extends State<LHomeView> {
  String querySearch = "O input está vazio por enquanto...";
  bool isRadioBlock = false;
  Pet? _pet = Pet.dog;
  bool isCheckbox1 = false;
  bool isCheckbox2 = false;
  bool isCheckbox3 = true;

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return Scaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: 'Home Page',
          subtitle: 'Demonstração de alguns componentes',
        ),
        foregroundColor: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.4, 1],
          colors: [
            FluentColors.of(context)?.brandBackground2Pressed ??
                Colors.transparent,
            FluentColors.of(context)?.brandBackground2Rest ??
                Colors.transparent,
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: FluentSize.size160.value,
                  vertical: FluentSize.size240.value),
              child: FluentSearchBar.leftAligned(
                hintText: "Qual vaga você procura hoje?",
                trailingIcon: Icon(
                  Icons.mic,
                  size: FluentSize.size200.value,
                  color: FluentColors.neutralForeground2Rest,
                ),
                onSearch: (String value) async {
                  await Future.delayed(Duration(seconds: 4), () {
                    querySearch = value;
                  });
                  setState(() {});
                },
                onCancelOperation: () {
                  debugPrint('OPERATION IS BEING CANCELED');
                },
              ),
            ),
            FluentContainer(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 10,
              ),
              width: (MediaQuery.of(context).size.width / 2),
              cornerRadius: FluentCornerRadius.xLarge,
              alignment: Alignment.center,
              color: Colors.indigo,
              child: FluentText(
                querySearch,
                textAlign: TextAlign.center,
                style: FluentThemeDataModel.of(context)
                    .fluentTextTheme
                    ?.body2
                    ?.fluentCopyWith(
                      fluentColor: Colors.white,
                    ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
              child: FluentTextField(
                hintText: 'Email address',
                assistiveText: 'Assistive text',
                label: 'Label',
                suffixIcon: Icon(Icons.layers_outlined),
              ),
            ),
            Container(
              color: Colors.yellow,
              height: 25,
              width: double.maxFinite,
            ),
            ButtonsRow(),
            Container(
              padding: EdgeInsets.only(
                bottom: FluentSize.size120.value,
                left: FluentSize.size120.value,
                right: FluentSize.size120.value,
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
              child: FluentList.oneLine(
                sectionHeaderTitle: 'Radio Button',
                // sectionHeaderTitleVariant: SectionHeaderTitleVariant.subtle,
                sectionDescriptionText:
                    'hello i am the list description, and i can give some information for lead you.',
                sectionDescriptionLeading: Icon(Icons.info_outline),
                separator: FluentStrokeDivider(
                  startIndent: FluentStrokeBorderIndent.strokeIndent16,
                  style: FluentThemeDataModel.of(context)
                      .fluentStrokeTheme
                      ?.stroke2,
                ),
                listItems: [
                  FluentListItemOneLine(
                    onTap: isRadioBlock
                        ? () {
                            debugPrint('Is radio block');
                          }
                        : () {
                            setState(() {
                              debugPrint('is not block');
                              _pet = Pet.dog;
                            });
                          },
                    text: 'Selecionar Cachorro',
                    leading: FluentRadioButton<Pet>(
                      semanticLabel: 'Selecionar Item Cachorro',
                      value: Pet.dog,
                      groupValue: _pet,
                      onChanged: isRadioBlock
                          ? null
                          : (value) {
                              setState(() {
                                _pet = value;
                              });
                            },
                    ),
                  ),
                  FluentListItemOneLine(
                    onTap: isRadioBlock
                        ? () {
                            debugPrint('Is radio block');
                          }
                        : () {
                            setState(() {
                              debugPrint('is not block');
                              _pet = Pet.cat;
                            });
                          },
                    text: 'Selecionar Gato',
                    leading: FluentRadioButton<Pet>(
                      semanticLabel: 'Selecionar Item Gato',
                      value: Pet.cat,
                      groupValue: _pet,
                      onChanged: isRadioBlock
                          ? null
                          : (value) {
                              setState(() {
                                _pet = value;
                              });
                            },
                    ),
                  ),
                  FluentListItemOneLine(
                    onTap: isRadioBlock
                        ? () {
                            debugPrint('Is radio block');
                          }
                        : () {
                            setState(() {
                              debugPrint('is not block');
                              _pet = Pet.bird;
                            });
                          },
                    text: 'Selecionar Pássaro',
                    leading: FluentRadioButton<Pet>(
                      semanticLabel: 'Selecionar Item Pássaro',
                      value: Pet.bird,
                      groupValue: _pet,
                      onChanged: isRadioBlock
                          ? null
                          : (value) {
                              setState(() {
                                _pet = value;
                              });
                            },
                    ),
                  ),
                  FluentListItemOneLine(
                    onTap: null,
                    text: 'Item Desabilitado',
                    leading: FluentRadioButton(
                      semanticLabel: 'Item Desabilitado',
                      value: Pet.noAnimals,
                      groupValue: _pet,
                      onChanged: null,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 120,
                    child: Text('Block radio'),
                  ),
                ),
                FluentCheckbox(
                  value: isRadioBlock,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _pet = isRadioBlock ? Pet.dog : Pet.noAnimals;
                        isRadioBlock = value;
                      });
                    }
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 5,
                right: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FluentCheckBoxWithTitle(
                    title: 'Checkbox 1',
                    value: isCheckbox1,
                    onChange: (value) {
                      if (value != null) {
                        setState(() {
                          isCheckbox1 = value;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    width: FluentSize.size80.value,
                  ),
                  FluentCheckBoxWithTitle(
                    title: 'Checkbox 2',
                    value: isCheckbox2,
                    onChange: (value) {
                      if (value != null) {
                        setState(() {
                          isCheckbox2 = value;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    width: FluentSize.size80.value,
                  ),
                  FluentCheckBoxWithTitle(
                    title: 'Disabled Checkbox',
                    value: isCheckbox3,
                    onChange: null,
                  )
                ],
              ),
            ),
            FluentContainer(
              color: FluentColors.of(context)?.brandBackgroundDisabledRest,
              padding: EdgeInsets.all(7),
              child: Column(
                children: [
                  FluentText(
                    'Valores Selecionados:',
                    style: FluentThemeDataModel.of(context)
                        .fluentTextTheme
                        ?.body2Strong,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isCheckbox1)
                        FluentContainer(
                          color:
                              FluentColors.of(context)?.brandForeground1Pressed,
                          cornerRadius: FluentCornerRadius.xLarge,
                          padding: EdgeInsets.all(7),
                          margin: EdgeInsets.only(right: 17),
                          child: FluentText(
                            'Checkbox1',
                            style: FluentThemeDataModel.of(context)
                                .fluentTextTheme
                                ?.caption1
                                ?.fluentCopyWith(fluentColor: Colors.white),
                          ),
                        ),
                      if (isCheckbox2)
                        FluentContainer(
                          color:
                              FluentColors.of(context)?.brandForeground1Pressed,
                          cornerRadius: FluentCornerRadius.xLarge,
                          padding: EdgeInsets.all(7),
                          margin: EdgeInsets.only(right: 17),
                          child: FluentText(
                            'Checkbox2',
                            style: FluentThemeDataModel.of(context)
                                .fluentTextTheme
                                ?.caption1
                                ?.fluentCopyWith(fluentColor: Colors.white),
                          ),
                        ),
                      if (isCheckbox3)
                        FluentContainer(
                          color:
                              FluentColors.of(context)?.brandForeground1Pressed,
                          cornerRadius: FluentCornerRadius.xLarge,
                          padding: EdgeInsets.all(7),
                          child: FluentText(
                            'Checkbox3',
                            style: FluentThemeDataModel.of(context)
                                .fluentTextTheme
                                ?.caption1
                                ?.fluentCopyWith(fluentColor: Colors.white),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
            ExampleIcons(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FluentContainer(
                color: Colors.lightGreen.withAlpha((0.64 * 255).round()),
                cornerRadius: FluentCornerRadius.xLarge,
                strokeStyle: FluentStrokeStyle(
                  color: Colors.pink,
                  thickness: FluentStrokeThickness.strokeWidth15,
                ),
                margin: EdgeInsets.only(bottom: 52),
                child: FluentListItemMultiLine(
                  leading: FluentAvatar(
                      child: CircleAvatar(
                    backgroundColor: Colors.grey,
                  )),
                  text: "John Doe",
                  subtext: "lorem ipsum dolor sit amet",
                ),
              ),
            ),
            FluentList.multiLine(
              sectionHeaderTitleVariant: SectionHeaderTitleVariant.bold,
              sectionHeaderTitle: 'Fluent Multiline List',
              sectionHeaderTitleIcon: Icons.lightbulb,
              separator: FluentStrokeDivider(
                style:
                    FluentThemeDataModel.of(context).fluentStrokeTheme?.stroke1,
              ),
              listItems: [
                FluentListItemMultiLine(
                  text: 'Hey, i am the title',
                  subtext:
                      'i am a little subtext to inform something to someone, okay?',
                ),
                FluentListItemMultiLine(
                  text: 'The interesting thing...',
                  subtext:
                      'Is that now, you can create separators to your list. You just have to add the separator property',
                  additionalContent: Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.yellow, size: 15),
                      Icon(Icons.lightbulb, color: Colors.yellow, size: 15),
                      Icon(Icons.lightbulb, color: Colors.yellow, size: 15),
                      Icon(Icons.lightbulb, color: Colors.yellow, size: 15),
                      Icon(Icons.lightbulb, color: Colors.yellow, size: 15),
                      Icon(Icons.lightbulb, color: Colors.yellow, size: 15),
                      Icon(Icons.lightbulb, color: Colors.yellow, size: 15),
                      Icon(Icons.lightbulb, color: Colors.yellow, size: 15),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: FluentCard(
                text: 'This is the title',
                subText:
                    'this is my subtext that have some information about something',
                coverImage: Image.network(
                  'https://images.pexels.com/photos/16465979/pexels-photo-16465979/free-photo-of-morena-campo-area-colinas.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load',
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Pet { dog, cat, bird, noAnimals }

class FluentCheckBoxWithTitle extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool? value)? onChange;

  const FluentCheckBoxWithTitle({
    super.key,
    required this.value,
    required this.onChange,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: FluentThemeDataModel.of(context)
              .fluentTextTheme
              ?.caption2
              ?.fluentCopyWith(
                fluentColor: FluentColors.neutralForeground2Rest,
                // ⚠️ ⚠️ ⚠️ Why do not use FluentText rather than do unnecessary casting
              ) as TextStyle,
        ),
        FluentCheckbox(value: value, onChanged: onChange)
      ],
    );
  }
}
