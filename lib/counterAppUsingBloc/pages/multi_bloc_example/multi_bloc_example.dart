import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/slider/slider_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/slider/slider_event.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/slider/slider_state.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/switch/switch_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/switch/switch_event.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/switch/switch_state.dart';

class MultiBlocExample extends StatelessWidget {
  const MultiBlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi bloc")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  // buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return Switch(
                      value: state.isEnable,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(
                          NotificationEnableOrDisable(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<SliderBloc, SliderState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(state.sliderValue * 100),
                  color: Colors.pink.withValues(alpha: 1),
                ),
                child: Center(
                  child: Text(
                    "Value: ${(state.sliderValue * 100).toStringAsFixed(0)}",
                    style: TextStyle(color: Colors.yellow, fontSize: 30),
                  ),
                ),
              );
            },
          ),
          BlocBuilder<SliderBloc, SliderState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return Slider(
                secondaryTrackValue: state.sliderValue,
                value: state.sliderValue,
                onChanged: (value) {
                  context.read<SliderBloc>().add(
                    SlideSlider(sliderValue: value),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
