import 'package:myportfolio/constant/links.dart';
import 'package:url_launcher/url_launcher.dart';

openLink(String link) async {
  final uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

mailMe() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: MyLinks.email,
  );
  await launchUrl(emailLaunchUri);
}
