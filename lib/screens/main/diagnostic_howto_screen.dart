import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'diagnostic_camera_screen.dart';

class DiagnosticHowToScreen extends StatelessWidget {
  const DiagnosticHowToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra superior
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 48),
                    child: Text(
                      'Diagnóstico',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ).copyWithBackground(),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Cómo tomar la foto',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 16),

            const _InstructionStep(
              number: 1,
              text: 'Captura a una distancia corta.',
            ),
            const _InstructionStep(
              number: 2,
              text: 'Asegúrate de que la foto no esté borrosa.',
            ),
            const _InstructionStep(
              number: 3,
              text: 'Toma la foto en condiciones de buena luminosidad.',
            ),

            const SizedBox(height: 32),

            // Ilustración (placeholder)
            Expanded(
              child: Center(
                child: Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.phone_iphone,
                    size: 80,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DiagnosticCameraScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Entendido',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InstructionStep extends StatelessWidget {
  final int number;
  final String text;

  const _InstructionStep({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.primary,
            child: Text(
              number.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Extension para poner fondo verde en la barra superior
extension _HeaderBg on Row {
  Widget copyWithBackground() {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: this,
    );
  }
}
