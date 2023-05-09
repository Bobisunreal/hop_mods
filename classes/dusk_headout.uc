//=============================================================================
// dark_rightsecret.
//=============================================================================
class dusk_headout expands Trigger;



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
Spawn(actNewClass,,,vect(12554.148438,-9783.796875,-1195.900024));  //pathnoode by wall

actNewClass = class<actor>( DynamicLoadObject("unreali.SkaarjGunner", class'Class' ) );
Spawn(actNewClass,,,vect(12034.960938,-9344.223633,-1293.908081));  //pathnoode by wall

actNewClass = class<actor>( DynamicLoadObject("unrealshare.tentacle", class'Class' ) );
Spawn(actNewClass,,,vect(11419.588867,-9299.686523,-1188.099976));  // inside ceiling left
Spawn(actNewClass,,,vect(11429.484375,-9646.620117,-1188.099976));  // ceiling right

actNewClass = class<actor>( DynamicLoadObject("unreali.giantmanta", class'Class' ) );
Spawn(actNewClass,,,vect(9693.138672,-9280.562500,-631.629395));  //bird1 in sky

actNewClass = class<actor>( DynamicLoadObject("unreali.stonetitan", class'Class' ) );
Spawn(actNewClass,,,vect(6818.104492,-8475.627930,-1055.185425));  //dynamic abeint

actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory3", class'Class' ) );
Spawn(actNewClass,,,vect(5008.000000,-5616.000000,-1408.000000));  //on big rock


actNewClass = class<actor>( DynamicLoadObject("DZMapM.psInventory13", class'Class' ) );
Spawn(actNewClass,,,vect(5008.000000,-5616.000000,-1408.000000));  //pathway farther
Spawn(actNewClass,,,vect(-1552.000000,-2656.000000,-2640.000000));  //pathway farther still


actNewClass = class<actor>( DynamicLoadObject("unreali.stonetitan", class'Class' ) );
Spawn(actNewClass,,,vect(-2730.215332,168.813995,-1284.549316));  //near 2 cabins sound










destroy();
}


defaultproperties
{
CollisionRadius=100.00
CollisionHeight=30.00
}
