  String? validateClassNumber(String? value) {
    if (value == null || value.trim().isEmpty || value.length > 2) {
      return 'Please Enter your Class';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value) ||
        int.parse(value) > 12 ||
        int.parse(value) < 0) {
      return 'Please Enter Your Correct Class';
    } else {
      return null;
    }
  }

  String? validateDivision(String? value) {
    if (value == null || value.trim().isEmpty || value.length > 1) {
      return 'Please Enter your Class Division(Alphabetic)';
    } else if (!RegExp(r'^[A-Z\s\-]+$').hasMatch(value)) {
      return 'Please Enter Your Correct Division(Must be in Capital Letters)';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'please Enter the Email correctly';
    }
    if (value.length < 4) {
      return 'Too short';
    }
    if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return ' Please enter a valid email';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty || value.length > 2) {
      return 'Please Enter your Age';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please Enter Your Correct Age';
    } else {
      return null;
    }
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'phone number can\'t be empty';
    }
    if (value.length < 10) {
      return 'only 10 digits.';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return ' Please enter a valid phone number';
    }
    return null;
  }

  String? validateStreet(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Street can\'t be empty';
    }
    return null;
  }