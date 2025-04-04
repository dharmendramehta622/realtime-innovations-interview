library mainapp;

import 'package:common_widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'package:bloc_concurrency/bloc_concurrency.dart';
export 'package:equatable/equatable.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

//! DATA
part 'data/blocs/employee_bloc/employee_bloc.dart';
part 'data/blocs/employee_bloc/employee_event.dart';
part 'data/blocs/employee_bloc/employee_state.dart';
//! END OF DATA

//! DISPLAY
part 'display/pages/landing_page.dart';
part 'display/pages/employees/add_employee_page.dart';
//! END OF DISPLAY

//!
part 'domain/navigation/router.dart';
part 'domain/navigation/routes.dart';
//! END OF DOMAIN
