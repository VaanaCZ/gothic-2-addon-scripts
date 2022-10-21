///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nadja_EXIT   (C_INFO)
{
	npc         = VLK_435_Nadja;
	nr          = 999;
	condition   = DIA_Nadja_EXIT_Condition;
	information = DIA_Nadja_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nadja_EXIT_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Nadja_PICKPOCKET (C_INFO)
{
	npc			= VLK_435_Nadja;
	nr			= 900;
	condition	= DIA_Nadja_PICKPOCKET_Condition;
	information	= DIA_Nadja_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Nadja_PICKPOCKET_Condition()
{
	C_Beklauen (40, 40);
};
 
FUNC VOID DIA_Nadja_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nadja_PICKPOCKET);
	Info_AddChoice		(DIA_Nadja_PICKPOCKET, DIALOG_BACK 		,DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nadja_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nadja_PICKPOCKET);
};
	
func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nadja_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_STANDARD		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_STANDARD_Condition;
	information	 = 	DIA_Nadja_STANDARD_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Nadja_STANDARD_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Bromor_Pay == FALSE)
	{
		return TRUE;
	};
};
var int Nadja_LuciaInfo;
func void DIA_Nadja_STANDARD_Info ()
{
	if (Nadja_LuciaInfo == TRUE)
	{
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_00"); //Sprich erst mit Bromor, vorher kann ich nicht mit dir reden.
	}
	else
	{
		AI_Output (self, other, "DIA_Nadja_STANDARD_16_00"); //Hey, ich kann mich jetzt nicht um dich kümmern, Süßer. Sprich mit Bromor, wenn du dich amüsieren willst.
	};
	
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	&& (Nadja_LuciaInfo == FALSE) 
	{
		AI_Output (other, self, "DIA_ADDON_Nadja_STANDARD_15_01"); //Ich will dir nur ein paar Fragen stellen über die verschwundenen Leute.
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_02"); //Ich könnte dir einiges erzählen, aber nicht hier, Süßer.
		AI_Output (other, self, "DIA_ADDON_Nadja_STANDARD_15_03"); //Dann lass uns nach oben gehen.
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_04"); //Gut. Aber vorher regelst du das mit Bromor. Ich will keinen Ärger.
		Nadja_LuciaInfo = TRUE;
	};	
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Danach		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  2;
	condition	 = 	DIA_Nadja_Danach_Condition;
	information	 = 	DIA_Nadja_Danach_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Nadja_Danach_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Bromor_Pay == FALSE)
	&& (Nadja_Nacht == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Nadja_Danach_Info ()
{
	AI_Output (self, other, "DIA_Nadja_Danach_16_00"); //Komm das nächste Mal wieder zu mir, Süßer.
	Nadja_Nacht = FALSE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_hochgehen		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_hochgehen_Condition;
	information	 = 	DIA_Nadja_hochgehen_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
	description	 =	"Lass uns hochgehen.";
};

func int DIA_Nadja_hochgehen_Condition ()
{	
	if (Bromor_Pay == 1)
	{
		return TRUE;
	};
};
func void DIA_Nadja_hochgehen_Info ()
{
	AI_Output (other, self, "DIA_Nadja_hochgehen_15_00"); //Lass uns hochgehen.
	AI_Output (self, other, "DIA_Nadja_hochgehen_16_01"); //Heute ist dein Glückstag, Süßer. Gehen wir.
	
	Bromor_Pay = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"DANCE");
};
///////////////////////////////////////////////////////////////////////
//	Info LuciaInfo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nadja_LuciaInfo		(C_INFO)
{
	npc		 = 	VLK_435_Nadja;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nadja_LuciaInfo_Condition;
	information	 = 	DIA_Addon_Nadja_LuciaInfo_Info;

	description	 = 	"Können wir jetzt reden?";
};
func int DIA_Addon_Nadja_LuciaInfo_Condition ()
{
	if (Bromor_Pay == 2)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) 
	&& (Nadja_LuciaInfo == TRUE)
		{
			return TRUE;
		};
};
var int Nadja_GaveLuciaInfo;
func void DIA_Addon_Nadja_LuciaInfo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_15_00"); //Können wir JETZT reden?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_01"); //Hier oben sind wir ungestört.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_02"); //Bromor sieht es nicht gerne, wenn wir während unserer Arbeit mit den Gästen reden, ohne dass es ihm etwas einbringt.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_03"); //Du willst also mehr über die verschwundenen Leute hier am Hafen erfahren, ja?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_04"); //Ich weiß nicht, ob ich dir eine große Hilfe sein kann, aber ich kann dir sagen, wohin Lucia verschwunden ist.

	Nadja_GaveLuciaInfo = TRUE;
	
	Info_ClearChoices	(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Wohin ist sie verschwunden?", DIA_Addon_Nadja_LuciaInfo_wo );
	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Erzähl mir von Lucia.", DIA_Addon_Nadja_LuciaInfo_lucia );
};
func void DIA_Addon_Nadja_LuciaInfo_lucia ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_00"); //Erzähl mir von Lucia.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_01"); //Niemand hier ist wirklich traurig darüber, dass sie weg ist.
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_02"); //Warum?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_03"); //Ich glaube, es gibt niemanden hier, den sie nicht versucht hat auszunutzen.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_04"); //Sie war ein echtes Miststück!
};
func void DIA_Addon_Nadja_LuciaInfo_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_wo_15_00"); //Wohin ist sie verschwunden?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_01"); //Sie hat sich öfter mit Elvrich, dem Lehrling des Tischlers Thorben aus der Unterstadt, getroffen.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_02"); //Ich wette mit dir, dass sie mit dem jungen Kerl durchgebrannt ist.

	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Das Freudenmädchen Lucia ist über Nacht aus Bromors Bordell verschwunden. Es wird vermutet, dass sie mit Thorbens Tischlerlehrling Elvrich durchgebrannt ist."); 

	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Wo können die beiden hin gegangen sein?", DIA_Addon_Nadja_LuciaInfo_Elvrich );
};
func void DIA_Addon_Nadja_LuciaInfo_Elvrich ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00"); //Wo könnten die beiden hingegangen sein?
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01"); //Wenn sie nicht von den Wölfen gefressen wurden, dann schätze ich, sind sie bei den Bauern untergekommen.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02"); //Wo sollten sie auch sonst hin?

	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Was weißt du sonst noch?", DIA_Addon_Nadja_LuciaInfo_sonst );
};
func void DIA_Addon_Nadja_LuciaInfo_sonst ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_sonst_15_00"); //Was weißt du sonst noch?
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_01"); //Ich hab' vieles über verschwundene Leute hier am Hafen gehört.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_02"); //Aber ich bin mir nicht sicher, ob ich den Geschichten Glauben schenken darf.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_03"); //Du solltest dich mal mit den Händlern hier unten unterhalten.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_04"); //Mehr kann ich dir leider nicht sagen.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_05"); //Nun, was ist nun mit uns beiden, Schätzchen? Immerhin hast du dafür bezahlt.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_06"); //Willst du dich nicht noch ein wenig amüsieren, bevor du wieder gehen musst?

	Info_ClearChoices (DIA_Addon_Nadja_LuciaInfo);
	
	//Zusatz 
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (Knows_Borka_Dealer == FALSE)
	{
		
		Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,PRINT_Addon_NadjaWait,DIA_Addon_Nadja_WAIT);
	};
	Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,"Danke. Aber ich muss weiter.",DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,"Warum nicht? ...",DIA_Nadja_Poppen_Start);
};
func void DIA_Addon_Nadja_LuciaInfo_weiter ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_weiter_15_00"); //Danke, aber ich muss jetzt gehen.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_weiter_16_01"); //Schade. Naja, vielleicht beim nächsten Mal.
	
	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht +1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices (DIA_Addon_Nadja_LuciaInfo);
};


///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Poppen	(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_Poppen_Condition;
	information	 = 	DIA_Nadja_Poppen_Info;
	permanent	 = 	TRUE;
	description  = "(Amüsieren)";
};

func int DIA_Nadja_Poppen_Condition ()
{	
	if (Bromor_Pay == 2)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 300) 
	
	/* Das ist böse - wenn ich direkt mit Bromor spreche passiert nix mehr. M.F.
	&&  (
		((Nadja_LuciaInfo != 0) && (Nadja_GaveLuciaInfo == 0))
		|| (Nadja_GaveLuciaInfo == TRUE)
		)
	*/	
	
	{
		return TRUE;
	};
};
func void DIA_Nadja_Poppen_Info ()
{
	AI_Output (self, other, "DIA_Nadja_Poppen_16_00"); //Die nächsten Stunden gehören nur uns.
	AI_Output (self, other, "DIA_Nadja_Poppen_16_01"); //Es ist Zeit, dass du dich entspannst. Lehne dich zurück und genieße es.

	Info_ClearChoices (DIA_Nadja_Poppen);
	Info_AddChoice (DIA_Nadja_Poppen,"Okay ...",DIA_Nadja_Poppen_Start);
};
FUNC VOID DIA_Nadja_Poppen_Start()
{
	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht +1);
	
	PlayVideo ("LOVESCENE.BIK");
		
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	/*	
	if Wld_IsTime (00,00,06,00)
	{
		Wld_SetTime (09,00);
	}
	else if Wld_IsTime (06,00,12,00)
	{
		Wld_SetTime (15,00);
	}
	else if Wld_IsTime (12,00,18,00)
	{
		Wld_SetTime (21,00);
	}
	else 
	{
		Wld_SetTime (03,00);	
	};
	*/
	
};

func void DIA_Addon_Nadja_LuciaInfo_Pop ()
{
	DIA_Nadja_Poppen_Start ();
};

///////////////////////////////////////////////////////////////////////
//	Info BUYHERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_BUYHERB		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 = 	2;
	condition	 = 	DIA_Nadja_BUYHERB_Condition;
	information	 = 	DIA_Nadja_BUYHERB_Info;
	permanent	 =	TRUE;
	description	 = 	"Wo kann ich hier Kraut kaufen?";
};
func int DIA_Nadja_BUYHERB_Condition ()
{	
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&& (Npc_KnowsInfo (other,DIA_Nadja_WANT_HERB) == FALSE)
	&& (Nadja_Money == FALSE)
	&& (Undercover_Failed == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Nadja_BUYHERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Nadja_BUYHERB_15_00"); //Wo kann ich hier Kraut kaufen?
	
	if  (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 500) 
	{	
		if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
		{
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_01"); //Woher soll ich das wissen? Selbst wenn ich es wüsste, würde ich es der Stadtwache garantiert nicht erzählen.
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_02"); //Wenn ich dir was erzählen soll, musst du schon ein paar Goldstücke locker machen.
			AI_Output (other, self, "DIA_Nadja_BUYHERB_15_03"); //Wie viel willst du?
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_04"); //50 Goldstücke sollten reichen.
			Nadja_Money = TRUE;
		};
	}
	else 
	{
		B_Say	(self, other,"$NOTNOW");
	};
};
///////////////////////////////////////////////////////////////////////
//	Info WANT_HERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_WANT_HERB		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 = 	2;
	condition	 = 	DIA_Nadja_WANT_HERB_Condition;
	information	 = 	DIA_Nadja_WANT_HERB_Info;
	permanent	 =  FALSE;
	description	 = 	"Jetzt sag mir wo ich Kraut kaufen kann. (50 Gold zahlen)";
};
func int DIA_Nadja_WANT_HERB_Condition ()
{	
	if 	(Npc_HasItems (other, ITmi_Gold) >= 50)
	&&  (Nadja_Money == TRUE)		
	&&  (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Nadja_WANT_HERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	AI_Output (other, self, "DIA_Nadja_WANT_HERB_15_00"); //Jetzt sag mir, wo ich Kraut kaufen kann.
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Nadja_WANT_HERB_16_01"); //Tut mir Leid, ich kann mich nicht mehr erinnern.
	}
	else
	{
		B_GiveInvItems	(other, self, ItMi_Gold, 50); 
		AI_Output (self, other, "DIA_Nadja_WANT_HERB_16_02"); //Sprich mit Borka, Süßer. Bei ihm bekommst du dein Kraut.
		Knows_Borka_Dealer = TRUE;
	};
};




 












