import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:myportfolio/util/constant/links.dart';
import 'package:myportfolio/widget/toast.dart';
import 'package:url_launcher/url_launcher.dart';

openLink(String link) async {
  final uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

mailMe() async {
  final Uri emailLaunchUri = Uri.parse("mailto:${MyLinks.email}");
  if (await canLaunchUrl(emailLaunchUri)) await launchUrl(emailLaunchUri);
}

bool isMobile() {
  return [TargetPlatform.iOS, TargetPlatform.android].contains(defaultTargetPlatform) && kIsWeb;
}
