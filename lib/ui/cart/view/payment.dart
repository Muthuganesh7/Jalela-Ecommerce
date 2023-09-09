import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lalela/constants/middleware.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import '../../../constants/string_constant.dart';

class PaymentPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PaymentState();
  }

}
class PaymentState extends State<PaymentPage>{
  MiddleWare middleWare = MiddleWare();
  int selectedCard = 0;
  TextEditingController mobileOtpController = TextEditingController();
  TextEditingController emailOtpController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
       appBar: AppBar(automaticallyImplyLeading: false,title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
         Icon(Icons.arrow_back_ios),
         Text(paymentMethod,style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold),),
         Container()
       ],),elevation: 0,backgroundColor: Colors.transparent,),
       body: SingleChildScrollView(
       child: Column(children: [
         getPaymentGateways(),
         getCardDetails(),

    ])
   ));
  }
  getCardDetails(){
    return Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children:[
      middleWare.putSizedBoxHeight(10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Row(children: [
          middleWare.putSizedBoxWidth(20),
          Container(padding: EdgeInsets.all(10),
            child: SvgPicture.asset('assets/images/debitcard.svg', height: 30, width: 30),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.grey.shade200),),
          middleWare.putSizedBoxWidth(10),
          Column(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
            Container(child: Text(debitCreditCard,style: middleWare.customTextStyle(15, Colors.black, FontWeight.bold),),),
            Container(child: Text(autopay,style: middleWare.customTextStyle(14, Colors.grey, FontWeight.normal),),)
          ],),]),
        Container(child: Icon(Icons.keyboard_arrow_up),margin: EdgeInsets.only(right: 20)),
      ],),
      Container(margin: EdgeInsets.only(left: 20,top: 20),child: Text(savedCards,style: middleWare.customTextStyle(15, Colors.black, FontWeight.bold),),),
      ListView.builder(itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, index) {
        return getCreditAndDebitCards();

      },),

      Container(
          margin: EdgeInsets.all(5),
          child: Card(elevation: 10,shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),child:Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.start,children: [
            Container(padding: EdgeInsets.all(10),margin: EdgeInsets.all(10),
              child: Image.asset('assets/images/mastercard.png', height: 30, width: 30),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.grey.shade200),),
            middleWare.putSizedBoxWidth(20),
            Container(child:Text(creditDebitCard,style: middleWare.customTextStyle(14, Colors.black, FontWeight.bold),),),
          ],),
            middleWare.putSizedBoxHeight(20),
            getCardNumberInput(),
            middleWare.putSizedBoxHeight(20),
            getCardNumberInput(),
            SizedBox(width: 200,height: 300,child: Expanded (child: CreditCardForm(cardNumber: "", expiryDate: "", cardHolderName: "", cvvCode: "",
                onCreditCardModelChange: (CreditCardModel data) {},
                themeColor: middleWare.uiThemeColor,
                formKey: _key)),)
              // getCVV(),
          ])))

    ]),);
  }

  getCreditAndDebitCards(){
    return Container(
        margin: EdgeInsets.all(5),
        child: Card(elevation: 10,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Container(padding: EdgeInsets.all(10),margin: EdgeInsets.all(10),
            child: Image.asset('assets/images/mastercard.png', height: 30, width: 30),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.grey.shade200),),

          Container(child:Text("6895 2456 8965 3698",style: middleWare.customTextStyle(14, Colors.black, FontWeight.bold),),),

          Container(child: Radio(onChanged: (val){
            setState(() {
              selectedCard = val!;
            });
          }, value: 1, groupValue: selectedCard,activeColor: middleWare.uiThemeColor,))
        ],)));
  }
  Container getCardNumberInput() {
    return Container(
      margin: EdgeInsets.only(
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: Opacity(
        opacity: 0.8,
        // child:
        // Padding(
        //   padding: EdgeInsets.only(
        //     top: middleWare.minimumPadding,
        //     bottom: middleWare.minimumPadding,
        //   ),
        child: TextFormField(

          style: middleWare.customTextStyle(
              14.00, middleWare.uiTextColor, FontWeight.bold),
          controller: cardNumberController,
          keyboardType: TextInputType.number,
          validator: (value) {
            value = value ?? "";
            if (value
                .trim()
                .isEmpty) {
              return "Please enter card number";
            } else if (value
                .trim()
                .length != 10) {
              return "Please enter valid card number";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: cardNumber,
            hintStyle: middleWare.customTextStyle(
                14.00, middleWare.uiFordGrayColor, FontWeight.normal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: middleWare.uiLightTextColor),
            ),
          ),
          /*onChanged: onSearchTextChanged,*/
        ),
        // ),
      ),
    );
  }

  getPaymentGateways(){
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(elevation: 10,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),child: Column(children:[
        middleWare.putSizedBoxHeight(10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Row(children: [
            middleWare.putSizedBoxWidth(20),
            Container(padding: EdgeInsets.all(10),
              child: SvgPicture.asset('assets/images/wallet.svg', height: 30, width: 30),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.grey.shade200),),
            middleWare.putSizedBoxWidth(10),
            Column(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
              Container(child: Text(upi,style: middleWare.customTextStyle(15, Colors.black, FontWeight.bold),),),
              Container(child: Text(nootp,style: middleWare.customTextStyle(14, Colors.grey, FontWeight.normal),),)
            ],),]),
          Container(child: Icon(Icons.keyboard_arrow_up),margin: EdgeInsets.only(right: 20)),
        ],),
        middleWare.putSizedBoxHeight(20),
        Row(children: [
          middleWare.putSizedBoxWidth(20),
          Column(children:[
            Container(padding: EdgeInsets.all(15),
              child: Image.asset('assets/images/gpay.png', height: 30, width: 30),
              decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey.shade400),borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.grey.shade200),),
            middleWare.putSizedBoxHeight(5),
            Text(gpay,style: middleWare.customTextStyle(13, middleWare.uiTextColor, FontWeight.normal),)
          ]),
          middleWare.putSizedBoxWidth(15),
          Column(children:[
            Container(padding: EdgeInsets.all(15),
              child: Image.asset('assets/images/phonepe.png', height: 30, width: 30),
              decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey.shade400),borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.grey.shade200),),
            middleWare.putSizedBoxHeight(5),
            Text(phonePay,style: middleWare.customTextStyle(13, middleWare.uiTextColor, FontWeight.normal),)
          ]),
          middleWare.putSizedBoxWidth(15),

          Column(children:[
            Container(padding: EdgeInsets.all(15),
              child: Image.asset('assets/images/airtel.png', height: 30, width: 30),
              decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey.shade400),borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.grey.shade200),),
            middleWare.putSizedBoxHeight(5),
            Text(airtelPay,style: middleWare.customTextStyle(13, middleWare.uiTextColor, FontWeight.normal),)
          ]),
          middleWare.putSizedBoxWidth(15),

          Column(children:[
            Container(padding: EdgeInsets.all(15),
              child: Icon(Icons.add, size: 30,color: middleWare.uiThemeColor),
              decoration: BoxDecoration(border: Border.all(width: 1,color: middleWare.uiThemeColor),borderRadius: BorderRadius.all(Radius.circular(10)),color: middleWare.themeTransparent),),
            middleWare.putSizedBoxHeight(5),
            Text(addUpiId,style: middleWare.customTextStyle(13, middleWare.uiTextColor, FontWeight.normal),)
          ]),
        ]),

        middleWare.putSizedBoxHeight(10),
      ]),),);
  }
}
class ExpiryDateInput extends StatefulWidget {
  @override
  _ExpiryDateInputState createState() => _ExpiryDateInputState();
}

class _ExpiryDateInputState extends State<ExpiryDateInput> {
  final TextEditingController _expiryDateController = TextEditingController();
  late String _errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _expiryDateController,
        decoration: InputDecoration(
          labelText: 'Expiry Date (MM/YY)',
          errorText: _errorText,
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            _errorText = validateExpiryDate(value);
          });
        },
      );
  }

  String validateExpiryDate(String input) {
    if (input.isEmpty) {
      return 'Please enter a date';
    }

    // Validate the format (MM/YY)
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(input)) {
      return 'Invalid format (MM/YY)';
    }

    final parts = input.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    // Validate the numeric values
    if (month == null || year == null) {
      return 'Invalid month or year';
    }

    final now = DateTime.now();
    final currentYear = now.year % 100; // Last two digits of the current year

    if (year < currentYear || year > currentYear + 10) {
      return 'Card has expired';
    }

    if (month < 1 || month > 12) {
      return 'Invalid month';
    }

    if (year == currentYear && month < now.month) {
      return 'Card has expired';
    }

    return "null"; // No error
  }

  @override
  void dispose() {
    _expiryDateController.dispose();
    super.dispose();
  }
}