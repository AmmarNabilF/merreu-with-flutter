import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App Pemula by CRUX',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();

}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();
  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  void addTask(){
    String newTask = taskController.text.trim();

    if (newTask.isNotEmpty) {
      setState(() {
        tasks.add(newTask);
      });

      taskController.clear();

      debugPrint('Task ditambahkan: $newTask');
      debugPrint('Total tasks sekarang: ${tasks.length}');
      debugPrint('Semua tasks: $tasks');
    }

    else{
      debugPrint('Task tidak boleh kosong');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My To-Do List'), backgroundColor: Colors.blue),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: 'Ketik task baru di sini...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: const Icon(Icons.task),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        addTask();
                        debugPrint('Button ditekan!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          SizedBox(width: 8),
                          Text(
                            'Tambah Tugas',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              tasks.isEmpty
              ? 'Belum ada tugas. Tambah tugas pertama kamu!'
              : 'Kamu punya ${tasks.length} task${tasks.length > 1 ? 's' : ''}',

              style: TextStyle(
                fontSize: 16,
                color: tasks.isEmpty ? Colors.grey[600] : Colors.blue[700],
                fontWeight: FontWeight.w500,
              )
            )
          ],
        ),
      ),
    );
  }
}
