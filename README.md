# Suits

Fashion e-commerce Flutter app (UI + navigation prototype).

## Screenshots
| Splash | Auth - Login |
| --- | --- |
| ![Splash](https://github.com/user-attachments/assets/7e166a62-d395-4ae2-bdb4-2f975c57a3fc) | ![Login](https://github.com/user-attachments/assets/362d42a8-70af-4520-8a98-01da32716709) |

| Auth - Register | Auth - OTP |
| --- | --- |
| ![Register](https://github.com/user-attachments/assets/9c8cea6a-e374-441a-b98b-a5b31d01c575) | ![OTP](https://github.com/user-attachments/assets/41749b60-a73a-4197-b924-875903d96128) |

| Success dialog | Home |
| --- | --- |
| ![Success Dialog](https://github.com/user-attachments/assets/ae4668d6-216f-4511-bca6-6e6c5b564bef) | ![Home](https://github.com/user-attachments/assets/ba05aaf9-d080-4bb9-b04a-e936f44f6e00) |

| Cart | Favourite items |
| --- | --- |
| ![Cart](https://github.com/user-attachments/assets/c5de7304-3f41-4e75-b0ae-0e48eef8b60f) | ![Favourites](https://github.com/user-attachments/assets/51697e20-0830-4fff-9ce3-918c4c9b7592) |

| Profile | Product details |
| --- | --- |
| ![Profile](https://github.com/user-attachments/assets/b726ad09-b57e-4b72-bf09-ee29825d7e0f) | ![Product details](https://github.com/user-attachments/assets/945205a3-93d9-490a-a8e2-ec75b55a71ef) |

| Checkout | Payment success |
| --- | --- |
| ![Checkout](https://github.com/user-attachments/assets/558a9859-daef-4bed-8e23-669adb0231e7) | ![Payment success](https://github.com/user-attachments/assets/16af034a-27f5-4e79-904c-56a865e88085) |

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
