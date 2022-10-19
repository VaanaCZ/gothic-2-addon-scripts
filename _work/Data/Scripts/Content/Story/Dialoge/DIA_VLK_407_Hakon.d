///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hakon_EXIT   (C_INFO)
{
	npc         = VLK_407_Hakon;
	nr          = 999;
	condition   = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Sperre		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Sperre_Condition;
	information	 = 	DIA_Hakon_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Hakon_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	{
		return TRUE;
	};
	//return FALSE;
};
func void DIA_Hakon_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Hakon_Sperre_12_00"); //Verschwinde, du Sträfling! Canthar hat mir gesagt, was du für ein mieser Kerl bist!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Hallo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 =  3;
	condition	 = 	DIA_Hakon_Hallo_Condition;
	information	 = 	DIA_Hakon_Hallo_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Hakon_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Hallo_Info ()
{
	AI_Output (self ,other,"DIA_Hakon_Add_12_00"); //Ich bin Hakon, der Waffenhändler. Kann ich etwa für dich tun?
	AI_Output (self ,other,"DIA_Hakon_Add_12_01"); //In diesen Tagen sollte jeder Mann eine Waffe tragen. Vor allem wenn er außerhalb der Stadtmauern unterwegs ist.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Hakon verkauft Waffen am Marktplatz.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Trade		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	99;
	condition	 = 	DIA_Hakon_Trade_Condition;
	information	 = 	DIA_Hakon_Trade_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Zeig mir deine Ware";
};
func int DIA_Hakon_Trade_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Hakon_Trade_15_00"); //Zeig mir deine Ware.
	
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self,other,"DIA_Hakon_Trade_12_01"); //Es ist mir eine Ehre, dass ein Vertreter unserer heiligen Kirche sich für meine Waren interessiert.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Hakon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_407_Hakon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Hakon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Hakon_MissingPeople_Info;

	description	 = 	"Was weißt du über das Verschwinden der Bürger von Khorinis?";
};

func int DIA_Addon_Hakon_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Hakon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //Was weißt du über das Verschwinden der Bürger von Khorinis?
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //Ich habe schon viele durch das Stadttor im Osten schreiten sehen.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //Einige sind gekommen, die ich in meinem Leben noch nie vorher gesehen habe und viele sind dort hinaus gegangen und kamen nie wieder.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //Aber neulich geschah etwas, das war schon befremdlich.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //Da war so ein Kerl bei mir. Ich glaube Joe ist sein Name. Er prahlte damit, dass er bald zu großen Geld kommen würde.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //Er wüsste angeblich, wie man in einen der Stadttürme, in denen die Miliz ihre Waffen aufbewahrt, hinein käme.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //Seitdem habe ich ihn nicht mehr gesehen, obwohl er mir sonst jeden Tag etwa um die gleiche Zeit über den Weg gelaufen ist.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //Ich hab das der Miliz gemeldet und dachte, vielleicht haben sie ihn erwischt und ich finde ihn da im Kerker wieder.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //Lord Andre wusste aber nicht, wovon ich rede. Er kannte den Typen nicht einmal.

	Log_CreateTopic (TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Joe,"Hakon, ein Händler in Khorinis, behauptet, dass ein Mann namens Joe einfach spurlos verschwunden ist. Dieser Joe wüsste angeblich, wie man in einen der Stadttürme, in denen die Miliz ihre Waffen aufbewahren, hinein käme."); 

	B_GivePlayerXP (XP_Ambient);
};

// ********************************************************
// 						OutOfTown
// ********************************************************
instance DIA_Hakon_OutOfTown		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_OutOfTown_Condition;
	information	 = 	DIA_Hakon_OutOfTown_Info;
	permanent	 = 	FALSE;
	description	 = 	"Erzähl mir mehr über die Gegend außerhalb der Stadt.";
};
func int DIA_Hakon_OutOfTown_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_OutOfTown_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_02"); //Erzähl mir mehr über die Gegend außerhalb der Stadt.
	AI_Output (self ,other,"DIA_Hakon_Add_12_03"); //Es ist verdammt gefährlich geworden da draussen.
	AI_Output (self ,other,"DIA_Hakon_Add_12_04"); //Zum einen wegen der Banditen und zum anderen wegen der wilden Tiere.
	AI_Output (self ,other,"DIA_Hakon_Add_12_05"); //Selbst die Tiere schienen in diesen beschissenen Zeiten nicht genug zu fressen zu haben.
	AI_Output (self ,other,"DIA_Hakon_Add_12_06"); //Sie wagen sich immer näher an die Stadt ran.
};

// ********************************************************
// 						Paladine
// ********************************************************
instance DIA_Hakon_Paladine		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	3;
	condition	 = 	DIA_Hakon_Paladine_Condition;
	information	 = 	DIA_Hakon_Paladine_Info;
	permanent	 = 	FALSE;
	description	 = 	"Weißt du etwas über die Paladine?";
};
func int DIA_Hakon_Paladine_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Paladine_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_07"); //Weißt du etwas über die Paladine?
	AI_Output (self ,other,"DIA_Hakon_Add_12_08"); //Ja! Die Kerle versauen mir mein Geschäft!
	AI_Output (self ,other,"DIA_Hakon_Add_12_09"); //In der ganzen Stadt kannst du höchstens noch Kurzschwerter kaufen.
	AI_Output (self ,other,"DIA_Hakon_Add_12_10"); //Alles, was länger als eine Elle ist, haben sie sich unter den Nagel gerissen.
	AI_Output (self ,other,"DIA_Hakon_Add_12_11"); //(sarkastisch) Dafür darf ich jetzt umsonst im Hotel wohnen - pah!
};

// ********************************************************
// 						WoWaffen
// ********************************************************
instance DIA_Hakon_WoWaffen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_WoWaffen_Condition;
	information	 = 	DIA_Hakon_WoWaffen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Wo bekommst du deine Waffen her?";
};
func int DIA_Hakon_WoWaffen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Hakon_WoWaffen_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_12"); //Wo bekommst du deine Waffen her?
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_13"); //Nirgendwo! Harad hat mich bisher immer beliefert.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_14"); //Harad, der Schmied hat mich bisher immer beliefert.
	};
	AI_Output (self ,other,"DIA_Hakon_Add_12_15"); //Jetzt produziert er nur noch für die Paladine.
	AI_Output (self ,other,"DIA_Hakon_Add_12_16"); //Er arbeitet Tag und Nacht wie bescheuert umsonst für die Kerle. Er denkt es wäre seine Pflicht.
	AI_Output (self ,other,"DIA_Hakon_Add_12_17"); //Alles, was ich dir anbieten kann sind Restbestände...
};

// ********************************************************
// 						HaradBandits
// ********************************************************
instance DIA_Hakon_HaradBandits		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_HaradBandits_Condition;
	information	 = 	DIA_Hakon_HaradBandits_Info;
	permanent	 = 	FALSE;
	description	 = 	"Harad hat mir von dem Banditenüberfall erzählt...";
};
func int DIA_Hakon_HaradBandits_Condition ()
{
	if (Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_HaradBandits_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_18"); //Harad hat mir von dem Banditenüberfall erzählt...
	AI_Output (self ,other,"DIA_Hakon_Add_12_19"); //Ach? Und?
	AI_Output (other, self,"DIA_Hakon_Add_15_20"); //Er will mir seine Zustimmung geben, eine Stelle als Lehrling anzunehmen, wenn ich die Banditen zur Strecke bringe.
	AI_Output (self ,other,"DIA_Hakon_Add_12_21"); //(lacht) Der gute alte Harad. Das ist wohl seine Art sich dafür zu entschuldigen, daß er zur Zeit keine Waffen mehr für mich herstellt.
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Banditen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Banditen_Condition;
	information	 = 	DIA_Hakon_Banditen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Was weißt du über die Banditen?";
};
func int DIA_Hakon_Banditen_Condition ()
{
	if (Npc_KnowsInfo (hero, DIA_Hakon_HaradBandits))
	|| (Npc_KnowsInfo (hero, DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};
func void DIA_Hakon_Banditen_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_15_00"); //Was weißt du über die Banditen?
	AI_Output (self, other, "DIA_Hakon_Banditen_12_01"); //Was ich von ihnen weiß? Auf dem Weg in die Stadt haben sie mich ausgeraubt!
	AI_Output (self, other, "DIA_Hakon_Banditen_12_02"); //Und ich bin nicht der Einzige. Die treiben hier schon seit geraumer Zeit ihr Unwesen.
	AI_Output (self, other, "DIA_Hakon_Banditen_12_03"); //Die Miliz hat zwar schon mal versucht, sie aufzuspüren, aber ohne Erfolg.

	MIS_HakonBandits = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HakonBanditen,LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen,"Hakon, der Waffenhändler wurde vor der Stadt von Banditen ausgeraubt." );
};


///////////////////////////////////////////////////////////////////////
//	WIEVIEL
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wieviel		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Wieviel_Condition;
	information	 = 	DIA_Hakon_Wieviel_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ich werde mich darum kümmern ...";
};
func int DIA_Hakon_Wieviel_Condition ()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wieviel_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //Ich werde mich darum kümmern ...
	AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //Was, DU willst dich mit den Banditen anlegen? Du alleine? Du bist wohl ein guter Kämpfer, was?
	AI_Output (other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //Wie viel ist dir die Sache wert?
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_25"); //(schlau) Du willst doch bei Harad Punkte sammeln oder etwa nicht?
		AI_Output (self ,other,"DIA_Hakon_Add_12_26"); //Ich denke nicht, das ich dich dafür noch bezahlen muß...
	}
	else
	{
		AI_Output (self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //Das ist eine gefährliche Sache.
		AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //Na ja, mir soll's Recht sein. Ich zahle dir 100 Goldstücke, wenn du die Banditen besiegst.
		MIS_HakonBanditsPay = TRUE;
	};
	
	Info_ClearChoices (DIA_Hakon_Banditen);
};

///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Miliz		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_Miliz_Condition;
	information	 = 	DIA_Hakon_Miliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"Weißt du, wer von der Miliz an der Suche beteiligt war? ";
};

func int DIA_Hakon_Miliz_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Miliz_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Miliz_15_00"); //Weißt du, wer von der Miliz an der Suche beteiligt war?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_01"); //Der Kerl heißt Pablo. Er war mit ein paar anderen auf der Suche nach den Banditen. Aber gefunden haben sie nichts.
	AI_Output (other, self, "DIA_Hakon_Miliz_15_02"); //Weißt du, wo ich Pablo finden kann?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_03"); //Er patrouilliert durch die Stadt. Du findest ihn entweder am Tempelplatz oder in der Unterstadt.
	
	B_LogEntry(TOPIC_HakonBanditen,"Pablo von der Stadtwache, war an der erfolglosen Suche nach den Banditen beteiligt." );
};
///////////////////////////////////////////////////////////////////////
//	Info Wo
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_Wo_Condition;
	information	 = 	DIA_Hakon_Wo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Wo bist du überfallen worden? ";
};

func int DIA_Hakon_Wo_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wo_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Wo_15_00"); //Wo bist du überfallen worden?
	AI_Output (self, other, "DIA_Hakon_Wo_12_01"); //In der Nähe von Akil's Hof. Geh einfach hier vorne aus dem Stadttor hinaus und folge dem Weg nach rechts.
	AI_Output (self, other, "DIA_Hakon_Wo_12_02"); //Dann kommst du nach einer Weile zu ein paar Treppenstufen. Von dort kamen die Kerle. Ich wette, die haben in dem Wald dahinter ihr Versteck.
};
///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Success		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Success_Condition;
	information	 = 	DIA_Hakon_Success_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ich habe die Banditen erledigt";
};

func int DIA_Hakon_Success_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	&& (Npc_IsDead (Bandit_1))
	&& (Npc_IsDead (Bandit_2))
	&& (Npc_IsDead (Bandit_3))
	
	{
		return TRUE;
	};
};
func void DIA_Hakon_Success_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Success_15_00"); //Ich habe die Banditen erledigt.
	AI_Output (self ,other,"DIA_Hakon_Add_12_27"); //So? Das kann ja jeder erzählen. Hast du einen Beweis?
	AI_Output (other, self,"DIA_Hakon_Add_15_28"); //(seufzt) Soll ich nochmal zurückgehen und ihnen die Köpfe abschlagen?
	AI_Output (self ,other,"DIA_Hakon_Add_12_29"); //(hastig) Nein - ich denke das wird nicht nötig sein. Ich glaube dir.
	AI_Output (self, other, "DIA_Hakon_Success_12_01"); //Damit hast du den Händlern und der Stadt einen großen Dienst erwiesen.
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_30"); //Harad wird zufrieden sein - denke ich.
	};
		
	if (MIS_HakonBanditsPay == TRUE)
	{	
		AI_Output (self, other, "DIA_Hakon_Success_12_02"); //Hier ist das versprochene Gold.
		B_GiveInvItems (self, other, ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Hakon_Bandits); 
	
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Hakon_Minenanteil (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 3;
	condition	= DIA_Hakon_Minenanteil_Condition;
	information	= DIA_Hakon_Minenanteil_Info;
	permanent	= FALSE;
	description = "Wo hast du die Minenanteile her, die du verkaufst?";
};   
                    
FUNC INT DIA_Hakon_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hakon_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Hakon_Minenanteil_15_00"); //Wo hast du die Minenanteile her, die du verkaufst?
	AI_Output (self, other, "DIA_Hakon_Minenanteil_12_01"); //Tut mir Leid, das kann ich dir nicht sagen. Ist mir zu gefährlich.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hakon_PICKPOCKET (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 900;
	condition	= DIA_Hakon_PICKPOCKET_Condition;
	information	= DIA_Hakon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Hakon_PICKPOCKET_Condition()
{
	C_Beklauen (45, 65);
};
 
FUNC VOID DIA_Hakon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hakon_PICKPOCKET);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_BACK 		,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};
	
func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};


// ************************************************************
// 			  				Kapitel2
// ************************************************************

INSTANCE DIA_Hakon_Kapitel2 (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 5;
	condition	= DIA_Hakon_Kapitel2_Condition;
	information	= DIA_Hakon_Kapitel2_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Hakon_Kapitel2_Condition()
{
	if (Kapitel >= 2)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hakon_Kapitel2_Info()
{	
	AI_Output (self ,other,"DIA_Hakon_Add_12_22"); //Da bist du ja wieder!
	AI_Output (self ,other,"DIA_Hakon_Add_12_23"); //Harad hat endlich den verdammten Auftrag für die Paladine erledigt.
	AI_Output (self ,other,"DIA_Hakon_Add_12_24"); //Das heißt, ich habe jetzt neue Waffen im Angebot. Hast du Interesse?
};
