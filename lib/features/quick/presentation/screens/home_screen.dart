import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.colorWidget});

  final String title;
  final Color colorWidget;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colorWidget,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'List of items:',
            ),
            const Text(
              'item1',
            ),
            const Text(
              'item2',
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                context.pushNamed('/quick_note_reminder_task');
              },
              child: const Text('Go to quick note reminder task'),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                context.pushNamed('/organizer');
              },
              child: const Text('Go to organizer'),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                context.pushNamed('/communication');
              },
              child: const Text('Go to communication'),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                context.pushNamed('/media');
              },
              child: const Text('Go to media'),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                context.pushNamed('/practice');
              },
              child: const Text('Go to practice'),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                context.pushNamed('/auth');
              },
              child: const Text('Go to auth'),
            ),
          ],
        ),
      ),
    );
  }
}
