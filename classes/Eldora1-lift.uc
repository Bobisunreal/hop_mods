//=============================================================================
// dark_rightsecret.
//=============================================================================
class Eldora1lift expands Trigger;

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

actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory3", class'Class' ) );
Spawn(actNewClass,,,vect(1936.000000,80.000000,896.000000));  //center lift for dorps

// i would like to wait, but the lift is coming.
Spawn(actNewClass,,,vect(1936.000000,80.000000,896.000000));  //center lift for dorps

destroy();
}


defaultproperties
{
CollisionRadius=150.00
CollisionHeight=50.00
}
