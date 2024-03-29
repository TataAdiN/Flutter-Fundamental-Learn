class CustomerReview {
  String name;
  String review;
  String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  CustomerReview copyWith({
    String? name,
    String? review,
    String? date,
  }) =>
      CustomerReview(
        name: name ?? this.name,
        review: review ?? this.review,
        date: date ?? this.date,
      );

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
    name: json["name"],
    review: json["review"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "date": date,
  };
}