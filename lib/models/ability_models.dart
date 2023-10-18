
class AbilityList {
  List<Ability> _abilities = [];

  AbilityList();

  List<Ability> get abilities => _abilities;

  addAbility (Ability ability) {
    abilities.add(ability);
    //_abilityList.sort((a, b) => a.source.name.compareTo(b.source.name));
  }

  removeAbility (String abilityName) {
    abilities.removeWhere((element) => element.title == abilityName);
  }

}

class Ability {
  AbilitySource source;
  String title;
  String body;
  List<AbilitySection> sections;

  Ability(
      {required this.source,
      required this.title,
      required this.body,
      required this.sections});
}

class AbilitySection {
  final List<Map<String, dynamic>> sectionContents;

  AbilitySection({required this.sectionContents});
}

enum AbilitySource implements Comparable<AbilitySource> {
  calling(colorTheme: 'calling', humanReadable: 'Calling Abilities'),
  species(colorTheme: 'species', humanReadable: 'Species Abilities'),
  history(colorTheme: 'history', humanReadable: 'History Abilities'),
  quirk(colorTheme: 'quirk', humanReadable: 'Quirk Abilities'),
  identity(colorTheme: 'identity', humanReadable: 'Identity Abilities'),
  item(colorTheme: 'items', humanReadable: 'Item Abilities');

  const AbilitySource({
    required this.colorTheme,
    required this.humanReadable,
  });

  final String colorTheme;
  final String humanReadable;

  @override
  int compareTo(AbilitySource otherSource) => otherSource.name.compareTo(name);
}

enum VisualStyle { heading, content, indent }
