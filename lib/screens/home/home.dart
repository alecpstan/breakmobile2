
import 'package:breakmobile2/common/custom_icons.dart';
import 'package:breakmobile2/main.dart';
import 'package:breakmobile2/screens/home/abilities.dart';
import 'package:breakmobile2/screens/home/identity.dart';
import 'package:breakmobile2/screens/home/inventory.dart';
import 'package:flutter/material.dart';
import 'package:breakmobile2/components/text_objects.dart';
import 'package:breakmobile2/components/combat_tile_objects.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            CombatHeader(heartsRemaining: 5, heartsTotal: 8),
            const Divider(color: Colors.black),
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  Abilities(),
                  Inventory(),
                  Identity(),
                ],
              ),
            ),
            // TabBar(
            //     tabs: [
            //       Tab(icon: Icon(Icons.bar_chart)),
            //       Tab(icon: Icon(Icons.shopping_bag)),
            //     ],
            // ),
          ]
        ),
      ),
    );
  }
}

Future<void> signOut(BuildContext context) async {
  try {
    supabase.auth.signOut();
    Navigator.of(context).pushReplacementNamed('/');
  } catch (e) {
    print('ERROR SIGN OUT $e');
    throw 'Error';
  }
}
