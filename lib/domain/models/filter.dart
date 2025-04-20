class Filter {
  final int? limit;
  final int? offset;
  final String? author;
  final String? title;
  final int? yearStart;
  final int? yearFinish;
  final int? rating;
  final bool? available;

  Filter({
    this.limit,
    this.offset,
    this.author,
    this.title,
    this.yearStart,
    this.yearFinish,
    this.rating,
    this.available,
  });
}
