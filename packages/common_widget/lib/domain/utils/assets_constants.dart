part of common_widget;

mixin Assets {
  static AssetIcons get icons => AssetIcons(); 
  static AssetImages get images => AssetImages(); 
}

class AssetIcons {
  String location = 'packages/common_widget/assets/icons';

  String get plus => '$location/plus.svg'; 
  String get arrow_right => '$location/arrow_right.svg'; 
  String get briefcase => '$location/briefcase.svg'; 
  String get date => '$location/date.svg'; 
  String get dropdown_arrow => '$location/dropdown_arrow.svg'; 
  String get person => '$location/person.svg'; 
  String get calendar_prev => '$location/calendar_prev.svg'; 
  String get calendar_next => '$location/calendar_next.svg'; 

}

 

class AssetImages {
  String location = 'packages/common_widget/assets/images';

  String get empty => '$location/empty.png';  
}
 
 
