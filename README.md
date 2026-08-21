# 💬 Chatting App — Flutter

A cross-platform real-time messaging application built with **Flutter**.

This repository contains the client application for the Chatting App project. The application communicates with a
separate **TypeScript / Node.js backend** using REST API and WebSocket connections.

## 🌐 Demo

The web version of the application is available here:

👉 [Chatting App — Web](https://vladimir-matveenko.github.io/chatting_app/)

## 🔗 Project Repositories

### 📱 Flutter Client

This repository — the Flutter client application.

### ⚙️ Backend

The backend is implemented separately using TypeScript, Node.js, Express and PostgreSQL.

👉 [Chatting App — Backend](https://github.com/vladimir-matveenko/chatting_app_ts)

## ✨ Features

### 🔐 Authentication

* User registration and login
* JWT authentication
* Access and refresh tokens
* Automatic access token refresh
* Password reset
* Verification code for password reset
* Protected API requests

### 💬 Messaging

* One-to-one chats
* Group chats
* Real-time messaging
* Message replies
* Message deletion
* Read/unread message status
* Unread message indicators
* Navigation to a specific message
* Chat member management

### 🔔 Notifications

* Real-time notifications
* Personal notification channel
* New message notifications
* Reply notifications
* Chat and member notifications
* Read/unread notification state

### 👤 User Profiles

* Profile editing
* Avatar upload
* Avatar deletion
* Image compression and processing
* User search

### 📱 Platforms

The application is built with Flutter and supports:

* Android
* iOS
* Web

## 🛠️ Tech Stack

* **Flutter**
* **Dart**
* **flutter_bloc** — state management
* **GoRouter** — navigation
* **Dio** — HTTP client
* **WebSocket** — real-time communication
* **Reactive Forms** — form management and validation
* **Cached Network Image** — image caching
* **Flutter ScreenUtil** — responsive UI
* **Image Picker** — image selection

## 🧱 Project Structure

The application uses a feature-oriented architecture:

```text
lib/
├── core/
│   ├── error/
│   ├── network/
│   ├── router/
│   ├── services/
│   └── ...
│
├── features/
│   ├── auth/
│   ├── chats/
│   ├── messages/
│   ├── notifications/
│   ├── profile/
│   ├── users/
│   └── ...
│
└── main.dart
```

Features are isolated into separate modules, which makes the application easier to maintain, test and extend.

## 🔄 Client Communication

The Flutter application communicates with the backend through two main channels.

### REST API

Used for:

* Authentication
* User management
* Chat management
* Message history
* Notifications
* Profile management
* File uploads

### WebSocket

Used for real-time events:

```text
Flutter Client
      │
      ├──────── REST API ────────► Backend
      │                              │
      │                              └── PostgreSQL
      │
      └──────── WebSocket ◄──────► Backend
                    │
                    ├── Messages
                    ├── Notifications
                    ├── Read status
                    └── Real-time events
```

## 🧪 Testing

The project includes unit and widget tests covering important application functionality, including:

* Authentication flows
* Form validation
* Navigation
* Cubit/Bloc behavior
* User interactions
* API-related flows

Tests are located in the `test/` directory.

## ⚙️ Getting Started

### Prerequisites

* Flutter SDK
* Dart SDK
* A running instance of the backend

### Clone the repository

```bash
git clone https://github.com/vladimir-matveenko/chatting_app.git
cd chatting_app
```

### Install dependencies

```bash
flutter pub get
```

### Start the backend

Clone and configure the backend repository:

```bash
git clone https://github.com/vladimir-matveenko/chatting_app_ts.git
```

See the backend README for setup and environment configuration.

### Run the application

```bash
flutter run
```

For web:

```bash
flutter run -d chrome
```

## 📌 Project Status

🚧 **Under development**

The project is actively developed and new features, improvements and tests may be added over time.

## 🔗 Related Project

👉 [Chatting App — TypeScript Backend](https://github.com/vladimir-matveenko/chatting_app_ts)

---

**Chatting App** — Flutter client for a real-time messaging application.
