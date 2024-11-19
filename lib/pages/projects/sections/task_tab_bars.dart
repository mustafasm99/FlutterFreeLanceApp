import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:finailtask/API/models/projects/task_model.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/projects/widgets/task_widget.dart';
import 'package:flutter/material.dart';

enum TaskStatus {
  toDo,
  inProgress,
  inReview,
  done,
}

class TaskTabBars extends StatelessWidget {
  TaskTabBars({super.key});
  List<Task> tasks = [
    // fake data to handle tha tasks
    Task(
      title: "Task 1",
      status: TaskStatus.toDo.index,
      progress: 50,
      freelancer: "John Doe",
      deadline: "3 days",
    ),
    Task(
      title: "Task 2",
      status: TaskStatus.toDo.index,
      progress: 50,
      freelancer: "Jane Doe",
      deadline: "5 days",
    ),
    Task(
      title: "Task 3",
      status: TaskStatus.inProgress.index,
      progress: 50,
      freelancer: "Jane Doe",
      deadline: "5 days",
    ),
    Task(
      title: "Task 4",
      status: TaskStatus.inProgress.index,
      progress: 50,
      freelancer: "Jane Doe",
      deadline: "5 days",
    ),
    Task(
      title: "Task 5",
      status: TaskStatus.inReview.index,
      progress: 50,
      freelancer: "Jane Doe",
      deadline: "5 days",
    ),
    Task(
      title: "Task 6",
      status: TaskStatus.inReview.index,
      progress: 50,
      freelancer: "Jane Doe",
      deadline: "5 days",
    ),
    Task(
      title: "Task 7",
      status: TaskStatus.done.index,
      progress: 50,
      freelancer: "Jane Doe",
      deadline: "5 days",
    ),
    Task(
      title: "Task 8",
      status: TaskStatus.done.index,
      progress: 50,
      freelancer: "Jane Doe",
      deadline: "5 days",
    ),
  ];

  List<Task> getTasksByStatus(TaskStatus status) {
    return tasks.where((task) => task.status == status.index).toList();
  }

  


  @override
  Widget build(BuildContext context) {
    
    List<Task> doneTasks = getTasksByStatus(TaskStatus.done);
    List<Task> inReviewTasks = getTasksByStatus(TaskStatus.inReview);
    List<Task> inProgressTasks = getTasksByStatus(TaskStatus.inProgress);
    List<Task> toDoTasks = getTasksByStatus(TaskStatus.toDo);


    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: context.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ButtonsTabBar(
                  backgroundColor: context.primaryDark,
                  radius: 20,
                  contentCenter: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  labelSpacing: 25,
                  unselectedBackgroundColor:
                      context.primaryColor.withOpacity(0.1),
                  unselectedBorderColor: context.primaryColor.withOpacity(0.3),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(
                      text: "All Tasks",
                    ),
                    Tab(
                      text: "To Do",
                    ),
                    Tab(
                      text: "In Progress",
                    ),
                    Tab(
                      text: "In Review",
                    ),
                    Tab(
                      text: "Done",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        tasks.length,
                        (index) {
                          return TaskWidget(
                            task: tasks[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        toDoTasks.length,
                        (index) {
                          return TaskWidget(
                            task: toDoTasks[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        inProgressTasks.length,
                        (index) {
                          return TaskWidget(
                           task:inProgressTasks[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        inReviewTasks.length,
                        (index) {
                          return TaskWidget(
                            task:inReviewTasks[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        doneTasks.length,
                        (index) {
                          return TaskWidget(
                            task:doneTasks[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
