import 'package:flutter/material.dart';

class IconMap {
  Icon iconByName(String name) {
    switch (name) {
      case 'Obras':
        return Icon(Icons.engineering);
        break;
      case 'Control de asistencia':
        return Icon(Icons.playlist_add_check);
        break;
      case 'Registro Biométrico':
        return Icon(Icons.fingerprint);
        break;
      case 'Personal':
        return Icon(Icons.groups);
        break;

      case 'Inventario':
        return Icon(Icons.inventory);
        break;

      case 'Equipos':
        return Icon(Icons.agriculture);
        break;

      case 'Usuarios':
        return Icon(Icons.engineering);
        break;
    }
    return Icon(Icons.person);
  }
}
