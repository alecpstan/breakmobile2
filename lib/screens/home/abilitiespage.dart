import 'package:breakmobile2/data/character_data.dart';
import 'package:breakmobile2/models/ability_models.dart';
import 'package:flutter/material.dart';
import '../../components/text_objects.dart';

class AbilitiesPage extends StatelessWidget {
  AbilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder when characterData is ready
    return FutureBuilder(
      future: characterData.initialiseAbilityList(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        // If characterData is not ready, show loading indicator
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        // If characterData is ready, show abilities page
        else {
          return ScrollingAbilityList();
        }
      },
    );
  }
}

class ScrollingAbilityList extends StatelessWidget {
  const ScrollingAbilityList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // For each ability source, create a heading and list of abilities
          for (AbilitySource abilitySource in AbilitySource.values)
            Column(
              children: [
                // Only add heading and list if an ability exists with a source
                if (characterData.abilityList.abilities.indexWhere(
                        (element) => abilitySource == element.source) !=
                    -1)
                  MainHeadingBlock(
                    titleText: abilitySource.humanReadable,
                    themeColor: abilitySource.colorTheme,
                  ),
                // Iterate through each ability with the current source
                for (Ability currentAbility in characterData
                    .abilityList.abilities
                    .where((element) => element.source == abilitySource))
                  SubHeadingBlock(
                    titleText: currentAbility.title,
                    bodyText: currentAbility.body,
                    themeColor: currentAbility.source.colorTheme,
                    detailText: [
                      for (var section in currentAbility.sections)
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
