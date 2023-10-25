import 'package:breakmobile2/models/character_data.dart';
import 'package:breakmobile2/main.dart';
import 'package:breakmobile2/screens/home/abilities_page.dart';
import 'package:breakmobile2/screens/home/identity_page.dart';
import 'package:breakmobile2/screens/home/inventory_page.dart';
import 'package:breakmobile2/screens/home/combat_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/primary_stat_models.dart';

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
    return FutureBuilder(
      future: context.read<CharacterData>().getInitialData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if ((snapshot.connectionState != ConnectionState.done)) {
          return const Center(child: CircularProgressIndicator());
        }
        // If characterData is ready, show abilities page
        else {
          return MainPageBody(controller: _controller);
        }
      },
    );
  }
}

class MainPageBody extends StatelessWidget {
  PageController controller;

  MainPageBody({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<PrimaryStats>().takeDamage(1);
            print(context.read<PrimaryStats>().heartsRemaining);
          }
        ),
        body: Column(children: [
          CombatHeader(),
          const Divider(color: Colors.black),
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                AbilitiesPage(),
                InventoryPage(),
                IdentityPage(),
              ],
            ),
          ),
        ]),
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
