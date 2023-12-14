// part of tasks;

// class App extends StatelessWidget {
//   App({super.key});

//   final TodosRepository todosRepository=mainTask() as TodosRepository;

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//       value: todosRepository,
//       child: const AppView(),
//     );
//   }
// }

// class AppView extends StatelessWidget {
//   const AppView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: FlutterTodosTheme.light,
//       darkTheme: FlutterTodosTheme.dark,
//       // localizationsDelegates: AppLocalizations.localizationsDelegates,
//       // supportedLocales: AppLocalizations.supportedLocales,
//       home: const HomePage(),
//     );
//   }
// }

// Future<TodosRepository> mainTask() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final todosApi = LocalStorageTodosApi(
//     plugin: await SharedPreferences.getInstance(),
//   );


//   TodosRepository todosRepository;
//   return todosRepository = TodosRepository(todosApi: todosApi);
// }