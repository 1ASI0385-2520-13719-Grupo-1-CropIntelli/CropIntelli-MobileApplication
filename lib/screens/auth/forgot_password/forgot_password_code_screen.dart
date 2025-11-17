import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'forgot_password_newpass_screen.dart';

class ForgotPasswordCodeScreen extends StatefulWidget {
  const ForgotPasswordCodeScreen({super.key});

  @override
  State<ForgotPasswordCodeScreen> createState() =>
      _ForgotPasswordCodeScreenState();
}

class _ForgotPasswordCodeScreenState extends State<ForgotPasswordCodeScreen> {
  final List<TextEditingController> digits =
      List.generate(6, (_) => TextEditingController());

  bool verified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            _logo(),

            const SizedBox(height: 10),

            const Text(
              "Reestablecer\nContraseña",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text("Ingrese el código de 6 dígitos",
                style: TextStyle(color: AppColors.primary)),

            const SizedBox(height: 14),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (i) => _digitBox(i)),
            ),

            const SizedBox(height: 20),

            _button("Enviar Código", () {
              setState(() => verified = true);

              Future.delayed(const Duration(milliseconds: 900), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ForgotPasswordNewPassScreen(),
                  ),
                );
              });
            }),

            if (verified) ...[
              const SizedBox(height: 12),
              const Text(
                "Código verificado exitosamente",
                style: TextStyle(color: AppColors.primary),
              )
            ]
          ],
        ),
      ),
    );
  }

  Widget _digitBox(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        width: 40,
        child: TextField(
          controller: digits[index],
          textAlign: TextAlign.center,
          maxLength: 1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            fillColor: AppColors.inputBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.spa, color: Colors.white, size: 70),
    );
  }

  Widget _button(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
