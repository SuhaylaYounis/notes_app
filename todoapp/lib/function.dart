import 'package:share/share.dart';


class Functions{
    static Future<void> shareLink(String link) async {
      Share.share(link);
  }
}