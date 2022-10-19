// ***********************************************************
// 						 	EXIT
// ***********************************************************
INSTANCE DIA_Meldor_EXIT   (C_INFO)
{
	npc         = VLK_415_Meldor;
	nr          = 999;
	condition   = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 						 	Hallo
// ***********************************************************
instance DIA_Meldor_Hallo		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Hallo_Condition;
	information	= DIA_Meldor_Hallo_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Meldor_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Meldor_Hallo_07_00"); //Was willst du?
	AI_Output (other, self, "DIA_Meldor_Hallo_15_01"); //Ich wollte mich hier mal umsehen ...
	AI_Output (self, other, "DIA_Meldor_Hallo_07_02"); //Und wo genau willst du hin?
};

// ***********************************************************
// 						 	Interessantes
// ***********************************************************
instance DIA_Meldor_Interessantes		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Interessantes_Condition;
	information	= DIA_Meldor_Interessantes_Info;
	permanent 	= FALSE;
	description	= "Was gibt's denn hier Interessantes zu sehen?";
};

func int DIA_Meldor_Interessantes_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Interessantes_15_00"); //Was gibt's denn hier Interessantes zu sehen?
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_01"); //Hier gibt's 'nen Puff und 'ne Kneipe. Der Wirt heißt Kardif. Wenn du Informationen willst, dann sprich mit ihm. Er ist der richtige Mann dafür.
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_02"); //Brauchst du eigentlich Geld?
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, der Wirt der Hafenkneipe handelt mit Informationen.");
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************
instance DIA_Meldor_Lehmar		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 3;
	condition	= DIA_Meldor_Lehmar_Condition;
	information	= DIA_Meldor_Lehmar_Info;
	permanent 	= FALSE;
	description	= "Hast du was zu verschenken?";
};

func int DIA_Meldor_Lehmar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Lehmar_15_00"); //Hast du was zu verschenken?
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_01"); //(gelangweilt) Nein. Aber direkt hier gegenüber ist das Haus von Lehmar, dem Geldverleiher.
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_02"); //Er wird dir sicher ein paar Goldstücke geben, geh nur zu ihm.
	Npc_ExchangeRoutine (self, "START");
};


// ***********************************************************
// 						 	Arbeitest
// ***********************************************************
instance DIA_Meldor_Arbeitest		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 4;
	condition	= DIA_Meldor_Arbeitest_Condition;
	information	= DIA_Meldor_Arbeitest_Info;
	permanent 	= FALSE;
	description	= "Arbeitest du für Lehmar?";
};

func int DIA_Meldor_Arbeitest_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Arbeitest_15_00"); //Arbeitest du für Lehmar?
	AI_Output (self, other, "DIA_Meldor_Arbeitest_07_01"); //Schlaues Kerlchen.
};

// ***********************************************************
// 						 	InsOV
// ***********************************************************
instance DIA_Meldor_InsOV		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_InsOV_Condition;
	information	= DIA_Meldor_InsOV_Info;
	permanent 	= FALSE;
	description	= "Eigentlich war ich auf dem Weg ins obere Viertel ...";
};

func int DIA_Meldor_InsOV_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info ()
{
	AI_Output (other, self, "DIA_Meldor_InsOV_15_00"); //Eigentlich war ich auf dem Weg ins obere Viertel ...
	AI_Output (self, other, "DIA_Meldor_InsOV_07_01"); //(sarkastisch) Ja, klar. Und ich wollte gerade aufs Schiff und mich zu meiner Audienz beim König bringen lassen.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_02"); //Leute wie du und ich kommen nicht mehr ins obere Viertel, seit die Paladine da sind.
};

// ***********************************************************
// 						 	Citizen
// ***********************************************************
instance DIA_Meldor_Citizen		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 6;
	condition	= DIA_Meldor_Citizen_Condition;
	information	= DIA_Meldor_Citizen_Info;
	permanent 	= FALSE;
	description	= "Bist du Bürger dieser Stadt?";
};

func int DIA_Meldor_Citizen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Citizen_15_00"); //Bist du Bürger dieser Stadt?
	AI_Output (self, other, "DIA_Meldor_Citizen_07_01"); //Wenn du meinst, ob ich hier wohne - ja. Aber ins obere Viertel lassen sie mich deswegen noch lange nicht.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_02"); //Nur die feinen Pinkel oder die Händler und Handwerker aus der Unterstadt kommen da noch rein.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_03"); //Die Leute aus dem Hafenviertel haben in Khorinis nicht viel zu melden. Hier gibt's noch nicht mal 'ne regelmäßige Milizpatrouille.

};
// ***********************************************************
// 						 Smoke
// ***********************************************************
instance DIA_Meldor_Smoke		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_Smoke_Condition;
	information	= DIA_Meldor_Smoke_Info;
	permanent 	= FALSE;
	description	= "Weißt du, wo ich Kraut kaufen kann?";
};

func int DIA_Meldor_Smoke_Condition ()
{	
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Meldor_Smoke_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Meldor_Smoke_15_00"); //Weißt du, wo ich Kraut kaufen kann?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_01"); //(musternd) Nö, keine Ahnung.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_02"); //Wenn ich du wäre, würde ich es mal in der 'roten Laterne' versuchen.
	};
};

// ***********************************************************
// 						 	PERM
// ***********************************************************
var int Meldor_DGNews;
// --------------------

instance DIA_Meldor_PERM		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 7;
	condition	= DIA_Meldor_PERM_Condition;
	information	= DIA_Meldor_PERM_Info;
	permanent 	= TRUE;
	description	= "Ist hier in letzter Zeit was Aufregendes passiert?";
};

func int DIA_Meldor_PERM_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info ()
{
	AI_Output (other, self, "DIA_Meldor_PERM_15_00"); //Ist hier in letzter Zeit was Aufregendes passiert?
	
	if (Kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_01"); //Die Stadtwache hat vor kurzem das ganze Hafenviertel auf den Kopf gestellt.
		AI_Output (self, other, "DIA_Meldor_PERM_07_02"); //Sie waren auf der Suche nach Diebesgut. In letzter Zeit gab's 'ne Menge Diebstähle hier. Vor allem in den besseren Vierteln.
		AI_Output (self, other, "DIA_Meldor_PERM_07_03"); //Klar, dass sie das alles auf die armen Schlucker im Hafen schieben wollen.
	}
	else if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	&&		(Meldor_DGNews == FALSE)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_04"); //Es heißt, sie haben ein Diebesnest in der Kanalisation ausgeräumt. Die Diebe sind alle getötet worden.
		Meldor_DGNews = TRUE;
	}
	else if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_05"); //Im Minental soll es Drachen geben. Bin mal gespannt, wann die Paladine hier abrücken, um sie zu bekämpfen.
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_06"); //Die Drachen sind angeblich alle tot. Da hat wohl irgendwer kräftig aufgeräumt.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_07"); //Nein.
	};
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************

instance DIA_Meldor_VonLehmar		(C_INFO)
{
	npc			 = 	VLK_415_Meldor;
	nr			 =  1;
	condition	 = 	DIA_Meldor_VonLehmar_Condition;
	information	 = 	DIA_Meldor_VonLehmar_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Meldor_VonLehmar_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Meldor_VonLehmar_Info ()
{
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_00"); //Warte doch mal ...
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_01"); //Ich soll dir was von Lehmar ausrichten ...

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Meldor_PICKPOCKET (C_INFO)
{
	npc			= VLK_415_Meldor;
	nr			= 900;
	condition	= DIA_Meldor_PICKPOCKET_Condition;
	information	= DIA_Meldor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Meldor_PICKPOCKET_Condition()
{
	C_Beklauen (34, 55);
};
 
FUNC VOID DIA_Meldor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Meldor_PICKPOCKET);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_BACK 		,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
	
func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
































