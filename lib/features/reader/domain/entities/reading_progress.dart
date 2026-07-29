class ReadingProgress {
  final int currentPage;

  final double progress;

  final String? lastBlockId;

  final DateTime? lastReadAt;

  const ReadingProgress({
    required this.currentPage,
    required this.progress,
    this.lastBlockId,
    this.lastReadAt,
  });
}
