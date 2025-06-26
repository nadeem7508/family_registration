class FamilyHead {
  final String name;
  final String phone;
  final String address;
  final String samaj;
  final String temple;
  final DateTime dob;

  FamilyHead({
    required this.name,
    required this.phone,
    required this.address,
    required this.samaj,
    required this.temple,
    required this.dob,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'samaj': samaj,
      'temple': temple,
      'dob': dob.toIso8601String(),
    };
  }
}
