// Trip class to represent each trip's details
class Trip {
  final String driverName;
  final String phoneNumber;
  final String status;
  final String location;
  final String route;

  Trip({
    required this.driverName,
    required this.phoneNumber,
    required this.status,
    required this.location,
    required this.route,
  });
}

List<Trip> trips = [
  Trip(
    driverName: 'Driver :  Mahmoud',
    phoneNumber: 'Phone : 056673674 ',
    status: 'Running',
    location: 'Inside',
    route: 'From University To Home',
  ),
  Trip(
    driverName: 'Driver :  ezzat',
    phoneNumber: 'Phone : 054756473 ',
    status: 'Ended',
    location: 'Outside',
    route: 'From University To Home',
  )
];
