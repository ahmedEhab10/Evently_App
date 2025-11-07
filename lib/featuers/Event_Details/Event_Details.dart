import 'package:flutter/material.dart';
import 'package:myeventlyapp/Models/Event_item_model.dart';
import 'package:myeventlyapp/featuers/Event_Details/Widgets/Event_Details_body.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: EventDetailsBody(Eevent: event)),
    );
  }
}
