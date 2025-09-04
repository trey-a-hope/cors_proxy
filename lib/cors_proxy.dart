import 'package:universal_platform/universal_platform.dart';

class CorsProxy {
  static const _endpoint = 'https://corsproxy.io/?';

  static String getEndpoint(String targetUrl, {String? apiKey}) {
    if (!UniversalPlatform.isWeb) return targetUrl;

    final proxyUrl = '$_endpoint${_ensureHttps(targetUrl)}';

    if (apiKey == null) {
      return proxyUrl;
    }

    return '$proxyUrl/?key=$apiKey';
  }

  static String _ensureHttps(String url) {
    if (url.startsWith('http://')) {
      return url.replaceFirst('http://', 'https://');
    }
    return url;
  }
}
