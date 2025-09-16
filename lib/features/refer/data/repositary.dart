import 'package:referpage/features/refer/domain/models/contactmodel.dart';
import 'package:referpage/features/refer/domain/domainservice.dart';

class ReferRepository {
  final service = ReferService();

  String fetchReferralCode() => service.getReferralCode();
  List<Contact> fetchContacts() => service.getContacts();
}
