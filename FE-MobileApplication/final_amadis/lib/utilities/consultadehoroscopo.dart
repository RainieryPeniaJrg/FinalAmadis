class TrafficAgentHoroscope {
  static final Map<String, List<String>> _recommendations = {
    'Aries': [
      'Hoy, mantén la calma en situaciones de tráfico intenso.',
      'Evita discusiones innecesarias al realizar inspecciones.',
      'Concéntrate en áreas problemáticas conocidas.'
    ],
    'Tauro': [
      'Prepárate para enfrentar desafíos en la gestión de tráfico.',
      'No descuides la revisión de documentación importante.',
      'Sé paciente al lidiar con conductores irritados.'
    ],
    'Géminis': [
      'Comunica claramente las regulaciones de tráfico.',
      'Explora nuevas estrategias para mejorar la seguridad vial.',
      'Mantén una comunicación efectiva con el equipo.'
    ],
    'Cáncer': [
      'Ten cuidado al realizar inspecciones en condiciones climáticas adversas.',
      'Confía en tu intuición al evaluar situaciones de tráfico.',
      'Asegúrate de seguir los procedimientos de seguridad.'
    ],
    'Leo': [
      'Destaca en la aplicación justa de multas y regulaciones.',
      'Mantén una actitud profesional ante desafíos inesperados.',
      'Hoy es un buen día para liderar con ejemplos positivos.'
    ],
    'Virgo': [
      'Organiza eficientemente tus tareas y rutas de patrullaje.',
      'Revisa minuciosamente la documentación de infracciones.',
      'Sé proactivo en la prevención de infracciones.'
    ],
    'Libra': [
      'Encuentra el equilibrio justo al aplicar multas.',
      'Fomenta un ambiente de respeto durante inspecciones.',
      'Hoy es propicio para tomar decisiones justas.'
    ],
    'Escorpio': [
      'Aborda desafíos con determinación y confianza.',
      'Investiga a fondo situaciones de tráfico complicadas.',
      'Evita revelar tus estrategias de patrullaje.'
    ],
    'Sagitario': [
      'Atrévete a explorar nuevas áreas de patrullaje.',
      'Sé optimista al enfrentar desafíos en la carretera.',
      'Mantén una actitud positiva hacia la seguridad vial.'
    ],
    'Capricornio': [
      'Persiste en la aplicación justa de regulaciones de tráfico.',
      'Enfócate en metas a largo plazo para mejorar la seguridad.',
      'Hoy es propicio para logros notables en el control de tráfico.'
    ],
    'Acuario': [
      'Mantén una mente abierta para abordar problemas de tráfico.',
      'Contribuye a la seguridad vial de la comunidad.',
      'Explora ideas innovadoras para mejorar la eficiencia.'
    ],
    'Piscis': [
      'Confía en tu intuición al identificar infracciones.',
      'Cultiva la compasión al tratar con conductores.',
      'Hoy es propicio para la resolución pacífica de conflictos viales.'
    ],
  };

  static String getRecommendation(String sign) {
    final recommendations = _recommendations[sign] ?? [];
    if (recommendations.isNotEmpty) {
      final randomIndex = DateTime.now().day % recommendations.length;
      return recommendations[randomIndex];
    } else {
      return 'No se encontró una recomendación para este signo.';
    }
  }
}
