# 🛍️ VibeCraft — Flutter Shopping App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)
![Localization](https://img.shields.io/badge/Localization-EN%20%7C%20AR-purple)

> A shopping app UI built end-to-end with Flutter & Dart — final project for the **Sprints Flutter Shopping App** track.
> #LearningInPublic

## 📖 Overview

**VibeCraft** simulates a real e-commerce flow from scratch: a splash screen, sign-up/sign-in with validation, a shopping home feed with featured products and hot offers, a profile drawer, and full **English/Arabic** localization with live, in-app language switching.

The project was built incrementally as part of the course — starting from core Dart concepts (variables, control flow, OOP) and growing into a full Flutter UI with `StatefulWidget`s, form validation, navigation, and localization.

## ✨ Features

**🚀 Splash Screen**
Animated loading indicator with a live percentage counter while the app initializes.

**👋 Welcome Screen**
Branded intro screen with a custom `Suwannaphum` font and two entry points — **Sign In** / **Sign Up**.

**🔐 Authentication**
- **Sign Up** — full name (must start with a capital letter), email (must contain `@`), password (6+ characters), confirm password (must match). On success, an `AwesomeDialog` confirms account creation, then the user is taken straight into the shopping home.
- **Sign In** — validates email/password and checks them against the registered account; if no account exists yet, a `SnackBar` offers a one-tap shortcut to Sign Up.
- Show/hide password toggles, and a loading state on the button while the form "submits".

**🛒 Shopping Home**
- Horizontal `PageView` banner for featured products.
- Responsive `GridView` (2 cards per row) — each card has a product image, title, and an **Add to Cart** button that shows a confirmation `SnackBar`.
- **Hot Offers** section — 5 vertically scrolling deal cards.
- Side `Drawer` showing the signed-in user's avatar, name, and email, plus Log out.

**🌍 Arabic / English Localization**
Every label, validator message, dialog, and snackbar is translated. Tap the globe icon in the AppBar to switch language instantly (RTL layout included), no restart needed.

## 🛠️ Tech Stack

| | |
|---|---|
| **Language** | Dart |
| **Framework** | Flutter |
| **Localization** | [easy_localization](https://pub.dev/packages/easy_localization) |
| **Dialogs** | [awesome_dialog](https://pub.dev/packages/awesome_dialog) |
| **State management** | `StatefulWidget` / `setState` |

## 📂 Project Structure

```
lib/
├── main.dart
├── featur.dart                       # language-toggle logic
├── widgets/
│   └── language_toggle_button.dart   # shared across screens
├── welcome_Screen.dart
├── loding_screen/
│   ├── lodingScreen.dart
│   └── widgets/
│       └── loding_screen_bar.dart
├── auth/
│   ├── accounts.dart                 # UserModel + in-memory auth store
│   ├── sign_in.dart
│   ├── sign_up.dart
│   └── widgets/
│       ├── sign_in_button.dart
│       ├── create_account_row.dart
│       └── auth_snackbar.dart
└── shopping_home/
    ├── shopping_home_screen.dart
    └── widgets/
        ├── app_drawer.dart
        ├── featured_product.dart
        ├── hot_offer_card.dart
        ├── section_title.dart
        └── view products.dart
```

Each screen has its own folder with a `widgets/` sub-folder for the UI pieces it owns; anything reused across multiple screens (like the language toggle) lives in the top-level `lib/widgets/`.

## 🖼️ Screenshots

| Splash | Welcome (EN) | Welcome (AR) |
|---|---|---|
| ![Splash](screen%20shots/Screenshot_1782548013.png) | ![Welcome EN](screen%20shots/Screenshot_1782548017.png) | ![Welcome AR](screen%20shots/Screenshot_1782548022.png) |

| Sign Up (EN) | Sign Up (AR) |
|---|---|
| ![Sign Up EN](screen%20shots/Screenshot_1782547994.png) | ![Sign Up AR](screen%20shots/Screenshot_1782547991.png) |

| Sign In (EN) | Sign In (AR) |
|---|---|
| ![Sign In EN](screen%20shots/Screenshot_1782547983.png) | ![Sign In AR](screen%20shots/Screenshot_1782547986.png) |

| Home (EN) | Home (AR) |
|---|---|
| ![Home EN](screen%20shots/Screenshot_1782547949.png) | ![Home AR](screen%20shots/Screenshot_1782547967.png) |

| Hot Offers | Drawer |
|---|---|
| ![Hot Offers](screen%20shots/Screenshot_1782547974.png) | ![Drawer](screen%20shots/Screenshot_1782547961.png) |

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (Dart **3.12+** — this project uses Dart's `dot shorthand` syntax, so an older SDK won't build it)
- Android Studio or VS Code with the Flutter & Dart plugins

### Run locally
```bash
git clone https://github.com/Amr4924/Shopping-App-Project.git
cd Shopping-App-Project
flutter pub get
flutter run
```

## 📝 Notes

- This is a front-end learning project — accounts live in memory only (no backend/database), so they reset every time the app restarts.
- Localization is implemented with `easy_localization` + JSON files rather than `.arb` files. Same end result for the user (full EN/AR switch with RTL), just a different package than the one originally suggested.

## 🙋 About

Built by **Amr (Sa3dwy)** as part of the **Sprints Flutter Shopping App** track.
#LearningInPublic