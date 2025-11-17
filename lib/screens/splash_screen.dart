import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'auth/auth_welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0;

  @override
  void initState() {
    super.initState();

    // Animación de la barra progresiva
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 120));
      if (!mounted) return false;
      setState(() {
        progress += 0.05;
      });
      return progress < 1;
    });

    // Navegar luego de 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AuthWelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),

            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.spa, color: Colors.white, size: 64),
            ),

            const SizedBox(height: 24),

            const Text(
              'Smart Agriculture\nfor Everyone',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const Spacer(),

            // Barra de carga animada
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: LinearProgressIndicator(
                value: progress,
                color: AppColors.primary,
                backgroundColor: AppColors.inputBackground,
                minHeight: 3,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
