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
		AI_Output			(self ,other, "DIA_RitualDementor_19_00"); //Has llegado demasiado tarde.
		AI_Output			(self ,other, "DIA_RitualDementor_19_01"); //Hemos destruido el Ojo de Innos para que no pueda recuperar su poder.
		AI_Output			(self ,other, "DIA_RitualDementor_19_02"); //Ahora demostraremos que tu intento de desafiar al maestro era vano.

		MIS_SCKnowsInnosEyeIsBroken  = TRUE;
		B_LogEntry (TOPIC_INNOSEYE, "Esos tipos siniestros me ponen de los nervios. Han destruido el Ojo de Innos. No tengo ni idea de cómo arreglarlo.");
 		B_LogEntry (TOPIC_TraitorPedro, "He encontrado el Ojo de Innos. Pero por ahora no hay rastro de Pedro por ningún lado. Esos magos negros están compinchados con él.");
		B_GivePlayerXP (XP_SCKnowsInnosEyeIsBroken);
	}
	else
	{
		var int randy;
		randy = Hlp_Random (4);
		
	 	if (randy == 0)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_03"); //Siente nuestro poder.
		};
		if (randy == 1)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_04"); //Por el maestro.
		};
		if (randy == 2)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_05"); //No puedes esconderte.
		};
		if (randy == 3)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_06"); //Te mataremos.
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
