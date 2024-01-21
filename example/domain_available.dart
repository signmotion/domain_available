import 'package:domain_available/domain_available.dart';

void main() async {
  final checked = await DomainAvailable('openai.com').firstRegisteredStatus();
  print('The ${checked.domain} is ${checked.registeredStatus}.');
}
