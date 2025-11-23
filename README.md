# QuickService

A Flutter application for booking service providers with real-time availability, pricing, and booking confirmation features.

## Time Spent

Approximately 2hrs 10mins.. 10mins for adding detailed

## State Management Approach

The app uses a hybrid state management approach combining **Riverpod** for global state and **ChangeNotifier/ValueNotifier** for local component state. Riverpod is used for the service provider list management (ProviderController) which needs to be shared across the app, while ChangeNotifier (BookingController) handles local booking state within the booking screen. This approach provides a clean separation between global and local state, making the codebase more maintainable and testable. The reactive UI updates are handled through `ListenableBuilder` and `ref.watch()` for Riverpod providers.

## Setup Instructions

1. Clone repository
   ```bash
   git clone <repository-url>
   cd quickservice
   ```

2. Run `flutter pub get`
   ```bash
   flutter pub get
   ```

3. Run `flutter run`
   ```bash
   flutter run
   ```

## Flutter Version

Flutter 3.32.4 • Dart 3.8.1

## Notes

**Assumptions:**
- Service provider data is currently hardcoded for demonstration purposes
- Booking times are pre-defined and some slots are marked as booked
- Hourly rates are fixed per provider
- No backend integration - all data is local

**Challenges:**
- Managing state synchronization between date, time, and duration selections
- Ensuring proper disposal of controllers to prevent memory leaks
- Implementing reactive UI updates when booking state changes
- Handling edge cases in price calculation when duration is not selected
- limited time to handle key Functionalities 

**Trade-offs:**
- Used ChangeNotifier instead of pure Riverpod for booking state to keep it scoped to the booking screen
- Simple validation (just checking if fields are selected) rather than complex form validation



## Widget Tree Structure

```
QuickService (MaterialApp)
│
├── OKToast
│   └── ScreenUtilInit
│       └── MaterialApp
│           └── ProviderScope (Riverpod)
│               └── ProviderListScreen (Home)
│                   │
│                   ├── Scaffold
│                   │   ├── AppBar
│                   │   │   └── MedAppText ("Bookings")
│                   │   │
│                   │   └── Body
│                   │       └── Padding
│                   │           └── Column
│                   │               ├── MMTextField (Search)
│                   │               │   └── TextEditingController
│                   │               │
│                   │               └── Expanded
│                   │                   └── Visibility
│                   │                       ├── Loading: ListView.builder
│                   │                       │   └── ProviderSkeleton (x10)
│                   │                       │
│                   │                       └── Content: Visibility
│                   │                           ├── Empty: Center
│                   │                           │   └── SmallAppText ("No Service Providers found")
│                   │                           │
│                   │                           └── List: ListView.separated
│                   │                               └── ProviderCard
│                   │                                   ├── ClipOval (Image)
│                   │                                   ├── Column
│                   │                                   │   ├── SmallAppText (Category)
│                   │                                   │   └── SmallAppText (Hourly Rate)
│                   │                                   └── BButton ("Book now")
│                   │                                       └── Navigation → BookingScreen
│
└── BookingScreen (Navigated from ProviderCard)
    │
    └── Scaffold
        └── Container
            └── Stack
                │
                ├── mainImageWidget
                │   └── Container
                │       ├── DecorationImage (Provider Image)
                │       └── Padding
                │           └── Row
                │               └── IconButton (Back)
                │
                └── Container (Bottom Sheet)
                    └── SingleChildScrollView
                        └── Container
                            └── Padding
                                └── Column
                                    │
                                    ├── Row (Provider Info)
                                    │   ├── ClipOval (Image)
                                    │   ├── Column
                                    │   │   ├── MedAppText (Name)
                                    │   │   └── SmallAppText (Category)
                                    │   └── Column
                                    │       ├── RatingBar
                                    │       └── SmallAppText (Hourly Rate)
                                    │
                                    ├── Divider
                                    │
                                    ├── MedAppText ("Select Date")
                                    ├── Wrap
                                    │   └── DateWidget (x5)
                                    │       └── GestureDetector
                                    │           └── Container
                                    │               └── SmallAppText (Date)
                                    │
                                    ├── MedAppText ("Select Time")
                                    ├── ResponsiveGridList
                                    │   └── GridSelector (x5)
                                    │       └── GestureDetector
                                    │           └── SmallAppText (Time)
                                    │
                                    ├── HourSelector
                                    │   └── DropdownTextFormField
                                    │       └── DropdownButtonFormField2
                                    │           └── DropdownMenuItem (x4)
                                    │
                                    └── Row (Price & Booking)
                                        ├── Column
                                        │   ├── SmallAppText ("Total Price")
                                        │   └── MedAppText (Calculated Total)
                                        │
                                        └── BButton ("Book Now")
                                            └── onTap → BookingConfirmationDialog
                                                │
                                                └── Dialog
                                                    └── Column
                                                        ├── Row
                                                        │   ├── MedAppText ("Booking Confirmed!")
                                                        │   └── IconButton (Close)
                                                        │
                                                        ├── _buildInfoRow (Provider)
                                                        ├── _buildInfoRow (Date)
                                                        ├── _buildInfoRow (Time)
                                                        ├── _buildInfoRow (Duration)
                                                        ├── Divider
                                                        ├── Row (Total Price)
                                                        └── ElevatedButton ("Done")
```

## Key Components

### Controllers
- **ProviderController** (Riverpod): Manages service provider list, filtering, and loading states
- **BookingController** (ChangeNotifier): Manages booking state (date, time, duration) and calculates total price

### Shared Widgets
- **BButton**: Custom button with disabled state support
- **MMTextField**: Custom text field with search functionality
- **DropdownTextFormField**: Custom dropdown with white text styling
- **SmallAppText/MedAppText/BigAppText**: Typography widgets with consistent styling
- **AppBar**: Custom app bar widget

### Feature Widgets
- **ProviderCard**: Displays service provider information
- **ProviderSkeleton**: Loading skeleton for providers
- **DateWidget**: Selectable date chip
- **GridSelector**: Selectable time slot
- **HourSelector**: Duration dropdown selector
- **BookingConfirmationDialog**: Booking confirmation modal

## Dependencies

- `hooks_riverpod`: State management
- `flutter_screenutil`: Responsive design
- `google_fonts`: Custom typography
- `custom_rating_bar`: Rating display
- `dropdown_button2`: Enhanced dropdown
- `responsive_grid_list`: Grid layout
- `oktoast`: Toast notifications
- `iconsax_plus`: Icon library
