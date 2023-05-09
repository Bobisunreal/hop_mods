//=============================================================================
// dark_rightsecret.
//=============================================================================
class foundry_part2 expands Trigger;



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
Spawn(actNewClass,,,vect(-1344.000000,2768.000000,-992.000000));  //pathnoode by wall


destroy();
}


defaultproperties
{
CollisionRadius=50.00
CollisionHeight=30.00
}
