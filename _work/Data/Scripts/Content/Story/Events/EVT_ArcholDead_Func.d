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
			B_LogEntry (TOPIC_HallenVonIrdorath,"Našel jsem tu nęco, co snad kdysi bývalo chrámem a obývala to spousta nemrtvých. Všechno mi živę pâipomíná zatracený skâetí chrám a Spáče. Tentokrát ale neselžu - teë už ne!"); 
			EVT_ARCHOLDEAD_FUNC_OneTime = TRUE;
		};
};
