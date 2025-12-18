# Flutter Grocery Price Scanner Project

This is a Flutter app for scanning grocery prices using camera and OCR.

## Features
- Camera integration for scanning price tags
- OCR text recognition using Google ML Kit
- Shopping list management with Provider
- Price total calculation
- Brazilian Portuguese UI
- Edit and delete items
- Clear all functionality

## Tech Stack
- **Flutter**: Mobile framework
- **Camera**: Camera access and image capture
- **Google ML Kit**: Text recognition (OCR)
- **Provider**: State management
- **Permission Handler**: Camera permissions

## Project Structure
```
lib/
├── models/
│   └── shopping_item.dart          # Data model
├── providers/
│   └── shopping_list_provider.dart # State management
├── screens/
│   ├── camera_scan_screen.dart     # Camera screen
│   ├── price_selection_screen.dart # Price selection
│   └── shopping_list_screen.dart   # Main list screen
├── services/
│   └── text_recognition_service.dart # OCR service
└── main.dart                        # Entry point
```

## Development Notes
- Minimum SDK: Android 21 (Lollipop)
- Target SDK: Latest
- iOS minimum: 12.0
- Requires physical device for camera functionality
- OCR optimized for Brazilian price format (R$)

## Project Status
- [x] Create copilot-instructions.md file
- [x] Get Flutter project setup info
- [x] Create Flutter project structure
- [x] Configure dependencies (camera, ML Kit, provider)
- [x] Implement camera and OCR functionality
- [x] Create shopping list state management
- [x] Build UI screens (3 screens)
- [x] Configure Android permissions
- [x] Configure iOS permissions
- [x] Update README with full documentation
- [ ] Test on physical device
- [ ] Deploy to stores (optional)

