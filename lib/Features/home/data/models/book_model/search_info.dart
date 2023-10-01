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

class SearchInfo extends Equatable {
  final String? textSnippet;

  const SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json['textSnippet'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'textSnippet': textSnippet,
      };

  @override
  List<Object?> get props => [textSnippet];
}
