import 'package:url_launcher/url_launcher.dart';

myLuncher(_url) async {
  if (await canLaunch(_url)) {
    await launch(_url);
  } else {
    throw "Could not launch $_url";
  }
}
