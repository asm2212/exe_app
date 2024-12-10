import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart'; // Added import

class WorkoutScheduleScreen extends StatefulWidget {
  const WorkoutScheduleScreen({super.key});

  @override
  State<WorkoutScheduleScreen> createState() => _WorkoutScheduleScreenState();
}

class _WorkoutScheduleScreenState extends State<WorkoutScheduleScreen> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;

  List eventArr = [
    {
      "name": "Ab Workout",
      "start_time": "25/05/2023 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "25/05/2023 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "25/05/2023 03:00 PM",
    },
    {
      "name": "Ab Workout",
      "start_time": "26/05/2023 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "26/05/2023 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "26/05/2023 03:00 PM",
    },
    {
      "name": "Ab Workout",
      "start_time": "27/05/2023 07:30 AM",
    },
    {
      "name": "Upperbody Workout",
      "start_time": "27/05/2023 09:00 AM",
    },
    {
      "name": "Lowerbody Workout",
      "start_time": "27/05/2023 03:00 PM",
    }
  ];

  List selectDayEventArr = [];

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    setDayEventWorkoutList();
  }

  /// Converts a DateTime object to a start date (stripping the time component)
  DateTime dateToStartDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Parses a date string into a DateTime object based on the provided format
  DateTime stringToDate(String dateString, {String formatStr = "dd/MM/yyyy hh:mm a"}) {
    try {
      return DateFormat(formatStr).parse(dateString);
    } catch (e) {
      // Handle parsing error
      print("Error parsing date string: $e");
      return DateTime.now(); // Return current date as a fallback
    }
  }

  /// Formats minutes into a time string (e.g., 60 -> "1:00 AM")
  String getTime(int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;
    final date = DateTime(0, 1, 1, hour, minute);
    return DateFormat('h:mm a').format(date);
  }

  /// Formats a date string into another specified format
  String getStringDateToOtherFormate(String dateString, {String outFormatStr = "h:mm a"}) {
    try {
      // Assuming the input format is "dd/MM/yyyy hh:mm a"
      DateTime date = DateFormat("dd/MM/yyyy hh:mm a").parse(dateString);
      return DateFormat(outFormatStr).format(date);
    } catch (e) {
      // Handle formatting error
      print("Error formatting date string: $e");
      return dateString; // Return original string as a fallback
    }
  }

  /// Retrieves the day of the week from a date string (e.g., "Monday")
  String getDayTitle(String dateString) {
    try {
      // Assuming the input format is "dd/MM/yyyy hh:mm a"
      DateTime date = DateFormat("dd/MM/yyyy hh:mm a").parse(dateString);
      return DateFormat('EEEE').format(date);
    } catch (e) {
      // Handle parsing error
      print("Error getting day title: $e");
      return ""; // Return empty string as a fallback
    }
  }

  void setDayEventWorkoutList() {
    var date = dateToStartDate(_selectedDateAppBBar);
    selectDayEventArr = eventArr.map((wObj) {
      return {
        "name": wObj["name"],
        "start_time": wObj["start_time"],
        "date": stringToDate(wObj["start_time"].toString(),
            formatStr: "dd/MM/yyyy hh:mm a")
      };
    }).where((wObj) {
      return dateToStartDate(wObj["date"] as DateTime) == date;
    }).toList();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorExtension.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorExtension.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/images/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Workout Schedule",
          style: TextStyle(
              color: ColorExtension.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ColorExtension.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/images/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: ColorExtension.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarAgenda(
            controller: _calendarAgendaControllerAppBar,
            appbar: false,
            selectedDayPosition: SelectedDayPosition.center,
            leading: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/ArrowLeft.png",
                  width: 15,
                  height: 15,
                )),
            training: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/ArrowRight.png",
                  width: 15,
                  height: 15,
                )),
            weekDay: WeekDay.short,
            dayNameFontSize: 12,
            dayNumberFontSize: 16,
            dayBGColor: Colors.grey.withOpacity(0.15),
            titleSpaceBetween: 15,
            backgroundColor: Colors.transparent,
            // fullCalendar: false,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            fullCalendarDay: WeekDay.short,
            selectedDateColor: Colors.white,
            dateColor: Colors.black,
            locale: 'en',

            initialDate: DateTime.now(),
            calendarEventColor: ColorExtension.primaryColor2,
            firstDate: DateTime.now().subtract(const Duration(days: 140)),
            lastDate: DateTime.now().add(const Duration(days: 60)),

            onDateSelected: (date) {
              _selectedDateAppBBar = date;
              setDayEventWorkoutList();
            },
            selectedDayLogo: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: ColorExtension.primaryG,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: media.width * 1.5,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var timelineDataWidth = (media.width * 1.5) - (80 + 40);
                      var availWidth = (media.width * 1.2) - (80 + 40);
                      var slotArr = selectDayEventArr.where((wObj) {
                        return (wObj["date"] as DateTime).hour == index;
                      }).toList();

                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Text(
                                getTime(index * 60),
                                style: TextStyle(
                                  color: ColorExtension.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            if (slotArr.isNotEmpty)
                              Expanded(
                                  child: Stack(
                                alignment: Alignment.centerLeft,
                                children: slotArr.map((sObj) {
                                  var min = (sObj["date"] as DateTime).minute;
                                  //(0 to 2)
                                  var pos = (min / 60) * 2 - 1;
                                  return Align(
                                    alignment: Alignment(pos, 0),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.transparent,
                                              contentPadding: EdgeInsets.zero,
                                              content: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 15, horizontal: 20),
                                                decoration: BoxDecoration(
                                                  color: ColorExtension.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets.all(8),
                                                            height: 40,
                                                            width: 40,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    ColorExtension.lightGray,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(10)),
                                                            child: Image.asset(
                                                              "assets/images/closed_btn.png",
                                                              width: 15,
                                                              height: 15,
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "Workout Schedule",
                                                          style: TextStyle(
                                                              color: ColorExtension.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight.w700),
                                                        ),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets.all(8),
                                                            height: 40,
                                                            width: 40,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    ColorExtension.lightGray,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(10)),
                                                            child: Image.asset(
                                                              "assets/images/more_btn.png",
                                                              width: 15,
                                                              height: 15,
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      sObj["name"].toString(),
                                                      style: TextStyle(
                                                          color: ColorExtension.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(children: [
                                                      Image.asset(
                                                        "assets/images/time_workout.png",
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "${getDayTitle(sObj["start_time"].toString())}|${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm a")}",
                                                        style: TextStyle(
                                                            color: ColorExtension.gray,
                                                            fontSize: 12),
                                                      )
                                                    ]),
                                            
                                                     const SizedBox(
                                                      height: 15,
                                                    ),
                                            
                                                    RoundButton(
                                                        title: "Mark Done",
                                                        onPressed: () {}),
                                            
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 35,
                                        width: availWidth * 0.5,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: ColorExtension.secondaryG),
                                          borderRadius:
                                              BorderRadius.circular(17.5),
                                        ),
                                        child: Text(
                                          "${sObj["name"].toString()}, ${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm a")}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis, // Added overflow
                                          style: TextStyle(
                                            color: ColorExtension.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: ColorExtension.gray.withOpacity(0.2),
                        height: 1,
                      );
                    },
                    itemCount: 24),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          // Define action for FAB here
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: ColorExtension.secondaryG),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: 20,
            color: ColorExtension.white,
          ),
        ),
      ),
    );
  }
}
