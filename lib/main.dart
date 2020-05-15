import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo Acessibilidade',
      //showSemanticsDebugger: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Acessibilidade'),
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
  bool _ativo = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: size.width * 0.4,
              child: Image.asset(
                'assets/images/flutter.png',
                semanticLabel: "Logo Flutter",
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Login',
                hintText: "Digite o nome do usuário ou email"
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      semanticLabel: "Mostrar Senha",
                    ),
                    tooltip: "Senha deixará de estar oculta",
                    onPressed: () {}),
              ),
            ),
            MergeSemantics(
              child: Row(children: <Widget>[
                Text('Permanecer Logado ?'),
                Switch(
                    value: _ativo,
                    onChanged: (val) {
                      setState(() {
                        _ativo = val;
                      });
                    })
              ]),
            ),
            RaisedButton(
              child: Text('Login'), 
              onPressed: () {}
            ),
          ],
        ),
      ),
    );
  }
}
