import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String dob;
  final String avatarUrl;

  const Profile({
    required this.id,
    required this.name,
    required this.dob,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [id, name, dob, avatarUrl];
}

