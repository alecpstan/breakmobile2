
import 'package:breakmobile2/models/ability_models.dart';


class TestData {
  final AbilityList _abilityList = AbilityList();

  TestData() {
    _abilityList.addAbility(
      Ability(
        body: 'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
        source: AbilitySource.species,
        title: 'Awesome cat skill',
        sections: [
          AbilitySection(
              sectionContents: [
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

      )
    );

    _abilityList.addAbility(
        Ability(
          body: 'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
          source: AbilitySource.calling,
          title: 'Awesome calling skill',
          sections: [
            AbilitySection(
              sectionContents: [
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
            AbilitySection(
              sectionContents: [
                {
                  'type': 'content',
                  'text':
                  'Unearthy Adversaries include: Asura, Devas, Demons, Undead, Unshaped, or any creature with 4 or more Allegiance points.'
                },
              ],
            ),
          ],

        )
    );

    _abilityList.addAbility(
        Ability(
          body: 'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
          source: AbilitySource.calling,
          title: 'Awesome cat skill',
          sections: [
            AbilitySection(
              sectionContents: [
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

        )
    );

    _abilityList.addAbility(
        Ability(
          body: 'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
          source: AbilitySource.quirk,
          title: 'Awesome cat skill',
          sections: [
            AbilitySection(
              sectionContents: [
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

        )
    );

    _abilityList.addAbility(
        Ability(
          body: 'Unlike most folk living on the Outer World, Rai-Neko are educated from a young age in advanced technology.',
          source: AbilitySource.history,
          title: 'Awesome cat skill',
          sections: [
            AbilitySection(
              sectionContents: [
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

        )
    );
  }

  get abilityList => _abilityList;

}
