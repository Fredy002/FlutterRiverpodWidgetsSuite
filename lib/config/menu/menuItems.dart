// ignore_for_file: file_names
import 'package:flutter/material.dart' show IconData, Icons;

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: 'Botones',
      subtitle: 'Varios botones de flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: 'Tarjetas',
      subtitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'Progress Indicators',
      subtitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItems(
      title: 'Snackbar and dialogs',
      subtitle: 'Display indicators',
      link: '/snackbars',
      icon: Icons.info_outline),
      MenuItems(
      title: 'Animated Container',
      subtitle: 'Stateful widget animated',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
];
