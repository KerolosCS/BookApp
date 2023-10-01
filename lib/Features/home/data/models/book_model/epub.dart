/*
 *
 *
 *
 * ----------------
 * | 241030072002 |
 * ----------------
 * Copyright © [2023] KERO CS FLUTTER DEVELOPMENT.
 * All Rights Reserved. For inquiries or permissions, contact  me ,
 * https://www.linkedin.com/in/kerolos-fady-software-engineer/
 *
 * /
 */

import 'package:equatable/equatable.dart';

class Epub extends Equatable {
  final bool? isAvailable;

  const Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json['isAvailable'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
      };

  @override
  List<Object?> get props => [isAvailable];
}
