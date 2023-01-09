import 'package:flutter_share/flutter_share.dart';

class SharedMethods {
  static Future<void> share(String description) async {
    await FlutterShare.share(
        title: 'member.id',
        text: description,
        linkUrl: 'https://member.id/',
        chooserTitle: 'Influencing Customer Behavior');
  }
}
