class Reviews {
  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerMail;

  Reviews({
    this.comment,
    this.date,
    this.rating,
    this.reviewerMail,
    this.reviewerName,
  });

  factory Reviews.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Reviews();
    return Reviews(
      comment: json['comment'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      rating: json['rating'] ?? 0,
      reviewerMail: json['reviewerEmail'] ?? '',
      reviewerName: json['reviewerName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'date': date?.toIso8601String(),
      'rating': rating,
      'reviewerEmail': reviewerMail,
      'reviewerName': reviewerName,
    };
  }
}
