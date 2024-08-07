
import 'package:flutter/cupertino.dart';
import 'package:task_bbc/articleDetailes_and_Register_page/Register.dart';
import 'package:task_bbc/articleDetailes_and_Register_page/article_detailes.dart';

class RouteManager{
 static Map<String,WidgetBuilder> route={
   RouteName.ArticleDetailesPage:(context)=> ArticleDetailes(),
   RouteName.registerPage:(context)=>RegisterPage(),
 };
}




class RouteName{
   static const  String ArticleDetailesPage = 'ArticleDetailes';
   static const  String registerPage = 'RegisterPage';
}