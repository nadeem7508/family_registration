import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/family_provider.dart';

class FamilyTreeScreen extends StatelessWidget {
  const FamilyTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FamilyProvider>(context);
    final head = provider.head;
    final members = provider.members;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xFF2B0A5C),
        title: Text(
          'FAMILY TREE ',
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
        child:
            head == null
                ? const Center(
                  child: Text(
                    "No Head Registered",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNode("👤 Head: ${head.name}"),
                      const Divider(height: 30),
                      const Text(
                        "Family Members:",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...members
                          .map(
                            (m) => _buildNode(
                              "👨‍👩‍👧‍👦 ${m.relation}: ${m.name}",
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildNode(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
        color: Colors.teal.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 14,
          ),),
    );
  }
}
