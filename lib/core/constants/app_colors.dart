import 'package:flutter/material.dart';

class AppColors {
  // Colores principales del tema HelloHand (basados en el diseño web)
  static const Color primaryPurple = Color(0xFF8B5CF6);
  static const Color primaryPink = Color(0xFFE879F9);
  static const Color darkBackground = Color(0xFF1A0828);
  static const Color darkSecondary = Color(0xFF2D1B69);
  
  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryPurple, primaryPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [darkBackground, darkSecondary, darkBackground],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Estados y feedback
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);
  
  // Textos
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFD1D5DB);
  static const Color textMuted = Color(0xFF9CA3AF);
  
  // Superficies
  static const Color surface = Color(0xFF1F2937);
  static const Color surfaceVariant = Color(0xFF374151);
  static const Color cardBackground = Color(0x0DFFFFFF); // 5% white opacity
  
  // Bordes
  static const Color borderPrimary = Color(0x338B5CF6); // 20% purple opacity
  static const Color borderSecondary = Color(0x1AFFFFFF); // 10% white opacity
}