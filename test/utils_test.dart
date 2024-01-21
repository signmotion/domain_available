import 'package:domain_available/domain_available.dart';
import 'package:test/test.dart';

void main() async {
  group('sanitizeDomain', () {
    test('sanitizing from string', () async {
      const r = 'mydomain.com';
      expect('https://mydomain.com'.sanitizeDomain, r);
      expect('http://mydomain.com/'.sanitizeDomain, r);
      expect('https://www.mydomain.com/'.sanitizeDomain, r);
      expect('https://www.mydomain.com/path/to.html'.sanitizeDomain, r);
    });
  });

  group('splitNameTldDomain', () {
    test('splitting by name and TLD from string', () async {
      const r = ('mydomain', 'com');
      expect('mydomain.com'.splitNameTldDomain, r);
      expect('https://mydomain.com'.splitNameTldDomain, r);
      expect('www.mydomain.com'.splitNameTldDomain, r);
      expect('www.sub.mydomain.com'.splitNameTldDomain, r);
      expect('https://www.mydomain.com/path/to.html'.splitNameTldDomain, r);
    });
  });
}
