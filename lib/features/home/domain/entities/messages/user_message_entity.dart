base class UserMessageEntity {
  final int id;
  final String name;
  final String surname;
  final String? photo;

  UserMessageEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.photo,
  });
}
