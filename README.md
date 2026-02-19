# CareSync

**CareSync** is a comprehensive, UK NHS-inspired personal health and appointment tracker application built with Flutter. It is designed to help users manage their healthcare journey with ease, offering features for tracking appointments, prescriptions, health metrics, and more, all wrapped in a modern, accessible, and polished user interface.

## 📱 Features

CareSync provides a robust set of features to keep you on top of your health:

*   **Dashboard**: A centralized hub showing upcoming appointments, active prescriptions, and recent health activity at a glance.
*   **Appointments**: Book, view, and manage your GP and hospital appointments. Keep track of dates, times, and locations.
*   **Prescriptions**: Manage your medication schedule, track repeat prescriptions, and set reminders for taking your medicine.
*   **Health Metrics**: Log and visualize vital health data such as Blood Pressure, Heart Rate, Weight, and more with interactive charts.
*   **Notifications**: Stay informed with timely reminders for appointments and medication.
*   **Profile Management**: Manage your personal details, NHS number, and app preferences.
*   **Secure & Offline-First**: Built with a local-first approach using Isar database to ensure your data is always accessible, even without an internet connection.

## 🛠 Tech Stack & Architecture

This project is built using **Flutter** and follows **Clean Architecture** principles to ensure scalability, testability, and maintainability.

*   **Framework**: [Flutter](https://flutter.dev/)
*   **Language**: [Dart](https://dart.dev/)
*   **State Management**: [Flutter Bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
*   **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
*   **Local Database**: [Isar](https://isar.dev/)
*   **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
*   **Code Generation**: [Freezed](https://pub.dev/packages/freezed) & [build_runner](https://pub.dev/packages/build_runner)
*   **UI/UX**: 
    *   [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil) for responsive design.
    *   [Google Fonts](https://pub.dev/packages/google_fonts) for typography.
    *   [Shimmer](https://pub.dev/packages/shimmer) for loading states.
    *   [FL Chart](https://pub.dev/packages/fl_chart) for data visualization.

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version >=3.1.0 <4.0.0)
*   Dart SDK
*   Android Studio / VS Code / Xcode (for iOS)

### Installation

1.  **Clone the repository**
    ```bash
    git clone https://github.com/georgeikwegbu/NHS_health_tracker.git
    cd NHS_health_tracker
    ```

2.  **Install dependencies**
    ```bash
    flutter pub get
    ```

3.  **Run Code Generation**
    This project uses `build_runner` for generating model serialization, database schemas, and dependency injection code.
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the App**
    Connect your device or start an emulator/simulator.
    ```bash
    flutter run
    ```

## 📂 Project Structure

The project follows a feature-based directory structure:

```
lib/
├── core/           # Core utilities, theme, configs, and shared widgets
├── features/       # Feature-specific code (Clean Architecture)
│   ├── appointments/
│   ├── dashboard/
│   ├── health_metrics/
│   ├── intro/      # Onboarding & Splash
│   ├── prescriptions/
│   ├── profile/
│   └── ...
├── main.dart       # Entry point
└── injection.dart  # DI setup
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

```text
MIT License

Copyright (c) 2024 George Ikwegbu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
