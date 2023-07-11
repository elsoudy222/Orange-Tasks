import 'package:flutter/material.dart';

class QuestsModel {
  final String title;
  final String subtitle;
  final int totalPoints;
  final Widget icon;

  QuestsModel({
    required this.title,
    required this.subtitle,
    required this.totalPoints,
    required this.icon,
  });
}
