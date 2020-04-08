import 'package:flutter/material.dart';
import 'package:omega/bloc/notification_bloc.dart';
import 'package:omega/service/db/database_provider.dart';
import 'package:omega/service/repository/notification_repo_implementation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = NotificationBloc();
  final repo = NotificationRepositoryImpl(DatabaseProvider.get);

  Future getUpdatedNotifications() async {
    await bloc.updateNotifications();
    final list = await repo.getUnSeen();
    if (list != null && list.isNotEmpty) {
      showNotifications();
    }
  }

  showNotifications() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(
            'اطلاعیه‌ها',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'بستن',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          content: Text('ccc'),
        ),
      ),
    ).whenComplete((){
      bloc.setSeenAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    getUpdatedNotifications();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          //
          //
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have :',
            ),
            Text('Omega Test Project'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
