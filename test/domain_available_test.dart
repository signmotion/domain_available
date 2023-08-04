import 'package:domain_available/domain_available.dart';
import 'package:test/test.dart';

void main() async {
  group('ok', () {
    test('check a domain available for registration', () async {
      const name = 'mykind456932notregistered0941527';
      const tld = 'org';
      final r = await DomainAvailable('$name.$tld').firstRegisteredStatus();
      expect(
        r,
        equals(const CheckedDomain(
          name,
          tld,
          registeredStatus: RegisteredStatus.available,
        )),
      );
    });

    test('check a domain unavailable for registration', () async {
      const name = 'google';
      const tld = 'com';
      final r = await DomainAvailable('$name.$tld').firstRegisteredStatus();
      expect(
        r,
        equals(const CheckedDomain(
          name,
          tld,
          registeredStatus: RegisteredStatus.taken,
        )),
      );
    });
  });
}
