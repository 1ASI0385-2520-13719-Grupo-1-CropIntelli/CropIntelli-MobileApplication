import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Ahora empezamos en 0 -> pestaña "Inicio"
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        onGoToDiagnostico: () {
          setState(() {
            _currentIndex = 1;
          });
        },
      ),
      const DiagnosticoPage(),
      const HistorialPage(),
      const ComunidadPage(),
      const PerfilPage(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Diagnóstico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Comunidad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// ===================== INICIO =====================

class HomePage extends StatelessWidget {
  final VoidCallback onGoToDiagnostico;

  const HomePage({super.key, required this.onGoToDiagnostico});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra superior
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40, bottom: 16),
            color: AppColors.primary,
            child: const Center(
              child: Text(
                'Inicio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Bienvenida
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Bienvenido a CropIntelli 🌱",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Monitorea la salud de tus cultivos y toma mejores decisiones cada día.",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Tarjeta principal: CTA diagnóstico
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.agriculture,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Diagnóstico de Cultivos",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Toma una foto de tu cultivo y detecta posibles problemas al instante.",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Botón grande "Diagnosticar ahora"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: onGoToDiagnostico,
                child: const Text(
                  "Diagnosticar ahora",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Acciones rápidas
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Acciones rápidas",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                _QuickActionCard(
                  icon: Icons.history,
                  label: "Ver\nhistorial",
                ),
                _QuickActionCard(
                  icon: Icons.lightbulb_outline,
                  label: "Consejos\nrápidos",
                ),
              ],
            ),
          ),

          const SizedBox(height: 26),

          // Recomendaciones
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Recomendaciones para ti",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 12),
              children: const [
                _RecommendationCard(
                  title: "Cómo prevenir plagas en etapas tempranas",
                  icon: Icons.bug_report_outlined,
                ),
                _RecommendationCard(
                  title: "Riego eficiente para ahorrar agua",
                  icon: Icons.water_drop,
                ),
                _RecommendationCard(
                  title: "Mejora la calidad del suelo",
                  icon: Icons.grass,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickActionCard({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 26),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const _RecommendationCard({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: AppColors.primary),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          
        ],
      ),
    );
  }
}

// ===================== DIAGNÓSTICO =====================

class DiagnosticoPage extends StatelessWidget {
  const DiagnosticoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 40, bottom: 16),
          color: AppColors.primary,
          child: const Center(
            child: Text(
              'Diagnóstico',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 40),

        Container(
          width: 180,
          height: 180,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.photo_camera,
            size: 90,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 32),

        SizedBox(
          width: 220,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Aquí luego conectarás cámara
            },
            child: const Text(
              'Tomar foto del cultivo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'O selecciona una imagen de\n tu galería',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 14,
          ),
        ),

        const Spacer(),
      ],
    );
  }
}

// ===================== PESTAÑAS PLACEHOLDER =====================

class HistorialPage extends StatelessWidget {
  const HistorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Historial',
        style: TextStyle(color: AppColors.primary, fontSize: 20),
      ),
    );
  }
}

class ComunidadPage extends StatelessWidget {
  const ComunidadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Comunidad',
        style: TextStyle(color: AppColors.primary, fontSize: 20),
      ),
    );
  }
}

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Perfil',
        style: TextStyle(color: AppColors.primary, fontSize: 20),
      ),
    );
  }
}
