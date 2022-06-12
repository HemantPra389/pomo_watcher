import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/feature/pomodoro/presentation/bloc/pomodoro_bloc/cubit/pomodoro_cubit.dart';
import 'package:pomo/feature/pomodoro/presentation/widgets/back_app_bar.dart';

class PomoDoroScreen extends StatefulWidget {
  static const routename = '/pomodoro-screen';
  @override
  State<PomoDoroScreen> createState() => _PomoDoroScreenState();
}

class _PomoDoroScreenState extends State<PomoDoroScreen> {
  String timer_text = '0';
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: BackAppBar('Pomodoro Timer'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 90),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(2, 2))
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'asset/icons/paint-brush.png',
                        height: 30,
                        color: Colors.white,
                      ),
                    )),
                title: const Text(
                  'Coding',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                subtitle: const Text(
                  '10 minutes',
                  style: TextStyle(
                      fontSize: 15, fontFamily: 'Ubuntu', color: Colors.grey),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '2/4',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Ubuntu',
                          color: Colors.grey.shade800),
                    ),
                    const Text(
                      '25 minutes',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Ubuntu',
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: mediaquery.height * .6,
              child: BlocBuilder<PomodoroCubit, PomodoroState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularPercentIndicator(
                          radius: 150,
                          percent: .5,
                          lineWidth: 25,
                          progressColor: Colors.green.shade500,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 30, fontFamily: 'Ubuntu'),
                              ),
                              Text(
                                '2 of 4 Sessions',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.grey),
                              ),
                            ],
                          )),
                      const Text(
                        'Stay focus for 25 minutes',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Icon(
                                Icons.repeat,
                                size: 25,
                                color: Colors.grey,
                              )),
                          const SizedBox(
                            width: 25,
                          ),
                          InkWell(
                            onTap: () {
                              BlocProvider.of<PomodoroCubit>(context)
                                  .startTimer();
                            },
                            child: Container(
                                padding: const EdgeInsets.all(27),
                                decoration: BoxDecoration(
                                    color: Colors.pink.shade300,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(
                                  Icons.pause,
                                  size: 45,
                                  color: Colors.white,
                                )),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Icon(
                                Icons.stop,
                                size: 25,
                                color: Colors.grey,
                              )),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
