import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_base/views/root.dart';
import 'package:flutter_base/views/users/collection.dart';

import 'package:flutter_base/themes/colors.dart' as ZJColors;
import 'package:flutter_base/themes/fonts.dart' as ZJFonts;
import 'themes/metrics.dart';

import 'package:flutter_base/routers/application.dart';
import 'package:flutter_base/routers/routers.dart';

import 'blocs/bloc_index.dart';

void main() => runApp(BlocProvider(
      bloc: ApplicationBloc(),
      child: MainApp(),
    ));

class MainApp extends StatefulWidget {
  MainApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  final Map<String, WidgetBuilder> routes = {
    '/collection': (context) => Collection()
  };

  @override
  void initState() {
    super.initState();
    _initListener();
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.configStream.listen((params) {
      print('~~~~~~~~~~~$params~~~~~~~~~');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'base',
      initialRoute: "/",
      routes: routes,
      theme: new ThemeData(
        primaryColor: Color(ZJColors.primaryColor),
        // backgroundColor: Color(ZJColors.backgroundColor),
        backgroundColor: Colors.cyan,
        accentColor: Color(ZJColors.accentColor),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(ZJColors.accentColor),
            fontSize: ZJFonts.body1,
          ),
        ),
        iconTheme: IconThemeData(
            color: Color(ZJColors.primaryColor), size: IconSize.large),
      ),
      home: new Scaffold(
        body: new Center(
          child: new Root(),
        ),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}
