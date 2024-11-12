RegExp regExp = RegExp(r'^(07[3-9][0-9]{8})$');
bool PhoneNumberViolation (String phoneNumber) {
  if (!regExp.hasMatch(phoneNumber)) {
    return false;
  }
  return true;
}