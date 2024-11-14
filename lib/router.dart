import "package:finailtask/pages/home/home.dart";
import "package:finailtask/pages/inpording/impording_page.dart";
import "package:finailtask/pages/profile/profileView.dart";
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

}

class AppPages {
  static final pages = [
    GetPage(name: AppRouter.home, page: () => const HomeView() , transition: Transition.fadeIn),
    // GetPage(name: Router.dashboard, page: () => DashboardView()),
    GetPage(name: AppRouter.impording, page: () => const InpordingView() , transition: Transition.fadeIn),
    // GetPage(name: AppRouter.otp, page: () => OtpView()),
    // GetPage(name: AppRouter.login, page: () => LoginView()),
    // GetPage(name: AppRouter.register, page: () => RegisterView()),
    GetPage(name: AppRouter.profile, page: () => const ProfileView()),
    GetPage(name: AppRouter.settings, page: () => const SettingsView()),
  ];
}