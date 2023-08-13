import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: 
           ColorScheme.fromSeed(seedColor:
            const Color.fromRGBO(240, 51, 51, 1)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}


class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
    void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
  var favorites = <WordPair>[];
    void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
switch (selectedIndex) {
  case 0:
    page = GeneratorPage();
    break;
  case 1:
    page = FavoritesPage();
    break;
  default:
    throw UnimplementedError('no widget for $selectedIndex');
}
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_filled),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite_sharp),
                      label: Text(
                        'Favorites', 
                      ),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(fontSize: 20),
                ),),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(fontSize: 20),
                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    required this.pair, super.key,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asUpperCase,
          style: style,
          semanticsLabel: '${pair.first} ${pair.second}',
        )
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
 return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.getNext();
                      Navigator.push(
                          context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
              );
                },
                icon: const Icon(Icons.heart_broken),
                label: const Text('No Like\'s yet'),
              ),
            ],
          ),
        ],
      ),
    );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Now you have '
              '${appState.favorites.length} favorites:',
                // style: GoogleFonts.roboto(
                // textStyle: const TextStyle(fontSize: 20),
                 style: const TextStyle(
            fontFamily: 'Manrope', // Используйте название семейства шрифта
            fontSize: 18.0,
          ),
          ),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: const Icon(Icons.favorite_outlined),
            title: Text(pair.asLowerCase),
          ),
      Image.asset('assets/images/svg/3.jpg'),
      ],
    );
  }
}


