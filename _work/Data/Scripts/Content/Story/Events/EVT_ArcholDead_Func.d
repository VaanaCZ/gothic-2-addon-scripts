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
			B_LogEntry (TOPIC_HallenVonIrdorath,"J'ai d�couvert quelque chose qui ressemble � un temple. Il est habit� par des cr�atures mortes-vivantes. Cela me rappelle ce maudit temple orque du Dormeur. Cette fois-ci je n'�chouerai pas. Pas cette fois-ci !"); 
			EVT_ARCHOLDEAD_FUNC_OneTime = TRUE;
		};
};
