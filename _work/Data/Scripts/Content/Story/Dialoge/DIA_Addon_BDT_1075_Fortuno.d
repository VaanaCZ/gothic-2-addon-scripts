///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_EXIT   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 999;
	condition   = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fortuno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1075_Addon_Fortuno;
	nr			= 900;
	condition	= DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information	= DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	C_Beklauen (10, 25);
};
 
FUNC VOID DIA_Addon_Fortuno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
	
func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Hi   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent   = TRUE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fortuno_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Fortuno_Geheilt_01 == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_Info()
{
	if (Fortuno_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_00");//(ansioso) Una nuvola cura sopra la casa… l'eletto si avvicina
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//Con il sangue… dovevo chiamarlo… LUI che mi vede… mi vede… oh, no, vai via, vattene
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//Tutto bene?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"Fortuno è fuori di testa. Sta cercando un 'novizio verde'");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//Verde… novizio verde… Non lo trovo
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Tornerò più tardi… (FINE)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Come posso aiutarti?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Ecco, prendi quest'erba di palude.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if Npc_HasItems (other, ItMi_Addon_Joint_01 ) >= 1
	{ 
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Ecco, prendi questo 'Novizio verde'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//Come posso aiutarti?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//Il novizio… il novizio verde aiuterà il novizio
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//Ecco, prendi quest'erba di palude.
	
	if B_GiveInvItems (other, self,ItMi_Joint,1)
	{
		AI_UseItem (self, ItMI_Joint);
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01");//Se non è verde non è forte, se non è verde non è forte
};
FUNC VOID DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00");//Ecco, prendi questo 'Novizio verde'.
	
	if B_GiveInvItems (other, self,ItMi_Addon_Joint_01,1)
	{
		AI_UseItem (self, ItMI_Addon_Joint_01);
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01");//(si riprende) AAAHHH...
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//La mia testa… chi… Mi chiamo... Fortuno… che cosa… cosa c'è che non va?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"Il 'novizio verde' ha aiutato Fortuno a schiarirsi le idee.");
};


///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_wer   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent   = FALSE;
	description	= "Esatto, ora dimmi che cosa non va.";
};
FUNC INT DIA_Addon_Fortuno_wer_Condition()
{	
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_wer_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//Allora, dimmi che cosa non va.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//Una volta facevo parte della Confraternita del Dormiente. Andava tutto bene a quei tempi.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//Bene, eravamo tutti criminali condannati, ma noi novizi non avevamo preoccupazioni
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//Ehi, anch'io ero un prigioniero nella Valle delle Miniere. Raccontami qualcosa di nuovo.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//Io... Non ricordo niente. La mia mente è annebbiata
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//Avanti, concentrati. Cosa è successo? Quando hai ripreso i sensi?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//Raven… Mi ricordo solo di Raven e… di stanze buie.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//Che c'entra Raven? Cosa ti ha fatto?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//(sospira) Mi dispiace. È come se la mia mente fosse prigioniera… Non capisco nemmeno io...
};
///////////////////////////////////////////////////////////////////////
//	Info FREE
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_FREE   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 5;
	condition   = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent   = FALSE;
	description	= "Dev'esserci un modo per rinfrescarti la memoria.";
};
FUNC INT DIA_Addon_Fortuno_FREE_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_wer)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//Dev'esserci un modo per rinfrescarti la memoria.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//Sì… sì, forse c'è un modo.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//I guru conoscono varie forme di alterazione dello spirito e della volontà.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//TU ti ricordi qualcosa in proposito?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//No, temo che questa conoscenza si sia persa con i guru
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//Dannazione. Beh, se c'è un modo per liberare il tuo spirito, lo troverò.

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"Fortuno si è ripreso, ma non si ricorda ancora nulla.");
};
///////////////////////////////////////////////////////////////////////
//	Info Herb
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Herb   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 99;
	condition   = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent   = FALSE;
	description	= "Ti serve altra erba di palude?";
};
FUNC INT DIA_Addon_Fortuno_Herb_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//Ti serve altra erba di palude?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//Sììììì, sicuramente. Comprerò tutta l'erba di palude su cui riuscirai a mettere le mani.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//Te la pagherò più di Fisk.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(consegna tutta l'erba di palude)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(consegna 1 erba di palude)",DIA_Addon_Fortuno_Trade_1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Trade (kein Trade Modul!)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trade   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 100;
	condition   = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent   = TRUE;
	description	= "Ho dell'erba di palude per te…";
};
FUNC INT DIA_Addon_Fortuno_Trade_Condition()
{	
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	&& Npc_KnowsInfo (other, DIA_Addon_Fortuno_Herb)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trade_15_00");//Ho dell'erba di palude per te
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
};
FUNC VOID DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems (other, Itpl_Swampherb);
	
	if B_GiveInvItems (other, self, ITPL_Swampherb, amount)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, amount * Value_SwampHerb);
	
	B_GivePlayerXP (amount * 10);
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_1()
{
	if B_GiveInvItems (other, self, ITPL_Swampherb, 1)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, Value_SwampHerb);
	
	B_GivePlayerXP (10);
	B_Fortuno_InfoManager();
};

///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trank   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 3;
	condition   = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent   = FALSE;
	description	= "Ho una pozione per te…";
};
FUNC INT DIA_Addon_Fortuno_Trank_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	&&   Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE)
	&& ((Npc_HasItems (other, ItPo_Addon_Geist_01) >= 1)
	||  (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//Ho una pozione per te. Ti aiuterà a ricordare.
	AI_Output (self, other, "DIA_Addon_Fortuno_Trank_13_01");//Mi fido di te.
	
	if (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1)//der richtige
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_02,1)
		{
			AI_UseItem (self, ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP (XP_Addon_Fortuno_02);
		
	}
	else
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_01,1)//der...äh...tödliche
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
			AI_StopProcessInfos (self);
			AI_UseItem (self, ItPo_Addon_Geist_01);
		};
	};
};
///////////////////////////////////////////////////////////////////////
//	Info No more Secrets
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_more   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent   = FALSE;
	description	= "E…?";
};
FUNC INT DIA_Addon_Fortuno_more_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_more_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_00");//E…?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//Aah! Io... Ora ricordo di nuovo! Ora vedo… Che Adanos sia con me, che cosa ho fatto?
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//Sì? Cos'hai fatto? E soprattutto, che cosa ha fatto Raven?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//Io l'ho aiutato… a prendere contatto. Con LUI. Voleva vari elisir… Glieli ho preparati.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//Ha cercato di aprire il portale per entrare nel tempio.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//Perché? Che cosa vuole nel tempio?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//Un potente artefatto… è sepolto insieme a colui che lo portava un tempo. Un possente guerriero che è caduto per SUA mano
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//E poi?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//Non siamo riusciti ad aprire il portale
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//Ma Raven era SICURO di riuscirci, se avesse fatto scavare la tomba del sacerdote.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//Ecco perché ha portato qui gli schiavi. Vittime che poteva obbligare a scavare dove riposano i poteri del tempo.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//Tomba del sacerdote?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//Il luogo in cui riposa un sacerdote di Adanos. Si trova nella miniera.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//Mi ricordo anche delle tavolette di pietra. Credeva che gli avrebbero mostrato la strada.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//E quando riuscì a decifrare i caratteri incisi su di esse, non ebbe più bisogno di me.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//Cancellò la mia memoria con un incantesimo e… tu mi hai liberato.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven vuole recuperare un potente artefatto dal tempio di Adanos."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Per qualche motivo Raven ha fatto scavare dentro la miniera la tomba di un sacerdote dell'antico culto."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Raven ritiene che alcune tavolette di pietra possano aiutarlo a realizzare i suoi piani."); 
	
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Addon_Fortuno_03);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fortuno_Attentat   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 9;
	condition   = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fortuno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&&  Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//Attacco? Mi spiace, sono stato… assente… per un po' di tempo. Non ne so niente.
};

