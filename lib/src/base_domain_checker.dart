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
