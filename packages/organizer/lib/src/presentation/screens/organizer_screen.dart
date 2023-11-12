part of organizer;

class Organizer extends StatelessWidget {
  const Organizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organizer'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.go(OrganizerRouterNames.organizerTasksRoute),
              child: const Text('Go to the topics screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.push(OrganizerRouterNames.organizerTasksRoute),
              child: const Text('Go to the tasks screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.push(OrganizerRouterNames.organizerReminderRoute),
              child: const Text('Go to the reminder screen'),
            ),
          ),
          const Center(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
