

// class TxtParser implements DocumentParser{
//   @override
//   DocumentType get type => DocumentType.txt;
//
//   @override
//     Future<Book> parse(File file) async {
//       final text = await file.readAsString();
//
//       return Book(bookId: const Uuid().v4(), bookTitle: path.basenameWithoutExtension(file.path), blocks: [TextBlock(text: text)]);
//     }
//
// }
