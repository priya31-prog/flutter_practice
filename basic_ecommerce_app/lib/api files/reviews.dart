class Reviews {
  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerMail;

  Reviews({
    this.comment,
    this.date,
    this.rating,
    this.reviewerMail,
    this.reviewerName,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      comment: json['comment'] ?? 0,
      date: json['date'] ?? '',
      rating: json['rating'] ?? '',
      reviewerMail: json['reviewerEmail'] ?? '',
      reviewerName: json['reviewerName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'date': date,
      'rating': rating,
      'reviewerEmail': reviewerMail,
      'reviewerName': reviewerName,
    };
  }
}
