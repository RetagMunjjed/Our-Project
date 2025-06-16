import 'package:untitled10/core/errors/error.model.dart';

abstract class Events_status{}


class initial_events_class extends Events_status{}

class start_events_class extends Events_status{}

class finish_events_class extends Events_status{}

class error_events_class extends Events_status{
final String errormassege;

  error_events_class(this.errormassege);
}

