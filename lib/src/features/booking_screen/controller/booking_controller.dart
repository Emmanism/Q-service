import 'package:flutter/foundation.dart';

class BookingController extends ChangeNotifier {
  String? _selectedDate;
  String? _selectedTime;
  String? _selectedDuration;
  bool _isSelectedTimeBooked = false;

  String? get selectedDate => _selectedDate;
  String? get selectedTime => _selectedTime;
  String? get selectedDuration => _selectedDuration;
  bool get isSelectedTimeBooked => _isSelectedTimeBooked;

  bool get isBookingValid => 
      _selectedDate != null && 
      _selectedTime != null && 
      _selectedDuration != null &&
      !_isSelectedTimeBooked;

  void setSelectedDate(String? date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedTime(String? time, {bool isBooked = false}) {
    _selectedTime = time;
    _isSelectedTimeBooked = isBooked;
    notifyListeners();
  }

  void setSelectedDuration(String? duration) {
    _selectedDuration = duration;
    notifyListeners();
  }

  int? getDurationInHours() {
    if (_selectedDuration == null) return null;
    // Extract number from strings like "1 hour", "2 hour", etc.
    final match = RegExp(r'(\d+)').firstMatch(_selectedDuration!);
    if (match != null) {
      return int.tryParse(match.group(1)!);
    }
    return null;
  }

  double calculateTotal(double hourlyRate) {
    final hours = getDurationInHours();
    if (hours == null) return 0.0;
    return hourlyRate * hours;
  }

  void reset() {
    _selectedDate = null;
    _selectedTime = null;
    _selectedDuration = null;
    _isSelectedTimeBooked = false;
    notifyListeners();
  }
}


