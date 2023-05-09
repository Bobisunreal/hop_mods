class mapfixes expands Mutator ;

function BeginPlay()
{
	FixCoopMaps();
	log("running the show off..",stringtoname("hopcoop()"));
	jumpthefish();
	AddGameRules();
}


function AddGameRules()
{
	local hops_GR gr;

	//local string ff;
	gr = Spawn(class'hops_GR');
	gr.MutatorPtr = self;
	if (Level.Game.GameRules == None)
		Level.Game.GameRules = gr;
	else if (gr != None)
		Level.Game.GameRules.AddRules(gr);
}


function MutateRespawningPlayer( Pawn Spawner )
{
local Amplifier am;
local DispersionPistol actthing;

 if (spawner.IsA('playerpawn') )
 {
 
   spawner.SetPropertyText("collisionheight", "35"); // for skarry tropper/nali
   consolecommand("set playerpawn collisionheight 35");
   
   foreach AllActors(class'Amplifier', am)
   {
	  if ( am.owner == spawner && am != None  && !IsInState('Activated'))
      {
	  am.GoToState('Activated');
	  }
	   
    }
	   
   foreach AllActors(class'DispersionPistol', actthing)
   {
	 if (spawner != None && actthing.owner == spawner &&  actthing != None )
      {
	  actthing.PowerLevel = 4;
	  }
	   
   }  


 }
}



function jumpthefish()
{

}



function FixCoopMaps()
{

	local String S;
	local mover mvr;
	local actor actthing;
	local class<actor> actNewClass;  // dlc
	local actor actthingaa;            // dlc
	
	
    S = caps(GetURLMap());
	if( InStr(S,".")==-1 )
	S = S$".unr";
	
// rtnp
 log(caps(S));
 
        // iniatal carcasses spawn death.
        actNewClass = class<actor>( DynamicLoadObject("dzitems.psilethalnali", class'Class' ) );
        foreach AllActors(class'actor', actthing)
       {
	     if (actthing.IsA('CreatureCarcass'))
         {
		  actthing.SetPropertyText("contents", "dzitems.psilethalnali");
		 }
	 
	    }	 
 
 
if(Level.Title =="Edge of Na PaliTHS" )
	{
	 Log("  -  Fixing thsRTNP bullshit...",'mapfix');
	 
	  foreach AllActors(class'mover', mvr)
       {
         if(mvr.tag == 'minedoor8')
         {
         mvr.trigger(self,self.Instigator);
         Log("  -  Opening entry doors..." $ string (mvr.name),'mapfix');
         };
       }
	 

       foreach AllActors(class'actor', actthing)
       {
   
	     if (actthing.IsA('dispatcher') || actthing.event == 'StartScout')
         {
		 dispatcher(actthing).OutDelays[1] = 3.0; // narration
		 dispatcher(actthing).OutDelays[2] = 2.0; // warm up
		 dispatcher(actthing).Outevents[0] = 'minedoor8'; // dont retrigger door
		 dispatcher(actthing).Outevents[2] = 'RadioTrans'; // dont retrigger door
		 dispatcher(actthing).Outevents[8] = ''; // dont retrigger door
		 }
	   
	   
         if (actthing.IsA('trigger')   && actthing.tag == 'StartScout' )
         {
         Log("  -  pre activating door messages...",'mapfix');
		 actthing.event = 'StartScout';
         }
		 
		
		 
	  }
		 

		 actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
         Spawn(actNewClass,,,vect(23476.083984,-13302.138672,-100.099998));  // entry, behind box inm conrner
		 Spawn(actNewClass,,,vect(23223.875000,-12707.416992,-109.099998));  // inside door
		 Spawn(actNewClass,,,vect(23736.072266,-12108.170898,-109.099998));  // hallway around conrner
		 
		 actNewClass = class<actor>( DynamicLoadObject("unreali.gaintmanta", class'Class' ) );
		 Spawn(actNewClass,,,vect(22206.923828,-11966.203125,-186.933319));  // on rock on left
		 

		 actNewClass = class<actor>( DynamicLoadObject("unreali.behemoth", class'Class' ) );
		 Spawn(actNewClass,,,vect(20749.240234,-8749.765625,104.548332));  // on rock on left
		 Spawn(actNewClass,,,vect(18939.500000,-11208.139648,278.471222));  // on rock on right
		 
		 // pond
		  actNewClass = class<actor>( DynamicLoadObject("unrealshare.superhealth", class'Class' ) );
		  actthingaa = Spawn(actNewClass,,,vect(17807.718750,-12956.914062,-678.400024));  // in water to right , trap.
		  actNewClass = class<actor>( DynamicLoadObject("hop_mods.dusk_waters", class'Class' ) );
		  actthingaa = Spawn(actNewClass,,,vect(17807.718750,-12956.914062,-678.400024));  // in water to right , trap.
		  
         //trap
		 actNewClass = class<actor>( DynamicLoadObject("rtnpmappak.rocketlauncher", class'Class' ) );
		 actthingaa = Spawn(actNewClass,,,vect(20133.978516,-10424.996094,-337.523773));  // center of area
		 actNewClass = class<actor>( DynamicLoadObject("hop_mods.dusk_titans", class'Class' ) );
		 actthingaa = Spawn(actNewClass,,,vect(20133.978516,-10424.996094,-337.523773));  // center of area
		 
		 actNewClass = class<actor>( DynamicLoadObject("hop_mods.dusk_upramp", class'Class' ) );
		 actthingaa = Spawn(actNewClass,,,vect(16257.152344,-9468.955078,-13.898766));  // near up ramp door pathnode
		 
		 actNewClass = class<actor>( DynamicLoadObject("hop_mods.dusk_headout", class'Class' ) );
		 actthingaa = Spawn(actNewClass,,,vect(12288.000000,-10064.000000,-1344.000000));  //at door heading of of lifty mine thing
		 
		  actNewClass = class<actor>( DynamicLoadObject("hop_mods.fillpond1", class'Class' ) );
		 actthingaa = Spawn(actNewClass,,,vect(5952.000000,-7456.000000,-2112.000000));  //near big rock outside mid
	
	}
	
if(Level.Title =="Neve's CrossingTHS" )
	{
	Log("nev edits",'mapfix');
	actNewClass = class<actor>( DynamicLoadObject("hop_mods.nevecpart2", class'Class' ) );
	actthingaa = Spawn(actNewClass,,,vect(2096.000000,-2832.000000,1248.000000));  //after catwalk
	
	actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
	actthingaa = Spawn(actNewClass,,,vect(4415.854004,-704.973389,1669.900024));  //corner tower
	
	}

if(Level.Title =="The Eldora Well1THS" )
	{
	Log("eldora spawns",'mapfix');
	// entra tents
	actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
	actthingaa = Spawn(actNewClass,,,vect(-311.491821,34.436157,411.899994));  //ceiling tent
	actthingaa = Spawn(actNewClass,,,vect(1271.343140,66.233833,411.899994));  //ceiling tent far
	// sliths on ground
	actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory8", class'Class' ) );
	actthingaa = Spawn(actNewClass,,,vect(480.000000,288.000000,-128.000000));  //floor, right hallway
	actthingaa = Spawn(actNewClass,,,vect(480.000000,-240.000000,-80.000000));  //floor, left hallway
	
	// slith drop at lift
	actNewClass = class<actor>( DynamicLoadObject("hop_mods.Eldora1lift", class'Class' ) );
	actthingaa = Spawn(actNewClass,,,vect(1264.000000,32.000000,-96.000000));  //lift dropps
	}

if( S~="Eldora2THS.unr" )
	{
	// playerstarts aafter well
	// squids everywhere
	
	
	}


if(Level.Title =="Glathriel VillageTHS" )
	{
	Log("glaths wrath",'mapfix');
	//triggered playerstart
	actNewClass = class<actor>( DynamicLoadObject("hop_mods.Glathriel1_push", class'Class' ) );
	actthingaa = Spawn(actNewClass,,,vect(112.000000,2464.000000,-448.000000));  //near big rock outside mid
	
	// tent in tunnel during boat ride
	actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
    Spawn(actNewClass,,,vect(4440.054688,3753.420410,-302.659790));  //tunnel
	Spawn(actNewClass,,,vect(3791.818848,2724.803223,-298.293701));  //tunnel 1
	
	// extra manta
	actNewClass = class<actor>( DynamicLoadObject("unreali.GiantManta", class'Class' ) );
    Spawn(actNewClass,,,vect(384.000000,3072.000000,784.000000));  //bird1 in sky

	// fix skarr player collsion at ending
	// height = 39
	}

if( S~="Glathriel2THS.unr" )
	{
	
	}
	
if( S~="CrashsiteTHS.unr" )
	{
	
	}

if( S~="Crashsite1THS.unr" )
	{
	
	}

	
if( S~="CrashSite2THS.unr" )
	{
	
	}	


if( S~="SpireLandTHS.unr" )
	{
	
	}	
	
	
if( S~="NagomiTHS.unr" )
	{
	
	}	

if( S~="VeloraTHS.unr" )
	{
	
	}	

if( S~="NagomiSunTHS.unr" )
	{
	
	}		


if(Level.Title =="Foundry Tarydium PlantTHS" )
	{
	  actNewClass = class<actor>( DynamicLoadObject("hop_mods.foundry_part2", class'Class' ) );
	  actthingaa = Spawn(actNewClass,,,vect(-1040.000000,2480.000000,-1194.000000));  //glass break hole
	
	
	}		


if( S~="ToxicTHS.unr" )
	{
	
	}		

if( S~="GlacenaTHS.unr" )
	{
	
	}
	
if( S~="AbyssTHS.unr" )
	{
	
	}

if( S~="NaliC2THS.unr" )
	{
	
	}	


	
	
// normal
	
	
if(Level.Title =="Vortex Rikers" )
{
  actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
  actthingaa = Spawn(actNewClass,,,vect(-1578.768921,976.507690,-148.100006));  //duct around corner
  
  actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory2", class'Class' ) );
  actthingaa = Spawn(actNewClass,,,vect(-1540.000000,-200.000000,-168.000000));  //near skayrr
  actthingaa = Spawn(actNewClass,,,vect(-1792.000000,736.000000,-160.000000));  //near entry
  actthingaa = Spawn(actNewClass,,,vect(-2299.559814,180.000000,100.000000));  //near pipe
   
  actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
  actthingaa = Spawn(actNewClass,,,vect(-1169.377441,152.079071,443.899994));  //main room ceiling beam
  
  actNewClass = class<actor>( DynamicLoadObject("unreali.SkaarjGunner", class'Class' ) );
  actthingaa = Spawn(actNewClass,,,vect(-2024.495117,-1184.794678,238.102509));  //near armor
  
  actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
  actthingaa = Spawn(actNewClass,,,vect(-1187.787354,-545.172058,163.899994));  //left under main area after door
  actthingaa = Spawn(actNewClass,,,vect(-1718.795654,-227.151459,163.899994));  //right under main area after door
   
  actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory9", class'Class' ) );
  actthingaa = Spawn(actNewClass,,,vect(-368.000000,-800.000000,-160.000000));  //med center by beds
	
  actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory2", class'Class' ) );
  actthingaa = Spawn(actNewClass,,,vect(-336.050629,-1728.086304,-28.676601));  //fan drop1
  actthingaa = Spawn(actNewClass,,,vect(48.603428,-1728.140259,-29.062675));  //fan drop2
  
  actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory9", class'Class' ) );
  actthingaa = Spawn(actNewClass,,,vect(2048.000000,48.000000,-208.000000));  //hasllway after skarry runaway
  
  
  actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
  actthingaa = Spawn(actNewClass,,,vect(-39.229424,109.029999,371.900269));  //roof big ends room
  actthingaa = Spawn(actNewClass,,,vect(1352.314453,451.758179,427.899994));  //roof big ends room after bridge
}	
	

	
if(Level.Title =="NyLeve's Falls" )
	{
	
	}	
	
	
if( S~="dig.unr" )
	{
	
	}	

if( S~="dug.unr" )
	{
	
	}	

if( S~="passage.unr" )
	{
	
	}	

if( S~="Chizra.unr" )
	{
	
	}	

if( S~="ceremony.unr" )
	{
	
	}	

if( S~="dark.unr" )
	{
	
	}	
	
if( S~="Harobed.unr" )
	{
	
	}	

if( S~="TerraLift.unr" )
	{
	
	}	

if( S~="terraniux.unr" )
	{
	
	}	

if( S~="Noork.unr" )
	{
	
	}	

if( S~="RUINS.unr" )
	{
	
	}	
	
if( S~="Trench.unr" )
	{
	
	}	
	
if( S~="isvkran4.unr" )
	{
	
	}	

	
if( S~="ISVKRAN32.unr" )
	{
	
	}	

if( S~="ISVDECK1.unr" )
	{
	
	}	

if( S~="spirevillage.unr" )
	{
	
	}	
	
if( S~="Thesunspire.unr" )
	{
	
	}	

if( S~="Skycaves.unr" )
	{
	
	}

if( S~="SkyTown.unr" )
	{
	
	}

if( S~="SkyBase.unr" )
	{
	
	}
	
	
if( S~="VeloraEnd.unr" )
	{
	
	}
	
if( S~="Bluff.unr" )
	{
	
	}

if( S~="dasapass.unr" )
	{
	
	}	
	
	
if( S~="dasacellars.unr" )
	{
	
	}	

if( S~="naliboat.unr" )
	{
	
	}	
	
if( S~="NALIC.unr" )
	{
	
	}

if( S~="nalilord.unr" )
	{
	
	}

if( S~="DCrater.unr" )
	{
	
	}

	
if( S~="extremebeg.unr" )
	{
	
	}	
if( S~="extremelab.unr" )
	{
	
	}		
	
if( S~="extremecore.unr" )
	{
	
	}	

if( S~="extremegen.unr" )
	{
	
	}

if( S~="extremedgen.unr" )
	{
	
	}

if( S~="extremedark.unr" )
	{
	
	}	
	
if( S~="extremeend.unr" )
	{
	
	}	
	
if( S~="QueenEnd.unr" )
	{
	
	}		
}