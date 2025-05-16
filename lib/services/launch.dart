import 'package:flutter/services.dart';
import 'package:myportfolio/constant/links.dart';
import 'package:myportfolio/widget/toast.dart';
import 'package:url_launcher/url_launcher.dart';

openLink(String link) async {
  final uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

mailMe() async {
  // final Uri emailLaunchUri = Uri(
  //   scheme: 'mailto',
  //   path: MyLinks.email,
  // );
  toast("Copied to clipboard");
  Clipboard.setData(ClipboardData(text: MyLinks.email));
  // await launchUrl(emailLaunchUri);
}
