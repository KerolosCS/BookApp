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

import 'package:books_app/core/utils/functions/snackbar.dart';
// import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lanchUrlMethod(
  context,
  String? url,
) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      customSnackBar(context, 'Cannot launch url : $url');
    } else {
      await launchUrl(uri);
    }
  }
}
