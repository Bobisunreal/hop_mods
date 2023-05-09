//=============================================================================
// dark_rightsecret.
//=============================================================================
class Glathriel1_push expands Trigger;



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
Spawn(actNewClass,,,vect(-288.000000,2432.000000,-352.000000));  //dock




destroy();
}


defaultproperties
{
CollisionRadius=300.00
CollisionHeight=3000.00
}
