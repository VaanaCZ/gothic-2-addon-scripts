///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
var int Brahim_ShowedMaps;
FUNC VOID B_BrahimNewMaps ()
{
	if (Brahim_ShowedMaps == TRUE)
	{
		AI_Output			(self, other, "B_BrahimNewMaps_07_00"); //Komm später noch mal wieder. Dann habe ich sicher wieder etwas neues für dich.
	};
};
INSTANCE DIA_Brahim_EXIT   (C_INFO)
{
	npc         = VLK_437_Brahim;
	nr          = 999;
	condition   = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brahim_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps ();
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Brahim_PICKPOCKET (C_INFO)
{
	npc			= VLK_437_Brahim;
	nr			= 900;
	condition	= DIA_Brahim_PICKPOCKET_Condition;
	information	= DIA_Brahim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Brahim_PICKPOCKET_Condition()
{
	C_Beklauen (15, 15);
};
 
FUNC VOID DIA_Brahim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Brahim_PICKPOCKET);
	Info_AddChoice		(DIA_Brahim_PICKPOCKET, DIALOG_BACK 		,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Brahim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Brahim_PICKPOCKET);
};
	
func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Brahim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_GREET		(C_INFO)
{
	npc			 = 	VLK_437_Brahim;
	nr			 = 	2;
	condition	 = 	DIA_Brahim_GREET_Condition;
	information	 = 	DIA_Brahim_GREET_Info;
	permanent	 =  FALSE;
	description	 = 	"Was machst du hier? ";
};
func int DIA_Brahim_GREET_Condition ()
{
	return TRUE;
};
func void DIA_Brahim_GREET_Info ()
{
	AI_Output (other, self, "DIA_Brahim_GREET_15_00"); //Was machst du hier?
	AI_Output (self, other, "DIA_Brahim_GREET_07_01"); //Mein Name ist Brahim. Ich zeichne und verkaufe Karten.
	AI_Output (self, other, "DIA_Brahim_GREET_07_02"); //Da du hier neu bist, kannst du vielleicht eine Karte der Stadt gebrauchen.
	AI_Output (self, other, "DIA_Brahim_GREET_07_03"); //Sie ist sehr günstig - und bis du dich eingewöhnt hast, äußerst nützlich.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Brahim zeichnet und verkauft Karten am Hafen.");
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Brahim_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_437_Brahim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Brahim_MissingPeople_Condition;
	information	 = 	DIA_Addon_Brahim_MissingPeople_Info;

	description	 = 	"Stimmt es, dass Bewohner der Stadt einfach verschwinden?";
};

func int DIA_Addon_Brahim_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (ENTERED_ADDONWORLD == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Brahim_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Brahim_MissingPeople_15_00"); //Stimmt es, dass Bewohner der Stadt einfach verschwinden?
	AI_Output	(self, other, "DIA_Addon_Brahim_MissingPeople_07_01"); //Das habe ich auch gehört. Bin mir aber nicht sicher, ob das auch wirklich so ist.
	AI_Output	(self, other, "DIA_Addon_Brahim_MissingPeople_07_02"); //Sieh dich doch mal um. Ist dieses Loch hier denn etwa der Ort, wo du alt werden willst?
	AI_Output	(self, other, "DIA_Addon_Brahim_MissingPeople_07_03"); //Kein Wunder, dass sich die Leute aus dem Staub machen.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Brahim_Perm		(C_INFO)
{
	npc			 = 	VLK_437_Brahim;
	nr			 = 	99;
	condition	 = 	DIA_Brahim_Perm_Condition;
	information	 = 	DIA_Brahim_Perm_Info;
	permanent	 =  TRUE;
	description	 = 	"";
};
func int DIA_Brahim_Perm_Condition ()
{	
	
	{
		return TRUE;
	};
};
func void DIA_Brahim_Perm_Info ()
{
	AI_Output (other, self, "DIA_Brahim_Perm_15_00"); //
	AI_Output (self, other, "DIA_Brahim_Perm_07_01"); //
};
*/
///////////////////////////////////////////////////////////////////////
//	Info BUY
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_BUY		(C_INFO)
{
	npc			 = 	VLK_437_Brahim;
	nr			 = 	9;
	condition	 = 	DIA_Brahim_BUY_Condition;
	information	 = 	DIA_Brahim_BUY_Info;
	permanent 	 =  TRUE;
	trade 		 =  TRUE;
	description	 = 	"Zeig mir deine Karten";
};

func int DIA_Brahim_BUY_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Brahim_GREET)
	{
		return TRUE;
	};
};
func void DIA_Brahim_BUY_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Brahim_BUY_15_00"); //Zeig mir deine Karten.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Brahim_BUY_07_01"); //Du wirst in eurem Kloster keine besseren finden.
	};
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other, "DIA_Brahim_BUY_07_02"); //Gutes Kartenmaterial ist wichtig, zumal, wenn man vom Festland kommt, Herr Paladin.
	};
	Brahim_ShowedMaps = TRUE;
};

//######################################
//##
//##	Kapitel 3
//##
//######################################

///////////////////////////////////////////////////////////////////////
//	Info Kap3_EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Brahim_Kap3_EXIT   (C_INFO)
{
	npc         = VLK_437_Brahim;
	nr          = 999;
	condition   = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brahim_Kap3_EXIT_Condition()	//siehe auch First Exit
{
	if (Kapitel >= 3)
	&& ((Npc_KnowsInfo (other,DIA_Brahim_Kap3_First_EXIT))
	|| (Npc_HasItems (other,ItWr_ShatteredGolem_MIS) == 0))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Brahim_Kap3_EXIT_Info()
{
	if (Kapitel <= 4)
	{
		B_BrahimNewMaps ();
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap3_First_EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Brahim_Kap3_First_EXIT   (C_INFO)
{
	npc         = VLK_437_Brahim;
	nr          = 999;
	condition   = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_MIS) >=1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_07_00"); //Ich wusste, dass du an dem Stück interessiert bist.
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_15_01"); //Was für ein Stück meinst du?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_07_02"); //Na, die alte Karte, die du gerade gekauft hast.
	AI_Output (self, other,"DIA_Brahim_Kap3_First_EXIT_07_03"); //Ich kenne Typen wie dich, ihr erkennt, wo sich die Chance auf Reichtum bietet.
	Info_ClearChoices (DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,DIALOG_BACK,DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,"Wo hast du das Schriftstück her?",DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,"Was ist das für ein Schriftstück?",DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,"Wieso behälst du es nicht selbst?",DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_BACK ()
{
	Info_ClearChoices (DIA_Brahim_Kap3_First_EXIT);
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_WhereGetIt ()
{
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00"); //Wo hast du die Karte her?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01"); //Och, das habe ich in einem Packen alter Karten gefunden, die ich vor kurzem erworben habe.
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02"); //Die Verkäuferin muss es wohl übersehen haben.
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_Content ()
{
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_Content_15_00"); //Was ist das für eine Karte?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01"); //Es scheint eine Schatzkarte oder etwas ähnliches zu sein.
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02"); //Aber wie ich dich einschätze, wirst du der Sache selbst auf den Grund gehen.
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00"); //Wieso behältst du es nicht selbst?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01"); //Ich bin ein alter Mann und die Zeiten, wo ich selber losgezogen bin, sind lange vorbei.
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02"); //So etwas überlass ich den Jüngeren.
};


