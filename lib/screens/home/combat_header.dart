import 'package:auto_size_text/auto_size_text.dart';
import 'package:breakmobile2/common/custom_icons.dart';
import 'package:breakmobile2/models/primary_stat_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:breakmobile2/common/colors_used.dart' as colors_used;
import 'package:provider/provider.dart';
import '../../models/character_data.dart';

// ***********************************************************
class CombatHeader extends StatelessWidget {
  final int heartsRemaining;
  final int heartsTotal;

  const CombatHeader(
      {super.key, this.heartsRemaining = 0, this.heartsTotal = 5});

  @override
  Widget build(BuildContext context) {
    return CombatHeaderPanel();
  }
}

class CombatHeaderPanel extends StatelessWidget {
  const CombatHeaderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: [
          _NameBadge(name: context.read<CharacterData>().name),
          Row(
            children: [
              Container(
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _Avatar(),
                    Expanded(
                      child: SizedBox(),
                    ),
                    _StatusBar(),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height:
                            40), // Space to allow the name header not to overlap
                    _HeartsTracker(),
                    const SizedBox(height: 10),
                    const Expanded(child: _CombatValues()),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

// ***********************************************************
class _Avatar extends StatelessWidget {
  const _Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/avatar.jpeg'),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}

// ***********************************************************
class _HeartsTracker extends StatelessWidget {
  _HeartsTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrimaryStats>(builder: (context, provider, _) {
      return SizedBox(
        height: 40,
        child: PannableRatingBar.builder(
          rate: provider.heartsRemaining.toDouble(),
          itemCount: provider.heartsTotal,
          alignment: WrapAlignment.start,
          spacing: 0,
          runSpacing: 0,
          direction: Axis.horizontal,
          itemBuilder: (context, index) {
            return const RatingWidget(
              selectedColor: Colors.redAccent,
              unSelectedColor: Color(colors_used.paleGrey),
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Icon(CupertinoIcons.heart_fill, size: 20)),
            );
          },
        ),
      );
    });
  }
}

// ***********************************************************
class _NameBadge extends StatelessWidget {
  String name;

  _NameBadge({super.key, this.name = 'Flutter McFluffkin the first'});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.only(left: 50, top: 10),
        //width: 280,
        height: 25,
        decoration: const BoxDecoration(
          color: Color(colors_used.paleGrey),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 55),
            child: AutoSizeText(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                letterSpacing: 1.05,
                fontWeight: FontWeight.bold,
                color: Color(colors_used.brightspecies),
              ),
              softWrap: false,
              maxLines: 2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}

// ***********************************************************
class _StatusBar extends StatelessWidget {
  const _StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.lightGreenAccent,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              //height: 30,
              // width: 10,
              color: Colors.red,
              child: Text('status'),
              // child: Row(
              //   children: [
              //     Container(color: Colors.red,),
              //     Container(color: Colors.blue,),
              //   ],
              // ),
            ),
            Container(
              //height: 30,
              // width: 10,
              color: Colors.blue,
              child: Text('status'),
              // child: Row(
              //   children: [
              //     Container(color: Colors.red,),
              //     Container(color: Colors.blue,),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

// ***********************************************************
class _CombatValues extends StatelessWidget {
  const _CombatValues({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: _AttackCombatValueTile()),
        Expanded(child: _DefenseCombatValueTile()),
        Expanded(child: _MoveCombatValueTile()),
      ],
    );
  }
}

// ***********************************************************
class _AttackCombatValueTile extends StatelessWidget {
  _AttackCombatValueTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrimaryStats>(
      builder: (context, provider, _) {
        return Material(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(CustomIcons.broadsword),
                    Text(
                      (provider.attackBonus >= 0)
                          ? '+${provider.attackBonus.toString()}'
                          : provider.attackBonus.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Text(
                  'ATTACK',
                  style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 1.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ***********************************************************
class _DefenseCombatValueTile extends StatelessWidget {
  _DefenseCombatValueTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrimaryStats>(
      builder: (context, provider, _) {
        return Material(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(CustomIcons.shield),
                    AutoSizeText(
                      provider.defense.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Text(
                  'DEFENSE',
                  style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 1.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ***********************************************************
class _MoveCombatValueTile extends StatelessWidget {
  _MoveCombatValueTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrimaryStats>(
      builder: (context, provider, _) {
        return Material(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(CustomIcons.player_dodge),
                    SizedBox(width: 3),
                    Expanded(
                      child: AutoSizeText(
                        provider.speed.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Text(
                  'SPEED',
                  style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 1.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
