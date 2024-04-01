enum Endpoints {
  sendNumber(path: '/auth/send_number'),
  sendCode(path: '/auth/send_code'),
  posts(path: "/posts"),
  refreshToken(path: '/auth/refresh'),
  profile(path: '/user/profile'),
  user(path: '/user');

  final String path;

  const Endpoints({required this.path});
}
