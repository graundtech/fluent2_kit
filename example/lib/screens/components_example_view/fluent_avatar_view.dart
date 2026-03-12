import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent_icons.dart';
import 'package:fluent2ui/fluent2ui.dart';

class PeopleExample {
  final String name;
  final String coverImageUrl;

  PeopleExample({
    required this.name,
    required this.coverImageUrl,
  });
}

class FluentAvatarView extends StatelessWidget {
  FluentAvatarView({super.key});

  final people = [
    PeopleExample(
      name: "Aubrey",
      coverImageUrl: "assets/images/avatars/avatar1.jpeg",
    ),
    PeopleExample(
      name: "Kristin",
      coverImageUrl: "assets/images/avatars/avatar2.jpeg",
    ),
    PeopleExample(
      name: "Dustin",
      coverImageUrl: "assets/images/avatars/avatar3.jpeg",
    ),
    PeopleExample(
      name: "Lee",
      coverImageUrl: "assets/images/avatars/avatar4.jpeg",
    ),
    PeopleExample(
      name: "Elara",
      coverImageUrl: "assets/images/avatars/avatar5.jpeg",
    ),
    PeopleExample(
      name: "Júlia",
      coverImageUrl: "assets/images/avatars/avatar3.jpeg",
    ),
    PeopleExample(
      name: "Marcos",
      coverImageUrl: "assets/images/avatars/avatar4.jpeg",
    ),
    PeopleExample(
      name: "Diego",
      coverImageUrl: "assets/images/avatars/avatar1.jpeg",
    ),
    PeopleExample(
      name: "Sara",
      coverImageUrl: "assets/images/avatars/avatar3.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Avatar",
          subtitle: "Components > Fluent Avatar",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentSectionDescription(
                description: "An avatar shows an image or text to represent "
                    "a person or group as well as gives additional information like their status and activity.",
              ),
              FluentStrokeDivider(
                height: FluentSize.size240.value,
              ),
              FluentSectionHeader(title: "People"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (PeopleExample value in people) ...[
                      Padding(
                        padding: EdgeInsets.all(FluentSize.size120.value),
                        child: Column(
                          children: [
                            FluentAvatar(
                              size: FluentAvatarSize.size56,
                              child: Image.asset(
                                value.coverImageUrl,
                                width: double.maxFinite,
                                height: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: FluentSize.size80.value,
                            ),
                            FluentText(
                              value.name,
                              style: FluentThemeDataModel.of(context)
                                  .fluentTextTheme
                                  ?.caption1,
                            )
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              FluentSectionHeader(title: "Behavior"),
              Padding(
                padding: EdgeInsets.only(
                    right: FluentSize.size160.value,
                    left: FluentSize.size160.value,
                    bottom: FluentSize.size160.value),
                child: FluentText(
                  "Avatars can include presence badges to indicate the status of an associated person.",
                ),
              ),
              FluentListItemMultiLine(
                text: "Esther Howard",
                subtext: "You: Let's do this!",
                // available
                leading: FluentAvatar(
                  statusPresenceBadge: StatusPresenceBadge.avaliable,
                  strokeStyle: FluentStrokeStyle(
                    color: Colors.purple,
                    thickness: FluentStrokeThickness.strokeWidth15,
                    padding: FluentSize.size20.value,
                  ),
                  child: Image.asset(
                    'assets/images/avatars/avatar3.jpeg',
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FluentStrokeDivider(
                startIndent: FluentStrokeBorderIndent.strokeIndent56,
                height: 0,
              ),
              FluentListItemMultiLine(
                text: "Cody Fisher",
                subtext: "System all the way down, man!",
                leading: FluentAvatar(
                  statusPresenceBadge: StatusPresenceBadge.away,
                  size: FluentAvatarSize.size40,
                  child: Image.asset(
                    'assets/images/avatars/avatar2.jpeg',
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FluentStrokeDivider(
                startIndent: FluentStrokeBorderIndent.strokeIndent56,
                height: 0,
              ),
              FluentListItemMultiLine(
                text: "Cody Fisher",
                subtext: "System all the way down, man!",
                leading: FluentAvatar(
                  size: FluentAvatarSize.size56,
                  cutout: Icon(
                    FluentIcons.heart_12_filled,
                    size: FluentSize.size160.value,
                  ),
                  child: Image.asset(
                    'assets/images/avatars/avatar1.jpeg',
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FluentStrokeDivider(
                startIndent: FluentStrokeBorderIndent.strokeIndent56,
                height: 0,
              ),
              FluentListItemMultiLine(
                text: "Cody Fisher",
                subtext: "System all the way down, man!",
                leading: FluentAvatar(
                  size: FluentAvatarSize.size56,
                  statusPresenceBadge: StatusPresenceBadge.dnd,
                  child: Image.asset(
                    'assets/images/avatars/avatar5.jpeg',
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
