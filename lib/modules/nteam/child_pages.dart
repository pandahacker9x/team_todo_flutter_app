import 'package:get/get.dart';
import 'package:team_todo_app/modules/nteam/components/actions/binding.dart';
import 'package:team_todo_app/modules/nteam/components/actions/list_screen.dart';
import 'package:team_todo_app/modules/nteam/components/join_requests/binding.dart';
import 'package:team_todo_app/modules/nteam/components/join_requests/list_screen.dart';
import 'package:team_todo_app/modules/nteam/components/members/binding.dart';
import 'package:team_todo_app/modules/nteam/components/members/list_screen.dart';
import 'package:team_todo_app/constants/routes.dart';

final teamChildPages = [
  GetPage(
    name: RouteNames.JOIN_REQUEST,
    page: () => JoinRequestScreen(),
    binding: JoinRequestBinding(),
  ),
  GetPage(
    name: RouteNames.MEMBERS,
    page: () => MemberListScreen(),
    binding: MembersBinding(),
  ),
  GetPage(
    name: RouteNames.ACTIONS,
    page: () => TeamActionListScreen(),
    binding: TeamActionBinding(),
  )
];
