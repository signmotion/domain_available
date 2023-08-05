import 'dart:convert';

import 'package:http/http.dart';

import '../base_domain_checker.dart';
import '../default_tlds.dart';
import '../registered_status.dart';
import '../checked_domain.dart';
import '../list_checked_domain_ext.dart';

/// \see https://instantdomainsearch.com
/// \thanks https://github.com/breitburg/domine
/// TODO Enhance a check with https://lookup.icann.org : https://github.com/icann/czds-api-client-python
class InstantDomainSearchCheck extends BaseDomainChecker {
  const InstantDomainSearchCheck()
      : super(
          'Instant Domain Search Check',
          doc: 'https://instantdomainsearch.com',
        );

  @override
  Future<List<CheckedDomain>> registeredStatus(
    String domainOrHisName, {
    Set<String> tlds = defaultTlds,
  }) async {
    final (String domainName, String domainTld) = splitDomain(domainOrHisName);
    if (domainName.isEmpty && domainTld.isEmpty) {
      throw ArgumentError('Unable to split domain: `$domainOrHisName`.');
    }

    return _check(
      domainName,
      tlds: domainTld.isEmpty ? tlds : {domainTld},
    );
  }

  static Future<List<CheckedDomain>> _check(
    String name, {
    required Set<String> tlds,
    bool retry = true,
  }) async {
    final parameters = {
      'tlds': tlds.join(','),
      'hash': _hash(name).toString(),
    };

    final uri1 = Uri.https(
      'instantdomainsearch.com',
      '/services/zone-names/$name',
      parameters,
    );
    final uri2 = Uri.https(
      'instantdomainsearch.com',
      '/services/dns-names/$name',
      parameters,
    );

    late final Iterable<Map<String, dynamic>> decoded;
    for (;;) {
      try {
        decoded = [
          for (final response in await Future.wait([
            uri1,
            uri2,
          ].map(get)))
            if (response.body.isNotEmpty) ...response.body.trim().split('\n'),
        ].map((e) => jsonDecode(e));
        break;
      } catch (_) {
        if (!retry) {
          rethrow;
        }
      }

      await Future.delayed(const Duration(seconds: 2));
    }

    return <CheckedDomain>[
      for (final check in decoded)
        CheckedDomain(
          name,
          check['tld'],
          registeredStatus: switch (check['isRegistered']) {
            true => RegisteredStatus.taken,
            false => RegisteredStatus.available,
            _ => RegisteredStatus.unknown,
          },
        )
    ].mergedByRegisteredStatus;
  }
}

/// It needed for get a correct responce.
int _hash(String name, [int t = 27]) {
  for (int o = 0; o < name.length; ++o) {
    t = ((t << 5) - t + name.codeUnitAt(o)).toSigned(32);
  }

  return t;
}
