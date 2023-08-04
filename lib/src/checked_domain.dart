import 'registered_domain_status.dart';

class CheckedDomain implements Comparable<CheckedDomain> {
  final String name;
  final String tld;
  final RegisteredStatus registeredStatus;

  const CheckedDomain(
    this.name,
    this.tld, {
    required this.registeredStatus,
  });

  String get domain => '$name.$tld';

  bool get unknown => registeredStatus == RegisteredStatus.unknown;
  bool get available => registeredStatus == RegisteredStatus.available;
  bool get taken => registeredStatus == RegisteredStatus.taken;

  @override
  int compareTo(CheckedDomain other) =>
      registeredStatus.index.compareTo(other.registeredStatus.index);

  @override
  bool operator ==(Object other) =>
      other is CheckedDomain ? compareTo(other) == 0 : false;

  @override
  int get hashCode => Object.hashAll([name, tld, registeredStatus]);

  @override
  String toString() => '$domain ${registeredStatus.name}';
}
