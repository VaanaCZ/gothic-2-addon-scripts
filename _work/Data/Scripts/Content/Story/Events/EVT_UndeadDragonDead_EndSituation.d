//****************************
// 	EVT_UNDEADDRAGONDEAD_ENDSITUATION (Funktion, die beim Durchschreiten des Triggerfeldes vor dem Untoten Drachen ausgeführt wird)
//****************************
var int EVT_UNDEADDRAGONDEAD_ENDSITUATION_OneTime;
func void EVT_UNDEADDRAGONDEAD_ENDSITUATION ()
{
	if (EVT_UNDEADDRAGONDEAD_ENDSITUATION_OneTime == FALSE)
	&& (Npc_IsDead(Dragon_Undead))
	{
	Angar_DI_Party = LOG_SUCCESS; //Joly:(schluß mit Follow)
	B_StartOtherRoutine	(Angar_DI,"FireDragonIsland");
	B_StartOtherRoutine	(Lee_DI,"UNDEADDRAGONDEAD");
	B_StartOtherRoutine	(Diego_DI,"UNDEADDRAGONDEAD");
	B_StartOtherRoutine	(Milten_DI,"UNDEADDRAGONDEAD");
	B_StartOtherRoutine	(Gorn_DI,"UNDEADDRAGONDEAD");
	B_StartOtherRoutine	(Lester_DI,"UNDEADDRAGONDEAD");
	EVT_UNDEADDRAGONDEAD_ENDSITUATION_OneTime = TRUE;
	};
};
