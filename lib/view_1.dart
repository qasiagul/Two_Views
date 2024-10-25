import 'package:flutter/material.dart';

// Simulating fetching data after a delay
Future<List<String>> fetchTasks() async {
  await Future.delayed(Duration(seconds: 2)); // Simulate a network delay
  return ['Task ', 'Task 12', 'Task 3', 'Task 4','Task ', 'Task 12', 'Task 3', 'Task 4'];
}

Future<List<Map<String,String>>> fetchMaps()async{
  await Future.delayed(Duration(seconds: 2));
  return [
    {'name':'qasia','f/name':'gulriaz','age':'18'},
     {'name':'eva','f/name':'andrew','age':'88'},
      {'name':'bella','f/name':'joseph','age':'28'},
  ];
}

class TaskViewFuture extends StatelessWidget {
  const TaskViewFuture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks - Future Builder'),
      ),
      body: FutureBuilder<List<Map<String,String>>>(
        future:fetchMaps(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tasks available'));
          }
          
          final mapData = snapshot.data;

          return ListView.builder(
            itemCount: mapData!.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(mapData[index]['name']!),
              );
            });


        },
      ),
    );
  }
}
