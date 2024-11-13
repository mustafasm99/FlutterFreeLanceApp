import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectIcons {
  static Widget icon(
    String fileName, {
    ColorFilter color = const ColorFilter.mode(Colors.black, BlendMode.srcIn),
    double size = 24.0,
  }) {
    return SvgPicture.asset(
      'assets/icons/$fileName',
      colorFilter: color,
      width: size,
      height: size,
    );
  }

  static Widget arrowRight({Color color = Colors.black, double size = 24.0}) =>
      icon('01_arrow-right-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget home({Color color = Colors.black, double size = 24.0}) =>
      icon('01_home-09.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget view({Color color = Colors.black, double size = 24.0}) =>
      icon('01_view.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget arrowLeft({Color color = Colors.black, double size = 24.0}) =>
      icon('02_arrow-left-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget dashboardSquareEdit({Color color = Colors.black, double size = 24.0}) =>
      icon('02_dashboard-square-edit.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget message({Color color = Colors.black, double size = 24.0}) =>
      icon('02_message-02.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget viewOff({Color color = Colors.black, double size = 24.0}) =>
      icon('02_view-off.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget arrowUp({Color color = Colors.black, double size = 24.0}) =>
      icon('03_arrow-up-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget favorite({Color color = Colors.black, double size = 24.0}) =>
      icon('03_favourite.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget arrowDown({Color color = Colors.black, double size = 24.0}) =>
      icon('04_arrow-down-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget lockPassword({Color color = Colors.black, double size = 24.0}) =>
      icon('04_lock-password.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget userCircle({Color color = Colors.black, double size = 24.0}) =>
      icon('04_user-circle.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget user({Color color = Colors.black, double size = 24.0}) =>
      icon('04_user.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget mail({Color color = Colors.black, double size = 24.0}) =>
      icon('05_mail-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget securityLock({Color color = Colors.black, double size = 24.0}) =>
      icon('05_security-lock.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget cancel({Color color = Colors.black, double size = 24.0}) =>
      icon('06_cancel-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget languageCircle({Color color = Colors.black, double size = 24.0}) =>
      icon('06_language-circle.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget passwordValidation({Color color = Colors.black, double size = 24.0}) =>
      icon('06_password-validation.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget paintBoard({Color color = Colors.black, double size = 24.0}) =>
      icon('07_paint-board.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget userSearch({Color color = Colors.black, double size = 24.0}) =>
      icon('07_user-search-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget edit({Color color = Colors.black, double size = 24.0}) =>
      icon('08_edit-02.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget settings({Color color = Colors.black, double size = 24.0}) =>
      icon('08_settings-02.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget volumeMute({Color color = Colors.black, double size = 24.0}) =>
      icon('09_volume-mute-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget notification({Color color = Colors.black, double size = 24.0}) =>
      icon('10_notification-02.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget logout({Color color = Colors.black, double size = 24.0}) =>
      icon('11_logout-02.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget globe({Color color = Colors.black, double size = 24.0}) =>
      icon('12_globe-02.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget delete({Color color = Colors.black, double size = 24.0}) =>
      icon('13_delete-02.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget plusSign({Color color = Colors.black, double size = 24.0}) =>
      icon('14_plus-sign.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget search({Color color = Colors.black, double size = 15}) =>
      icon('15_search-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget filterHorizontal({Color color = Colors.black, double size = 24.0}) =>
      icon('1_filter-horizontal.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);

  static Widget clock({Color color = Colors.black, double size = 24.0}) =>
      icon('clock-01.svg', color: ColorFilter.mode(color, BlendMode.srcIn), size: size);
}