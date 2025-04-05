part of common_widget;

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    this.onSave,
    this.onCancel,
   required this.initialDate ,
  });
  final void Function()? onSave;
  final void Function()? onCancel;
  final DateTime initialDate;
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('d MMM y').format(_selectedDay);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _dateController.text = DateFormat('d MMM y').format(selectedDay);
    });
  }

  DateTime _getNextWeekday(int weekday) {
    DateTime now = DateTime.now();
    int daysToAdd = (weekday - now.weekday + 7) % 7;
    return now.add(Duration(days: daysToAdd));
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDay,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDay) {
      setState(() {
        _selectedDay = pickedDate;
        _dateController.text = DateFormat('d MMM y').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: 'Today',
                      color: kPrimary50,
                      textColor: kPrimary700,
                      onTap: () {},
                    ),
                    CustomButton(
                      text: "Next Monday",
                      onTap: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: "Next Tuesday",
                      color: kPrimary50,
                      textColor: kPrimary700,
                      onTap: () {},
                    ),
                    CustomButton(
                      text: "After 1 week",
                      color: kPrimary50,
                      textColor: kPrimary700,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
            const Gap(10),
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),  
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: _onDaySelected,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            const Gap(10),
            Divider(color: kBorder),
            // current datetime, save,cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // current datetime
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SVG.asset(Assets.icons.date),
                    const Gap(12),
                    regularText(widget.initialDate.formatToReadableDate, 16, kTextPrimary)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 12,
                  children: [
                    CustomButton(
                      text: "Cancel",
                      color: kPrimary50,
                      textColor: kPrimary700,
                      width: 78,
                      onTap: widget.onCancel,
                    ),
                    CustomButton(
                      text: "Save", 
                      width: 73,
                      onTap: widget.onSave,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
