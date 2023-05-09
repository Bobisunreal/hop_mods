//=============================================================================
// dark_rightsecret.
//=============================================================================
class nevecpart2 expands Trigger;



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

actNewClass = class<actor>( DynamicLoadObject("JCoopZ1SSF.jzplayerstart", class'Class' ) );
Spawn(actNewClass,,,vect(2368.000000,-2736.000000,1248.000000));  //dock

actNewClass = class<actor>( DynamicLoadObject("unreali.warlord", class'Class' ) );
Spawn(actNewClass,,,vect(77.127808,453.438538,2045.099976));  //bridge

actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory3", class'Class' ) );
Spawn(actNewClass,,,vect(368.000000,-3008.000000,1712.000000));  //before badge




destroy();
}


defaultproperties
{
CollisionRadius=700.00
CollisionHeight=3000.00
}
