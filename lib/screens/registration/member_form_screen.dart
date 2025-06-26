import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_registration/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:family_registration/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/family_member_model.dart';
import '../../providers/family_provider.dart';

class MemberFormScreen extends StatelessWidget {
  const MemberFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final relationController = TextEditingController();
    final dobController = TextEditingController();
    DateTime? selectedDob;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xFF2B0A5C),
        title: Text(
          'REGISTER FAMILY MEMBER ',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.3), height: 1.0),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 51, 4, 92),
              Color.fromARGB(255, 58, 11, 158),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                   style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration:  InputDecoration(hintText: "Name",
                   hintStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    focusedBorder:
                        TTextFormFieldTheme
                            .lightInputDecorationTheme
                            .focusedBorder,
                    enabledBorder:
                        TTextFormFieldTheme
                            .lightInputDecorationTheme
                            .enabledBorder,
                  ),
                ),  SizedBox(height: 10),
                TextField(
                  controller: relationController,
                   style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration:  InputDecoration(hintText: "Relation",
                   hintStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    focusedBorder:
                        TTextFormFieldTheme
                            .lightInputDecorationTheme
                            .focusedBorder,
                    enabledBorder:
                        TTextFormFieldTheme
                            .lightInputDecorationTheme
                            .enabledBorder,
                  ),
                ),  SizedBox(height: 10),
                TextField(
                  controller: dobController,
                   style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  readOnly: true,
                  decoration:  InputDecoration(hintText: "Date of Birth",
                   hintStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    focusedBorder:
                        TTextFormFieldTheme
                            .lightInputDecorationTheme
                            .focusedBorder,
                    enabledBorder:
                        TTextFormFieldTheme
                            .lightInputDecorationTheme
                            .enabledBorder,
                  ),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2010),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      selectedDob = picked;
                      dobController.text = "${picked.toLocal()}".split(' ')[0];
                    }
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(width: double.infinity,
                  child: ElevatedButton(
                    style: TElevatedButtonTheme.lightElevatedButtonTheme.style,
                    onPressed: () async {
                      if (selectedDob != null) {
                        final member = FamilyMember(
                          name: nameController.text,
                          relation: relationController.text,
                          dob: selectedDob!,
                        );
                  
                        // Store in Provider
                        Provider.of<FamilyProvider>(
                          context,
                          listen: false,
                        ).addMember(member);
                  
                        // 🔥 Save to Firestore
                        await FirebaseFirestore.instance
                            .collection('family_members')
                            .add(member.toMap());
                  
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Member added.")),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please select a valid DOB"),
                          ),
                        );
                      }
                    },
                    child: const Text("Add Member"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
