class DataParseService {
  String parseDate(String date) {
    String monthName;
    String dayNumber;
    switch (date.split('-')[1]) {
      case '01':
        monthName = ' января';
        break;
      case '02':
        monthName = ' февраля';
        break;
      case '03':
        monthName = ' марта';
        break;
      case '04':
        monthName = ' апреля';
        break;
      case '05':
        monthName = ' мая';
        break;
      case '06':
        monthName = ' июня';
        break;
      case '07':
        monthName = ' июля';
        break;
      case '08':
        monthName = ' августа';
        break;
      case '09':
        monthName = ' сентября';
        break;
      case '10':
        monthName = ' октября';
        break;
      case '11':
        monthName = ' ноября';
        break;
      case '12':
        monthName = ' декабря';
        break;
    }

    if (date.split('-')[2].substring(0, 1) == '0') {
      dayNumber = date.split('-')[2].substring(1, 2);
    } else {
      dayNumber = date.split('-')[2].substring(0, 2);
    }

    return dayNumber + monthName;
  }
}
