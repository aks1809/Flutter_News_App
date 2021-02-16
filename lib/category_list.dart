import 'package:flutter/material.dart';
import 'categories.dart';

List<Category> _categories = [
  Category("General", "This news is general", "images/general.png"),
  Category("Business", "This news is business", "images/business.png"),
  Category("Entertainment", "This news is entertainment", "images/entertainment.png"),
  Category("Health", "This news is health", "images/health.png"),
  Category("Science", "This news is science", "images/science.png"),
  Category("Sports", "This news is sports", "images/sports.png"),
  Category("Technology", "This news is technology", "images/technology.png"),
];

List<Category> getCategories(){
  return _categories;
}