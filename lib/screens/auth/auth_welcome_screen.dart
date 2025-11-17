import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'login_method_screen.dart';
import 'register_method_screen.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),

            // Logo
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.spa, color: Colors.white, size: 70),
            ),

            const SizedBox(height: 24),

            const Text(
              "Bienvenido a\nCropIntelli",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            // BOTÓN INICIAR SESIÓN
            _btn(
              text: "Iniciar sesión",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginMethodScreen()),
                );
              },
            ),

            const SizedBox(height: 16),

            // BOTÓN REGISTRARSE —–> AHORA SÍ FUNCIONA
            _btn(
              text: "Registrarse",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterMethodScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _btn({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
