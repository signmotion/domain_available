import 'checked_domain.dart';
import 'default_tlds.dart';

/// Base class for checkers.
abstract class BaseDomainChecker {
  const BaseDomainChecker(this.name, {required this.doc})
      : assert(name.length > 0, 'The checker name should be set.');

  /// A name this checker.
  final String name;

  /// Doc or URL to doc for this checker.
  final String doc;

  /// Check a states for domains.
  Future<List<CheckedDomain>> registeredStatus(
    String domainOrHisName, {
    Set<String> tlds = defaultTlds,
  });

  @override
  String toString() => name;
}

/// Check domain is valid.
bool isValidDomain(String uriOrDomain) {
  final uri = Uri.tryParse(sanitizeDomain(uriOrDomain));

  return uri != null &&
      uri.host.isNotEmpty &&
      uri.hasEmptyPath &&
      !uri.hasQuery &&
      !uri.hasPort &&
      !uri.hasFragment;
}

/// It return domain only or empty string.
/// A prefix `www.` will be removed.
String sanitizeDomain(String uriOrDomain) {
  final uri = _preSanitizeDomain(uriOrDomain);

  return uri?.host.replaceFirst('www.', '') ?? '';
}

Uri? _preSanitizeDomain(String uriOrDomain) {
  const scheme = 'https://';
  if (uriOrDomain.isEmpty || !uriOrDomain.contains('.', 1)) {
    return null;
  }

  final p =
      (uriOrDomain.startsWith(scheme) ? uriOrDomain : '$scheme$uriOrDomain')
          .trim();

  return Uri.tryParse(p);
}

/// Split domain by name and TLD.
(String name, String tld) splitDomain(String domain) {
  final splitted = sanitizeDomain(domain).split('.');
  switch (splitted.length) {
    case 0:
      return ('', '');
    case 1:
      return (splitted.first, '');
    case 2:
      return (splitted.first, splitted.last);
  }

  return (splitted.first, splitted.sublist(1).join('.'));
}
