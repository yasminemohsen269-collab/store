part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

// الحالة الأولية
final class AuthInitial extends AuthState {}

// أثناء تنفيذ عملية (تسجيل دخول/تسجيل جديد/تسجيل خروج)
final class AuthLoading extends AuthState {}

// في حالة نجاح العملية (المستخدم سجل دخول)
final class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
}

// في حالة عدم وجود مستخدم (يا إما لسه جديد أو عمل تسجيل خروج)
final class AuthUnauthenticated extends AuthState {}

// في حالة حدوث خطأ
final class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
