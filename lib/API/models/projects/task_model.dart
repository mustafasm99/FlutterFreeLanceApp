class Task {
  final String title;
  final int status;
  final double progress;
  final String? freelancer;
  final String? deadline;

  Task({
    required this.title,
    required this.status,
    required this.progress,
    this.freelancer,
    this.deadline,
  });


  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      status: json['status'],
      progress: json['progress'],
      freelancer: json['freelancer'],
      deadline: json['deadline'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'status': status,
      'progress': progress,
      'freelancer': freelancer,
      'deadline': deadline,
    };
  }
}