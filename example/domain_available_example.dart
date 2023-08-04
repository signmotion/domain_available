import 'package:domain_available/domain_available.dart';

void main() async {
  final checked = await DomainAvailable('google.com').firstRegisteredStatus();
  print('The domain `${checked.domain}` is ${checked.registeredStatus}.');
}
