library common_widget;

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

export 'package:go_router/go_router.dart';
export 'package:flutter/material.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:toastification/toastification.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:gap/gap.dart';

//! DATA
//! END OF DATA

//! DISPLAY
part 'display/widgets/custom_button.dart';
part 'display/widgets/custom_text_field.dart';
part 'display/widgets/date_field.dart';
part 'display/components/loading_container.dart';
part 'display/widgets/date_picker.dart';

// pages
part 'display/pages/empty_data_page.dart';
//datepicker
part 'display/components/table_calendar/customization/calendar_builders.dart';
part 'display/components/table_calendar/customization/calendar_style.dart';
part 'display/components/table_calendar/customization/days_of_week_style.dart';
part 'display/components/table_calendar/customization/header_style.dart';
part 'display/components/table_calendar/shared/utils.dart';
part 'display/components/table_calendar/table_calendar.dart';
part 'display/components/table_calendar/table_calendar_base.dart';
part 'display/components/table_calendar/widgets/calendar_core.dart';
part 'display/components/table_calendar/widgets/calendar_header.dart';
part 'display/components/table_calendar/widgets/calendar_page.dart';
part 'display/components/table_calendar/widgets/cell_content.dart';
part 'display/components/table_calendar/widgets/custom_icon_button.dart';
part 'display/components/table_calendar/widgets/format_button.dart';
//! END OF DISPLAY

//! DOMAIN
part 'domain/utils/assets_constants.dart';
part 'domain/utils/ui_constants.dart';
part 'domain/utils/svg.dart';
part 'domain/helpers/utils.dart';
//! END OF DOMAIN
