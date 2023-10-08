import 'package:flutter/cupertino.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:breakmobile2/common/colors_used.dart' as colors_used;


// ***********************************************************
class CombatHeader extends StatelessWidget {
  final int heartsRemaining;
  final int heartsTotal;

  const CombatHeader({super.key, this.heartsRemaining = 0, this.heartsTotal = 5});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: [
          _NameBadge(),
          Row(
            children: [
              Container(
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _Avatar(),
                    Expanded(child: SizedBox(),),
                    _StatusBar(),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40), // Space to allow the name header not to overlap
                  _HeartsTracker(heartsTotal: heartsTotal, heartsRemaining: heartsRemaining),
                  _CombatValues(),
                ],
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

  int heartsRemaining;
  int heartsTotal;

  _HeartsTracker({super.key, this.heartsRemaining = 0, this.heartsTotal = 5});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 240,
      child: PannableRatingBar.builder(
        rate: heartsRemaining.toDouble(),
        itemCount: heartsTotal,
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
              child: Icon(CupertinoIcons.heart_fill, size:20)),
          );
         },
      ),
    );
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
        margin: EdgeInsets.only(left: 50, top: 10),
        //width: 280,
        height: 25,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left:55),
            child: Text(
              name,
              style: TextStyle(
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
        decoration: const BoxDecoration(
          color: Color(colors_used.paleGrey),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
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
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          _AttackCombatValueTile(),
          _DefenseCombatValueTile(),
          _MoveCombatValueTile(),
        ],
      ),
    );
  }
}
// ***********************************************************
class _AttackCombatValueTile extends StatelessWidget {
  const _AttackCombatValueTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// ***********************************************************
class _DefenseCombatValueTile extends StatelessWidget {
  const _DefenseCombatValueTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// ***********************************************************
class _MoveCombatValueTile extends StatelessWidget {
  const _MoveCombatValueTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}





