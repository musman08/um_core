enum UserAuthorization{
  pending('pending'),
  rejected('rejected'),
  approved('approved'),
  changeRequest('change request');

  const UserAuthorization(this.name);

  final String name;
}