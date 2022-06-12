import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';
import 'package:pomo/feature/pomodoro/domain/usecases/add_task_usecase.dart';
import 'package:pomo/feature/pomodoro/presentation/bloc/home_page_bloc/cubit/home_screen_cubit.dart';
import 'package:pomo/feature/pomodoro/presentation/widgets/back_app_bar.dart';
import 'package:pomo/injection_container.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'pomodoro_screen.dart';

class CreateTaskScreen extends StatefulWidget {
  static const routename = '/create-task-screen';
  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final dropdown_tile_items = ['Coding', 'Reading', 'Music', 'Painting'];
  String? _value;
  double wrk_session_slider_val = 0;
  double long_break_slider_val = 0;
  double shortbreak_slider_val = 0;
  int taskid = DateTime.now().day +
      DateTime.now().month +
      DateTime.now().hour +
      DateTime.now().minute +
      DateTime.now().second;
  late String task_title;

  DateTime dateTime = DateTime.now();
  TimeOfDay timenow =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: BackAppBar('Create New Task'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 10),
        child: SingleChildScrollView(
          child: SizedBox(
            height: mediaquery.height * .65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                create_Task_field(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    date_time_btn(mediaquery, "Date", Icons.date_range,
                        () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: dateTime,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));
                      if (newDate == null) return;
                      setState(() {
                        dateTime = newDate;
                      });
                    }, '${dateTime.day}/${dateTime.month}/${dateTime.year}'),
                    date_time_btn(mediaquery, "Time", Icons.timer, () async {
                      TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: timenow,
                      );
                      if (timeOfDay == null) return;
                      setState(() {
                        timenow = timeOfDay;
                      });
                    }, '${timenow.format(context)}'),
                  ],
                ),
                dropDownbtn(),
                slider_widget('Working Sessions', 120, wrk_session_slider_val),
                slider_widget('Long Break', 20, long_break_slider_val),
                slider_widget('Short Break', 10, shortbreak_slider_val),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: !keyboardIsOpen,
        child: InkWell(
          onTap: () {
            locator.call<AddTaskUseCase>().addTask(TaskEntity(
                id: taskid,
                task_title: task_title,
                date: DateTime.now(),
                timeOfDay: DateTime(dateTime.year, dateTime.month, dateTime.day,
                    timenow.hour, timenow.minute),
                category: _value!,
                wrk_session: wrk_session_slider_val.toInt(),
                long_break: long_break_slider_val.toInt(),
                short_break: shortbreak_slider_val.toInt()));
            Navigator.of(context).pushNamed(PomoDoroScreen.routename);
            BlocProvider.of<HomeScreenCubit>(context).showTasks();
          },
          child: Container(
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.pink.shade300,
            ),
            child: const Text(
              'Create New Task',
              style: TextStyle(
                  fontFamily: 'Ubuntu', color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Column slider_widget(String title, double maxvalue, double sliderValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20, fontFamily: 'Ubuntu', color: Colors.grey.shade700),
        ),
        const SizedBox(
          height: 5,
        ),
        SfSliderTheme(
          data: SfSliderThemeData(tooltipBackgroundColor: Colors.pink.shade300),
          child: SfSlider(
            min: 0.0,
            max: maxvalue,
            interval: 1,
            value: sliderValue.toInt(),
            thumbIcon: Container(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.pink.shade300, width: 3),
            )),
            enableTooltip: true,
            activeColor: Colors.pink.shade300,
            inactiveColor: Colors.grey.shade300,
            onChanged: (value) {
              switch (title) {
                case "Working Sessions":
                  setState(() {
                    wrk_session_slider_val = value;
                  });
                  break;
                case "Long Break":
                  setState(() {
                    long_break_slider_val = value;
                  });
                  break;
                case "Short Break":
                  setState(() {
                    shortbreak_slider_val = value;
                  });
                  break;
                default:
              }
            },
          ),
        ),
      ],
    );
  }

  Container dropDownbtn() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _value,
          isExpanded: true,
          hint: const Text(
            'Select Category',
            style: TextStyle(fontSize: 18, fontFamily: 'Ubuntu'),
          ),
          items: dropdown_tile_items.map(buildMenuItem).toList(),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  Column date_time_btn(Size mediaquery, String title, IconData iconData,
      VoidCallback myfun, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20, fontFamily: 'Ubuntu', color: Colors.grey.shade700),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: mediaquery.width * 0.4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data,
                  style: const TextStyle(fontFamily: 'Ubuntu', fontSize: 18),
                ),
                IconButton(onPressed: myfun, icon: Icon(iconData))
              ],
            ),
          ),
        )
      ],
    );
  }

  Container create_Task_field() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Ubuntu',
                color: Colors.grey.shade700),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
                hintText: 'Task Title',
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: Colors.pink.shade200),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                focusColor: Colors.pink.shade200,
                fillColor: Colors.pink.shade200.withOpacity(.1),
                filled: true),
            onChanged: (value) {
              setState(() {
                task_title = value;
              });
            },
          )
        ],
      ),
    );
  }
}
