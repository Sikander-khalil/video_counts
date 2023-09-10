import 'package:d_chart/d_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {

  final data = [

    {

      'study' : 'Math',
      'student' : 20,

    },
    {

      'study' : 'Bio',
      'student' : 70,

    },
    {

      'study' : 'Physics',
      'student' : 50,

    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Charts"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          AspectRatio(aspectRatio: 16 / 9,
          child: DChartPie(

           data: data.map((e) {


             return {'domain' : e['study'], 'measure' : e['student']};

           }).toList(),
            fillColor: (pieData,index){

             switch (pieData['domain']){

               case 'Math':
                 return Colors.red;
               case 'Bio':
                 return Colors.green;



               default:

                 return Colors.blue;

             }

            },
            labelColor: Colors.black,
            labelFontSize: 18,
            labelPosition: PieLabelPosition.outside,
            labelLineColor: Colors.amber,
            labelLineThickness: 2,
            labelLinelength: 16,
            labelPadding: 1,
            pieLabel: (Map<dynamic,dynamic> pieData, int? index){

             return pieData['domain'] +
              ':\n ' +

              pieData['measure'].toString();


            },

            donutWidth: 20,






          )


          ),


        ],
      ),


    );
  }
}

class HomeBack extends StatefulWidget {
  const HomeBack({super.key});

  @override
  State<HomeBack> createState() => _HomeBackState();
}

class _HomeBackState extends State<HomeBack> {
  final colorList = <Color>[

    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          PieChart(dataMap: {

            "Total" : 20,
            "Recovered" : 80,
            "Death" : 100,





          },
            chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: false
            ),
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            legendOptions: const LegendOptions(
                legendPosition: LegendPosition.left
            ),
            animationDuration: const Duration(milliseconds: 1200),
            chartType: ChartType.ring,
            colorList: colorList,

          ),
        ],
      ),
    );
  }
}
