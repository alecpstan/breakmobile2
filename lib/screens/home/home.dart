
import 'package:breakmobile2/main.dart';
import 'package:flutter/material.dart';
import 'package:breakmobile2/components/text_objects.dart';
import 'package:breakmobile2/components/combat_tile_objects.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final PageController controller = PageController();
    const String testThemeColor = 'history';

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 50),
          CombatHeader(heartsRemaining: 13, heartsTotal: 20),
          MainHeadingBlock(
              titleText: 'Standard abilities',
              bodyText: 'Available for selection at Rank 2 or higher.',
              themeColor: testThemeColor,
          ),
          SubHeadingBlock(
            titleText: 'Heading 2',
            bodyText:
                'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
            themeColor: testThemeColor,
            detailText: [
              {
                'type': 'heading', 'text': 'Advantages'
              },
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
