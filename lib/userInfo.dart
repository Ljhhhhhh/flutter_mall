import 'package:flutter/material.dart';
import 'package:flutter_mall/components/edit_view.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:address_picker/address_picker.dart';

class UserinfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserinfoWidgetState();
  }
}

class UserinfoWidgetState extends State<UserinfoWidget> {
  @override
  final _formKey = GlobalKey<FormState>();
  FocusNode pWF = new FocusNode();
  TextEditingController pWC = new TextEditingController();
  TextEditingController pWAdd = new TextEditingController();
  String _format = 'yyyy-MM-dd';
  TextEditingController _formatCtrl = TextEditingController();
  DateTime _dateTime;

  void _showTimePicker() {
    const String MIN_DATETIME = '2010-05-12 05:15:20';
    const String MAX_DATETIME = '2021-11-25 22:45:10';
    const String INIT_DATETIME = '2019-05-17 18:13:15';
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: DateTime.parse(INIT_DATETIME),
      dateFormat: _format,
      pickerMode: DateTimePickerMode.date, // show TimePicker
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('确认', style: TextStyle(color: Colors.red)),
        cancel: Text('取消', style: TextStyle(color: Color(0xFF333333))),
        // title: Text(
        //     '选择生日',
        //     style: TextStyle(color: Colors.green, fontSize: 24.0),
        //   ),
        // title: Container(
        //   decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
        //   width: double.infinity,
        //   height: 56.0,
        //   alignment: Alignment.center,
        //   child: Text(
        //     '选择生日',
        //     style: TextStyle(color: Colors.green, fontSize: 24.0),
        //   ),
        // ),
        titleHeight: 56.0,
      ),
      onCancel: () {
        debugPrint('onCancel');
      },
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        pWC.text = dateTime.toString();
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }

  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFFF3F4F6),
        appBar: AppBar(
          title: Text('我的资料'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text('我的资料',
                    style: TextStyle(
                        fontSize: 15,
                        height: 21 / 15,
                        color: Color(0xFF999999))),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  // child: Column(
                  //   children: <Widget>[TextField()],
                  // ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new EditView(
                          label: '手机号码',
                          hint: '填写手机号码',
                          controller: pWC,
                          // focusNode: pWF,
                          bottomLineColor: Colors.grey.withOpacity(0.5),
                          onTap: () => setState(() {}),
                          onChanged: (str) {
                            setState(() {});
                          },
                        ),
                        new EditView(
                          label: '姓名',
                          hint: '填写姓名',
                          controller: pWC,
                          // focusNode: pWF,
                          bottomLineColor: Colors.grey.withOpacity(0.5),
                          onTap: () => setState(() {}),
                          onChanged: (str) {
                            setState(() {});
                          },
                        ),
                        new EditView(
                          label: '性别',
                          hint: '填写性别',
                          controller: pWC,
                          // focusNode: pWF,
                          bottomLineColor: Colors.grey.withOpacity(0.5),
                          onTap: () => setState(() {}),
                          onChanged: (str) {
                            setState(() {});
                          },
                        ),
                        new EditView(
                          label: '生日',
                          readOnly: true,
                          hint: '填写生日',
                          controller: pWC,
                          // focusNode: pWF,
                          bottomLineColor: Colors.grey.withOpacity(0.5),
                          onTap: () => {_showTimePicker()},
                          onChanged: (str) {
                            setState(() {});
                          },
                        ),
                        new EditView(
                          label: '邮箱',
                          hint: '填写邮箱',
                          controller: pWC,
                          // focusNode: pWF,
                          bottomLineColor: Colors.grey.withOpacity(0.5),
                          onTap: () => setState(() {}),
                          onChanged: (str) {
                            setState(() {});
                          },
                        ),
                        // AddressPicker(
                        //   style: TextStyle(color: Colors.black, fontSize: 17),
                        //   mode: AddressPickerMode.provinceCityAndDistrict,
                        //   onSelectedAddressChanged: (address) {
                        //     print('${address.currentProvince.province}');
                        //     print('${address.currentCity.city}');
                        //     print('${address.currentDistrict.area}');
                        //   },
                        // ),
                        new EditView(
                          label: '所在地区',
                          hint: '填写所在地区',
                          controller: pWAdd,
                          // https://pub.flutter-io.cn/packages/address_picker
                          // https://pub.flutter-io.cn/packages/slide_popup_dialog#-example-tab-
                          // focusNode: pWF,
                          bottomLineColor: Colors.grey.withOpacity(0.5),
                          onTap: () => {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => BottomSheet(
                                    onClosing: () {},
                                    builder: (context) => Container(
                                          height: 250.0,
                                          child: AddressPicker(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17),
                                            mode: AddressPickerMode
                                                .provinceCityAndDistrict,
                                            onSelectedAddressChanged:
                                                (address) {
                                              print(
                                                  '${address.currentProvince.province}');
                                              print(
                                                  '${address.currentCity.city}');
                                              print(
                                                  '${address.currentDistrict.area}');
                                            },
                                          ),
                                        )))
                          },
                          onChanged: (str) {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  )),
              Container(height: 60),
              Material(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xFFF3C774), // 渐变背景
                  child: MaterialButton(
                    child: Text("确认",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                    onPressed: () {},
                    height: 50,
                    minWidth: 355,
                  )),
              Container(
                height: keyboardHeight,
              )
            ],
          ),
        ));
  }
}
