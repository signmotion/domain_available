// ignore_for_file: avoid_print

import 'package:domain_available/domain_available.dart';

void main() async {
  final checked =
      await const DomainAvailable('openai.com').firstRegisteredStatus();
  print('The ${checked.domain} is ${checked.registeredStatus}.');
}
