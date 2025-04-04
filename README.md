```markdown
# realtimeinv_interview
 - Mobile application for Gowolo Global

## Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [FVM](https://fvm.app/documentation/getting-started/installation)

## Getting Started

Follow these steps to set up and run the project:

### 1. Clone the Repository
https://github.com/gowologlobaldeveloper/realtimeinv_interview.git
```bash
git clone https://your_username:your_password@github.com/gowologlobaldeveloper/realtimeinv_interview.git
cd realtimeinv_interview

### 2. Install FVM

If you haven't installed FVM yet, you can install it using the following command:

```bash
dart pub global activate fvm
```

### 3. Install Flutter Version

Use FVM to install the Flutter version specified for this project:

```bash
fvm install flutter_version
```

### 4. Use the Specified Flutter Version

Make sure to always use the FVM-managed Flutter version when running commands for this project:

```bash
fvm use flutter_version
```

### 5. Install Dependencies

Install the project dependencies:

```bash
fvm flutter pub get
```

### 6. Run the Project

You can now run the project using the FVM-managed Flutter:

```bash
fvm flutter run
```

## Project Structure

Project's structure is built using MVVM architecture.

```plaintext
realtimeinv_interview
├── assets 
│   ├── images/..
│   ├── icons/..
│   └── ...
├── lib 
│   ├── main.dart
│   ├── app.dart
│   └── ...   
│   └── packages/...   
├── test
│   └── ...
└── README.md

```

## Contributing

If you would like to contribute to this project, please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature-name`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some feature'`)
5. Push to the branch (`git push origin feature/your-feature-name`)
6. Create a new Pull Request

### Build App Bundle

```bash
flutter build appbundle --no-tree-shake-icons
```

### Build APK

```bash
flutter build apk --no-tree-shake-icons
```
## Creating splash and launcher icons
``` 
flutter pub run flutter_native_splash:create
flutter pub run flutter_launcher_icons:main
```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.