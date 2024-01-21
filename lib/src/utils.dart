import 'utils_ext.dart';

/// Check domain is valid.
/// Has as extension. See [UtilsDomainStringExt].
bool isValidDomain(String uriOrDomain) {
  final uri = Uri.tryParse(sanitizeDomain(uriOrDomain));

  return uri != null &&
      uri.host.isNotEmpty &&
      uri.hasEmptyPath &&
      !uri.hasQuery &&
      !uri.hasPort &&
      !uri.hasFragment;
}

/// It return a valid domain only or empty string.
/// A prefix `www.` will be removed.
/// Has as extension. See [UtilsDomainStringExt].
String sanitizeDomain(String uriOrDomain) {
  final uri = _preSanitizeDomain(uriOrDomain);

  return uri?.host.replaceFirst('www.', '') ?? '';
}

Uri? _preSanitizeDomain(String uriOrDomain) {
  var p = uriOrDomain.trim();
  if (p.isEmpty || !p.contains('.', 1)) {
    return null;
  }

  if (!p.contains('://')) {
    p = 'https://$p';
  }

  return Uri.tryParse(p);
}

/// Split domain by name and TLD.
/// Has as extension. See [UtilsDomainStringExt].
(String name, String tld) splitNameTldDomain(String domain) {
  final splitted = domain.sanitizeDomain.split('.');
  switch (splitted.length) {
    case 0:
      return ('', '');
    case 1:
      return (splitted.first, '');
    case 2:
      return (splitted.first, splitted.last);
  }

  return (splitted[splitted.length - 2], splitted.last);
}
