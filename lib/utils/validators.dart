class Validators {
  static bool isPasswordValid(String password) {
    final hasMinLength = password.length > 6;
    final hasMaxLength = password.length < 10;
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    return hasMinLength && hasMaxLength && hasUppercase && hasSpecialChar;
  }
}
