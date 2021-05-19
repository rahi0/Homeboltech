// To parse this JSON data, do
//
//     final addendumModel = addendumModelFromJson(jsonString);

import 'dart:convert';

AddendumModel addendumModelFromJson(String str) =>
    AddendumModel.fromJson(json.decode(str));

String addendumModelToJson(AddendumModel data) => json.encode(data.toJson());

class AddendumModel {
  AddendumModel({
    this.data,
    this.success,
  });

  List<Datum> data;
  bool success;

  factory AddendumModel.fromJson(Map<String, dynamic> json) => AddendumModel(
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
    this.name,
    this.seniorManagement,
    this.salesDirector,
    this.techSalesAgent,
    this.billableHour,
    this.minPrice,
    this.questions,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  double seniorManagement;
  double salesDirector;
  int techSalesAgent;
  int billableHour;
  int minPrice;
  String questions;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        seniorManagement: json["senior_management"].toDouble(),
        salesDirector: json["sales_director"].toDouble(),
        techSalesAgent: json["tech_sales_agent"],
        billableHour: json["billable_hour"],
        minPrice: json["min_price"],
        questions: json["questions"] == null ? null : json["questions"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "senior_management": seniorManagement,
        "sales_director": salesDirector,
        "tech_sales_agent": techSalesAgent,
        "billable_hour": billableHour,
        "min_price": minPrice,
        "questions": questions == null ? null : questions,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
