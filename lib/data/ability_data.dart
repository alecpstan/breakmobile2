import 'package:breakmobile2/models/ability_models.dart';
import 'package:breakmobile2/main.dart'; // to gain access to global supabase instance

// Class holding a list of abilities
class AbilityList {
  List<Ability> _abilities = [];

  AbilityList();

  List<Ability> get abilities => _abilities;

  // Get ability list by source
  List<Ability> getAbilityListBySource(AbilitySource source) {
    return _abilities.where((element) => element.source == source).toList();
  }

  // Sort ability list by souyrce then alphabetically
  sortAbilityList() {
    _abilities.sort((a, b) => a.source.name.compareTo(b.source.name));
    _abilities.sort((a, b) => a.title.compareTo(b.title));
  }

  //Add ability to ability list
  addAbility(Ability ability) {
    abilities.add(ability);
  }

  // Remove ability form ability list by name
  removeAbility(String abilityName) {
    abilities.removeWhere((element) => element.title == abilityName);
  }

  // Remove ability form ability list by index
  removeAbilityByIndex(int index) {
    abilities.removeAt(index);
  }
}

// Class to hold and manage test data
class CharacterData {
  final AbilityList _abilityList = AbilityList();

  get abilityList => _abilityList;

  // Constructor
  CharacterData() {
    initialiseAbilityListDemoData();
    //initialiseAbilityList();
  }

  Future initialiseAbilityList() async {
    // Get data from supabase table 'abilities'
    final response =
        supabase.from('abilities').select<List<Map<String, dynamic>>>();
    print(response);
  }

  initialiseAbilityListDemoData() {
    _abilityList.addAbility(Ability(
      body:
          'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
      source: AbilitySource.species,
      title: 'Awesome cat skill',
      sections: [
        AbilitySection(
          sectionContents: [
            {'type': 'heading', 'text': 'Advantages'},
            {
              'type': 'content',
              'text':
                  'You may choose a consumable material (such as lantern oil or a treat) to act as a deterrent to an Unearthly Adversary.',
              'icon': 'tick',
              'icon_color': 'green_bright',
            },
            {
              'type': 'indent',
              'text': 'Glittering: +1 on Attack rolls.',
              'icon': 'warning'
            },
            {'type': 'heading', 'text': 'Disadvantages'},
            {
              'type': 'content',
              'text':
                  'Unearthy Adversaries include: Asura, Devas, Demons, Undead, Unshaped, or any creature with 4 or more Allegiance points.'
            },
          ],
        ),
      ],
    ));

    _abilityList.addAbility(Ability(
      body:
          'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
      source: AbilitySource.calling,
      title: 'Awesome calling skill',
      sections: [
        AbilitySection(
          sectionContents: [
            {'type': 'heading', 'text': 'Advantages'},
            {
              'type': 'content',
              'text':
                  'You may choose a consumable material (such as lantern oil or a treat) to act as a deterrent to an Unearthly Adversary.',
              'icon': 'tick',
              'icon_color': 'green_bright',
            },
            {
              'type': 'indent',
              'text': 'Glittering: +1 on Attack rolls.',
              'icon': 'warning'
            },
            {'type': 'heading', 'text': 'Disadvantages'},
            {
              'type': 'content',
              'text':
                  'Unearthy Adversaries include: Asura, Devas, Demons, Undead, Unshaped, or any creature with 4 or more Allegiance points.'
            },
          ],
        ),
        AbilitySection(
          sectionContents: [
            {
              'type': 'content',
              'text':
                  'Unearthy Adversaries include: Asura, Devas, Demons, Undead, Unshaped, or any creature with 4 or more Allegiance points.'
            },
          ],
        ),
      ],
    ));

    _abilityList.addAbility(Ability(
      body:
          'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
      source: AbilitySource.calling,
      title: 'Awesome cat skill',
      sections: [
        AbilitySection(
          sectionContents: [
            {'type': 'heading', 'text': 'Advantages'},
            {
              'type': 'content',
              'text':
                  'You may choose a consumable material (such as lantern oil or a treat) to act as a deterrent to an Unearthly Adversary.',
              'icon': 'tick',
              'icon_color': 'green_bright',
            },
            {
              'type': 'indent',
              'text': 'Glittering: +1 on Attack rolls.',
              'icon': 'warning'
            },
            {'type': 'heading', 'text': 'Disadvantages'},
            {
              'type': 'content',
              'text':
                  'Unearthy Adversaries include: Asura, Devas, Demons, Undead, Unshaped, or any creature with 4 or more Allegiance points.'
            },
          ],
        ),
      ],
    ));

    _abilityList.addAbility(Ability(
      body:
          'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
      source: AbilitySource.quirk,
      title: 'Awesome cat skill',
      sections: [
        AbilitySection(
          sectionContents: [
            {'type': 'heading', 'text': 'Advantages'},
            {
              'type': 'content',
              'text':
                  'You may choose a consumable material (such as lantern oil or a treat) to act as a deterrent to an Unearthly Adversary.',
              'icon': 'tick',
              'icon_color': 'green_bright',
            },
            {
              'type': 'indent',
              'text': 'Glittering: +1 on Attack rolls.',
              'icon': 'warning'
            },
            {'type': 'heading', 'text': 'Disadvantages'},
            {
              'type': 'content',
              'text':
                  'Unearthy Adversaries include: Asura, Devas, Demons, Undead, Unshaped, or any creature with 4 or more Allegiance points.'
            },
          ],
        ),
      ],
    ));

    _abilityList.addAbility(Ability(
      body:
          'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
      source: AbilitySource.history,
      title: 'Awesome cat skill',
      sections: [
        AbilitySection(
          sectionContents: [
            {'type': 'heading', 'text': 'Advantages'},
            {
              'type': 'content',
              'text':
                  'You may choose a consumable material (such as lantern oil or a treat) to act as a deterrent to an Unearthly Adversary.',
              'icon': 'tick',
              'icon_color': 'green_bright',
            },
            {
              'type': 'indent',
              'text': 'Glittering: +1 on Attack rolls.',
              'icon': 'warning'
            },
            {'type': 'heading', 'text': 'Disadvantages'},
            {
              'type': 'content',
              'text':
                  'Unearthy Adversaries include: Asura, Devas, Demons, Undead, Unshaped, or any creature with 4 or more Allegiance points.'
            },
          ],
        ),
      ],
    ));
  }
}
