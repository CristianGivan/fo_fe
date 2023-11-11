part of '../../organizer.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text('Reminder'),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(OrganizerRouterNames.organizerRoute),
                child: const Text('Go to the tasks screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
