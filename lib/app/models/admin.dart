import 'package:meta/meta.dart';

@immutable
class Admin {
    const Admin({
      @required this.uid,
      this.email,
      this.displayName
    });

    final String uid;
    final String email;
    final String displayName;
}