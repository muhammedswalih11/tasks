class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});

  String get initial => name.isNotEmpty ? name[0].toUpperCase() : '?';
}
