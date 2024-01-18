class CategoryModel {
  final String? id;
  final String name;
  final List<String>? subCategories;

  CategoryModel({required this.id, required this.name, this.subCategories});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      subCategories: json['subCategories'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subCategories': subCategories,
    };
  }
}