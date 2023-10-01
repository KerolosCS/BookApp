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

import 'package:flutter/material.dart';

void customSnackBar(context, String url) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        url,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
