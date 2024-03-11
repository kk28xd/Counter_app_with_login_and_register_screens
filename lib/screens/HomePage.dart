import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
            ConditionalBuilder(
                condition: num == 5,
                builder: (context) => const Text('Num == 5',
                    style: TextStyle(fontSize: 40, color: Color(0xff2A1F3F))),
                fallback: (context) => const Text('Num != 5',
                    style: TextStyle(fontSize: 40, color: Color(0xff2A1F3F)))),
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
            const Gap(40),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(text:'G',style: TextStyle(color: Colors.red,fontSize: 20)),
                            TextSpan(text:'D',style: TextStyle(color: Colors.blue,fontSize: 20)),
                            TextSpan(text:'S',style: TextStyle(color: Colors.green,fontSize: 20)),
                            TextSpan(text:'C ',style: TextStyle(color: Colors.yellow,fontSize: 20)),
                            TextSpan(text:'Is The Best',style: TextStyle(fontSize: 20)),
                          ]
                        ),
                      ),
                    )
                    //action: SnackBarAction(label: 'OK', onPressed: () {},),
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  const Text(
                    'GDSC',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
