import 'package:breakmobile2/models/character_data.dart';
import 'package:breakmobile2/models/ability_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/text_objects.dart';

class AbilitiesPage extends StatelessWidget {
  AbilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollingAbilityList();
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
                if (context.read<CharacterData>().abilityList.abilities.indexWhere(
                        (element) => abilitySource == element.source) !=
                    -1)
                  MainHeadingBlock(
                    titleText: abilitySource.humanReadable,
                    themeColor: abilitySource.colorTheme,
                  ),
                // Iterate through each ability with the current source
                for (Ability currentAbility in context.read<CharacterData>()
                    .abilityList.abilities
                    .where((element) => element.source == abilitySource))
                  SubHeadingBlock(
                    titleText: currentAbility.title,
                    bodyText: currentAbility.body,
                    themeColor: currentAbility.source.colorTheme,
                    detailText: currentAbility.detailSections
                        .map((e) => e.sectionContents)
                        .toList(),
                  ),
              ],
            ),
          if (context.read<CharacterData>().abilityList.abilities.isEmpty)
            const Center(
              child: Text('No abilities yet'),
            ),
        ],
      ),
    );
  }
}
