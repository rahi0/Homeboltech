// To parse this JSON data, do
//
//     final adminAllVideoModel = adminAllVideoModelFromJson(jsonString);

import 'dart:convert';

AdminAllVideoModel adminAllVideoModelFromJson(String str) => AdminAllVideoModel.fromJson(json.decode(str));

String adminAllVideoModelToJson(AdminAllVideoModel data) => json.encode(data.toJson());

class AdminAllVideoModel {
    AdminAllVideoModel({
        this.data,
        this.success,
    });

    List<Datum> data;
    bool success;

    factory AdminAllVideoModel.fromJson(Map<String, dynamic> json) => AdminAllVideoModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
    };
}

class Datum {
    Datum({
        this.id,
        this.title,
        this.description,
        this.tutorialCategoryId,
        this.url,
        this.pdf,
        this.createdAt,
        this.updatedAt,
        this.category,
    });

    int id;
    String title;
    String description;
    int tutorialCategoryId;
    String url;
    dynamic pdf;
    DateTime createdAt;
    DateTime updatedAt;
    Category category;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        tutorialCategoryId: json["tutorial_category_id"],
        url: json["url"],
        pdf: json["pdf"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "tutorial_category_id": tutorialCategoryId,
        "url": url,
        "pdf": pdf,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toJson(),
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
