import 'package:card_list/presentation/home/view/detail_page.dart';
import 'package:card_list/presentation/home/view/form_page.dart';
import 'package:card_list/presentation/home/view/home_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'details/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return DetailsPage(cardId: id);
          },
        ),
        GoRoute(
          path: 'form',
          builder: (context, state) => const FormScreen(),
        ),
        GoRoute(
          path: 'form/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return FormScreen(editCardId: id);
          },
        ),
      ],
    ),
  ],
);
