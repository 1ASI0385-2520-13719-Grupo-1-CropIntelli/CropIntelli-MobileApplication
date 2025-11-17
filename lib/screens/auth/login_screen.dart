import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'forgot_password/forgot_password_email_screen.dart';
import '../main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showSuccessMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),

                // Flecha atrás
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.primary, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 20),

                // Logo
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

                const SizedBox(height: 18),

                // Título
                const Text(
                  "Iniciar Sesión",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 30),

                // Usuario
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: userController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Usuario",
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Contraseña
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Contraseña",
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Olvidó contraseña
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ForgotPasswordEmailScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "¿Olvidó Contraseña?",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Botón iniciar sesión
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        showSuccessMessage = true;
                      });

                      Future.delayed(const Duration(milliseconds: 800), () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainScreen(),
                          ),
                          (route) => false,
                        );
                      });
                    },
                    child: const Text(
                      "Iniciar sesión",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                if (showSuccessMessage) ...[
                  const SizedBox(height: 12),
                  const Text(
                    "Inicio de Sesión exitoso",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
