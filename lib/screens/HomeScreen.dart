// ignore_for_file: prefer_const_constructors
import 'package:econnect/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://support.ceiba-healthcare.com/hc/en-us/requests/new');

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _scanBarcode = 'Unknown';

  
  @override
  void initState() {
    super.initState();
  }
 
 Future<void> scanBarcodeNormal() async {
  String barcodeScanRes;
  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
    print(barcodeScanRes);
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version';
  }

  if(!mounted) return;
  setState(() {
    _scanBarcode = barcodeScanRes;
  });

 }




 signOut() async  {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
 }

Future<void> _launchUrl() async {
      if(!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }



  Widget build(BuildContext context) {
    return Scaffold(
      

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple[200],
        title:Text ('Smart Infusion Administration'),
        actions: <Widget> [

          
          SizedBox(
            
            width: 50,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Color.fromARGB(255, 112, 69, 139),
              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              
              textStyle: TextStyle(
                fontSize: 14,
                
              ),    
            ),
              onPressed: _launchUrl,  
            child: Text('Need Help'), 
            ), 
            ),


          SizedBox(
            height: 15,
            width: 55,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue,
              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              
              textStyle: TextStyle(
                fontSize: 12,
                
              ),     
            ),
              onPressed: () {
              signOut();
            },
            
            child: Text('Logout'), 
            ),
            ),

            
        ],
          ),
    
        


      body: Container(

      color: Colors.white,
      alignment: Alignment.center,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [

          ElevatedButton(           
          onPressed: () => scanBarcodeNormal(),
          
          child: 
          Text('Barcode'),
          
          //SvgPicture.asset('lib/images/barcode-medication.3bceaa06.svg',
          
          
          //width: 40,
          //height: 80,
          
          
          //),   
          ),
          SizedBox(
            height: 30,
          ),

          SizedBox(
            height: 30,
            child: Text('OR'),
          ),

     
          SizedBox(
            width: 200,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.only(left: 15, right: 15),
              hintText: "Enter the Medication Serial No. manually"
            ),
          ), 
          ),

          SizedBox(
            height: 30,
          ),

          Text('you barcode: '),
          Text(_scanBarcode),





          
          
        ],
             
      ),
      
    ), 
      
    );
  }
}
