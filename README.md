# Suits

Fashion e-commerce Flutter app (UI + navigation prototype).

## Screenshots

Add your screenshots into `docs/screenshots/` (create the folder if it doesn’t exist), then the images below will render automatically.

> Suggested format: PNG, ~1080px wide, filenames exactly as below.

| Splash | Auth - Login |
| --- | --- |
| ![Splash](docs/screenshots/splash.png) | ![Login](docs/screenshots/auth_login.png) |

| Auth - Register | Auth - OTP |
| --- | --- |
| ![Register](docs/screenshots/auth_register.png) | ![OTP](docs/screenshots/auth_otp.png) |

| Success dialog | Home |
| --- | --- |
| ![Success Dialog](docs/screenshots/success_dialog.png) | ![Home](docs/screenshots/home.png) |

| Cart | Favourite items |
| --- | --- |
| ![Cart](docs/screenshots/cart.png) | ![Favourites](docs/screenshots/favourites.png) |

| Profile | Product details |
| --- | --- |
| ![Profile](docs/screenshots/profile.png) | ![Product details](docs/screenshots/product_details.png) |

| Checkout | Payment success |
| --- | --- |
| ![Checkout](docs/screenshots/checkout.png) | ![Payment success](docs/screenshots/payment_success.png) |

## Features (implemented screens)

- **Splash**: animated logo then navigates to onboarding (`lib/views/splash.dart`)
- **Onboarding**: swipe pages + skip (`lib/views/on_boarding.dart`)
- **Auth**: login, register, OTP, success dialogs (`lib/views/login.dart`, `lib/views/register.dart`, `lib/views/otp.dart`)
- **Home**: bottom navigation (Home / Cart / Favourites / Profile) (`lib/views/home/view.dart`)
- **Product**: product details with quantity + color + size pickers (`lib/views/product.dart`)
- **Cart**: cart list + swipe-to-remove + promo input + checkout (`lib/views/home/pages/cart.dart`)
- **Checkout**: shipping address + order list (`lib/views/checkout.dart`)
- **Payment**: payment methods + payment success screen (`lib/views/payment_methods.dart`, `lib/views/payment.dart`)

## Entry point

- **App entry**: `lib/main.dart`
- **Current start screen**: `LoginView` (`lib/views/login.dart`)
- **Tip**: if you want to start from splash, set `home:` to `SplashView()` in `lib/main.dart`.
- **DevicePreview**: currently enabled in `main()` (good for UI previewing during development).

## Tech stack

- **Flutter (Material)** with a custom theme (fonts + colors) in `lib/main.dart`
- **Reusable UI components** in `lib/core/widgets/` (buttons, app bar, inputs, cards, image wrapper, etc.)
- **SVG + images** via `flutter_svg` and the `AppImage` widget (`lib/core/widgets/app_image.dart`)

> Note: `pubspec.yaml` includes packages like `flutter_bloc`, `dio`, `freezed`, etc. They’re currently **not used** in the UI code yet (ready to be integrated when you add real state management + API/data models).

## Requirements

- Flutter SDK (Dart SDK compatible with `sdk: ^3.10.0` in `pubspec.yaml`)
- Android Studio / VS Code + Flutter extension
- Android/iOS toolchains (depending on your target)

## Getting started

Install dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

## Build

Android APK:

```bash
flutter build apk --release
```

Android App Bundle:

```bash
flutter build appbundle --release
```

iOS (macOS only):

```bash
flutter build ios --release
```

## Assets & fonts

- **Assets**: `assets/images/`, `assets/icons/`, `assets/fonts/` (declared in `pubspec.yaml`)
- **Fonts**: MysteryQuest, Inter, Waterfall, Montserrat, Arial

## Code generation (optional)

If you start using `freezed` / `json_serializable`, run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Notes

- If you don’t want `DevicePreview` in release builds, disable it (or gate it with `kReleaseMode`).
