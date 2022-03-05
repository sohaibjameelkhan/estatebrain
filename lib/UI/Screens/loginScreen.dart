import 'package:estatebrain/UI/Screens/OtpScreen.dart';
import 'package:estatebrain/UI/Screens/signupScreen.dart';
import 'package:estatebrain/UI/Screens/updatePasswordScreen.dart';
import 'package:estatebrain/UI/Widgets/auth_textfield_widget.dart';
import 'package:estatebrain/UI/Widgets/button_widget.dart';
import 'package:estatebrain/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';

import 'package:country_pickers/country_pickers.dart';

import '../../res.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginScreen> {
  bool isvisible = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('90');

  Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('90');

  Country _selectedCupertinoCountry =
      CountryPickerUtils.getCountryByIsoCode('tr');

  Country _selectedFilteredCupertinoCountry =
      CountryPickerUtils.getCountryByIsoCode('DE');

  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 13,
              ),
              Container(
                height: 120,
                width: 170,
                decoration: BoxDecoration(),
                child: Center(
                  child: Image.asset(
                    Res.transparentLogo,
                    height: 150,
                    width: 160,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Exisiting ESTATEBRAIN User:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "You can use your ESTATE BRAIN app",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Phone Number and Password to login",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          // Container(
                          //   height: 50,
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //       border:
                          //           Border.all(width: 1, color: Colors.grey),
                          //       borderRadius: BorderRadius.circular(5)),
                          //   child: Container(
                          //     height: 50,
                          //     child: ListTile(
                          //         title: _buildCountryPickerDropdown(
                          //             sortedByIsoCode: true)),
                          //   ),
                          // ),
                        ],
                      ),
                      authtextfieldWidget(
                        //obsecuretext: false,
                        containerheght: 60,
                        heading: "Phone or Email*",
                        onPwdTap: () {},
                        visible: false,
                        isPasswordField: false,
                        suffixIcon2: Icons.visibility_off,
                        suffixIcon: Icons.email,
                        showsuffix: false,
                        maxlength: 30,
                        keyboardtype: TextInputType.emailAddress,
                        //  authcontroller: _emailController,
                        showImage: false,
                        suffixImage: "",
                        text: "Enter Phone or Email",
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return "";
                          } else if (value.length <= 2) return "";
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      authtextfieldWidget(
                        //obsecuretext: true,
                        containerheght: 45,
                        heading: "Password",
                        onPwdTap: () {
                          setState(() {
                            isvisible = !isvisible;
                          });
                        },
                        visible: isvisible,
                        isPasswordField: true,
                        suffixIcon2: Icons.visibility_off,
                        suffixIcon: Icons.email,
                        showsuffix: true,
                        maxlength: 30,
                        keyboardtype: TextInputType.emailAddress,
                        //  authcontroller: _emailController,
                        showImage: false,
                        suffixImage: "",
                        text: "Enter Your Password",
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return "";
                          } else if (value.length <= 2) return "";
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdatePassword()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: buttonWidget(
                    buttonwidth: double.infinity,
                    showborder: false,
                    text: "Login",
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    textColor: Colors.white,
                    bacgroundcolor: MyAppColors.pink),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: buttonWidget(
                    buttonwidth: double.infinity,
                    showborder: true,
                    text: "Sign Up",
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    textColor: Colors.black,
                    bacgroundcolor: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCountryPickerDropdownSoloExpanded() {
    return CountryPickerDropdown(
      underline: Container(
        height: 2,
        color: Colors.red,
      ),
      //show'em (the text fields) you're in charge now
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      //if you want your dropdown button's selected item UI to be different
      //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
      onValuePicked: (Country country) {
        print("${country.name}");
      },
      itemBuilder: (Country country) {
        return Row(
          children: <Widget>[
            SizedBox(width: 8.0),
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(width: 2.0),
            Expanded(child: Text(country.name)),
          ],
        );
      },
      itemHeight: null,
      isExpanded: true,
      //initialValue: 'TR',
      icon: Icon(Icons.arrow_downward),
    );
  }

  //-------------------------------------this one code picker is used ---------------------------------

  _buildCountryPickerDropdown(
      {bool filtered = false,
      bool sortedByIsoCode = false,
      bool hasPriorityList = false,
      bool hasSelectedItemBuilder = false}) {
    double dropdownButtonWidth = MediaQuery.of(context).size.width * 0.4;
    //respect dropdown button icon size
    double dropdownItemWidth = dropdownButtonWidth - 30;
    double dropdownSelectedItemWidth = dropdownButtonWidth - 30;
    return Row(
      children: <Widget>[
        SizedBox(
          // width: 2,
          width: dropdownButtonWidth,
          child: CountryPickerDropdown(
            /* underline: Container(
              height: 2,
              color: Colors.red,
            ),*/
            //show'em (the text fields) you're in charge now
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            //if you have menu items of varying size, itemHeight being null respects
            //that, IntrinsicHeight under the hood ;).
            itemHeight: null,
            //itemHeight being null and isDense being true doesn't play along
            //well together. One is trying to limit size and other is saying
            //limit is the sky, therefore conflicts.
            //false is default but still keep that in mind.
            isDense: false,
            //if you want your dropdown button's selected item UI to be different
            //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
            selectedItemBuilder: hasSelectedItemBuilder == true
                ? (Country country) => _buildDropdownSelectedItemBuilder(
                    country, dropdownSelectedItemWidth)
                : null,
            //initialValue: 'AR',
            itemBuilder: (Country country) => hasSelectedItemBuilder == true
                ? _buildDropdownItemWithLongText(country, dropdownItemWidth)
                : _buildDropdownItem(country, dropdownItemWidth),
            initialValue: 'AR',
            itemFilter: filtered
                ? (c) => ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode)
                : null,
            //priorityList is shown at the beginning of list
            priorityList: hasPriorityList
                ? [
                    CountryPickerUtils.getCountryByIsoCode('GB'),
                    CountryPickerUtils.getCountryByIsoCode('CN'),
                  ]
                : null,
            sortComparator: sortedByIsoCode
                ? (Country a, Country b) => a.isoCode.compareTo(b.isoCode)
                : null,
            onValuePicked: (Country country) {
              print("${country.name}");
            },
          ),
        ),
        // SizedBox(
        //   width: 0.0,
        // ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: "Phone",
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.number,
          ),
        )
      ],
    );
  }

  Widget _buildDropdownItem(Country country, double dropdownItemWidth) =>
      SizedBox(
        width: dropdownItemWidth,
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 5.0,
            ),
            Expanded(child: Text("+${country.phoneCode}(${country.isoCode})")),
          ],
        ),
      );

  Widget _buildDropdownItemWithLongText(
          Country country, double dropdownItemWidth) =>
      SizedBox(
        width: dropdownItemWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              SizedBox(
                width: 5.0,
              ),
              Expanded(child: Text("${country.name}")),
            ],
          ),
        ),
      );

  Widget _buildDropdownSelectedItemBuilder(
          Country country, double dropdownItemWidth) =>
      SizedBox(
          width: dropdownItemWidth,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  CountryPickerUtils.getDefaultFlagImage(country),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: Text(
                    '${country.name}',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )),
                ],
              )));

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
          ),
        ),
      );

  void _openFilteredCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: CountryPickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: Text('Select your phone code'),
                onValuePicked: (Country country) =>
                    setState(() => _selectedFilteredDialogCountry = country),
                itemFilter: (c) => ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
                itemBuilder: _buildDialogItem)),
      );

  void _openCupertinoCountryPicker() => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerCupertino(
          backgroundColor: Colors.black,
          itemBuilder: _buildCupertinoItem,
          pickerSheetHeight: 300.0,
          pickerItemHeight: 75,
          initialCountry: _selectedCupertinoCountry,
          onValuePicked: (Country country) =>
              setState(() => _selectedCupertinoCountry = country),
          priorityList: [
            CountryPickerUtils.getCountryByIsoCode('TR'),
            CountryPickerUtils.getCountryByIsoCode('US'),
          ],
        );
      });

  void _openFilteredCupertinoCountryPicker() => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerCupertino(
          backgroundColor: Colors.white,
          pickerSheetHeight: 200.0,
          initialCountry: _selectedFilteredCupertinoCountry,
          onValuePicked: (Country country) =>
              setState(() => _selectedFilteredCupertinoCountry = country),
          itemFilter: (c) => ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
        );
      });

  Widget _buildCupertinoSelectedItem(Country country) {
    return Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Text("+${country.phoneCode}"),
        SizedBox(width: 8.0),
        Flexible(child: Text(country.name))
      ],
    );
  }

  Widget _buildCupertinoItem(Country country) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: CupertinoColors.white,
        fontSize: 16.0,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 8.0),
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      ),
    );
  }
}
