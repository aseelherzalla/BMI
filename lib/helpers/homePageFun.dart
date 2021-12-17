import 'dart:math';

import 'package:bmi/models/status.dart';
import 'package:bmi/models/user.dart';
import 'package:bmi/pages/completinformation_page.dart';
import 'package:intl/intl.dart';

class HomePageFun{
  static final String lC = 'littleChanges';
  static final String sG = 'stillGood';
  static final String gA = 'stillGood';
  static final String bC = 'beCareful';
  static final String sB = 'soBad';
  static final String underweight = 'underWeight';
  static final String normal = 'normal';
  static final String overweight = 'overweight';
  static final String obesity = 'obesity';
  //
  static double calculateBMIValue(UserInformation user,double weight,double height){
    double percentage;
    int age = DateTime.now().year - DateFormat("yyyy").parseStrict(user.dateOfBirth).year;
    if(age>=2 && age<=10){
      percentage = 0.7;
    }
    else if(age>10 && age<=20 && user.gender == Gender.male.toString()){
      percentage = 0.9;
    }
    else if(age>10 && age<=20 && user.gender == Gender.femal.toString()){
      percentage = 0.8;
    }
    else if(age>20){
      percentage = 1;
    }
    return (weight/pow(height/100, 2))* percentage ;
  }
  static String calculateBMIStatus(UserInformation user,double weight,double height){
    String bmiStatus;
    double bmiValue = calculateBMIValue(user,weight,height);
    if(bmiValue < 18.5){
      bmiStatus = underweight;
    }
    if(bmiValue >= 18.5 && bmiValue< 25){
      bmiStatus = normal;
    }
    if(bmiValue >= 25 && bmiValue< 30){
      bmiStatus = overweight;
    }
    if(bmiValue >30){
      bmiStatus = obesity;
    }
    return bmiStatus;
  }
  static String changeStatus({Status currentStatus,List<Status> statuses,UserInformation userData,String status}){
    /// reorder the code in this method
    String changeStatus ;
    double difference;
    ///current status
    double bmiValueCurrentStatus = calculateBMIValue(userData, currentStatus.weight, currentStatus.height);
    if(statuses.length>0){
      ///because the status list is reversed.
      Status beforeCurrentStatus = statuses.first;
      ///(before current)
      double bmiValueBeforeCurrentStatus = calculateBMIValue(userData,beforeCurrentStatus.weight,beforeCurrentStatus.height);
      difference = bmiValueCurrentStatus-bmiValueBeforeCurrentStatus;
    }
    else{
      difference = null;
    }
    print(' difference= $difference ');
    if(difference != null){
      if(difference<-1){
        if(status ==underweight){
          changeStatus = sB;
        }
        if(status ==normal){
          changeStatus = sB;
        }
        if(status ==overweight){
          changeStatus = bC;
        }
        if(status ==obesity){
          changeStatus = bC;
        }
      }
      else if(difference>=-1 && difference <-0.6){
        if(status ==underweight){
          changeStatus = sB;
        }
        if(status ==normal){
          changeStatus = bC;
        }
        if(status ==overweight){
          changeStatus = gA;
        }
        if(status ==obesity){
          changeStatus = gA;
        }
      }
      else if(difference>=-0.6 && difference <-0.3){
        if(status ==underweight){
          changeStatus = sB;
        }
        if(status ==normal){
          changeStatus = bC;
        }
        if(status ==overweight){
          changeStatus = sG;
        }
        if(status ==obesity){
          changeStatus = lC;
        }
      }
      else if(difference>=-0.3 && difference <0){
        if(status ==underweight){
          changeStatus = lC;
        }
        if(status ==normal){
          changeStatus = lC;
        }
        if(status ==overweight){
          changeStatus = lC;
        }
        if(status ==obesity){
          changeStatus = lC;
        }
      }
      else if(difference>=0 && difference <0.3){
        if(status ==underweight){
          changeStatus = lC;
        }
        if(status ==normal){
          changeStatus = lC;
        }
        if(status ==overweight){
          changeStatus = lC;
        }
        if(status ==obesity){
          changeStatus = bC;
        }
      }
      else if(difference>=0.3 && difference <0.6){
        if(status ==underweight){
          changeStatus = sG;
        }
        if(status ==normal){
          changeStatus = bC;
        }
        if(status ==overweight){
          changeStatus = bC;
        }
        if(status ==obesity){
          changeStatus = sB;
        }
      }
      else if(difference>=0.6 && difference <1){
        if(status ==underweight){
          changeStatus = gA;
        }
        if(status ==normal){
          changeStatus = bC;
        }
        if(status ==overweight){
          changeStatus = sB;
        }
        if(status ==obesity){
          changeStatus = sB;
        }
      }
      else if(difference>=1){
        if(status ==underweight){
          changeStatus = gA;
        }
        if(status ==normal){
          changeStatus = bC;
        }
        if(status ==overweight){
          changeStatus = sB;
        }
        if(status ==obesity){
          changeStatus = sB;
        }
      }
    }
    else{
      changeStatus = '';
    }
    print('changeStatus $changeStatus');
    return changeStatus;
  }
}