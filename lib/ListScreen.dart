import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_example/MapScreen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ocean Trap"),
        actions: <Widget>[IconButton(icon: Icon(Icons.location_on,color: Colors.white,size: 30,), onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen()));
        },),SizedBox(width: 8,)],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Prototypes"),
          ),
          GestureDetector(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen(protoTypeLatLng: LatLng(26.4679011, -140.5077093),)));},

            child: Card(

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Prototype001',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 4,),
                        Text("Lat: 26.467, Lng: -140.507")
                      ],crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Status: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        Container(padding:EdgeInsets.all(4),decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Colors.blue,),child: Text("Empty",style: TextStyle(color: Colors.white),))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen(protoTypeLatLng: LatLng(31.9783886, -133.9622316),)));},

            child: Card(

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Prototype002',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 4,),
                        Text("Lat: 31.978, Lng: -133.962")
                      ],crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Status: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        Container(padding:EdgeInsets.all(4),decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Colors.red,),child: Text("Full",style: TextStyle(color: Colors.white),))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen(protoTypeLatLng: LatLng(28.1028001, -131.3196995),)));},
            child: Card(

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Prototype004',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 4,),
                        Text("Lat: 28.102, Lng: -131.319")
                      ],crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Status: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        Container(padding:EdgeInsets.all(4),decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Colors.green,),child: Text("Collecting",style: TextStyle(color: Colors.white),))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
