///
/// Copyright (C) 2019 Andrious Solutions
///
/// This program is free software; you can redistribute it and/or
/// modify it under the terms of the GNU General Public License
/// as published by the Free Software Foundation; either version 3
/// of the License, or any later version.
///
/// You may obtain a copy of the License at
///
///  http://www.apache.org/licenses/LICENSE-2.0
///
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
///          Created  14 Nov 2019
///
///

class VarStr {
  static VariableString _varStr = VariableString();

  static String set(String str) {
    _varStr.value = str;
    return _varStr.value;
  }

  static String get get => _varStr.value;
}

class VariableString {
  VariableString() {
    regExp = RegExp("'(.*?)'");
  }

  RegExp regExp;

  String _value = "";

  set value(String str) {
    _value = "";
    if (str != null && str.isNotEmpty) {
      RegExpMatch match = regExp.firstMatch(str);
      if (match != null) _value = match.group(0).replaceAll("'", "");
    }
  }

  String get value => _value;
}
