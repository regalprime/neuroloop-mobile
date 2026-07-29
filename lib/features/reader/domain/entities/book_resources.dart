import 'book_resource.dart';
import 'resource_type.dart';

class BookResources {
  final Map<String, BookResource> resources;

  const BookResources({
    this.resources = const {},
  });

  BookResource? findById(String id) {
    return resources[id];
  }

  List<BookResource> findByType(ResourceType type) {
    return resources.values.where((resource) => resource.type == type).toList();
  }

  bool contains(String id) {
    return resources.containsKey(id);
  }

  int get length => resources.length;

  bool get isEmpty => resources.isEmpty;

  bool get isNotEmpty => resources.isNotEmpty;
}
