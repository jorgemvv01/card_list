# Card list - Flutter app

A simple Flutter app to manage and organize a list of custom cards, using the BLoC (Cubit) pattern for scalable state management.

## Features

- View a list of cards
- Add new cards
- Edit existing cards
- Delete cards
- Smooth navigation using GoRouter
- State management with `flutter_bloc`

## Getting Started

### Prerequisites

- [Flutter >= 3.24.4](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/jorgemvv01/card_list.git
    cd card_list
    ```
2. Install dependencies:
    ```bash
    flutter pub get
    ```
3. Run the app:
    ```bash
    flutter run
    ```

## Project Structure

```
lib/
├── core/                    # Common utilities, routing
├── domain/                  # Business models and core logic
├── presentation/            # Presentation layer (UI + state)
│   └── home/                # Feature: Home
│       ├── cubits/          # Cubit state management for Home
│       ├── view/            # UI pages (screens)
│       └── widgets/         # Reusable widgets for Home
└── main.dart                # App entry point
```

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [equatable](https://pub.dev/packages/equatable)
- [go_router](https://pub.dev/packages/go_router)
- [intl](https://pub.dev/packages/intl)