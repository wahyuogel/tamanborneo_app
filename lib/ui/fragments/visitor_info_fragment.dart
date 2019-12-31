import 'package:flutter/material.dart';
import 'package:zoo_app/ui/components/home/home_ticket_banner.dart';
import 'package:zoo_app/resources/app_colors.dart';
import 'package:zoo_app/resources/app_strings.dart';

class VisitorInfoFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: TabBar(
                indicatorColor: Colors.green,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.info_outline, color: Colors.green)),
                  Tab(icon: Icon(Icons.map, color: Colors.green,)),
                ]),
            body: TabBarView(
                children: <Widget>[
                  _buildGeneralInfoSection(context),
                  _buildSpecificInfoSection(context)
                ])
        )
    );
  }

  Widget _buildGeneralInfoSection(BuildContext context) {
    return SingleChildScrollView(child: Container(
        child: Column(
            children: <Widget>[
              _buildLabel(context, Strings.vInfoContact),
              Table(
                  children: [
                    _buildTableRow(Strings.vInfoPhoneLabel,
                        Strings.vInfoPhoneContent),
                  ]),
              _buildLabel(context, Strings.vInfoEntranceFee),
              Table(
                  children: [
                    _buildTableRow(Strings.vInfoEntranceFeeLabel,
                        Strings.vInfoEntranceFeeWeekday),
                    _buildTableRow("",
                        Strings.vInfoEntranceFeeWeekend),
                  ]),
              _buildLabel(context, Strings.vInfoOpeningHour),
              Table(
                  children: [
                    _buildTableRow(Strings.vInfoOpeningHourLabel,
                        Strings.vInfoOpeningHourContent),
                  ]),

              _buildLabel(context, Strings.vInfoBuyTicketOnline),
              Padding( child : HomeTicketBanner(), padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
              _buildLabel(context, Strings.vInfoAddress),
              Table(
                  children: [
                    _buildTableRow(Strings.vInfoAddressLabel,
                        Strings.vInfoAddressContent),
                  ]),
            ])
    ));
  }

  Widget _buildSpecificInfoSection(BuildContext context){
    return SingleChildScrollView(child: Container(
        child: Column(
            children: <Widget>[
              _buildLabel(context, Strings.vInfoHowToGo),
              Table(
                  children: [
                    _buildTableRow(Strings.vInfoHowToGoByCarLabel,
                        Strings.vInfoHowToGoByCarContent),
                    _buildTableRow(Strings.vInfoHowToGoByBusLabel,
                        Strings.vInfoHowToGoByBusContent),
                    _buildTableRow(Strings.vInfoHowToGoByPublicTransLabel,
                        Strings.vInfoHowToGoByPublicTransContent),
                  ]),
            ])
    ));
  }

  TableRow _buildTableRow(String label, String content) {
    return TableRow(
        children: [
          Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0),
              )),
          Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(content,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black45,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0),
              )),
        ]);
  }

  Widget _buildLabel(BuildContext context, String label) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 40,
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          color: AppColors.primary
      ),
      child: Text(label,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18.0),
      ),
    );
  }
}