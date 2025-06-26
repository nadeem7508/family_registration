
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/family_member_model.dart';

class FamilyProvider with ChangeNotifier {
  FamilyHead? _head;
  final List<FamilyMember> _members = [];

  FamilyHead? get head => _head;
  List<FamilyMember> get members => List.unmodifiable(_members);

  void setHead(FamilyHead head) {
    _head = head;
    notifyListeners();
  }

  void addMember(FamilyMember member) {
    _members.add(member);
    notifyListeners();
  }

  void clearFamily() {
    _head = null;
    _members.clear();
    notifyListeners();
  }
}
