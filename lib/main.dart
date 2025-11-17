import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'screens/auth/auth_welcome_screen.dart';

void main() {
  runApp(const CropIntelliApp());
}

class CropIntelliApp extends StatelessWidget {
  const CropIntelliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CropIntelli',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(), // 👉 OJO: aquí sí podemos usar const
    );
  }
}

/// SPLASH SCREEN DENTRO DE MAIN.DART
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();

    // Controlador de 2 segundos para la barra
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _progress = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Cuando termina la animación, navegamos a la pantalla de bienvenida
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const AuthWelcomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),

            // Logo
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(
                    Icons.spa,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Texto "Smart Agriculture for Everyone"
            const Center(
              child: Text(
                'Smart Agriculture\nfor Everyone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),

            const Spacer(),

            // Barra de carga animada
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _progress,
                      builder: (context, child) {
                        return Stack(
                          children: [
                            // Línea de fondo (clarita)
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: AppColors.inputBackground.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                            // Línea que se va llenando
                            FractionallySizedBox(
                              widthFactor: _progress.value,
                              child: Container(
                                height: 2,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
