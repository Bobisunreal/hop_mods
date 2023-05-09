//=============================================================================
// dark_rightsecret.
//=============================================================================
class dusk_waters expands Trigger;



var int bb;

function Touch( actor Other )
{
  if (other.IsA('playerpawn') )
 {
  SetTimer(0.5,true,'spawnjunk'); // repeat every 1 second for effect
 }
}



function spawnjunk()
{
local actor actthing;
local class<actor> actNewClass;

SetTimer(0,false,'spawnjunk'); // stoptimer?


PlaySound(Sound(DynamicLoadObject("unreali.teleport2", Class'Sound' )),  SLOT_Interact, 10.0, false);
actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory6", class'Class' ) );
Spawn(actNewClass,,,vect(17829.388672,-12630.776367,-68.624756));  // light near pond spawn loads of manta
PlaySound(Sound'teleport2',  SLOT_None,2.0,,2.0);
Spawn(actNewClass,,,vect(18078.638672,-12457.032227,538.988708));  // light near pond
PlaySound(Sound'teleport2',  SLOT_None,2.0,,2.0);
Spawn(actNewClass,,,vect(18078.638672,-12457.032227,538.988708));  // light near pond
PlaySound(Sound'teleport2',  SLOT_None,2.0,,2.0);
Spawn(actNewClass,,,vect(17829.388672,-12902.776367,-536.624756));  // low
actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory7", class'Class' ) );
Spawn(actNewClass,,,vect(17829.388672,-12902.776367,-536.624756));  // low
destroy();
}


defaultproperties
{
CollisionRadius=16.00
CollisionHeight=19.00
}
