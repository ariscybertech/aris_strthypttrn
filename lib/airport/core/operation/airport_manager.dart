import '../IAirport.dart';
import 'IAirportManager.dart';

class AirportManager extends IAirportManager {
  AirportManager({required ITransfer transfer, required double money}) : super(transfer, money);

  @override
  bool completeTransfer() {
    final wayCost = transfer.calculate();
    return money >= wayCost;
  }
}
