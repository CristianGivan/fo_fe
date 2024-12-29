import '../../utils/exports/external_exports.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const MenuButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(title),
        ),
      ],
    );
  }
}
