bool isValidEmail(String email){
  RegExp regExp = RegExp( r'^[\w-\.]+@[\w]+\.[\w]{2,4}');
  return regExp.hasMatch(email);
}