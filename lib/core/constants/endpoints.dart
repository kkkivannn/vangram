enum Endpoints {
  sendNumber(path: '/auth/send_number'),
  sendCode(path: '/auth/send_code'),
  posts(path: "/posts"),
  post(path: '/post'),
  refreshToken(path: '/auth/refresh'),
  profile(path: '/user/profile'),
  userPosts(path: '/users_posts'),
  chats(path: '/chat/chats'),
  messages(path: '/chat/messages'),
  user(path: '/user');

  final String path;

  const Endpoints({required this.path});
}
