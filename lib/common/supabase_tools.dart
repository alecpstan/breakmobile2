import 'package:breakmobile2/main.dart';

Future getSupabaseTable(String tableName) async {
  try {
    final response = await supabase.from(tableName).select();
    return response;
  } on Exception catch (e) {
    print(e);
    return null;
  }
}
