import '../IAirport.dart';

abstract class IAirportManager {
  final ITransfer transfer;
  final double money;
  bool completeTransfer();
  IAirportManager(this.transfer, this.money);
}
