class CustomCard {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;

  CustomCard({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });


  CustomCard copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return CustomCard(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt, 
    );
  }
}
