import 'package:family_registration/utils/constants/sizes.dart';
import 'package:family_registration/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF2B0A5C),
        title: Text(
          'Family Registration Form ',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
         actions: [
          IconButton(
            icon:  Icon(Icons.logout,color: Colors.red,),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
          ),
        ],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.3), height: 1.0),
        ),
      ),
      body: Container(
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
        child: ListView(
          padding:  EdgeInsets.all(20),
          children: [
            OutlinedButton(
              style: TOutlinedButtonTheme.darkOutlinedButtonTheme.style,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.headForm),
              child: const Text("Register Family Head"),
            ),
            SizedBox(height: TSizes.spaceBtwItems,),
            OutlinedButton(
              style: TOutlinedButtonTheme.darkOutlinedButtonTheme.style,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.memberForm),
              child: const Text("Add Family Member"),
            ),
             SizedBox(height: TSizes.spaceBtwItems,),
            OutlinedButton(
              style: TOutlinedButtonTheme.darkOutlinedButtonTheme.style,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.tree),
              child: const Text("View Family Tree"),
            ),
             SizedBox(height: TSizes.spaceBtwItems,),
            OutlinedButton(
              style: TOutlinedButtonTheme.darkOutlinedButtonTheme.style,
              onPressed: () => Navigator.pushNamed(context, AppRoutes.export),
              child: const Text("Export to PDF/Image"),
            ),
          ],
        ),
      ),
    );
  }
}
