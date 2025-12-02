
final dates = [
'Tues 25',
'Wed 26',
'Thur 27',
'Fri 28',
'Sat 29',
];

final hours = [
'1 hour',
'2 hour',
'3 hour',
'4 hour',
];

class Times {
final String time;
final bool isBooked;


Times({
required this.time,
required this.isBooked,
});

}

final times = [
  Times(
    isBooked: true,
    time:'9:00 AM',
    ),
  Times(
    isBooked: false,
    time:'11:00 AM',
    ),
  Times(
    isBooked: true,
    time:'1:00 PM',
    ),
  Times(
    isBooked: true,
    time:'3:00 PM',
    ),
  Times(
    isBooked: false,
    time:'5:00 PM',
    ),
  Times(
    isBooked: false,
    time:'7:00 PM',
    ),
];