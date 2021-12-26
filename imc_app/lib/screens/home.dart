import 'package:imc_app/constants_app/app_constants.dart';
import 'package:imc_app/widgets/left_bar.dart';
import 'package:imc_app/widgets/right_bar.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _result =0;
  String _TextResult="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:   Text(
          "Calculateur IMC",
          style: TextStyle(color: accentHexcolor,fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexcolor,
      body: SingleChildScrollView(
        child: Column(
          children:  [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexcolor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Taille",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                      )
                    ),
                  )
                ),
                Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexcolor
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Poids",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          )
                      ),
                    )
                ),
              ],
            ),
              const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _result = _w/(_h*_h);
                    if (_result<18.5 ){
                      _TextResult ="Insuffisance podérale(maigreur)";
                    } else if (_result >= 18.5 && _result <= 25){
                      _TextResult ="Corpulence normale";
                    }else if (_result > 25 && _result <= 30){
                      _TextResult ="Vous etes en surpoids ";
                    } else if (_result > 30 && _result <= 35){
                      _TextResult ="Obésité modérée ";
                    } else if (_result > 35 && _result <= 40){
                      _TextResult ="Obésité sévère ";
                    }else{
                      _TextResult ="Obésité morbide ou massive ";
                    }
                  });
              },
              child: Container(
                child: Text("Calculer",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: accentHexcolor),),
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              child: Text(_result.toStringAsFixed(2),style: TextStyle(fontSize: 90, color: accentHexcolor),),
            ),
            const SizedBox(height: 30,),
           Visibility(
             visible: _TextResult.isNotEmpty,
             child: Container(
             child: Text(
               _TextResult,
               style: TextStyle(
                   fontSize: 32,
                   fontWeight: FontWeight.w400,
                   color: accentHexcolor),),
           ),),
            const SizedBox(height: 10,),
             const LeftBar(barWidth: 40,),
            

            const SizedBox(height: 20,),
            const RightBar(barWidth: 70,),
            const SizedBox(height: 50,),
            const RightBar(barWidth: 70,),
            const SizedBox(height: 50,),
            const RightBar(barWidth: 20,),



          ],
        ),
      ),
    );
  }
  
}



