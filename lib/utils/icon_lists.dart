import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons{
  final List<Map<String, dynamic>> homeExpensesCategories=[
    {
      "name": "Combustible/Gas",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name":"Insumos para el hogar",
      "icon": FontAwesomeIcons.cartShopping,
    },
    {
      "name":"Leche",
      "icon": FontAwesomeIcons.mugHot,
    },
    {
      "name":"Internet",
      "icon":FontAwesomeIcons.wifi,
    },
    {
      "name":"Electricidad",
      "icon":FontAwesomeIcons.bolt,
    },
    {
      "name":"Agua",
      "icon":FontAwesomeIcons.water,
    },
    {
      "name":"Alquiler",
      "icon": FontAwesomeIcons.house
    },
    {
      "name":"Cuota telefonía",
      "icon": FontAwesomeIcons.phone,
    },
    {
      "name":"Salida a cenar",
      "icon":FontAwesomeIcons.utensils,
    },
    {
      "name":"Entretenimiento",
      "icon":FontAwesomeIcons.film,
    },
    {
      "name":"Salud",
      "icon":FontAwesomeIcons.bookMedical
    },
    {
      "name":"Transporte",
      "icon":FontAwesomeIcons.bus,
    },
    {
      "name":"Vestimenta",
      "icon":FontAwesomeIcons.shirt
    },
    {
      "name":"Alimentos",
      "icon":FontAwesomeIcons.bowlFood
    },
    {
      "name":"Educación",
      "icon":FontAwesomeIcons.graduationCap,
    },
    {
      "name":"Otros",
      "icon":FontAwesomeIcons.cartPlus,
    },

  ];
  IconData getExpenseCategoryIcons(String categoryName){
    final category=homeExpensesCategories.firstWhere(
            (category) => category['name']==categoryName,
            orElse: () => {"icon":FontAwesomeIcons.car});
    return category['icon'];
  }
}