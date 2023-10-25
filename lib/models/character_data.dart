import 'package:breakmobile2/models/ability_models.dart';
import 'package:breakmobile2/models/primary_stat_models.dart';
import '../data/data_processing.dart';
import 'package:flutter/material.dart';

//CharacterData characterData = CharacterData();

// Class to hold and manage character data
class CharacterData extends ChangeNotifier {
  late String _name;
  late int _level;

  AbilityList _abilityList = AbilityList();
  PrimaryStats _primaryStats = PrimaryStats();

  //Constructor
  CharacterData({String name = 'New Character', int level = 1}) {
    _name = name;
    _level = level;
  }

  // Getters
  String get name => _name;
  set name(String name) {
    _name = name;
    notifyListeners();
  }

  int get level => _level;
  void incrementLevel() {
    _level++;
    notifyListeners();
  }

  void decrementLevel() {
    _level--;
    notifyListeners();
  }

  AbilityList get abilityList => _abilityList;
  PrimaryStats get primaryStats => _primaryStats;

  //setters with notifier
  set abilityList(AbilityList abilityList) {
    _abilityList = abilityList;
    //notifyListeners();
  }

  set primaryStats(PrimaryStats primaryStats) {
    _primaryStats = primaryStats;
    //notifyListeners();
  }

  Future<void> getInitialData() async {

    _primaryStats = await getPrimaryData();
    _abilityList = await getAbilityList();
  }
}