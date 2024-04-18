class Utils {
  static String formatDate(DateTime date) {
    // Implement logic to format date
    return '${date.year}-${date.month}-${date.day}';
  }

  static int calculateAge(DateTime birthDate) {
    // Implement logic to calculate age
    final now = DateTime.now();
    var age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}

class Constants {
  static const String appName = 'Recruiting App';
  static const String defaultImageUrl = 'assets/default_image.jpg';
}
