// Class holding a list of abilities

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
    //notifyListeners();
  }

  // Remove ability form ability list by name
  removeAbility(String abilityName) {
    abilities.removeWhere((element) => element.title == abilityName);
    //notifyListeners();
  }

  // Remove ability form ability list by index
  removeAbilityByIndex(int index) {
    abilities.removeAt(index);
    //notifyListeners();
  }
}

// Class holding the contents of an ability
class Ability {
  late AbilitySource _source;
  late String _title;
  late String _body;
  late List<AbilityDetailSection> _detailSections;

  Ability({
    required AbilitySource source,
    required String title,
    required String body,
    List<AbilityDetailSection>? detailSections,
  }) {
    _source = source;
    _title = title;
    _body = body;
    _detailSections = detailSections ?? [];
  }

  // Getters
  AbilitySource get source => _source;

  String get title => _title;

  String get body => _body;

  List<AbilityDetailSection> get detailSections => _detailSections;
}

// Class holding the contents of the details section of an ability
class AbilityDetailSection {
  late final Map<String, dynamic> _sectionContents;

  AbilityDetailSection({required Map<String, dynamic> sectionContents}) {
    _sectionContents = sectionContents;
  }
  // Getters
  Map<String, dynamic> get sectionContents => _sectionContents;
}

// Tools used to create abilities
// Create an ability from json
Ability abilityFromJson(Map<String, dynamic> json) {
  List<AbilityDetailSection> abilityDetailSections = [];

  if (json['sections'] != null) {
    json['sections'].forEach((section) {
      abilityDetailSections.add(AbilityDetailSection(sectionContents: section));
    });
  }

  return Ability(
    source: AbilitySource.values
        .firstWhere((element) => element.name == json['source']),
    title: json['title'] as String,
    body: json['body'] as String,
    detailSections:
        abilityDetailSections.isNotEmpty ? abilityDetailSections : null,
  );
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
