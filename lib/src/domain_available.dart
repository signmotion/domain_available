import 'base_domain_available.dart';
import 'checkers/instant_domain_search_check.dart';

/// A domain available checker.
class DomainAvailable extends BaseDomainAvailable {
  const DomainAvailable(
    super.name, {
    super.checker = const InstantDomainSearchCheck(),
  });
}
