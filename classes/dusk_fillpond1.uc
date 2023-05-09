//=============================================================================
// dark_rightsecret.
//=============================================================================
class dusk_fillpond1 expands Trigger;



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
Spawn(actNewClass,,,vect(5008.000000,-5616.000000,-1408.000000));  //on big rock


actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory10", class'Class' ) );
Spawn(actNewClass,,,vect(2364.738770,-6206.178711,-4595.688965));  //above water
Spawn(actNewClass,,,vect(-658.152588,-5806.260742,-4989.302734));  //water 2
Spawn(actNewClass,,,vect(-3027.810791,-3444.732666,-5304.932617));  //water 3 near crossover

Spawn(actNewClass,,,vect(2364.738770,-6206.178711,-4595.688965));  //above water
Spawn(actNewClass,,,vect(-658.152588,-5806.260742,-4989.302734));  //water 2
Spawn(actNewClass,,,vect(-3027.810791,-3444.732666,-5304.932617));  //water 3 near crossover












destroy();
}


defaultproperties
{
CollisionRadius=152.00
CollisionHeight=1200.00
}
