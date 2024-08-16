extension Validator on String? {
  String? get isValidEmail {
    if (this == null) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this!) ? null : 'Email is invalid';
  }

  // Password {min 8 characters, at least one uppercase letter, one number}
  String? get isStrongPassword {
    if (this == null) return 'Password is required';

    final hasMinLength = this!.length >= 8;
    if (!hasMinLength)return 'Password must contain at least 8 characters';
    
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(this!);
    if (!hasUppercase)return 'Password must contain an uppercase letter';

    final hasDigits = RegExp(r'\d').hasMatch(this!);
    if (!hasDigits) return 'Password must contain a number';

    

    return null;
  }

  bool get isNotEmptyOrNull => this != null && this!.isNotEmpty;
}
