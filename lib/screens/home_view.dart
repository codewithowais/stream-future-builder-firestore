import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future futureCall(counter) async {
    await Future.delayed(const Duration(seconds: 3));
    return counter * counter;
  }

  Stream streamCall(counter) async* {
    while (false) {
      await Future.delayed(const Duration(seconds: 1));
      yield counter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: futureCall(5),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    "Future: ${snapshot.data}",
                    style: const TextStyle(fontSize: 40),
                  );
                }
                return const RefreshProgressIndicator();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder(
              stream: streamCall(1),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Stream: ${snapshot.data}",
                    style: const TextStyle(fontSize: 40),
                  );
                }
                return const RefreshProgressIndicator();
              }),
            )
          ],
        ),
      ),
    );
  }
}
