import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

// Simulating a stream of task updates
Stream<List<String>> taskStream() async* {
  await Future.delayed(Duration(seconds: 2)); // Simulate initial delay
  yield ['Task 1', 'Task 2']; // Initial data
  await Future.delayed(Duration(seconds: 2));
  yield ['Task 1', 'Task 2', 'Task 3']; // Updated data
  await Future.delayed(Duration(seconds: 2));
  yield ['Task 1', 'Task 2', 'Task 3', 'Task 4']; // More updates
}

  Stream<int> getLiveStreaming() async* {
    int value = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      value = value + 1;
      log(value.toString());
      yield value;
    }
  }

class TaskViewRealtime extends StatelessWidget {
  const TaskViewRealtime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Builder'),
      ),
      body: StreamBuilder(
        stream: taskStream(),
        builder: (context,snapshot){
        if(snapshot.hasData){
          return Center(child: Text(snapshot.data.toString(),style: TextStyle(fontSize: 30),));
        }else{
          return Center(child: const CircularProgressIndicator());
        }
      })
    );
  }
}
