import 'dart:convert';
import 'package:date_time_format/date_time_format.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:video_count/video_player.dart';

import 'model.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {

 final String id;

   const HomeScreen({super.key, required this.id});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  final colorList = <Color>[

    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),


  ];



  Future<MyModel> getApiCall() async{

    final url = Uri.parse("https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&key=${widget.id}");

    var response = await get(url, headers: {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods':
      'GET,PUT,POST,DELETE'
    });

    if(response.statusCode == 200){


      final decoded = jsonDecode(response.body);



      return MyModel.fromJson(decoded);

    }else{

      throw Exception('Failed to load data. Status Code: ${response.statusCode}, Response Body: ${response.body}');


    }







  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiCall();
  }
  String formatDuration(int minutes, int seconds) {
    String formattedMinutes = '$minutes minute${minutes == 1 ? '' : 's'}';
    String formattedSeconds = '$seconds second${seconds == 1 ? '' : 's'}';

    return '$formattedMinutes $formattedSeconds';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<MyModel>(
        future: getApiCall(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.data == null) {
            return Center(
              child: Text("No data available"),
            );
          } else {
            final channelListResponse = snapshot.data;

            return ListView.builder(
              itemCount: channelListResponse!.items!.length,
              itemBuilder: (context, index){

                var viewCount = channelListResponse.items![index].statistics!.viewCount;
                var likecount = channelListResponse.items![index].statistics!.likeCount;
                var commentcount = channelListResponse.items![index].statistics!.commentCount;
    String? durationString = channelListResponse.items![index].contentDetails!.duration;


    RegExp regExp = RegExp(r'PT(\d+)M(\d+)S');
  Match? match = regExp.firstMatch(durationString!);

       String formattedDuration = ''; // Declare the variable here
                if(match != null){

                  int minutes = int.parse(match.group(1)!);

                  int seconds = int.parse(match.group(2)!);
                  formattedDuration = formatDuration(minutes, seconds); // Assign the value here

                }else {
                  print("Invalid duration format");
                }







                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Card(

                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white.withOpacity(0.9),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(channelListResponse.items![index].snippet!.title.toString(), style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 17),
                          PieChart(
                            dataMap: {
                              "Views Count": double.parse(viewCount!),
                              "Like Count": double.parse(likecount!),
                              "Comment Count": double.parse(commentcount!),
                            },
                            chartValuesOptions: const ChartValuesOptions(showChartValuesInPercentage: false,






                            ),
                            chartRadius: MediaQuery.of(context).size.width / 1.2,
                            legendOptions: const LegendOptions(legendPosition: LegendPosition.left),
                            animationDuration: const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            baseChartColor: Colors.white,
                            colorList: colorList,



                          ),

                          SizedBox(height: 17),
                          Image(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            image: NetworkImage(channelListResponse.items![index].snippet!.thumbnails!.high!.url.toString()),
                          ),
                        Row(
                          children: [
                            Text("Watch Time"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.video_collection),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(formattedDuration),
                            ),
                          ],
                        )
                        ],
                      ),

                    ),
                    onTap: (){
                      var id = snapshot.data!.items![index].id;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayer(id: id.toString())));





                    },
                  ),
                );



              },

            );
          }
        },
      ),

    );
  }
}

