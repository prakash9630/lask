

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/util/date_format.dart';

final filterProvider = ChangeNotifierProvider<FilterProvider>((ref) {
  return FilterProvider();
});

class FilterProvider extends ChangeNotifier{
  int ratingIndex=0;
  String? lawyerName='';
  String? lawyerLicense='';
  List<String> ratings=[];
  String? fromDate='';
  String? toDate='';

  changeRatingIndex(int index){
    ratingIndex=index;
    notifyListeners();
  }

  onFromDateSelected(DateTime? date){
    if(date!=null){
      fromDate= dateToString(date);
    }
    notifyListeners();
  }
  onToDateSelected(DateTime? date){
    if(date!=null){
      toDate= dateToString(date);
    }
    notifyListeners();
  }

  onLawyerNameChange(String? name){
    lawyerName=name;
    notifyListeners();
  }
  onLawyerLicenseIdChange(String? licenseId){
    lawyerLicense=licenseId;
    notifyListeners();
  }

  onRatingChange(List<String> ratings){
    this.ratings=ratings;
    notifyListeners();
  }

  clearData(){
    lawyerLicense='';
    ratings=[];
    lawyerName='';
    toDate='';
    fromDate='';

  }

  Map<String,dynamic> filterData(){
      var map= <String,dynamic>{};
      if(lawyerName!.isNotEmpty){
        map['name']=lawyerName;
      }
      if(lawyerLicense!.isNotEmpty){
        map['license_number']=lawyerLicense;
      }
      if(ratings.isNotEmpty){
        map['rating']=ratings;
      }
      if(fromDate!.isNotEmpty){
        map['start_date']=fromDate;
      }
      if(toDate!.isNotEmpty){
        map['end_date']=toDate;
      }
      return map;
  }
}