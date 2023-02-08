import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkProvider {
  // Creating Dynamic Link

  Future<String> createLink() async {
    const String url = 'https://com.example.deep_linking_tutorial';

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse(url),
      uriPrefix: 'https://deeplinktutorials.page.link',
      androidParameters: const AndroidParameters(
        packageName: 'com.example.deep_linking_tutorial',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.example.deep_linking_tutorial',
        minimumVersion: '0',
      ),
    );
    final FirebaseDynamicLinks dynamicLink = FirebaseDynamicLinks.instance;

    final refLink = await dynamicLink.buildShortLink(parameters);

    return refLink.shortUrl.toString();
  }

  // Initialize The Dynamic Link
  void initializeDynamicLink() async {
    final instanceOfLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (instanceOfLink != null) {
      final Uri refLink = instanceOfLink.link;

      Share.share('Share Link: ${refLink.data}');
    }
  }
}
