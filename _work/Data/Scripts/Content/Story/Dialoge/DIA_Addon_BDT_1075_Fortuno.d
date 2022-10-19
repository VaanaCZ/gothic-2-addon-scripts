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
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_00");//(ängstlich) Eine schwarze Wolke über dem Haus ... der Eine kommt...
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//Mit Blut ... gebraucht, ihn zu rufen ... IHN, der mich sieht ... er sieht mich ... oh nein, geh weg, verschwinde ...
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//Alles klar bei dir?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"Fortuno ist nicht bei Sinnen. Er sucht nach einem 'Grünen Novizen'");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//Grün ... grüner Novize ... ich kann ihn nicht finden ...
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Ich komme später wieder ...(ENDE)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Wie kann ich dir helfen?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Hier, nimm dieses Sumpfkraut.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if Npc_HasItems (other, ItMi_Addon_Joint_01 ) >= 1
	{ 
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Hier, nimm diesen 'Grünen Novizen'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//Wie kann ich dir helfen?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//Der grüne ... der grüne Novize hilft dem Novizen ...
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//Hier, nimm dieses Sumpfkraut.
	
	if B_GiveInvItems (other, self,ItMi_Joint,1)
	{
		AI_UseItem (self, ItMI_Joint);
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01");//Nicht grün, nicht stark, nicht grün, nicht stark ...
};
FUNC VOID DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00");//Hier, nimm diesen 'Grünen Novizen'.
	
	if B_GiveInvItems (other, self,ItMi_Addon_Joint_01,1)
	{
		AI_UseItem (self, ItMI_Addon_Joint_01);
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01");//(gesundend) AAAHHH ...
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//Mein Kopf ... wer ... ich bin ... Fortuno ... was ... was ist los?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"Der 'grüne Novize' hat Fortuno wieder einen klaren Kopf verschafft.");
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
	description	= "So, jetzt erzähl mir mal was mit dir los ist.";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//So, jetzt erzähl mir mal, was mit dir los ist.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//Einst gehörte ich zur Bruderschaft des Schläfers. Da war noch alles in Ordnung.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//Gut, wir waren alle verurteilte Verbrecher, aber für uns Novizen war das Leben recht unbeschwert ...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//Hey, ich war selbst im Minental gefangen. Erzähl mir was Neues.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//Ich ... ich erinnere mich an nichts. Dunkelheit liegt über meinem Verstand ...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//Komm schon, konzentriere dich. Was ist passiert? Wann bist du wieder zu dir gekommen?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//Raven ... ich erinnere mich nur an Raven und an ... an dunkle Räume.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//Was ist mit Raven? Was hat er mit dir gemacht?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//(seufzt) Tut mir Leid. Mir ist, als ob mein Verstand gefangen wäre ... ich verstehe es selbst nicht ...
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
	description	= "Es muss eine Möglichkeit geben, deine Erinnerung wieder aufzufrischen.";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//Es muss eine Möglichkeit geben, deine Erinnerung wieder aufzufrischen.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//Ja ... ja vielleicht gibt es eine Möglichkeit.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//Die Gurus verstanden sich auf verschiedene Arten der Geist - und Willensveränderung.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//Weißt DU noch was darüber?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//Nein, ich befürchte dieses Wissen ist mit den Gurus verschwunden ...
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//Verdammt. Nun - wenn es einen Weg gibt, deinen Geist zu befreien, werde ich ihn finden.

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"Fortuno ist wieder bei Sinnen, aber er kann sich an Nichts erinnern.");
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
	description	= "Brauchst du mehr Sumpfkraut?";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//Brauchst du mehr Sumpfkraut?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//Jaaa, unbedingt. Alles, was du an Sumpfkraut auftreiben kannst, werde ich dir abkaufen.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//Ich zahle dir sogar mehr dafür als Fisk.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(Alles Sumpfkraut abgeben) ",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(1 Sumpfkraut abgeben) ",DIA_Addon_Fortuno_Trade_1);
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
	description	= "Ich habe Sumpfkraut für dich...";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_Trade_15_00");//Ich habe Sumpfkraut für dich ...
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
	description	= "Ich habe einen Trank für dich ...";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//Ich habe einen Trank für dich. Das wird dir helfen, dich zu erinnern.
	AI_Output (self, other, "DIA_Addon_Fortuno_Trank_13_01");//Ich vertraue dir.
	
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
	description	= "Und...?";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_00");//Und ... ?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//Aah! Ich ... ich erinnere mich wieder! Jetzt sehe ich ... Adanos steh mir bei - was habe ich getan!?
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//Ja, was hast du getan? Und vor allem - was hat Raven getan?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//Ich habe ihm geholfen ... Kontakt aufzunehmen. Zu IHM. Er wollte verschiedene Elixiere ... ich braute sie ihm.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//Er hat versucht, das Portal zu öffnen, um in den Tempel zu gelangen.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//Wieso? Was will er in dem Tempel?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//Ein mächtiges Artefakt ... es liegt begraben, zusammen mit dem, der es einst trug. Ein großer Krieger, der IHM verfallen ist ...
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//Und weiter?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//Wir konnten das Portal nicht öffnen ...
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//Aber Raven war sicher, DASS er es könnte, wenn er die Gruft des Priesters ausheben lässt.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//Deshalb brachte er die Sklaven her. Opfer, die er zwingen konnte, dort zu buddeln, wo die Mächte der Zeit ruhen.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//Gruft des Priesters?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//Die Ruhestätte eines Adanos-Priesters. Sie liegt in der Mine.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//Ich erinnere mich auch an die Steintafeln. Er glaubte, dass sie ihm den Weg zeigen würden.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//Und als er die Schriftzeichen darauf entziffern konnte, brauchte er mich nicht mehr.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//Er hat einen Zauber des Vergessens auf mich gewirkt und ... und du hast mich befreit.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven will ein mächtiges Artefakt aus dem Tempel Adanos' bergen."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Aus irgendeinem Grund hat Raven das Grab eines Priesters der alten Kultur in der Goldmine freilegen lassen."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Raven glaubt, dass einige Steintafeln ihm bei seinen Plänen helfen werden."); 
	
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
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//Attentat? Tut mir Leid, ich war einige Zeit ... abwesend ... ich weiß nichts darüber.
};

