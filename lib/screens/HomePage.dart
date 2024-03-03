import 'package:flutter/material.dart';

int num = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2A1F3F),
        title: const Text('Counter app',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$num',
              style: const TextStyle(
                fontSize: 150,
                color: Color(0xff2A1F3F),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    onPressed: () {
                      setState(() {
                        num++;
                      });
                    },
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color(0xff2A1F3F),
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    )),
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            num = 0;
                          });
                        },
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: const Color(0xff2A1F3F),
                        child: const Text(
                          'Reset',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                MaterialButton(
                    onPressed: () {
                      setState(() {
                        num--;
                      });
                    },
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color(0xff2A1F3F),
                    child: const Text(
                      'Subtract',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            const SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
