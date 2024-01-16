class Taxonomy {
  int? id;
  String? guid;
  String? slug;
  String? name;

  Taxonomy({
    required this.id,
    required this.guid,
    required this.slug,
    required this.name,
  });

  factory Taxonomy.fromJson(Map<String, dynamic> json) {
    return Taxonomy(
      id: json['id'],
      guid: json['Guid'],
      slug: json['slug'],
      name: json['name']??json['city'],
    );
  }
}

class Category {
  String name;
  String slug;
  List<Taxonomy> taxonomies;

  Category({
    required this.name,
    required this.slug,
    required this.taxonomies,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    List<dynamic> taxonomiesList = json['taxonomies'];
    List<Taxonomy> taxonomies = taxonomiesList.map((taxonomy) => Taxonomy.fromJson(taxonomy)).toList();

    return Category(
      name: json['name'],
      slug: json['slug'],
      taxonomies: taxonomies,
    );
  }
}

class DataModel {
  List<Category> data;

  DataModel({required this.data});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> categoriesList = json['data'];
    List<Category> categories = categoriesList.map((category) => Category.fromJson(category)).toList();

    return DataModel(data: categories);
  }
}
