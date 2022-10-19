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
		AI_Output			(self ,other, "DIA_RitualDementor_19_00"); //Du kommst zu spät.
		AI_Output			(self ,other, "DIA_RitualDementor_19_01"); //Wir haben das Auge Innos' zerstört, auf dass es seine Macht niemals zurückerlangen wird.
		AI_Output			(self ,other, "DIA_RitualDementor_19_02"); //Wir werden dir jetzt zeigen, was für sinnloses Unterfangen es doch war, den Meister herauszufordern.

		MIS_SCKnowsInnosEyeIsBroken  = TRUE;
		B_LogEntry (TOPIC_INNOSEYE, "Diese schwarzen Kerle gehen mir langsam auf die Nerven. Sie haben das Auge Innos zerstört. Kein Ahnung, wie ich das nun wieder regeln soll.");
 		B_LogEntry (TOPIC_TraitorPedro, "Das Auge Innos habe ich gefunden. Aber von Pedro war bisher noch keine Spur zu sehen. Diese schwarzen Magier stecken mit ihm unter einer Decke.");
		B_GivePlayerXP (XP_SCKnowsInnosEyeIsBroken);
	}
	else
	{
		var int randy;
		randy = Hlp_Random (4);
		
	 	if (randy == 0)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_03"); //Jetzt wirst du unsere Macht spüren.
		};
		if (randy == 1)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_04"); //Für den Meister.
		};
		if (randy == 2)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_05"); //Du kannst dich nicht verstecken.
		};
		if (randy == 3)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_06"); //Wir werden dich töten.
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
