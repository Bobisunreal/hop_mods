//=============================================================================
// dark_rightsecret.
//=============================================================================
class dusk_upramp expands Trigger;



var int bb;

function Touch( actor Other )
{
  if (other.IsA('playerpawn') )
  {
  SetTimer(0.5,true,'spawnjunk'); //
  }
}



function spawnjunk()
{
local actor actthing;
local class<actor> actNewClass;
SetTimer(0,false,'spawnjunk'); // stoptimer?
PlaySound(Sound(DynamicLoadObject("unreali.teleport2", Class'Sound' )),  SLOT_Interact, 10.0, false);

actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
Spawn(actNewClass,,,vect(16380.869141,-10063.090820,155.899994));  // inside door

actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory2", class'Class' ) );
Spawn(actNewClass,,,vect(15516.410156,-10050.491211,-351.683563));  // angle down
Spawn(actNewClass,,,vect(15516.410156,-10050.491211,-351.683563));  // angle down

actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
Spawn(actNewClass,,,vect(12669.801758,-10047.487305,-1159.599976));  // bottom
Spawn(actNewClass,,,vect(13588.190430,-10043.384766,-1124.099976));  // nearly bottom




destroy();
}


defaultproperties
{
CollisionRadius=100.00
CollisionHeight=30.00
}
