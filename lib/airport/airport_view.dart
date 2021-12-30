import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import 'airport_view_model.dart';
import 'core/constant/lottie_constant.dart';

class AirportView extends AirportViewModel {
  final String title = 'Welcome Airport @VBacik10';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
          minimum: context.paddingLow,
          child: Column(
            children: [
              Expanded(child: Lottie.asset(LottieItems.AIRPORT.path)),
              Divider(),
              Expanded(child: buildAnimatedAlign(context)),
              Text(title, style: context.textTheme.headline5),
              Row(
                children: [
                  Expanded(child: buildColumnRadio()),
                  buildFloatingActionButtonPlay(),
                ],
              ),
            ],
          )),
    );
  }

  AnimatedAlign buildAnimatedAlign(BuildContext context) {
    return AnimatedAlign(
        duration: context.durationLow, alignment: alignment, child: SizedBox(width: context.dynamicWidth(0.4), child: Lottie.asset(lottiePath)));
  }

  Column buildColumnRadio() {
    return Column(
      children: [
        RadioListTile<TransferTypes>(value: TransferTypes.BUS, title: Text('Bus'), groupValue: types, onChanged: (val) => changeTypes(val)),
        RadioListTile<TransferTypes>(value: TransferTypes.AIRPlANE, title: Text('Airplane'), groupValue: types, onChanged: (val) => changeTypes(val)),
        RadioListTile<TransferTypes>(value: TransferTypes.CAR, title: Text('Car'), groupValue: types, onChanged: (val) => changeTypes(val)),
        RadioListTile<TransferTypes>(value: TransferTypes.BCYLE, title: Text('Bcyle'), groupValue: types, onChanged: (val) => changeTypes(val)),
      ],
    );
  }

  FloatingActionButton buildFloatingActionButtonPlay() {
    return FloatingActionButton(
      onPressed: () {
        onWayPlay();
      },
      child: Icon(Icons.play_arrow),
    );
  }
}
