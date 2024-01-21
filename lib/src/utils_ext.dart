import 'utils.dart' as u;

/// Has as function. See [utils.dart].
extension UtilsDomainStringExt on String {
  bool get isValidDomain => u.isValidDomain(this);

  String get sanitizeDomain => u.sanitizeDomain(this);

  (String name, String tld) get splitNameTldDomain =>
      u.splitNameTldDomain(this);
}
