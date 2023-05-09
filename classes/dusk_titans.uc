//=============================================================================
// dark_rightsecret.
//=============================================================================
class dusk_titans expands Trigger;



var int bb,yy;
var bool yet;
var actor warlordhold ;
var int oldhealth;

function Touch( actor Other )
{
local playerpawn pp;
if (other.IsA('playerpawn') )
{
other.PlaySound(Sound(DynamicLoadObject("unreali.laugh1wl", Class'Sound' )),  SLOT_Interact, 10.0, false);
SetTimer(0.5,false,'spawnjunk'); // 
}
}

function followcarpet()
{
local actor actthing;
local class<actor> actNewClass;
local vector hhj;
  if (warlordhold != none  )
  {

  // only if it took more damage
  log("new "  $ scriptedpawn(warlordhold).health $ "  old " $ oldhealth);
  if (scriptedpawn(warlordhold).health < oldhealth)
  {
   oldhealth = scriptedpawn(warlordhold).health;
   hhj = warlordhold.location + 50 * vect(0.00,0.00,25.00) + 60 * VRand();
   actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory9", class'Class' ) );
   actthing =Spawn(actNewClass,,,hhj); 
   PlaySound(Sound'teleport2',  SLOT_None,2.0,,2.0);
   actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory9", class'Class' ) );
   actthing =Spawn(actNewClass,,,warlordhold.location); 
   PlaySound(Sound'teleport2',  SLOT_None,2.0,,2.0);
   log("ride the carpet");
  }else{
  log("waiting for carpet");
  }
  
   
  }else{
  //destroy();
  }


}


function carepackage()
{
local actor actthing;
local class<actor> actNewClass;
local vector vt;
  if (warlordhold != none)
  {
   vt = vect(20078.410156,-10879.737305,1297.246704) + 550 * vect(0.00,0.00,4.00) + 560 * VRand();
   actNewClass = class<actor>( DynamicLoadObject("unrealshare.woodenbox", class'Class' ) );
   actthing =Spawn(actNewClass,,,vt);  // ambeintsound location
   actthing.SetPropertyText("contents", "unrealshare.superhealth");
   actthing.SetPropertyText("Physics", "PHYS_Falling");
   actthing.drawscale=3.0;
   log("ride the carry");
  }else{
  //destroy();
  }


}


function spawnjunk()
{
local actor actthing;
local vector vv;
local class<actor> actNewClass;

if (yet)
{
return;
}



//SetTimer(0,false,'spawnjunk'); // stoptimer?


actNewClass = class<actor>( DynamicLoadObject("unreali.gaintmanta", class'Class' ) );
actthing =Spawn(actNewClass,,,vect(21164.017578,-11378.676758,930.188110));  // near enter
//actthing.drawscale=2.0;
//actthing.SetPropertyText("collisionradius", "96.0");
////actthing.SetPropertyText("collisionheight", "155.0");


//actthing = Spawn(actNewClass,,,vect(20723.369141,-8890.692383,764.885742));  // back palm
//actthing.drawscale=2.0;
//actthing.SetPropertyText("collisionradius", "96.0");
//actthing.SetPropertyText("collisionheight", "155.0");

actNewClass = class<actor>( DynamicLoadObject("unreali.warlord", class'Class' ) );
warlordhold = Spawn(actNewClass,,,vect(19448.841797,-9983.207031,829.564209));  // palm, lefty of door
warlordhold.PlaySound(Sound'teleport2',  SLOT_None,2.0,,2.0);
warlordhold.drawscale=2.0;
warlordhold.SetPropertyText("collisionradius", "96.0");
warlordhold.SetPropertyText("collisionradius", "96.0");
warlordhold.SetPropertyText("health", "5000");
oldhealth = scriptedpawn(warlordhold).health;

  
actNewClass = class<actor>( DynamicLoadObject("unreali.gaintmanta", class'Class' ) );
actthing = Spawn(actNewClass,,,vect(19106.734375,-11078.409180,768.898193));  // near lake
//actthing.drawscale=2.0;
//actthing.SetPropertyText("collisionradius", "96.0");
//actthing.SetPropertyText("collisionheight", "155.0");

log("cliff dwelers");
//destroy();
yet = true;
SetTimer(10,true,'followcarpet'); // 
SetTimer(20,true,'carepackage'); // 
}


defaultproperties
{
CollisionRadius=500.00
CollisionHeight=15.00
triggertype=TT_PlayerProximity
}
