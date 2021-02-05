class Event {
  Event(
      this.eventTitle,
      this.eventDate,
      this.eventHour,
      this.eventLocation
      );

  final String eventTitle;
  final String eventDate;
  final String eventHour;
  final String eventLocation;
  List<Match> eventMatches;
}