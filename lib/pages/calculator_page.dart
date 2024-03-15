import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController pricePurchasedController = TextEditingController();
  TextEditingController shareHeldController = TextEditingController();
  TextEditingController brokerageController = TextEditingController();
  TextEditingController minBrokerageController = TextEditingController();
  TextEditingController priceSoldController = TextEditingController();
  TextEditingController taxedController = TextEditingController();
  TextEditingController taxExemptController = TextEditingController();

  double shareHeld = 0.0;
  double pricePurchased = 0.0;
  double brokerage = 0.0;
  double minBrokerage = 0.0;
  double priceSold = 0.0;
  double taxed = 0.0;
  double taxExempt = 0.0;

  double pricePurchasedPerShare = 0.0;
  double totalGrossProfitLoss = 0.0;
  double lessBuyingAndSellingBrokerage = 0.0;
  double lessClearingFees = 0.0;
  double lessStampDuties = 0.0;
  double netProfitLoss = 0.0;
  double investmentChangePercentage = 0.0;
  double netDividend = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Title Container
          Container(
            alignment: Alignment.center,
            child: Text(
              "Bursa Investment Calculator",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Input And Output of Calculator Container
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profit & Loss Calculation
                Text(
                  "Profit & Loss Calculation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                // Input Fields
                NumericInputField(labelText: 'Price Purchased (RM)', controller: pricePurchasedController),
                NumericInputField(labelText: 'Share Held (Units)', controller: shareHeldController),
                NumericInputField(labelText: 'Brokerage (%)', controller: brokerageController),
                NumericInputField(labelText: 'Minimum Brokerage (RM)', controller: minBrokerageController),
                NumericInputField(labelText: 'Price Sold (RM)', controller: priceSoldController),
                SizedBox(height: 16),
                // Gross Dividend Per Share
                Text(
                  "Gross Dividend Per Share",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                // Input Fields
                NumericInputField(labelText: 'Taxed (RM)', controller: taxedController),
                NumericInputField(labelText: 'Tax Exempt (RM)', controller: taxExemptController),
                SizedBox(height: 16),
                // Output Fields
                if (pricePurchasedPerShare != 0.0 || totalGrossProfitLoss != 0.0 || lessBuyingAndSellingBrokerage != 0.0 || lessClearingFees != 0.0 || lessStampDuties != 0.0 || netProfitLoss != 0.0 || investmentChangePercentage != 0.0 || netDividend != 0.0) ...[
                  Text(
                    "Output",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Output Fields
                  Column(
                    children: [
                      OutputTextField(labelText: "Share Held (Units)", value: shareHeld.toStringAsFixed(2)),
                      OutputTextField(labelText: "Price Purchased Per Share (RM)", value: pricePurchasedPerShare.toStringAsFixed(2)),
                      OutputTextField(labelText: "Price Sold (RM)", value: priceSold.toStringAsFixed(2)),
                      OutputTextField(labelText: "Total Gross Profit (Loss) On These Shares (RM)", value: totalGrossProfitLoss.toStringAsFixed(2)),
                      OutputTextField(labelText: "Less Buying And Selling Brokerage (RM)", value: lessBuyingAndSellingBrokerage.toStringAsFixed(2)),
                      OutputTextField(labelText: "Less Clearing Fees (RM)", value: lessClearingFees.toStringAsFixed(2)),
                      OutputTextField(labelText: "Less Stamp Duties (RM)", value: lessStampDuties.toStringAsFixed(2)),
                      OutputTextField(labelText: "Net Profit (Loss) (RM)", value: netProfitLoss.toStringAsFixed(2)),
                      OutputTextField(labelText: "As A Percentage, Your Investment Has Changed (%)", value: investmentChangePercentage.toStringAsFixed(2)),
                      OutputTextField(labelText: "Net Dividend (RM)", value: netDividend.toStringAsFixed(2)),
                    ],
                  ),
                ],
                SizedBox(height: 16),
                // Reset and Calculate Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _resetValues,
                      child: Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: _calculateValues,
                      child: Text('Calculate'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _calculateValues() {
    setState(() {
      shareHeld = double.tryParse(shareHeldController.text) ?? 0.0;
      pricePurchased = double.tryParse(pricePurchasedController.text) ?? 0.0;
      brokerage = double.tryParse(brokerageController.text) ?? 0.0;
      minBrokerage = double.tryParse(minBrokerageController.text) ?? 0.0;
      priceSold = double.tryParse(priceSoldController.text) ?? 0.0;
      taxed = double.tryParse(taxedController.text) ?? 0.0;
      taxExempt = double.tryParse(taxExemptController.text) ?? 0.0;

      // Perform calculations
      pricePurchasedPerShare = pricePurchased / shareHeld; // bursa punya salah, im better
      totalGrossProfitLoss = (priceSold - pricePurchased) * shareHeld; 
      lessBuyingAndSellingBrokerage = 0.0; // idk how 
      lessClearingFees = 0.0; // idk how calculation
      lessStampDuties = 0.0; // idk the calculation
      netProfitLoss = totalGrossProfitLoss - lessBuyingAndSellingBrokerage - lessClearingFees - lessStampDuties; //tak complete sebab tak tau lessClearingFees and lessStampDuties tu kira macam mana, i think.
      investmentChangePercentage = pricePurchased != 0 ? ((priceSold - pricePurchased) / pricePurchased) * 100 : 0.0; //idk if the calculations are correct or not but value hampir sama dengan bursa
      netDividend = 0.0; // idk how...
    });
  }

  void _resetValues() {
    setState(() {
      pricePurchasedController.clear();
      shareHeldController.clear();
      brokerageController.clear();
      minBrokerageController.clear();
      priceSoldController.clear();
      taxedController.clear();
      taxExemptController.clear();

      pricePurchasedPerShare = 0.0;
      totalGrossProfitLoss = 0.0;
      lessBuyingAndSellingBrokerage = 0.0;
      lessClearingFees = 0.0;
      lessStampDuties = 0.0;
      netProfitLoss = 0.0;
      investmentChangePercentage = 0.0;
      netDividend = 0.0;
    });
  }
}

class NumericInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  NumericInputField({required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: labelText),
    );
  }
}

class OutputTextField extends StatelessWidget {
  final String labelText;
  final String value;

  OutputTextField({required this.labelText, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            initialValue: value,
            readOnly: true,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}
