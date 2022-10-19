// ************************************************************
// 			  					EXIT 
// ************************************************************
INSTANCE DIA_Elena_EXIT   (C_INFO)
{
	npc         = BAU_911_Elena;
	nr          = 999;
	condition   = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Elena_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo 
// ************************************************************
instance DIA_Elena_HALLO		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 1;
	condition	= DIA_Elena_HALLO_Condition;
	information	= DIA_Elena_HALLO_Info;
	permanent	= FALSE;
	description	= "Hallo, schönes Kind.";
};

func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Elena_HALLO_15_00"); //Hallo, schönes Kind.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_01"); //Na? Wo haben sie dich denn laufen lassen?
	}
	else
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_02"); //Was willst du?
	};
};


// ************************************************************
// 			  					Aufstand
// ************************************************************
instance DIA_Elena_Aufstand		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 2;
	condition	= DIA_Elena_Aufstand_Condition;
	information	= DIA_Elena_Aufstand_Info;
	permanent	= FALSE;
	description	= "Ich habe gehört, ihr lehnt euch gegen den König auf?";
};

func int DIA_Elena_Aufstand_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info ()
{
	AI_Output (other, self, "DIA_Elena_Aufstand_15_00"); //Ich habe gehört, ihr lehnt euch gegen den König auf?
	AI_Output (self, other, "DIA_Elena_Aufstand_16_01"); //Mein Vater hat beschlossen, dass es an der Zeit ist, dass wir uns selbst verteidigen.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Elena_Aufstand_16_02"); //Die Milizen haben uns sowieso nie geholfen. Die waren nur hier, um unsere Waren wegzuschleppen.
	};
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Arbeit		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 3;
	condition	= DIA_Elena_Arbeit_Condition;
	information	= DIA_Elena_Arbeit_Info;
	permanent	= FALSE;
	description	= "Welche Arbeit gibt es hier auf dem Hof?";
};

func int DIA_Elena_Arbeit_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Elena_Arbeit_15_00"); //Welche Arbeit gibt es hier auf dem Hof?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_01"); //Mein Vater zahlt Geld an alle Männer, die helfen, den Hof zu verteidigen.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_02"); //Hast du Interesse? Du siehst mir nicht wie jemand aus, der an Feldarbeit interessiert ist.
	AI_Output (other, self, "DIA_Elena_Arbeit_15_03"); //Wie viel zahlt dein Vater?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_04"); //Das musst du schon mit ihm selbst aushandeln.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_05"); //Ich weiß nur, dass jeder der Söldner hier täglich seinen Sold bekommt.
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Regeln		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 4;
	condition	= DIA_Elena_Regeln_Condition;
	information	= DIA_Elena_Regeln_Info;
	permanent	= FALSE;
	description	= "Gibt es hier irgendwelche Regeln, die ich beachten sollte?";
};

func int DIA_Elena_Regeln_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Elena_Regeln_15_00"); //Gibt es hier irgendwelche Regeln, die ich beachten sollte?
	AI_Output (self, other, "DIA_Elena_Regeln_16_01"); //Du fasst hier nichts an, was dir nicht gehört.
	AI_Output (self, other, "DIA_Elena_Regeln_16_02"); //Du marschierst nicht in Bereiche, in denen du nichts zu suchen hast.
	AI_Output (self, other, "DIA_Elena_Regeln_16_03"); //Und wenn du vor hast, dich zu prügeln, halt dich an die Söldner.
	AI_Output (self, other, "DIA_Elena_Regeln_16_04"); //Wenn du Schlägereien mit den Bauern anfängst, hast du hier alle gegen dich.
};


// ************************************************************
// 			  					Aufgabe 
// ************************************************************
instance DIA_Elena_AUFGABE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 5;
	condition	= DIA_Elena_AUFGABE_Condition;
	information	= DIA_Elena_AUFGABE_Info;
	permanent 	= FALSE;
	description	= "Was ist deine Aufgabe hier?";
};

func int DIA_Elena_AUFGABE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info ()
{
	AI_Output (other, self, "DIA_Elena_AUFGABE_15_00"); //Was ist deine Aufgabe hier?
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_01"); //Ich verkaufe die Waren unseres Hofes. Wenn du etwas kaufen möchtest, musst du's mir nur sagen.
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_02"); //Aber ich warne dich. Bei mir wird nicht gefeilscht und nicht gestohlen, klar?
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Elena verkauft Waren auf Onar's Hof.");
};

// ************************************************************
// 			  					TRADE 
// ************************************************************

//---------------------------------
var int Elena_Trade_mit_mir;
//---------------------------------

instance DIA_Elena_TRADE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr          = 7;
	condition	= DIA_Elena_TRADE_Condition;
	information	= DIA_Elena_TRADE_Info;
	permanent	= TRUE;
	description	= "Zeig mir deine Ware!";
	trade		= TRUE;
};

func int DIA_Elena_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_AUFGABE))
	|| (Elena_Trade_mit_mir == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Elena_TRADE_15_00"); //Zeig mir deine Ware!
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Elena_TRADE_16_01"); //Was kann ich dir anbieten?
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Elena_PERM		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 900;
	condition	= DIA_Elena_PERM_Condition;
	information	= DIA_Elena_PERM_Info;
	permanent	= TRUE;
	description	= "Ist was Bedeutendes passiert in letzter Zeit?";
};

func int DIA_Elena_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Elena_PERM_15_00"); //Ist was Bedeutendes passiert in letzter Zeit?

	if (kapitel <= 1)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_01"); //Vor einigen Tagen hat mein Vater erlassen, dass wir nichts mehr in der Stadt verkaufen dürfen.
		AI_Output			(self, other, "DIA_Elena_PERM_16_02"); //Darum bleibe ich hier auf dem Hof und verkaufe meine Ware nur noch an Besucher.
	
		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_03"); //Die Milizangriffe auf die umliegenden Höfe scheinen sich zu häufen. Nur eine Frage der Zeit, bis mein Vater einschreitet.
	}
	else if (Kapitel == 3)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_04"); //Das Land ist ziemlich unsicher geworden. Keiner wagt sich weiter als bis zu den eigenen Feldern. In der Stadt ist schon lange keiner von uns mehr gewesen.
	}
	else if (kapitel == 4)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_05"); //Die Söldner sind immer unruhiger geworden. Doch seit Sylvio mit seinen Jungs weg ist, scheinen sie sich ein bisschen zu entspannen.
	}
	else //Kapitel 5
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_06"); //Alle reden nur noch von dem bevorstehenden Angriff der Orks. Aber ich glaube nicht so recht daran. Ich denke, hier auf dem Hof sind wir vor ihnen sicher.
	};
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Minenanteil
///////////////////////////////////////////////////////////////////////
instance DIA_Elena_MINENANTEIL		(C_INFO)
{
	npc		 = 	BAU_911_Elena;
	nr		 = 	2;
	condition	 = 	DIA_Elena_MINENANTEIL_Condition;
	information	 = 	DIA_Elena_MINENANTEIL_Info;

	description  =  "Du verkaufst Minenanteile?";
};

func int DIA_Elena_MINENANTEIL_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Elena_Hallo))
		{
				return TRUE;
		};
};

func void DIA_Elena_MINENANTEIL_Info ()
{
	AI_Output			(other, self, "DIA_Elena_MINENANTEIL_15_00"); //Du verkaufst Minenanteile?
	AI_Output			(self, other, "DIA_Elena_MINENANTEIL_16_01"); //Und wenn schon. Ich habe sie ja auch für teures Geld kaufen müssen.
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Elena_PICKPOCKET (C_INFO)
{
	npc			= BAU_911_Elena;
	nr			= 900;
	condition	= DIA_Elena_PICKPOCKET_Condition;
	information	= DIA_Elena_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Elena_PICKPOCKET_Condition()
{
	C_Beklauen (30, 35);
};
 
FUNC VOID DIA_Elena_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Elena_PICKPOCKET);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_BACK 		,DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};
	
func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};





















