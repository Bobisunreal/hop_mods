class hops_GR expands GameRules;


var mapfixes MutatorPtr;



function ModifyPlayer(Pawn Other)
{
	if (PlayerPawn(Other) == none || Other.IsA('Spectator'))
		return;
mutatorptr.MutateRespawningPlayer(other);
}

defaultproperties
{
				bNotifySpawnPoint=True

}
