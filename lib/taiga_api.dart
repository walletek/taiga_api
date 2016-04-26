/**
 * Created by lejard_h on 24/04/16.
 */

library taiga_api;

import "dart:io";
import "dart:convert";
import "dart:async";

import "package:http/http.dart" as http;

part "src/core.dart";
part "src/resolver.dart";
part "src/auth.dart";
part "src/milestones.dart";
part "src/users.dart";
part "src/list_behavior.dart";
part 'src/issue.dart';
part 'src/feedbacks.dart';