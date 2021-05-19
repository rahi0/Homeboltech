// To parse this JSON data, do
//
//     final adminPendingTaskModel = adminPendingTaskModelFromJson(jsonString);

import 'dart:convert';

AdminPendingTaskModel adminPendingTaskModelFromJson(String str) => AdminPendingTaskModel.fromJson(json.decode(str));

String adminPendingTaskModelToJson(AdminPendingTaskModel data) => json.encode(data.toJson());

class AdminPendingTaskModel {
    AdminPendingTaskModel({
        this.data,
        this.success,
    });

    List<Datum> data;
    bool success;

    factory AdminPendingTaskModel.fromJson(Map<String, dynamic> json) => AdminPendingTaskModel(
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
        this.projectId,
        this.status,
        this.userId,
        this.agentId,
        this.description,
        this.createdAt,
        this.duration,
        this.user,
        this.tech,
        this.project,
    });

    int id;
    int projectId;
    String status;
    int userId;
    int agentId;
    String description;
    DateTime createdAt;
    int duration;
    Tech user;
    Tech tech;
    Project project;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        projectId: json["project_id"],
        status: json["status"],
        userId: json["user_id"],
        agentId: json["agent_id"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        duration: json["duration"],
        user: Tech.fromJson(json["user"]),
        tech: Tech.fromJson(json["tech"]),
        project: Project.fromJson(json["project"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "project_id": projectId,
        "status": status,
        "user_id": userId,
        "agent_id": agentId,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "duration": duration,
        "user": user.toJson(),
        "tech": tech.toJson(),
        "project": project.toJson(),
    };
}

class Project {
    Project({
        this.id,
        this.addendumId,
        this.addendum,
    });

    int id;
    int addendumId;
    Addendum addendum;

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        addendumId: json["addendum_id"],
        addendum: Addendum.fromJson(json["addendum"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "addendum_id": addendumId,
        "addendum": addendum.toJson(),
    };
}

class Addendum {
    Addendum({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Addendum.fromJson(Map<String, dynamic> json) => Addendum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Tech {
    Tech({
        this.id,
        this.firstname,
        this.lastname,
        this.image,
    });

    int id;
    String firstname;
    String lastname;
    String image;

    factory Tech.fromJson(Map<String, dynamic> json) => Tech(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "image": image,
    };
}