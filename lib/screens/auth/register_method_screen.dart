import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'register_screen.dart';

class RegisterMethodScreen extends StatelessWidget {
  const RegisterMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.spa, color: Colors.white, size: 70),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Registro",
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // Botón CropIntelli
            _btn(
              text: "Continuar con CropIntelli",
              color: AppColors.primary,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                );
              },
            ),

            const SizedBox(height: 16),

            // Botón Google (no hace nada)
            _btn(
              text: "Continuar con Google",
              color: Colors.white,
              textColor: Colors.black,
              showGoogle: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _btn({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
    bool showGoogle = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showGoogle)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
                    height: 22,
                  ),
                ),
              Text(text, style: TextStyle(color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
