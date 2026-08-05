// import 'dart:io';

// import 'package:path/path.dart' as path;
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'package:uuid/uuid.dart';

// import '../../domain/entities/book.dart';
// import '../../domain/entities/book_block.dart';
// import '../../domain/entities/book_content.dart';
// import '../../domain/entities/book_metadata.dart';
// import '../../domain/entities/book_resources.dart';
// import '../../domain/entities/document_type.dart';
// import '../../domain/entities/reading_progress.dart';
// import 'document_parser.dart';

// class PdfParser implements DocumentParser {
//   const PdfParser();

//   static const Uuid _uuid = Uuid();

//   @override
//   DocumentType get type => DocumentType.pdf;

//   @override
//   Future<Book> parse(File file) async {
//     final bytes = await file.readAsBytes();

//     final document = PdfDocument(
//       inputBytes: bytes,
//     );

//     try {
//       final extractor = PdfTextExtractor(document);

//       final List<BookBlock> blocks = [];

//       int totalWords = 0;

//       for (int page = 0; page < document.pages.count; page++) {
//         final pageText = extractor.extractText(
//           startPageIndex: page,
//           endPageIndex: page,
//         );

//         final paragraphs = pageText.split(RegExp(r'\n\s*\n')).map((e) => e.trim()).where((e) => e.isNotEmpty);

//         for (final paragraph in paragraphs) {
//           totalWords += paragraph.split(RegExp(r'\s+')).where((e) => e.isNotEmpty).length;

//           blocks.add(
//             TextBlock(
//               id: _uuid.v4(),
//               text: paragraph,
//             ),
//           );
//         }

//         if (page != document.pages.count - 1) {
//           blocks.add(
//             PageBreakBlock(
//               id: _uuid.v4(),
//               pageNumber: page + 1,
//             ),
//           );
//         }
//       }

//       return Book(
//         metadata: BookMetadata(
//           id: _uuid.v4(),
//           title: path.basenameWithoutExtension(file.path),
//           author: null,
//           description: null,
//           thumbnail: null,
//           language: 'unknown',
//           totalPages: document.pages.count,
//           wordCount: totalWords,
//           importedAt: DateTime.now(),
//           type: DocumentType.pdf,
//         ),
//         content: BookContent(
//           blocks: blocks,
//         ),
//         progress: const ReadingProgress(
//           currentPage: 1,
//           progress: 0,
//           lastBlockId: null,
//           lastReadAt: null,
//         ),
//         resources: const BookResources(),
//       );
//     } finally {
//       document.dispose();
//     }
//   }
// }
