import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'diagnostic_result_screen.dart';

class DiagnosticAnalyzingScreen extends StatefulWidget {
  const DiagnosticAnalyzingScreen({super.key});

  @override
  State<DiagnosticAnalyzingScreen> createState() =>
      _DiagnosticAnalyzingScreenState();
}

class _DiagnosticAnalyzingScreenState extends State<DiagnosticAnalyzingScreen> {
  @override
  void initState() {
    super.initState();

    // Simula análisis por 2 segundos y luego muestra el resultado
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const DiagnosticResultScreen(),
        ),
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
            Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Analizando el cultivo',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Espera unos segundos mientras se realiza el diagnóstico...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
