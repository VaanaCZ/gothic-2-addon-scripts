//****************************
// 	EVT_ARCHOLDEAD_FUNC (bei Archol dem Schattenlord)
//****************************
var int EVT_ARCHOLDEAD_FUNC_OneTime;
func void EVT_ARCHOLDEAD_FUNC ()
{
	if (Npc_IsDead(Skeleton_Lord_Archol))
	{
		Skeleton_Archol1.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol2.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol3.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol4.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol5.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol6.aivar[AIV_EnemyOverride] = FALSE;
	};
	
		if (EVT_ARCHOLDEAD_FUNC_OneTime == FALSE)
		{
			B_LogEntry (TOPIC_HallenVonIrdorath,"Ich habe so etwas wie einen Tempel gefunden. Er wird von einer Unmenge von untoten Wesen bewohnt. Erinnert mich alles verdammt an diesen elenden Orctempel des Schläfers. Diesmal werde ich nicht versagen. Diesmal nicht!"); 
			EVT_ARCHOLDEAD_FUNC_OneTime = TRUE;
		};
};
