import 'package:flutter/material.dart';
import 'package:hellohand_mobile/core/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: _buildCurrentScreen(),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }
  
  Widget _buildCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return _buildChatContent();
      case 2:
        return _buildDictionaryContent();
      case 3:
        return _buildSettingsContent();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Header
          _buildHeader(),
          const SizedBox(height: 40),
          
          // Botones principales de traducción
          _buildMainButtons(),
          const SizedBox(height: 40),
          
          // Botón de micrófono central
          _buildMicrophoneButton(),
          const SizedBox(height: 40),
          
          // Instrucciones
          _buildInstructions(),
          const SizedBox(height: 40),
          
          // Confianza de traducción
          _buildConfidenceIndicator(),
          
          const Spacer(),
          
          // Botones de acción rápida
          _buildQuickActions(),
        ],
      ),
    );
  }
  
  Widget _buildHeader() {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
          child: const Text(
            'HelloHand',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Comunicación sin barreras - Bidireccional',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  
  Widget _buildMainButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildModeButton(
            'Voz → Señas',
            Icons.mic,
            AppColors.primaryGradient,
            isSelected: true,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildModeButton(
            'Señas → Voz',
            Icons.videocam,
            const LinearGradient(
              colors: [AppColors.textMuted, AppColors.textMuted],
            ),
            isSelected: false,
          ),
        ),
      ],
    );
  }
  
  Widget _buildModeButton(String text, IconData icon, Gradient gradient, {required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        gradient: isSelected ? gradient : null,
        color: isSelected ? null : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColors.borderSecondary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildMicrophoneButton() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Función de micrófono por implementar')),
        );
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryPurple.withValues(alpha: 0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: const Icon(
          Icons.mic,
          color: Colors.white,
          size: 48,
        ),
      ),
    );
  }
  
  Widget _buildInstructions() {
    return Column(
      children: [
        const Text(
          'Toca el micrófono para hablar',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        _buildInstructionCard('Presiona el micrófono para hablar', Icons.check_circle, AppColors.success),
        const SizedBox(height: 8),
        _buildInstructionCard('La voz se convertirá en texto y señas', Icons.check_circle, AppColors.success),
      ],
    );
  }
  
  Widget _buildInstructionCard(String text, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSecondary),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildConfidenceIndicator() {
    return Column(
      children: [
        const Text(
          'Confianza de traducción',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: 0.85,
          backgroundColor: AppColors.surfaceVariant,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryPurple),
        ),
        const SizedBox(height: 4),
        const Text(
          '85%',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
  
  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton('Limpiar', Icons.clear_all, Colors.orange),
        _buildActionButton('Leer', Icons.volume_up, AppColors.success),
        _buildActionButton('Guardar', Icons.save, Colors.blue),
      ],
    );
  }
  
  Widget _buildActionButton(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
  
  Widget _buildChatContent() {
    return const Center(
      child: Text(
        'Chat\n(Por implementar)',
        style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
  
  Widget _buildDictionaryContent() {
    return const Center(
      child: Text(
        'Diccionario\n(Por implementar)',
        style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
  
  Widget _buildSettingsContent() {
    return const Center(
      child: Text(
        'Ajustes\n(Por implementar)',
        style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
  
  Widget _buildBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.borderSecondary),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.primaryPurple,
        unselectedItemColor: AppColors.textMuted,
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'INICIO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'CHAT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'DICCIONARIO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'AJUSTES',
          ),
        ],
      ),
    );
  }
}