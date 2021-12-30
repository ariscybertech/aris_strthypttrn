import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import 'airport.dart';
import 'core/constant/lottie_constant.dart';
import 'core/model/transfer/airway_transfer.dart';
import 'core/model/transfer/bicyle_transfer.dart';
import 'core/model/transfer/bus_transfer.dart';
import 'core/model/transfer/car_transfer.dart';
import 'core/operation/IAirportManager.dart';
import 'core/operation/airport_manager.dart';

abstract class AirportViewModel extends State<Airport> {
  // Add your state and logic here
  TransferTypes types = TransferTypes.CAR;
  late final double _userMoney;
  String lottiePath = LottieItems.CAR.path;
  AlignmentGeometry alignment = Alignment.centerLeft;
  late IAirportManager manager;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _userMoney = 100;
    manager = AirportManager(transfer: CarTransfer(), money: _userMoney);
  }

  void changeTypes(TransferTypes? type) {
    if (type == null) {
      return;
    }
    manager = createAirportMAnager(type);
    setState(() {
      types = type;
    });
  }

  IAirportManager createAirportMAnager(TransferTypes types) {
    switch (types) {
      case TransferTypes.AIRPlANE:
        lottiePath = LottieItems.AIRPLANE.path;
        return AirportManager(transfer: AirwayTransfer(), money: _userMoney);

      case TransferTypes.CAR:
        lottiePath = LottieItems.CAR.path;
        return AirportManager(transfer: CarTransfer(), money: _userMoney);

      case TransferTypes.BUS:
        lottiePath = LottieItems.BUS.path;
        return AirportManager(transfer: BusTransfer(), money: _userMoney);

      case TransferTypes.BCYLE:
        lottiePath = LottieItems.BCYLE.path;
        return AirportManager(transfer: BiclyeTransfer(), money: _userMoney);
    }
  }

  void changeAligment() {
    setState(() {
      alignment = alignment == Alignment.centerRight ? Alignment.centerLeft : Alignment.centerRight;
    });
  }

  Future<void> onWayPlay() async {
    changeAligment();
    await Future.delayed(context.durationLow);
    if (manager.completeTransfer()) {
      manager.transfer.sendMessage(user: 'VB');
      showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          children: [Lottie.asset(LottieItems.DONE.path), Text('Cost: ${manager.transfer.calculate()}')],
        ),
      );
    } else {
      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(content: Text('${manager.transfer.calculate()} dont have')));
    }
    changeAligment();
  }
}

enum TransferTypes { CAR, BCYLE, AIRPlANE, BUS }
