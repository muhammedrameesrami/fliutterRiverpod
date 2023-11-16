import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodprovider/model.dart';
import 'package:riverpodprovider/usernotifier.dart';

final themeProvider = StateProvider<bool>((ref) => true);
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final islightTheme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: islightTheme ? ThemeData.light() : ThemeData.dark(),
      // routerConfig: _router,
      home: Myhome(),
    );
  }
}

final userProvider = StateNotifierProvider<UserNotifier, Model>(
    (ref) => UserNotifier(Model('muhammed ramees', 'malappuram')));

class Myhome extends ConsumerWidget {
  Myhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final using = ref.watch(userProvider.select((value) => value.address));
    final user = ref.watch(userProvider.select((value) => value.name));
    bool? islight = true;
    final isLightTheme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: islight ? Colors.green : Colors.red,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.person),
        title: Center(child: Text('Riverpod')),
        actions: [
          Switch(
            activeColor: Colors.white,
            value: isLightTheme,
            onChanged: (value) =>
                ref.read(themeProvider.notifier).state = value,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) =>
                  ref.read(userProvider.notifier).UpdateName(value),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              onSubmitted: (value) =>
                  ref.read(userProvider.notifier).UpdateAddress(value),
            ),
            SizedBox(
              height: 10,
            ),
            Text(user.toString()),
            Text(using.toString())
          ],
        ),
      ),
    );
  }
}
