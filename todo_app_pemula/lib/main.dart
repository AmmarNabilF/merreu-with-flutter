import 'package:flutter/material.dart';

class Task {
  String title;
  bool isCompleted;
  Task({
    required this.title,
    this.isCompleted = false,
  });

  void toggle() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return 'Task{title: $title, isCompleted: $isCompleted}';
  }
}

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
  List<Task> tasks = [];
  TextEditingController taskController = TextEditingController();
  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  void addTask(){
    String newTaskTitle = taskController.text.trim();

    if (newTaskTitle.isNotEmpty) {
      Task newTask = Task(title: newTaskTitle);
      setState(() {
        tasks.add(newTask);
      });
      taskController.clear();

      print('Task ditambahkan: $newTask');
      print('Total tasks sekarang: ${tasks.length}');
    }

    else{
      print('Task tidak boleh kosong');
    }
  }

  void removeTask(int index) async{
    Task taskToDelete = tasks[index];
    bool? shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Row(
            children: [
            Icon(Icons.warning, color: Colors.orange),
            SizedBox(width: 8),
            Text('Konfirmasi Hapus'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Apakah kamu yakiin ingin menghapus task ini'),
              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '"$taskToDelete.title"',
                  style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Hapus'),
            ), 
          ],
        );
      },
    );

    if (shouldDelete == true) {
      setState((){
        tasks.removeAt(index);
      });

      debugPrint('Task dihapus: $taskToDelete');
      debugPrint('Sisa tasks: ${tasks.length}');
    }
    else {
      debugPrint('Delete dibatalkan');
    }
  }

  void toggleTask(int index){
    setState(() {
      tasks[index].toggle();
    });

    Task task = tasks[index];
    String status = task.isCompleted ? "selesai" : "belum selesai";
    print('Task $status: ${task.title}');
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
            const SizedBox(height: 20),
            Text(
              'Total Tasks: ${tasks.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!, width: 2),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: tasks.isEmpty
                  ?
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox_outlined,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Belum ada tugas',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tambahkan tugas pertamamu di atas!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    )
                  :
                    ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        Task task = tasks[index]; // Ambil Task object

                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              // Background berubah berdasarkan status
                              color: task.isCompleted ? Colors.green[50] : Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: task.isCompleted
                                  ? Border.all(color: Colors.green[200]!, width: 2) // Border hijau jika selesai
                                  : null,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Opacity(
                              opacity: task.isCompleted ? 0.7 : 1.0, // Completed task lebih transparan
                              child: ListTile(
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    // Warna berubah berdasarkan status
                                    color: task.isCompleted ? Colors.green[100] : Colors.blue[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: task.isCompleted
                                        ? Icon(Icons.check, color: Colors.green[700]) // Icon check jika selesai
                                        : Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                              color: Colors.blue[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                  ),
                                ),
                                title: Text(
                                  task.title, // Akses .title dari Task object
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: task.isCompleted ? Colors.grey[600] : Colors.black87,
                                    // STRIKETHROUGH untuk completed task
                                    decoration: task.isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                subtitle: Text(
                                  task.isCompleted ? 'Selesai ✅' : 'Belum selesai',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: task.isCompleted ? Colors.green[600] : Colors.grey[600],
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // CHECKBOX untuk toggle complete
                                    IconButton(
                                      icon: Icon(
                                        task.isCompleted
                                            ? Icons.check_circle
                                            : Icons.radio_button_unchecked,
                                        color: task.isCompleted ? Colors.green[600] : Colors.grey[400],
                                      ),
                                      onPressed: () => toggleTask(index),
                                      tooltip: task.isCompleted
                                          ? 'Mark as incomplete'
                                          : 'Mark as complete',
                                    ),
                                    // Delete button
                                    IconButton(
                                      icon: Icon(Icons.delete_outline, color: Colors.red[400]),
                                      onPressed: () => removeTask(index),
                                      tooltip: 'Hapus task',
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                // Tap pada item juga bisa toggle
                                onTap: () => toggleTask(index),
                              ),
                            ),
                          ),
                        );
                      },
                    )
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
