import 'package:breakmobile2/main.dart';
import 'package:breakmobile2/models/primary_stat_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../common/supabase_tools.dart';
import '../models/ability_models.dart';

Future<dynamic> getNamedData(String tableName, String name) async {
  final response = await getSupabaseTable(tableName);
  for (Map<String, dynamic> json in response) {
    if (json['title'] == name) {
      return json;
    }
  }
  return null;
}


Future<AbilityList> getAbilityList() async {
  AbilityList abilityList = AbilityList();
  // get supabase table 'abilities'
  final response = await getSupabaseTable('abilities');
  // iterate through each ability in the response and add it to the ability list
  for (Map<String, dynamic> abilityJson in response) {
    // Only add the ability if its not already on the list
    if (abilityList.abilities
            .indexWhere((element) => element.title == abilityJson['title']) ==
        -1) {
      abilityList.addAbility(abilityFromJson(abilityJson));
    }
  }
  return abilityList;
}

Future<PrimaryStats> getPrimaryData() async {
  PrimaryStats primaryStats = PrimaryStats();

  // get supabase table 'combat_stats'
  final response = await getSupabaseTable('characters');
  print(response);
  // iterate through each combat stat in the response and add it to the combat stat list

  return primaryStats;
}
