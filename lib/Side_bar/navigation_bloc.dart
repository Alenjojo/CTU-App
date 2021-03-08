import 'package:bloc/bloc.dart';
import 'package:ctu_app/Screens/change_password_page.dart';
import 'package:ctu_app/Screens/myprofile_page.dart';

import '../Screens/dashboard_page.dart';

enum NavigationEvents {
  DashBoardPageClickedEvent,
  MyProfileClickedEvent,
  ChangePasswordClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => DashBoardPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.DashBoardPageClickedEvent:
        yield DashBoardPage();
        break;
      case NavigationEvents.MyProfileClickedEvent:
        yield MyProfilePage();
        break;
      case NavigationEvents.ChangePasswordClickedEvent:
        yield ChangePasswordPage();
        break;
    }
  }
}
