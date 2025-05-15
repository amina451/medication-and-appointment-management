class Valid {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre nom';
    }
    if (value.length < 2) {
      return 'Le nom doit comporter au moins 2 caractères';
    }
    if (value.length > 50) {
      return 'Le nom ne doit pas dépasser 50 caractères';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Le nom ne doit contenir que des lettres et des espaces';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre mot de passe';
    }
    if (value.length < 6) {
      return 'Le mot de passe doit comporter au moins 6 caractères';
    }
    if (value.length > 20) {
      return 'Le mot de passe ne doit pas dépasser 20 caractères';
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]+$').hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins une lettre et un chiffre';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre adresse e-mail';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return 'Veuillez entrer une adresse e-mail valide (ex : utilisateur@exemple.com)';
    }
    return null; 
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre numéro de téléphone';
    }
    if (!value.startsWith('+')) {
      return 'Le numéro de téléphone doit commencer par un indicatif pays (ex : +213)';
    }
    if (!RegExp(r'^\+[1-9]\d{1,14}$').hasMatch(value)) {
      return 'Veuillez entrer un numéro de téléphone valide (ex : +213)';
    }
    return null; 
  }
}
