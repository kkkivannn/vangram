enum Endpoints {
  signUp(path: '/auth/signUp');

  final String path;
  const Endpoints({required this.path});
}
