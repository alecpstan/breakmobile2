import 'package:breakmobile2/data/ability_data.dart';
import 'package:breakmobile2/models/ability_models.dart';
import 'package:flutter/material.dart';
import '../../components/text_objects.dart';

class AbilitiesPage extends StatelessWidget {
  AbilityList abilityList = AbilityList();

  AbilitiesPage({super.key});

  //get testThemeColor => 'calling';

  AbilityList getAbilityData() {
    return CharacterData().abilityList;
  }

  @override
  Widget build(BuildContext context) {
    abilityList = getAbilityData();

    return SingleChildScrollView(
      child: Column(
        children: [
          for (var abilitySource in AbilitySource.values)
            Column(
              children: [
                // Only add heading and list if an ability exists with a source
                if (abilityList?.abilities.indexWhere(
                        (element) => abilitySource == element.source) !=
                    -1)
                  MainHeadingBlock(
                      titleText: abilitySource.humanReadable,
                      themeColor: abilitySource.colorTheme),
                for (var subHeading in abilityList.abilities.where(
                    (element) => element.source.name == abilitySource.name))
                  SubHeadingBlock(
                    titleText: subHeading.title,
                    bodyText: subHeading.body,
                    themeColor: subHeading.source.colorTheme,
                    detailText: [
                      for (var section in subHeading.sections)
                        section.sectionContents,
                    ],
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class ChildrenBlock extends StatelessWidget {
  final AbilitySource source;

  const ChildrenBlock({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHeadingBlock(
            titleText: source.colorTheme, themeColor: source.colorTheme),
        for (var subHeading in AbilityList()
            .abilities
            .where((element) => element.source == AbilitySource.species))
          SubHeadingBlock(
            titleText: subHeading.title,
            bodyText: subHeading.body,
            themeColor: subHeading.source.colorTheme,
            detailText: [
              for (AbilitySection section in subHeading.sections)
                section.sectionContents,
            ],
          ),
      ],
    );
  }
}
