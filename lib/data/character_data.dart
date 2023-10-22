import 'package:breakmobile2/models/ability_models.dart';
import 'package:breakmobile2/common/supabase_tools.dart'; // to gain access to global supabase instance

CharacterData characterData = CharacterData();

// Class to hold and manage character data
class CharacterData {
  AbilityList _abilityList = AbilityList();
  // Getters
  get abilityList => _abilityList;

  Future<void> initialiseAbilityList() async {
    // get supabase table 'abilities'
    final response = await getSupabaseTable('abilities');
    // iterate through each ability in the response and add it to the ability list
    for (Map<String, dynamic> abilityJson in response) {
      // Only add the ability if its not already on the list
      if (_abilityList.abilities
              .indexWhere((element) => element.title == abilityJson['title']) ==
          -1) {
        _abilityList.addAbility(abilityFromJson(abilityJson));
        print(
            'loaded: ${_abilityList.abilities[_abilityList.abilities.length - 1].title} from ${_abilityList.abilities[_abilityList.abilities.length - 1].source.humanReadable}');
      }
    }
  }

  Future<void> initialiseAbilityListDemoData() async {
    _abilityList = AbilityList();
    _abilityList.addAbility(
      Ability(
          body:
              'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
          source: AbilitySource.species,
          title: 'Awesome species skill',
          detailSections: [
            AbilityDetailSection(
              sectionContents: {
                'type': 'heading',
                'text': 'Advantages',
              },
            ),
            AbilityDetailSection(
              sectionContents: {
                'type': 'content',
                'text':
                    'You may choose a consumable material (such as lantern oil or a treat) to act as a deterrent to an Unearthly Adversary.',
                'icon': 'tick',
                'icon_color': 'green_bright',
              },
            ),

            AbilityDetailSection(
              sectionContents: {
                'type': 'indent',
                'text': 'Glittering: +1 on Attack rolls.',
                'icon': 'warning'
              },
            ),
            AbilityDetailSection(
              sectionContents: {'type': 'divider'},
            ),
            AbilityDetailSection(
              sectionContents: {
                'type': 'heading',
                'text': 'Disadvantages',
              },
            ),
            AbilityDetailSection(
              sectionContents: {
                'type': 'content',
                'text':
                    'Unearthy Adversaries include: Asura, Devas, Demons, Undead, Unshaped, or any creature with 4 or more Allegiance points.'
              },
            ),
          ]),
    );

    _abilityList.addAbility(
      Ability(
          body:
          'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
          source: AbilitySource.calling,
          title: 'Awesome calling skill',
          detailSections: [
            AbilityDetailSection(
              sectionContents: {
                'type': 'heading',
                'text': 'Advantages',
              },
            ),
            AbilityDetailSection(
              sectionContents: {
                'type': 'content',
                'text':
                'You may choose a consumable material (such as lantern oil or a treat) to act as a deterrent to an Unearthly Adversary.',
                'icon': 'tick',
                'icon_color': 'green_bright',
              },
            ),
            AbilityDetailSection(
              sectionContents: {
                'type': 'indent',
                'text': 'Glittering: +1 on Attack rolls.',
                'icon': 'warning'
              },
            ),
          ]),
    );

    _abilityList.addAbility(
      Ability(
          body:
          'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
          source: AbilitySource.quirk,
          title: 'Awesome quirk skill',
          detailSections: []),
    );

  }
}
