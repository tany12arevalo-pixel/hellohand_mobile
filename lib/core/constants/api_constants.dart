class ApiConstants {
  // URL base de tu backend Django
  static const String baseUrl = 'https://192.168.137.88:8021';
  static const String apiUrl = '$baseUrl/api';
  
  // Endpoints del backend
  static const String roomsEndpoint = '$apiUrl/rooms';
  static const String translatorEndpoint = '$apiUrl/translator';
  
  // WebSocket URLs
  static const String wsBaseUrl = 'wss://192.168.137.88:8021';
  static const String chatWsUrl = '$wsBaseUrl/ws/chat';
  
  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // Configuración de la app
  static const String appName = 'HelloHand';
  static const String appVersion = '1.0.0';
  
  // Configuración de traducción
  static const double defaultConfidenceThreshold = 0.3;
  static const int maxRecentTranslations = 10;
}
