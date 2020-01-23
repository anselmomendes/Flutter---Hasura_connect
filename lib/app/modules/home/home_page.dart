import 'package:flutter/material.dart';
import 'package:hasura/app/app_repository.dart';
import 'package:hasura/app/model/model_user.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: FutureBuilder<ModelUser>(
                future: search('Anselmo'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Text(snapshot.data.nome);
                }),
          ),
          Card(
            child: FutureBuilder<ModelUser>(
                future: search('Anselmo'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Text(snapshot.data.sobrenome);
                }),
          ),
          Card(
            child: FutureBuilder<ModelUser>(
                future: search('Anselmo'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Text(snapshot.data.id.toString());
                }),
          ),
          Card(
            child: FutureBuilder<ModelUser>(
                future: createUser('Anselmo3'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Text(snapshot.data.dataDeNascimento.day.toString());
                }),
          ),
        ],
      ),
    );
  }
}
