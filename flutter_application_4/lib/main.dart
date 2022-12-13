import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/historycubit.dart';
import 'package:flutter_application_4/ttc.dart';
import 'eventhandlercubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => EventHandlerCubit()),
        BlocProvider(create: (BuildContext context) => ttc()),
        BlocProvider(create: (BuildContext context) => historycubit())
      ],
      child: BlocBuilder<ttc, tts>(
        builder: (context, state) {
          if (state is ThemeState) {
            return MaterialApp(
                title: 'Flutter Theme',
                theme: ThemeData(brightness: state.brightness),
                debugShowCheckedModeBanner: false,
                home: StartWindow(
                  title: 'Practice 4',
                ));
          }
          return MaterialApp(
            title: 'Flutter Theme',
            theme: ThemeData(brightness: Brightness.light),
            debugShowCheckedModeBanner: false,
            home: StartWindow(title: 'Practice 4'),
          );
        },
      ),
    );
  }
}

class StartWindow extends StatefulWidget {
  const StartWindow({super.key, required this.title});

  final String title;

  @override
  State<StartWindow> createState() => _StartWindowState();
}

class _StartWindowState extends State<StartWindow> {
  static String textCounter = "0";

  static List<Text> history = [
    Text(
        "_______________________________________________________________________________________________________________________________________")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<EventHandlerCubit, EventHandlerCondition>(
                  builder: (context, state) {
                    if (state is EventHandlerMistake) {
                      textCounter = state.service;
                      return Text(
                        textCounter,
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }

                    if (state is Event) {
                      textCounter = state.CounterValue.toString();
                      return Text(
                        textCounter,
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }

                    return Text("0",
                        style: Theme.of(context).textTheme.headline4);
                  },
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            Brightness brightness =
                                Theme.of(context).brightness;
                            context
                                .read<EventHandlerCubit>()
                                .EventHandler(brightness, true);
                            context.read<historycubit>().eventhandler(
                                history, int.parse(textCounter), brightness);
                          },
                          child: const Icon(Icons.remove)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Brightness brightness = Theme.of(context).brightness;
                          context
                              .read<EventHandlerCubit>()
                              .EventHandler(brightness, false);
                          context.read<historycubit>().eventhandler(
                              history, int.parse(textCounter), brightness);
                        },
                        child: const Icon(Icons.add)),
                  ],
                ),
                BlocBuilder<historycubit, historycondition>(
                  builder: (context, state) {
                    if (state is History) {
                      return Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: state.history,
                            )),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              context.read<ttc>().EventHandler(Theme.of(context).brightness),
          tooltip: 'Increment',
          child: const Text("Theme", style: TextStyle(fontSize: 15))),
    );
  }
}
