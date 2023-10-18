import 'package:breakmobile2/data/ability_data.dart';
import 'package:breakmobile2/models/ability_models.dart';
import 'package:flutter/material.dart';
import '../../components/text_objects.dart';
import '../../data/ability_data.dart';

class Abilities extends StatelessWidget {
  AbilityList abilityList = AbilityList();

  Abilities({super.key});

  get testThemeColor => 'calling';

  AbilityList getAbilityData() {
    return TestData().abilityList;
  }

  Column childrenBlock (AbilitySource source) {
    return Column(
      children: [
        MainHeadingBlock(
            titleText: source.humanReadable,
            themeColor: source.colorTheme),
        for (var subHeading in abilityList.abilities
            .where((element) => element.source == AbilitySource.species))
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
    );
  }

  @override
  Widget build(BuildContext context) {
    abilityList = getAbilityData();

    return SingleChildScrollView(
      child: Column(
        children: [
          for (var abilitySource in AbilitySource.values)
            Column(
              children: [ // Only add heading and list if an ability exists with a source
                if(abilityList.abilities.indexWhere((element) => abilitySource == element.source) != -1)
                  MainHeadingBlock(
                      titleText: abilitySource.humanReadable,
                      themeColor: abilitySource.colorTheme
                  ),
                  for (var subHeading in abilityList.abilities
                      .where((element) => element.source.name == abilitySource.name))
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
