
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
      future: characterData.initialiseAbilityListDemoData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        // If characterData is not ready and list is empty, show loading indicator
        if ((snapshot.connectionState != ConnectionState.done) && (characterData.abilityList.abilities.length == 0))
        {
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
                    detailText: currentAbility.detailSections.map((e) => e.sectionContents).toList(),
                  ),

              ],
            ),
          if (characterData.abilityList.abilities.length == 0)
            const Center(
              child: Text('No abilities yet'),),
        ],

      ),
    );
  }
}
