///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Coragon_EXIT   (C_INFO)
{
	npc         = VLK_420_Coragon;
	nr          = 999;
	condition   = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Coragon_PICKPOCKET (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr			= 900;
	condition	= DIA_Coragon_PICKPOCKET_Condition;
	information	= DIA_Coragon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Coragon_PICKPOCKET_Condition()
{
	C_Beklauen (40, 45);
};
 
FUNC VOID DIA_Coragon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Coragon_PICKPOCKET);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_BACK 		,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};
	
func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};

// *********************************************************
// 							Hallo
// *********************************************************
instance DIA_Coragon_HALLO		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_HALLO_Condition;
	information	 = 	DIA_Coragon_HALLO_Info;
	permanent    =  FALSE;
	description	 = 	"Krieg ich hier was zu trinken?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Krieg ich hier was zu trinken?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Wenn du Gold hast, kannst du hier sogar was essen, wenn du willst.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Bei dem Wirt Coragon kann ich Nahrung und Getränke kaufen.");
};

// *********************************************************
// 							Trade
// *********************************************************
instance DIA_Coragon_Trade		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_Trade_Condition;
	information	 = 	DIA_Coragon_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Zeig mir deine Ware.";
	trade 		 =  TRUE;
};
func int DIA_Coragon_Trade_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Trade_Info () //FIXME_FILER NOCH ESSEN IN INV
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Zeig mir deine Ware.
};

// *********************************************************
// 							WhatsUp
// *********************************************************
instance DIA_Coragon_WhatsUp	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  3;
	condition	 = 	DIA_Coragon_WhatsUp_Condition;
	information	 = 	DIA_Coragon_WhatsUp_Info;
	permanent    =  FALSE;
	description	 = 	"Und, wie läuft das Geschäft so? ";
	
};
func int DIA_Coragon_WhatsUp_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_WhatsUp_Info ()
{
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //Und, wie läuft das Geschäft so?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //Ach, hör auf. Lord Andre läßt am Galgenplatz Freibier ausschenken.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Jetzt kommen fast nur noch die reiche Leute aus der Oberstadt her.
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //Was ist so falsch an denen?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //(lacht) Einige von den feinen Pinkeln können dir ganz schön auf die Nerven gehen.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Dieser Valentino zum Beispiel - ich kann den Kerl nicht leiden.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Aber ich kann mir meine Kundschaft nicht aussuchen. Ich brauche jedes Goldstück.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //Das bißchen, was ich gespart habe, ist mir zusammen mit meinem ganzen Silber gestohlen worden.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Coragon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_420_Coragon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Coragon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Coragon_MissingPeople_Info;

	description	 = 	"Erzähl mir etwas über die vermissten Bürger der Stadt.";
};

func int DIA_Addon_Coragon_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Coragon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //Erzähl mir etwas über die vermissten Bürger der Stadt.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //°Ich habe gehört, das es viele am Hafen unten erwischt haben soll. Was nicht verwunderlich ist bei der Gegend da unten. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //°Selbst Thorben der Tischler in der Unterstadt beklagt den Verlust seines Lehrlings.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //°Hakon, ein Händler vom Marktplatz erzählte eine besonders abenteurliche Geschichte. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //°Er meinte, da wäre so'n Typ, dem er sonst jeden Tag über den Weg gelaufen wäre, auf einmal wie vom Erdboden verschluckt. Er ist deswegen sogar bei der Miliz gewesen. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //°Die Bürger der Stadt sind darauf alle ziemlich in Panik geraten. Ich weiß nicht, was ich davon halten soll. Ich schätze, das ist alles Unsinn.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //°Khorinis ist eine rauhe Stadt und vor den Toren lauern eine Menge Gefahren.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //°Wenn du nicht innerhalb der Stadtmauern bleibst, wirst du von Banditen überfallen oder von wilden Tieren gefressen. So einfach ist das.  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Sowohl Hakon, ein Händler vom Marktplatz, als auch Thorben der Tischler sollen etwas über die vermissten Leute wissen."); 
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  4;
	condition	 = 	DIA_Coragon_Bestohlen_Condition;
	information	 = 	DIA_Coragon_Bestohlen_Info;
	permanent    =  FALSE;
	description	 = 	"Du bist bestohlen worden?";
	
};
func int DIA_Coragon_Bestohlen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Bestohlen_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Du bist bestohlen worden?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //Ja, ist schon ne Weile her. An dem Abend war es noch ziemlich voll und ich habe Bier rumgebracht.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Ich war nicht lange hinter der Theke weg - aber den Mistkerlen hat es gereicht.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //Ich war schon bei der Miliz deswegen - aber die haben natürlich nichts gefunden. Stattdessen besaufen sie sich am Freibierstand.
	
	MIS_Coragon_Silber = LOG_RUNNING;
};


// **************
// B_Coragon_Bier
// **************

var int Coragon_Bier;
// ------------------	
	
func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //Hier - nimm das als Belohnung.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //Ein ganz besonderes Bier. Es ist mein letztes Fass.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //Es ist der letzte Schluck!
	};
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_BringSilber	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  5;
	condition	 = 	DIA_Coragon_BringSilber_Condition;
	information	 = 	DIA_Coragon_BringSilber_Info;
	permanent    =  FALSE;
	description	 = 	"Ich hab dein Silber";
	
};
func int DIA_Coragon_BringSilber_Condition ()
{	
	if (MIS_Coragon_Silber == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_CoragonsSilber) >= 8)
	{
		return TRUE;
	};
};
func void DIA_Coragon_BringSilber_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //Ich hab dein Silber
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //Tatsächlich!
	B_GivePlayerXP (XP_CoragonsSilber);
	B_Coragon_Bier();
	
	MIS_Coragon_Silber = LOG_SUCCESS;
};

// *********************************************************
// 					Lehmars Schuldenbuch
// *********************************************************
instance DIA_Coragon_Schuldenbuch	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  6;
	condition	 = 	DIA_Coragon_Schuldenbuch_Condition;
	information	 = 	DIA_Coragon_Schuldenbuch_Info;
	permanent    =  FALSE;
	description	 = 	"Schau mal was ich hier habe...";
	
};
func int DIA_Coragon_Schuldenbuch_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Schuldenbuch_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //Schau mal was ich hier habe...
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Mmm? (überrascht) Das ist das Schuldenbuch von Lehmar!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Was hast du damit vor?
};


// *********************************************************
// 					Schuldenbuch geben
// *********************************************************
instance DIA_Coragon_GiveBook (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  7;
	condition	 = 	DIA_Coragon_GiveBook_Condition;
	information	 = 	DIA_Coragon_GiveBook_Info;
	permanent    =  FALSE;
	description	 = 	"Hier hast du das Buch.";
	
};
func int DIA_Coragon_GiveBook_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_GiveBook_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Hier hast du das Buch.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //Danke! Du hast mich gerettet. Lehmar kann ziemlich ungemütlich werden.
	B_GivePlayerXP (XP_Schuldenbuch);
	B_Coragon_Bier();
};


// *********************************************************
// 							ToOV
// *********************************************************
instance DIA_Coragon_ToOV (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  9;
	condition	 = 	DIA_Coragon_ToOV_Condition;
	information	 = 	DIA_Coragon_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"Was muss sich machen, um ins obere Viertel zu kommen?";
	
};
func int DIA_Coragon_ToOV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	&& (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Coragon_ToOV_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //Was muss sich machen, um ins obere Viertel zu kommen?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Du mußt Bürger der Stadt sein. Such dir eine Arbeit.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //Am besten bei den Handwerkern in der Unterstadt. Dann bist du ein Bürger der Stadt.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //Tja, und wenn dir das noch nicht reicht, dann sprich mit Lord Andre in der Kaserne.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Vielleicht nimmt er dich ja bei der Stadtwache auf. Die kommen auch in's obere Viertel.
};


// *********************************************************
// 							Valentino
// *********************************************************
instance DIA_Coragon_Valentino (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  8;
	condition	 = 	DIA_Coragon_Valentino_Condition;
	information	 = 	DIA_Coragon_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Was ist los mit diesem Valentino?";
	
};
func int DIA_Coragon_Valentino_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Valentino_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //Was ist los mit diesem Valentino?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Er ist stinkreich und muss nicht arbeiten. und er bindet das auch jedem auf die Nase.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Egal ob man's hören will oder nicht.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Er säuft viel und bleibt immer bis zum Ende, bis er dann früh am Morgen zurück in's obere Viertel wankt.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //Das geht jeden Tag so.
	
	
};

// *********************************************************
// 						Zeche - Important
// *********************************************************
instance DIA_Coragon_News (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 1;
	condition	= DIA_Coragon_News_Condition;
	information	= DIA_Coragon_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
	
};
func int DIA_Coragon_News_Condition ()
{	
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if (Regis_Ring == TRUE)
		{	
			return TRUE;
		};
	};
};
func void DIA_Coragon_News_Info ()
{
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //Valentino konnte letzte Nacht seine Zeche nicht bezahlen.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Er hat irgendwas gefaselt - er wäre ausgeraubt worden und würde später bezahlen... Sowas!.
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //Vorher hat er noch geprahlt, wieviel Geld er hat.
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //Dann greift er in seine Tasche und macht ein dämliches Gesicht. Er meint er wäre bestohlen worden...
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //Und? Was hast du gemacht?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //Na, ich hab ihm 'ne ordentliche Tracht Prügel verabreicht, was sonst!
};

// *********************************************************
// 						Ring geben
// *********************************************************
instance DIA_Coragon_Ring (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 10;
	condition	= DIA_Coragon_Ring_Condition;
	information	= DIA_Coragon_Ring_Info;
	permanent   = FALSE;
	description = "Hier - nimm diesen Ring.";
	
};
func int DIA_Coragon_Ring_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_News))
	&& (Npc_HasItems (other, ItRi_ValentinosRing) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Ring_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Hier - nimm diesen Ring.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Was? Ich verstehe nicht...
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //Er gehörte Valentino.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //Du kannst ihn ja an den nächsten weitergeben, der ihm eine Tracht Prügel verabreicht...

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























