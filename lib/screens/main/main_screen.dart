import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

// Importamos las pantallas del flujo diagnóstico
import 'diagnostic_howto_screen.dart';
import 'diagnostic_analyzing_screen.dart';
import 'diagnostic_camera_screen.dart';
import 'diagnostic_capture_screen.dart';
import 'diagnostic_result_screen.dart';

// Galería ficticia
import 'diagnostic_gallery_permission_screen.dart';
import 'diagnostic_gallery_mock_screen.dart';

// Importar tu pantalla de INICIO nueva
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),               // Inicio
      _buildDiagnostic(context),        // Diagnóstico
      _placeholder("Historial"),        // Historial
      _placeholder("Comunidad"),        // Comunidad
      _placeholder("Perfil"),           // Perfil
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() => _currentIndex = i);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Diagnóstico"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Historial"),
          BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: "Comunidad"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }

  // ============================
  //   PANTALLA DE DIAGNÓSTICO
  // ============================
  Widget _buildDiagnostic(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Barra superior
            Container(
              height: 60,
              color: AppColors.primary,
              alignment: Alignment.center,
              child: const Text(
                'Diagnóstico',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Ícono principal
            Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.photo_camera,
                size: 96,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 32),

            // Botón de foto del cultivo
            SizedBox(
              width: 260,
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
                      builder: (_) => const DiagnosticHowToScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Tomar foto del cultivo',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 24),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const DiagnosticGalleryPermissionScreen(),
                  ),
                );
              },
              child: const Text(
                "O selecciona una imagen de tu galería",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Pantallas temporales
  Widget _placeholder(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
