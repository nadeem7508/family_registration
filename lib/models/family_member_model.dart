// lib/models/family_member_model.dart
class FamilyMember {
  final String name;
  final String relation;
  final DateTime dob;

  FamilyMember({
    required this.name,
    required this.relation,
    required this.dob,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'relation': relation,
      'dob': dob.toIso8601String(),
    };
  }
}
