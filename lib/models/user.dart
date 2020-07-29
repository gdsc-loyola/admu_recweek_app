String firstName;
String email;
String imageUrl;
String displayName;

void getCurrentUser(user) async {
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  displayName = user.displayName;
  firstName = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  // // Only taking the first part of the name, i.e., First Name
  if (firstName.contains(" ")) {
    firstName = firstName.substring(0, firstName.indexOf(" "));
  }
}
