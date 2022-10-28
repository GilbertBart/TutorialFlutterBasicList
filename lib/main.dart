import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Que son les funcions statefull: boto amb estat de premut o no premut
// i stateless: logos que no fan res (widget stateless no variara d'estat)
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Inventing',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Inventing'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}



class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}
class RandomWords extends StatefulWidget {
   const RandomWords({super.key});


  @override
    State<RandomWords> createState() => _RandomWordsState();
}