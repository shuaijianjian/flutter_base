import 'package:flutter/material.dart';
import 'package:flutter_base/model/user.dart';

class Collection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionState();
  }
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: AppBar(
        title: new Text('我的收藏'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text("${user.name ?? ''} ${user.email ?? ''}"),
        ),
      ),
    );
  }
}
