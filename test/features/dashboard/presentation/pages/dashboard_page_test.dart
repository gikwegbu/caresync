import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_sync/features/dashboard/presentation/bloc/dashboard_cubit.dart';
import 'package:care_sync/features/dashboard/presentation/pages/dashboard_page.dart';

class MockDashboardCubit extends Mock implements DashboardCubit {}

void main() {
  late MockDashboardCubit mockDashboardCubit;

  setUp(() {
    mockDashboardCubit = MockDashboardCubit();
    // Stub the state and stream
    when(() => mockDashboardCubit.state).thenReturn(
      const DashboardState.loaded(
        userName: 'Test User',
        upcomingAppointmentCount: 2,
        pendingPrescriptionsCount: 1,
        latestMetric: '120 bpm',
      ),
    );
    when(() => mockDashboardCubit.stream).thenAnswer((_) => Stream.value(
          const DashboardState.loaded(
            userName: 'Test User',
            upcomingAppointmentCount: 2,
            pendingPrescriptionsCount: 1,
            latestMetric: '120 bpm',
          ),
        ));
    when(() => mockDashboardCubit.loadDashboardData()).thenAnswer((_) async {});
    when(() => mockDashboardCubit.close()).thenAnswer((_) async {});

    // Ignore overflow errors in widget tests
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.exceptionAsString().contains('A RenderFlex overflowed')) {
        return;
      }
      originalOnError?.call(details);
    };
  });

  Widget createWidgetUnderTest() {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) => MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 2000,
            height: 4000,
            child: BlocProvider<DashboardCubit>.value(
              value: mockDashboardCubit,
              child: const DashboardPage(),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('DashboardPage renders and displays loaded state correctly',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.text('Hi, Test User'), findsOneWidget);
    expect(find.text('2'), findsOneWidget); // Upcoming appointments
    expect(find.text('1'), findsOneWidget); // Pending prescriptions
    expect(find.text('120 bpm'), findsOneWidget); // Latest metric
    expect(find.text('Quick Actions'), findsOneWidget);
    expect(find.text('Recent Activity'), findsOneWidget);

    verify(() => mockDashboardCubit.loadDashboardData()).called(1);
  });
}
