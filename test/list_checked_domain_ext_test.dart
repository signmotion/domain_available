import 'package:domain_available/domain_available.dart';
import 'package:test/test.dart';

void main() async {
  const checkedA = CheckedDomain(
    'a-domain-for-test',
    'com',
    registeredStatus: RegisteredStatus.unknown,
  );

  group('mergedByRegisteredStatus', () {
    test('empty list', () async {
      const source = <CheckedDomain>[];
      const expected = <CheckedDomain>[];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('one element list', () async {
      const source = <CheckedDomain>[checkedA];
      const expected = source;
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, different domains', () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.taken,
        ),
        checkedA,
        CheckedDomain(
          'facebook',
          'com',
          registeredStatus: RegisteredStatus.taken,
        ),
      ];
      const expected = source;
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, same domains, unknown + unknown status',
        () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.unknown,
        ),
        checkedA,
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.unknown,
        ),
      ];
      final expected = [source.last, checkedA];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, same domains, unknown + available status',
        () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.unknown,
        ),
        checkedA,
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.available,
        ),
      ];
      final expected = [source.last, checkedA];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, same domains, unknown + taken status', () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.unknown,
        ),
        checkedA,
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.taken,
        ),
      ];
      final expected = [source.last, checkedA];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, same domains, available + unknown', () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.available,
        ),
        checkedA,
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.unknown,
        ),
      ];
      final expected = [source.first, checkedA];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, same domains, available + available', () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.available,
        ),
        checkedA,
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.available,
        ),
      ];
      final expected = [source.first, checkedA];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, same domains, available + taken status',
        () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.available,
        ),
        checkedA,
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.taken,
        ),
      ];
      final expected = [source.last, checkedA];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, same domains, taken + unknown', () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.taken,
        ),
        checkedA,
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.unknown,
        ),
      ];
      final expected = [source.first, checkedA];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, same domains, taken + available', () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.taken,
        ),
        checkedA,
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.available,
        ),
      ];
      final expected = [source.first, checkedA];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });

    test('some elements list, same domains, taken + taken status', () async {
      const source = <CheckedDomain>[
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.taken,
        ),
        checkedA,
        CheckedDomain(
          'google',
          'com',
          registeredStatus: RegisteredStatus.taken,
        ),
      ];
      final expected = [source.last, checkedA];
      expect(source.mergedByRegisteredStatus, containsAll(expected));
    });
  });
}
