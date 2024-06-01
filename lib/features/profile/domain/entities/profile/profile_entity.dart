base class ProfileEntity {
  final int? id;
  final String? name;
  final String? surname;
  final int? age;
  final String? phone;
  final String? photo;

  ProfileEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.age,
    required this.phone,
    required this.photo,
  });
}
