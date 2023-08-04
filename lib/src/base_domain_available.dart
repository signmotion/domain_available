import 'base_domain_checker.dart';
import 'checked_domain.dart';
import 'default_tlds.dart';

/// Base class for domain available checkers.
abstract class BaseDomainAvailable {
  const BaseDomainAvailable(
    this.name, {
    required this.checker,
  }) : assert(name.length > 0, 'The second level domain name should be set.');

  /// Second level domain name.
  final String name;

  final BaseDomainChecker checker;

  /// Returns a registered status for [name] in declared top level domains.
  Future<List<CheckedDomain>> registeredStatus({
    Set<String> tlds = defaultTlds,
  }) =>
      checker.registeredStatus(name, tlds: tlds);

  /// Returns a first registered status after call [registeredStatus].
  Future<CheckedDomain> firstRegisteredStatus({
    Set<String> tlds = defaultTlds,
  }) async =>
      (await registeredStatus(tlds: tlds)).first;

  @override
  String toString() => '$name $checker';
}
