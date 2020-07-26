class Calculate {
  Calculate({this.billAmount, this.splitBetween, this.tip});

  double billAmount;
  int tip;
  int splitBetween;

  double totalAmount;
  double tipTotal;
  double tipEach;

  String calculateBill() {
    totalAmount = (billAmount + (billAmount * (tip / 100))) / splitBetween;
    return totalAmount.toStringAsFixed(2);
  }

  String calculateTipTotal() {
    tipTotal = (billAmount * (tip / 100));
    return tipTotal.toStringAsFixed(2);
  }

  String calculateTipEach() {
    tipEach = (billAmount * (tip / 100)) / splitBetween;
    return tipEach.toStringAsFixed(2);
  }
}
