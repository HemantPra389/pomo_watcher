import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';
import 'package:pomo/feature/pomodoro/presentation/bloc/home_page_bloc/cubit/home_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeScreenCubit>(context).showTasks();
    return Scaffold(
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
        if (state is ShowTaskState) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Morning, Hemant',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 35,
                      color: Colors.grey.shade700),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            color: Colors.grey.withOpacity(.4),
                            offset: const Offset(1, 1)),
                      ]),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 55,
                        percent: state.taskData.length/100,
                        lineWidth: 10,
                        progressColor: Colors.pink.shade300,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          (state.taskData.length).toString(),
                          style: TextStyle(fontSize: 25, fontFamily: 'Ubuntu'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            'Wow! Your daily\ngoals are almost done',
                            style:
                                TextStyle(fontSize: 22, fontFamily: 'Ubuntu'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '1 of ${state.taskData.length} Completed',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Ubuntu',
                                color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Tasks(${state.taskData.length})',
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontFamily: 'Ubuntu',
                          fontSize: 20),
                    ),
                    Text(
                      'See all',
                      style:
                          TextStyle(fontSize: 18, color: Colors.pink.shade300),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<HomeScreenCubit, HomeScreenState>(
                  builder: (context, state) {
                    if (state is ShowTaskState) {
                      return Expanded(child: task_tile(state.taskData));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  ListView task_tile(List<TaskEntity> tasklist) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 2)
              ]),
          child: ListTile(
            leading: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.pink.shade300,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    'asset/icons/coding.png',
                    height: 35,
                    color: Colors.white,
                  ),
                )),
            title: Text(
              "${tasklist[index].task_title} ${index + 1}",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Ubuntu',
              ),
            ),
            subtitle: Text(
              "${tasklist[index].wrk_session.toString()} minutes",
              style: TextStyle(
                  fontSize: 15, fontFamily: 'Ubuntu', color: Colors.grey),
            ),
            trailing: SizedBox(
              height: 90,
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Container(
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: .1,
                                  offset: Offset(1, 1),
                                  blurRadius: 2),
                            ],
                            borderRadius: BorderRadius.circular(15)),
                      )),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeScreenCubit>(context)
                            ..deleteTask(index)..showTasks();

                      },
                      icon: Container(
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: .1,
                                  offset: Offset(1, 1),
                                  blurRadius: 2),
                            ],
                            borderRadius: BorderRadius.circular(15)),
                      ))
                ],
              ),
            ),
          ),
        );
      },
      itemCount: tasklist.length,
    );
  }
}
