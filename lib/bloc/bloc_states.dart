abstract class AppStates {}

class AppIntialState extends AppStates {}

class AppBottomNavBarState extends AppStates {}

class AppLoadingBusinessState extends AppStates {}

class AppBusinessSucsscState extends AppStates {}

class AppBusinesserrorState extends AppStates {
  final String error;
  AppBusinesserrorState(this.error);
}

class AppLoadingSportState extends AppStates {}

class AppSportSucsscState extends AppStates {}

class AppSporterrorState extends AppStates {
  final String error;
  AppSporterrorState(this.error);
}

class AppLoadingScienceState extends AppStates {}

class AppScienceSucsscState extends AppStates {}

class AppScienceerrorState extends AppStates {
  final String error;
  AppScienceerrorState(this.error);
}

class AppChangeThemeState extends AppStates {}
//
class AppLoadingSearchState extends AppStates {}

class AppSearchSucsscState extends AppStates {}

class AppSearcherrorState extends AppStates {
  final String error;
  AppSearcherrorState(this.error);
}
