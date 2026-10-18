
import 'package:flutter/material.dart';
import 'logic.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget{const MyApp({super.key});@override Widget build(BuildContext c)=>MaterialApp(debugShowCheckedModeBanner:false,title:'ChurchHub',theme:ThemeData(colorScheme:ColorScheme.fromSeed(seedColor:Color(0xFF6A1B9A)),useMaterial3:true),home:const Home());}
String naira(num v)=>'₦${v.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\B)(?=(\d{3})+(?!\d))'),(m)=>',')}';

class Home extends StatefulWidget{const Home({super.key});@override State<Home> createState()=>_S();}
class _S extends State<Home>{int tab=0,attendance=0;
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('ChurchHub')),body:[_dash(),_members(),_giving()][tab],bottomNavigationBar:NavigationBar(selectedIndex:tab,onDestinationSelected:(i)=>setState(()=>tab=i),destinations:const[NavigationDestination(icon:Icon(Icons.church),label:'Dashboard'),NavigationDestination(icon:Icon(Icons.people),label:'Members'),NavigationDestination(icon:Icon(Icons.volunteer_activism),label:'Giving')]));
 Widget _dash()=>ListView(padding:const EdgeInsets.all(16),children:[Text('Members: ${members.length} · Giving: ${naira(totalGiving)}',style:const TextStyle(fontSize:18,fontWeight:FontWeight.bold)),const SizedBox(height:12),Text('Service attendance today: $attendance'),ElevatedButton(onPressed:()=>setState(()=>attendance++),child:const Text('Mark one attendee present')),...events.map((e)=>ListTile(leading:const Icon(Icons.event),title:Text(e)))]);
 Widget _members()=>ListView(children:[...groups.map((g)=>ListTile(title:Text(g),trailing:Chip(label:Text('${membersIn(g)}')))),const Divider(),...members.map((m)=>ListTile(title:Text(m.name),subtitle:Text('${m.group} · ${m.phone}')))]);
 Widget _giving()=>ListView(children:givings.map((g)=>ListTile(title:Text('${g.type} · ${naira(g.amount)}'),subtitle:Text(g.member))).toList());
}
