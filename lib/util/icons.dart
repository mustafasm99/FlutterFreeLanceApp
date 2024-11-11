import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectIcons {
  static const arrowDown = ImageIcon(AssetImage('assets/icons/arrow-down.png'));
  static const arrowUp = ImageIcon(AssetImage('assets/icons/arrow-up.png'));
  static const arrowLeft = ImageIcon(AssetImage('assets/icons/arrow-left.png'));
  static const arrowRight = ImageIcon(AssetImage('assets/icons/arrow-right.png'));
  static const cancel = ImageIcon(AssetImage('assets/icons/cancel.png'));
  static const dashboard = ImageIcon(AssetImage('assets/icons/dashboard-square-edit.png'));
  static const delete = ImageIcon(AssetImage('assets/icons/delete.png'));
  static const eay = ImageIcon(AssetImage('assets/icons/eay.png'));
  static const favorite = ImageIcon(AssetImage('assets/icons/favorite.png'));
  static const filter = ImageIcon(AssetImage('assets/icons/filter-horizontal.png'));
  static const fullArrowLeft = ImageIcon(AssetImage('assets/icons/full-arrow-left.png'));
  static const fullArrowRight = ImageIcon(AssetImage('assets/icons/full-arrow-right.png'));
  static const globe = ImageIcon(AssetImage('assets/icons/globe.png'));
  static const home = ImageIcon(AssetImage('assets/icons/home.png'));
  static const language = ImageIcon(AssetImage('assets/icons/language-circle.png'));
  static const lockPassword = ImageIcon(AssetImage('assets/icons/lock-password.png'));
  static const logout = ImageIcon(AssetImage('assets/icons/logout.png'));
  static const mail = ImageIcon(AssetImage('assets/icons/mail-01.png'));
  static const message = ImageIcon(AssetImage('assets/icons/message-02.png'));
  static const notification = ImageIcon(AssetImage('assets/icons/notification.png'));
  static const printBoard = ImageIcon(AssetImage('assets/icons/print-board.png'));
  static const plus = ImageIcon(AssetImage('assets/icons/plus-sign.png'));
  static const search = ImageIcon(AssetImage('assets/icons/search.png'));
  static const settings = ImageIcon(AssetImage('assets/icons/settings.png'));
  static const securityLock = ImageIcon(AssetImage('assets/icons/security-lock.png'));
  static const userCircle = ImageIcon(AssetImage('assets/icons/user-circle.png'));
  static const userSearch = ImageIcon(AssetImage('assets/icons/user-search.png'));
  static Widget user({double? size, Color? color = Colors.black}) {
    return SvgPicture.asset(
      'assets/icons/user.svg',
      height: size,
      width: size,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
  static const viewOff = ImageIcon(AssetImage('assets/icons/view-off.png'));
  static const volumeMute = ImageIcon(AssetImage('assets/icons/volume-mute.png'));

  // static Widget icons(String iconName , {double?size , Color? color}){
  //   return ImageIcon(AssetImage('assets/icons/$iconName.png'),size: size,color: color,);
  // }

}