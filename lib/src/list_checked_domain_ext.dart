import 'checked_domain.dart';
import 'registered_status.dart';

extension ListCheckedDomainExt on List<CheckedDomain> {
  /// Removes duplicates detected by [CheckedDomain.domain].
  List<CheckedDomain> get mergedByRegisteredStatus {
    Map<String, CheckedDomain> r = <String, CheckedDomain>{};
    for (final ch in this) {
      final earlyStatus =
          r[ch.domain]?.registeredStatus ?? RegisteredStatus.unknown;
      final currentStatus = ch.registeredStatus;
      r[ch.domain] = CheckedDomain(
        ch.name,
        ch.tld,
        registeredStatus: switch (currentStatus) {
          RegisteredStatus.taken => currentStatus,
          RegisteredStatus.available => earlyStatus == RegisteredStatus.unknown
              ? RegisteredStatus.available
              : earlyStatus,
          RegisteredStatus.unknown => earlyStatus,
        },
      );
    }

    return r.values.toList();
  }
}
