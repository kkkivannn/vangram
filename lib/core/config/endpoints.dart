enum Endpoints {
  sendNumber(path: '/auth/send_number'),
  sendCode(path: '/auth/send_code'),
  user(path: '/user');

  final String path;

  const Endpoints({required this.path});
}
