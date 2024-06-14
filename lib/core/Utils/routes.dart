import 'package:bookly/Features/home/presentation/Views/Book-Details.dart';
import 'package:bookly/Features/home/presentation/Views/homeView.dart';
import 'package:go_router/go_router.dart';
import '../../Features/Splash/Presentation/Views/splashView.dart';

abstract class AppRoutes{
 static const bd='/bookdetails';
static final  router= GoRouter(
 routes: [
  GoRoute( path: '/',
builder: (context, state)=> const SplashView()),
GoRoute( path: '/homeview',
builder: (context, state)=> const HomeView()),

GoRoute( path: bd,
builder: (context, state)=> const BookDetailView()),
 ],
);


}