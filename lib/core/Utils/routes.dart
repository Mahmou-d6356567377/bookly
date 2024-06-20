import 'package:bookly/Features/Search/Presention/View/widgets/Seach_View_Body.dart';
import 'package:bookly/Features/home/presentation/Views/Book-Details.dart';
import 'package:bookly/Features/home/presentation/Views/homeView.dart';
import 'package:go_router/go_router.dart';
import '../../Features/Splash/Presentation/Views/splashView.dart';

abstract class AppRoutes {
  static const bd = '/bookdetails';
  static const sv = '/SearchView';
  static const hm = '/homeview';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: hm, builder: (context, state) => const HomeView()),
      GoRoute(path: bd, builder: (context, state) => const BookDetailView()),
      GoRoute(
        path: sv,
        builder: (context, state) => const SearchViewBody(),
      ),
    ],
  );
}
