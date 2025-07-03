import 'package:card_list/presentation/home/view/detail_page.dart';
import 'package:card_list/presentation/home/view/form_page.dart';
import 'package:card_list/presentation/home/view/home_page.dart';
import 'package:card_list/presentation/not_found/view/not_found_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'details/:id',
          builder: (context, state) {
            final idParam = state.pathParameters['id'];
            if (idParam == null) {
              return const NotFoundPage(message: 'ID no proporcionado.');
            }
            final id = int.tryParse(idParam);
            if (id == null) {
              return const NotFoundPage(message: 'ID no válido.');
            }
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
            final id = int.tryParse(state.pathParameters['id'] ?? '');
            return FormScreen(editCardId: id);
          },
        ),
      ],
    ),
  ],
);
