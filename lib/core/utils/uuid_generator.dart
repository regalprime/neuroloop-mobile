import 'package:neuroloop/core/utils/id_generator.dart';
import 'package:uuid/uuid.dart';

class UuidGenerator implements IdGenerator {
  const UuidGenerator();

  @override
  String generate() {
    return const Uuid().v4();
  }
}
