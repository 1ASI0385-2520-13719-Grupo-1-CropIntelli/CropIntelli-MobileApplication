import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'diagnostic_analyzing_screen.dart';

class DiagnosticGalleryMockScreen extends StatelessWidget {
  const DiagnosticGalleryMockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(12, (index) => index);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Barra superior tipo galería
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 4),
                  const Expanded(
                    child: Text(
                      'Recientes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.collections),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),

            // Grid de imágenes
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final isRealPlant = index == 0;

                  return GestureDetector(
                    onTap: () {
                      // Da igual cuál toquen, simulamos que eligieron la foto
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DiagnosticAnalyzingScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isRealPlant
                            ? Colors.transparent
                            : AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(6),
                        image: isRealPlant
                            ? const DecorationImage(
                                image: AssetImage('assets/example_plant.jpg'),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: isRealPlant
                          ? null
                          : const Icon(
                              Icons.image,
                              color: Color(0xFFB0B0B0),
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
