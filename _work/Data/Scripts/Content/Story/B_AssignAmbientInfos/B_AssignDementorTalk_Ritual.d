// ***************************************************
//  	B_AssignDementorTalk_Ritual	
// ***************************************************

func void B_AssignDementorTalk_Ritual ()
{	
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	

	if (MIS_SCKnowsInnosEyeIsBroken == FALSE)
	
	{
		AI_Output			(self ,other, "DIA_RitualDementor_19_00"); //Vous arrivez trop tard.
		AI_Output			(self ,other, "DIA_RitualDementor_19_01"); //Nous avons détruit l'Œil d'Innos pour qu'il ne retrouve plus jamais son pouvoir.
		AI_Output			(self ,other, "DIA_RitualDementor_19_02"); //Nous allons maintenant vous démontrer combien est vaine votre tentative pour défier le Maître.

		MIS_SCKnowsInnosEyeIsBroken  = TRUE;
		B_LogEntry (TOPIC_INNOSEYE, "Ces types sinistres commencent à me taper sur les nerfs. Ils ont détruits l'Œil d'Innos. J'ignore comment le réparer.");
 		B_LogEntry (TOPIC_TraitorPedro, "J'ai trouvé l'Œil d'Innos. Mais pour l'instant, aucune trace de Pedro. Ces magiciens noirs sont de mèche avec lui.");
		B_GivePlayerXP (XP_SCKnowsInnosEyeIsBroken);
	}
	else
	{
		var int randy;
		randy = Hlp_Random (4);
		
	 	if (randy == 0)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_03"); //Tâtez de notre puissance.
		};
		if (randy == 1)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_04"); //Pour le Maître.
		};
		if (randy == 2)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_05"); //Vous ne pouvez vous cacher.
		};
		if (randy == 3)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_06"); //Nous vous tuerons.
		};
	};
	Npc_SetRefuseTalk (self,30);
};
func void B_AssignDementorTalk_Ritual_Exit ()
{	
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed (self);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	Snd_Play 	("MFX_FEAR_CAST" );
	self.aivar[AIV_EnemyOverride] = FALSE;
	/*
	DMT_1201.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1202.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1203.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1204.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1205.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1206.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1207.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1208.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1209.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1210.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1211.aivar[AIV_EnemyOverride] = FALSE;
	*/
};
