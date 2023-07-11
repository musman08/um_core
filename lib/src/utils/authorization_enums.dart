enum UserAuthorization{
  pending('pending'),
  rejected('rejected'),
  approved('approved'),
  changeRequest('change request');

  const UserAuthorization(this.name);

  final String name;
}

enum UserAuthentication{
  wrongPassword('wrong-password'),
  userNotFound('user-not-found'),
  weakPassword('weak-password'),
  existingEmail('email-already-in-use');

  const UserAuthentication(this.name);
  final String name;
}