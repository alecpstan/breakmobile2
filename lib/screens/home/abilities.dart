import 'package:flutter/material.dart';
import '../../components/text_objects.dart';

class Abilities extends StatelessWidget {
  const Abilities({super.key});

  get testThemeColor => 'calling';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
      ),
    );
  }
}
