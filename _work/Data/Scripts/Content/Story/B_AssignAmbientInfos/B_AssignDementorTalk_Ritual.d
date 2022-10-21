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
		AI_Output			(self ,other, "DIA_RitualDementor_19_00"); //Sei arrivato troppo tardi.
		AI_Output			(self ,other, "DIA_RitualDementor_19_01"); //Abbiamo distrutto l'Occhio di Innos in modo che esso non possa più recuperare il suo potere.
		AI_Output			(self ,other, "DIA_RitualDementor_19_02"); //Ora dimostreremo l'inutilità del tuo tentativo di sfidare il Padrone.

		MIS_SCKnowsInnosEyeIsBroken  = TRUE;
		B_LogEntry (TOPIC_INNOSEYE, "Questi tizi inquietanti cominciano a darmi sui nervi. Hanno distrutto l'Occhio di Innos, e non ho idea di come potrei aggiustarlo.");
 		B_LogEntry (TOPIC_TraitorPedro, "Ho trovato l'Occhio di Innos, ma nessuna traccia di Pedro finora. Quei maghi oscuri sono in combutta con lui.");
		B_GivePlayerXP (XP_SCKnowsInnosEyeIsBroken);
	}
	else
	{
		var int randy;
		randy = Hlp_Random (4);
		
	 	if (randy == 0)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_03"); //Ora assaggerai la nostra potenza.
		};
		if (randy == 1)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_04"); //Per il Padrone.
		};
		if (randy == 2)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_05"); //Non puoi nasconderti.
		};
		if (randy == 3)
		{
			AI_Output			(self ,other, "DIA_RitualDementor_19_06"); //Ti uccideremo.
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
