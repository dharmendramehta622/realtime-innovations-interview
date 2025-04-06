library mainapp;

import 'package:common_widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

export 'package:bloc_concurrency/bloc_concurrency.dart';
export 'package:equatable/equatable.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

//! DOMAIN
part 'domain/navigation/router.dart';
part 'domain/navigation/routes.dart';
//! END OF DOMAIN

//! DATA
//blocs
part 'data/blocs/employee_bloc/employee_bloc.dart';
part 'data/blocs/employee_bloc/employee_event.dart';
part 'data/blocs/employee_bloc/employee_state.dart';
//models
part 'data/models/user_model.dart';
//services
part 'data/services/user_services.dart';
//! END OF DATA

//! DISPLAY
//components
part 'display/components/user_container.dart';
//pages
part 'display/pages/landing_page.dart';
part 'display/pages/employees/add_employee_page.dart';
part 'display/pages/employees/edit_employee_page.dart';
//! END OF DISPLAY
