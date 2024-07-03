import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/assets_manager.dart';
import 'package:grocery/core/utils/string_manager.dart';

import 'package:grocery/core/utils/string_manager.dart';

import 'package:grocery/core/utils/string_manager.dart';

import 'package:grocery/core/utils/string_manager.dart';

import 'package:grocery/core/utils/string_manager.dart';

import 'package:grocery/core/utils/string_manager.dart';

import 'package:grocery/core/utils/string_manager.dart';

import '../widgets/category_item_widget.dart';

class CategoryConst {
   static final List<CategoryItemWidget> categories = [
      CategoryItemWidget(name: StringManager.vegetables, image: AssetsManager.vegetablesIcon),
      CategoryItemWidget(name: StringManager.fruits, image: AssetsManager.fruitsIcon),
      CategoryItemWidget(name: StringManager.beverages, image: AssetsManager.beveragesIcon),
      CategoryItemWidget(name: StringManager.grocery, image: AssetsManager.groceryIcon),
      CategoryItemWidget(name: StringManager.edibleOil, image: AssetsManager.edibleOilIcon),
      CategoryItemWidget(name: StringManager.houseHold, image: AssetsManager.houseHoldIcon),
      CategoryItemWidget(name: StringManager.babyCare, image: AssetsManager.babyCareIcon),
   ];
}