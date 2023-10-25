import 'package:flutter/material.dart';

// class to hold combat stat values
class PrimaryStats extends ChangeNotifier {
  late int _attackBonus;
  late int _defense;
  late int _heartsTotal;
  late int _heartsRemaining;
  late Speed _speed;

  //Constructor
  PrimaryStats({
    int attackBonus = 0,
    int defense = 0,
    int heartsTotal = 5,
    int heartsRemaining = 10,
    Speed speed = Speed.slow,
  }) {
    _attackBonus = attackBonus;
    _defense = defense;
    _heartsTotal = heartsTotal;
    _heartsRemaining = heartsRemaining;
    _speed = speed;
  }

  //Getters
  int get attackBonus => _attackBonus;
  int get defense => _defense;
  int get heartsTotal => _heartsTotal;
  int get heartsRemaining => _heartsRemaining;
  Speed get speed => _speed;

  //Setters with change notifiers
  set attackBonus(int attackBonus) {
    _attackBonus = attackBonus;
    notifyListeners();
  }

  set defense(int defense) {
    _defense = defense;
    notifyListeners();
  }

  set heartsTotal(int heartsTotal) {
    _heartsTotal = heartsTotal;
    notifyListeners();
  }

  set heartsRemaining(int heartsRemaining) {
    _heartsRemaining = heartsRemaining;
    notifyListeners();
  }

  set speed(Speed speed) {
    _speed = speed;
    notifyListeners();
  }

  set speedByIndex(int index) {
    _speed = Speed.values[index];
    notifyListeners();
  }

  void incrementSpeed() {
    _speed = _speed.increment();
    notifyListeners();
  }

  void decrementSpeed() {
    _speed = _speed.decrement();
    notifyListeners();
  }

  // Methods
  // Take damage, minimum 0 hearts
  void takeDamage(int damage) {
    _heartsRemaining = (_heartsRemaining - damage).clamp(0, _heartsTotal);
    notifyListeners();
  }

  //Heal damage, maximum _heartsTotal
  void healDamage(int damage) {
    _heartsRemaining = (_heartsRemaining + damage).clamp(0, _heartsTotal);
    notifyListeners();
  }

  void resetHearts() {
    _heartsRemaining = _heartsTotal;
    notifyListeners();
  }

}

// Enum to hold speed values
enum Speed {
  slow(name: 'Slow', movement: 0),
  average(name: 'Average', movement: 1),
  fast(name: 'Fast', movement: 2),
  veryFast(name: 'Very Fast', movement: 2);

  const Speed({
    required this.name,
    required this.movement,
  });

  final String name;
  final int movement;

  //return the enum whos index is one higher than the current enum but within the maximum number of enums
  Speed increment() {
    int newSpeed = (index + 1).clamp(0, 3);
    return Speed.values[newSpeed];
  }

  //return the enum whos 'value' is one lower than the current enum, with a floor of 0
  Speed decrement() {
    int newSpeed = (index - 1).clamp(0, 3);
    return Speed.values[newSpeed];
  }

  //add or subtract the given number of enums from the current enum, with a floor of 0 and a ceiling of the maximum number of enums
  Speed setTo(int amount) {
    return Speed.values[amount.clamp(0, 3)];
  }
}
