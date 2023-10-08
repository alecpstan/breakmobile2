import 'package:flutter/material.dart';


final Map<String,List<int>> startColorLookup = {
  'calling' : [0xff873089,0xffece0ed],
  'species' :[0xff336fb2, 0xffd7e2f0],
  'history' :[0xff4eb2af, 0xffdcf0f0],
  'quirk' :[0xff9ac358, 0xffecf3de],
  'identity' : [0xffeea84f, 0xfffdeddc],
  'items' :[0xffdb4482, 0xfff8d9e6],
};

final Map<String,List<int>> midColorLookup = {
  'calling': [0xff5a4696, 0xffe5e2ef],
  'species': [0xff3d92b4, 0xffd8e9f0],
  'history' : [0xff59b393, 0xffdff1ea],
  'quirk' :[0xffbfaf4a, 0xfff2efdc],
  'identity' :[0xffe37b72, 0xfffae4e3],
  'items':[0xffab3f89, 0xffeed9e7],
};

final Map<String,List<int>> endColorLookup = {
  'calling': [0xff336fb1, 0xffe1e9f3],
  'species': [0xff4eb3b0, 0xffdcf0ef],
  'history' :[0xff75b676, 0xffe3f0e4],
  'quirk' : [0xffe99942, 0xfffaebd9],
  'identity': [0xffdb4181, 0xfff8d9e6],
  'items': [0xff813d91, 0xffe5d8ea],
};
final Map<String,List<int>> textColorLookup = {
  'calling': [Colors.white.value, 0xff873189],
  'species' : [Colors.white.value, 0xff346fb2],
  'history' :[Colors.white.value, 0xff4eb2af],
  'quirk' :[Colors.white.value, 0xff7ea34f],
  'identity' :[Colors.white.value, 0xffe37f3b],
  'items:' :[Colors.white.value, 0xffd94081],
};

final Map<String, int> dotIconColor = {
  'calling' : 0xff873189,
  'species' : 0xff346fb2,
  'history' : 0xff4eb2af,
  'quirk' : 0xff7ea34f,
  'identity' : 0xffe37f3b,
  'items' : 0xffd94081,
  'green_bright': 0xff7ea34f,

};

const int brightspecies = 0xff00aae9;
const int paleGrey = 0xffefefef;
