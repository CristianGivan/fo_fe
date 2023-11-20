part of organizer;

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: const Center(
          child: Text('Tasks'),
        ),
      ),
    );
  }
}
