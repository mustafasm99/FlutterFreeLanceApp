import "package:finailtask/pages/create_project/create_project.dart";
import "package:finailtask/pages/dashbord/dashboard_view.dart";
import "package:finailtask/pages/home/home.dart";
import "package:finailtask/pages/inpording/impording_page.dart";
import "package:finailtask/pages/login/login_view.dart";
import "package:finailtask/pages/notifications/notifications_view.dart";
import "package:finailtask/pages/profile/profileView.dart";
import "package:finailtask/pages/projects/project_view.dart";
import "package:finailtask/pages/settings/settings_view.dart";
import "package:get/get.dart";

class AppRouter {
  static const String home = "/feed";
  static const String dashboard = "/dashboard";
  static const String impording = "/impording";
  static const String otp = "/otp";
  static const String login = "/login";
  static const String register = "/register";
  static const String feed = "/feed";
  static const String profile = "/profile";
  static const String settings = "/settings";
  static const String createProject = "/create-project";
  static const String project = "/project/:id,:title";
  static const String notifications = "/notifications";
}

class AppPages {
  static final pages = [
    GetPage(name: AppRouter.home, page: () => HomeView() , transition: Transition.fadeIn),
    GetPage(name: AppRouter.impording, page: () => const InpordingView() , transition: Transition.fadeIn),
    GetPage(name: AppRouter.profile, page: () => ProfileView()),
    GetPage(name: AppRouter.settings, page: () => const SettingsView()),
    GetPage(name: AppRouter.createProject, page: () => CreateProject()),
    GetPage(name: AppRouter.dashboard, page:()=> DashboardView()),
    GetPage(name: AppRouter.project, page:()=> ProjectView()),
    GetPage(name: AppRouter.notifications, page:()=> NotificationsView()),
    GetPage(name: AppRouter.login, page:()=> LoginView()),
  ];
}