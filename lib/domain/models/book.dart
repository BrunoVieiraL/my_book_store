class Book {
  final int? id;
  final String cover;
  final String title;
  final String author;
  final String synopsis;
  final int year;
  final int rating;
  final bool available;

  Book({
    this.id,
    required this.cover,
    required this.title,
    required this.author,
    required this.synopsis,
    required this.year,
    required this.rating,
    required this.available,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      cover: json['cover'],
      title: json['title'],
      author: json['author'],
      synopsis: json['synopsis'],
      year: json['year'],
      rating: json['rating'],
      available: json['available'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'cover': cover,
      'title': title,
      'author': author,
      'synopsis': synopsis,
      'year': year,
      'rating': rating,
      'available': available,
    };
  }
}
