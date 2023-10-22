// Class holding a list of abilities
import 'dart:ffi';

class AbilityList {
  List<Ability> _abilities = [];

  AbilityList();

  List<Ability> get abilities => _abilities;

  // Get ability list by source
  List<Ability> getAbilityListBySource(AbilitySource source) {
    return _abilities.where((element) => element.source == source).toList();
  }

  // Sort ability list by source then alphabetically
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

// Class holding the contents of an ability
class Ability {
  late AbilitySource _source;
  late String _title;
  late String _body;
  late List<AbilitySection> _sections;

  Ability({
    required source,
    required title,
    required body,
    required sections,
  }) {
    _source = source;
    _title = title;
    _body = body;
    _sections = sections;
  }

  Ability.fromJson(Map<String, dynamic> json)
      : _source = AbilitySource.values
            .firstWhere((element) => element.name == json['source']),
        _title = json['title'] as String,
        _body = json['body'] as String,
        _sections = [];//json['sections'] as List<AbilitySection>;

  // Getters
  AbilitySource get source => _source;

  String get title => _title;

  String get body => _body;

  List<AbilitySection> get sections => List.unmodifiable(_sections);
}

// Class holding the contents of the details section of an ability
class AbilitySection {
  late final List<Map<String, dynamic>> _sectionContents;

  AbilitySection({required sectionContents}) {
    _sectionContents = sectionContents;
  }
  // Getters
  List<Map<String, dynamic>> get sectionContents =>
      List.unmodifiable(_sectionContents);
}

// Enum holding the different sources of abilities
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

// Enum holding the different visual styles for ability sections
enum AbilityVisualStyle {
  heading,
  content,
  indent,
}
