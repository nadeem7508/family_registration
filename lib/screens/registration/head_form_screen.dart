import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_registration/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:family_registration/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../providers/family_provider.dart';

class HeadFormScreen extends StatelessWidget {
  const HeadFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();
    final dobController = TextEditingController();
    final samajController = TextEditingController();
    final templeController = TextEditingController();
    DateTime? selectedDob;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xFF2B0A5C),
        title: Text(
          'REGISTER FAMILY HEAD ',
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
                  decoration: InputDecoration(
                    hintText: "Full Name",
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
                ),
                SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "Phone",
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
                ),
                SizedBox(height: 10),
                TextField(
                  controller: addressController,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "Address",
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
                ),
                SizedBox(height: 10),
                TextField(
                  controller: dobController,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "Date of Birth",
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
                  readOnly: true,
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(1980),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      selectedDob = picked;
                      dobController.text = "${picked.toLocal()}".split(' ')[0];
                    }
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: samajController,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "Samaj",
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
                ),
                SizedBox(height: 10),
                TextField(
                  controller: templeController, style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "Temple",
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
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: TElevatedButtonTheme.lightElevatedButtonTheme.style,
                    onPressed: () async {
                      if (selectedDob != null) {
                        final head = FamilyHead(
                          name: nameController.text,
                          phone: phoneController.text,
                          address: addressController.text,
                          dob: selectedDob!,
                          samaj: samajController.text,
                          temple: templeController.text,
                        );

                        Provider.of<FamilyProvider>(
                          context,
                          listen: false,
                        ).setHead(head);

                        await FirebaseFirestore.instance
                            .collection('family_heads')
                            .add(head.toMap());

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Family Head registered."),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please select a valid date of birth",
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Save Head"),
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
