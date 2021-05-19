// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  Dashboard({
    this.totalAmount,
    this.paidAmount,
    this.remainingAmount,
    this.completedProject,
    this.runningProjects,
    this.pendingProject,
    this.totalTask,
    this.completedTask,
    this.totalHours,
    this.totalIncome,
    this.success,
  });

  int totalAmount;
  int paidAmount;
  int remainingAmount;
  int completedProject;
  int runningProjects;
  int pendingProject;
  int totalTask;
  int completedTask;
  int totalHours;
  int totalIncome;
  bool success;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        totalAmount: json["totalAmount"],
        paidAmount: json["paidAmount"],
        remainingAmount: json["remainingAmount"],
        completedProject: json["completedProject"],
        runningProjects: json["runningProjects"],
        pendingProject: json["pendingProject"],
        totalTask: json["totalTask"],
        completedTask: json["completedTask"],
        totalHours: json["totalHours"],
        totalIncome: json["totalIncome"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "totalAmount": totalAmount,
        "paidAmount": paidAmount,
        "remainingAmount": remainingAmount,
        "completedProject": completedProject,
        "runningProjects": runningProjects,
        "pendingProject": pendingProject,
        "totalTask": totalTask,
        "completedTask": completedTask,
        "totalHours": totalHours,
        "totalIncome": totalIncome,
        "success": success,
      };
}
