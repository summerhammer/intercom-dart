import 'package:flutter/material.dart';
import 'package:intercom_api/intercom_api.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intercom API Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Intercom Client Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final client = Client.accessToken('YOUR_ACCESS_TOKEN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(
              onPressed: () async {
                final tags = await client.tags.list();
                debugPrint('$tags');
              },
              child: const Text('Get Tags')
            ),
            FilledButton(
              onPressed: () async {
                try {
                  final list = await client.articles.list();
                  debugPrint('$list');
                } on Error catch (e){
                  debugPrint('${e.stackTrace}');
                }
              },
              child: const Text('Get Articles')
            ),
            FilledButton(
              onPressed: () async {
                final list = await client.articles.search(phrase: 'Test');
                debugPrint('$list');
              },
              child: const Text('Search Articles')
            ),
          ],
        ),
      ),
    );
  }
}
