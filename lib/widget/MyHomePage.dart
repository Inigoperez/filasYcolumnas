import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int filas = 1;
  int columas = 1;

  PageController _filasController;
  PageController _columnasController;

  void initState() {
    super.initState();
    _filasController = new PageController();
    _columnasController = new PageController();
    _filasController.addListener(() => _establecerFC());
    _columnasController.addListener(() => _establecerFC());
  }

  void _establecerFC() {
    setState(() {
      filas = _filasController.page.floor() + 1;
      columas = _columnasController.page.floor() + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(),
            SizedBox(
              height: 60,
              child: PageView.builder(
                controller: _filasController,
                itemBuilder: (context, page) {
                  return Center(child: Text('${page + 1}'));
                },
              ),
            ),
            Divider(),
            SizedBox(
              height: 60,
              child: PageView.builder(
                controller: _columnasController,
                itemBuilder: (context, page) {
                  return Center(child: Text('${page + 1}'));
                },
              ),
            ),
            Divider(),
            for (int i = 1; i <= filas; i++)
              Expanded(
                child: Row(
                  children: [
                    for (int y = 1; y <= columas; y++)
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.width,
                          child:
                              Text(y.toString(), textAlign: TextAlign.center),
                          decoration: BoxDecoration(
                            color: Colors.lightGreen[50],
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
