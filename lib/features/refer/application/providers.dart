import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:referpage/features/refer/domain/models/contactmodel.dart';
import 'package:referpage/features/refer/data/repositary.dart';

final repositoryProvider = Provider<ReferRepository>((ref) {
  return ReferRepository();
});

final referralCodeprovider = Provider<String>((ref) {
  return ref.read(repositoryProvider).fetchReferralCode();
});

final contactsProvider = Provider<List<Contact>>((ref) {
  return ref.read(repositoryProvider).fetchContacts();
});

final selectedButtonProvider = StateProvider<String>((ref) => "All");
final selectedReferralProvider = StateProvider<List<int>>((ref) => []);
