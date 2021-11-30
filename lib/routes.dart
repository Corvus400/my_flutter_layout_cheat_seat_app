import 'package:flutter/material.dart';
import 'package:flutter_layout_cheat_sheet/contents/container_box_decoration.dart';
import 'package:flutter_layout_cheat_sheet/contents/my_material.dart';
import 'package:flutter_layout_cheat_sheet/contents/my_align.dart';
import 'package:flutter_layout_cheat_sheet/contents/my_constrained_box.dart';
import 'package:flutter_layout_cheat_sheet/contents/container_basic.dart';
import 'package:flutter_layout_cheat_sheet/contents/my_expanded.dart';
import 'package:flutter_layout_cheat_sheet/contents/my_safe_area.dart';
import 'package:flutter_layout_cheat_sheet/contents/my_sized_box.dart';
import 'package:flutter_layout_cheat_sheet/contents/my_slivers.dart';
import 'package:flutter_layout_cheat_sheet/contents/my_stack.dart';
import 'package:flutter_layout_cheat_sheet/contents/row_and_column.dart';

const kRouteRowAndColumn = '/row_and_column';
const kRouteMyStack = '/my_stack';
const kRouteMyExpanded = '/my_expanded';
const kRouteMyConstrainedBox = '/my_constrainedBox';
const kRouteMyAlign = '/my_align';
const kRouteContainerBasic = '/container_basic';
const kRouteContainerBoxDecoration = '/container_box_decoration';
const kRouteMyMaterial = '/my_material';
const kRouteMySlivers = '/my_slivers';
const kRouteMySizedBox = '/my_sized_box';
const kRouteMySafeArea = '/my_safe_area';

final kRoutes = <String, WidgetBuilder>{
  kRouteRowAndColumn: (BuildContext context) => RowAndColumn(),
  kRouteMyStack: (BuildContext context) => MyStack(),
  kRouteMyExpanded: (BuildContext context) => MyExpanded(),
  kRouteMyConstrainedBox: (BuildContext context) => MyConstrainedBox(),
  kRouteMyAlign: (BuildContext context) => MyAlign(),
  kRouteContainerBasic: (BuildContext context) => ContainerBasic(),
  kRouteContainerBoxDecoration: (BuildContext context) => ContainerBoxDecoration(),
  kRouteMyMaterial: (BuildContext context) => MyMaterial(),
  kRouteMySlivers: (BuildContext context) => MySlivers(),
  kRouteMySizedBox: (BuildContext context) => MySizedBox(),
  kRouteMySafeArea: (BuildContext context) => MySafeArea(),
};
