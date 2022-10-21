///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Babera_EXIT   (C_INFO)
{
	npc         = BAU_934_Babera;
	nr          = 999;
	condition   = DIA_Babera_EXIT_Condition;
	information = DIA_Babera_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Babera_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Babera_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_HALLO		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	1;
	condition	 = 	DIA_Babera_HALLO_Condition;
	information	 = 	DIA_Babera_HALLO_Info;

	description	 = 	"Hallo, sch�nes M�dchen.";
};

func int DIA_Babera_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Babera_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Babera_HALLO_15_00"); //Hallo, sch�nes M�dchen.
	AI_Output			(self, other, "DIA_Babera_HALLO_16_01"); //S��holzraspeln wirkt bei mir nicht, Junge. Sag, was du willst. Ich hab zu tun.
};

///////////////////////////////////////////////////////////////////////
//	Info Wiesiehtsaus
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_WIESIEHTSAUS		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	2;
	condition	 = 	DIA_Babera_WIESIEHTSAUS_Condition;
	information	 = 	DIA_Babera_WIESIEHTSAUS_Info;

	description	 = 	"Wie l�uft's mit der Feldarbeit?";
};

func int DIA_Babera_WIESIEHTSAUS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Babera_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Babera_WIESIEHTSAUS_Info ()
{
	AI_Output			(other, self, "DIA_Babera_WIESIEHTSAUS_15_00"); //Wie l�uft's mit der Feldarbeit?
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_16_01"); //Guck dir die riesigen Felder an, die wir bestellen m�ssen, dann wei�t du, wie es l�uft.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_16_02"); //Suchst du Landarbeit?

	Info_ClearChoices	(DIA_Babera_WIESIEHTSAUS);

	if (hero.guild == GIL_NONE)
		{
			Info_AddChoice	(DIA_Babera_WIESIEHTSAUS, "Nein. Eigentlich will ich S�ldner werden.", DIA_Babera_WIESIEHTSAUS_Nein );
			Info_AddChoice	(DIA_Babera_WIESIEHTSAUS, "Vielleicht.", DIA_Babera_WIESIEHTSAUS_Vielleicht );
		};
};
func void DIA_Babera_WIESIEHTSAUS_Vielleicht ()
{
	AI_Output			(other, self, "DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00"); //Vielleicht.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01"); //Wenn das so ist, dann geh am Besten zu unserem Bauern Sekob, dem alten Menschenschinder. Der hat vielleicht was f�r dich.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02"); //Du kannst es nat�rlich auch auf Onars gro�em Hof am Ende der langen Allee versuchen.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03"); //Aber nimm dich vor den S�ldnern in Acht. Sie m�gen keine Fremden.

	Info_ClearChoices	(DIA_Babera_WIESIEHTSAUS);
};

func void DIA_Babera_WIESIEHTSAUS_Nein ()
{
	AI_Output			(other, self, "DIA_Babera_WIESIEHTSAUS_Nein_15_00"); //Nein. Eigentlich will ich S�ldner werden.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Nein_16_01"); //Dann bist du hier falsch. Die S�ldner findest du meistens auf dem Hof des Gro�bauern.

	Info_ClearChoices	(DIA_Babera_WIESIEHTSAUS);
};

///////////////////////////////////////////////////////////////////////
//	Info bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_BRONKO		(C_INFO)
{
	npc		 	 = 	BAU_934_Babera;
	nr		 	 = 	3;
	condition	 = 	DIA_Babera_BRONKO_Condition;
	information	 = 	DIA_Babera_BRONKO_Info;

	description	 = 	"(nach Bronko fragen)";
};

func int DIA_Babera_BRONKO_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bronko_Hallo))
		&& (Npc_KnowsInfo(other, DIA_Babera_WIESIEHTSAUS)) 
		)
		{
				return TRUE;
		};
};

func void DIA_Babera_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Babera_BRONKO_15_00"); //Sag mal, der grimmige Typ da...
	AI_Output			(self, other, "DIA_Babera_BRONKO_16_01"); //Das ist Bronko. Was ist mit ihm?
	AI_Output			(other, self, "DIA_Babera_BRONKO_15_02"); //Ist das euer Bauer?
	AI_Output			(self, other, "DIA_Babera_BRONKO_16_03"); //(lacht) Hat er dir das erz�hlt, ja? Sekob ist unser Bauer. Bronko ist nur ein Faulpelz und Tunichtgut. Aber er hat B�renkr�fte.
	AI_Output			(self, other, "DIA_Babera_BRONKO_16_04"); //Deswegen sagt keiner was, wenn er nicht arbeitet.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Babera_BRONKO_16_05"); //Die Einzigen, die er f�rchtet, seid ihr S�ldner.

		}
	else
		{
			AI_Output			(self, other, "DIA_Babera_BRONKO_16_06"); //Die Einzigen, die ihn zur Arbeit bewegen k�nnten, sind die S�ldner. Vor denen hat er Angst.

		};
	Babera_BronkoKeinBauer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Rosi
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_Rosi		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	3;
	condition	 = 	DIA_Babera_Rosi_Condition;
	information	 = 	DIA_Babera_Rosi_Info;

	description	 = 	"Wo ist Rosi?";
};

func int DIA_Babera_Rosi_Condition ()
{
		if (MIS_bringRosiBackToSekob == LOG_RUNNING)
		&& (Kapitel >= 5)
		&& (RosiFoundKap5 == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Babera_Rosi_Info ()
{
	AI_Output			(other, self, "DIA_Babera_Rosi_15_00"); //Wo ist Rosi?
	AI_Output			(self, other, "DIA_Babera_Rosi_16_01"); //Sie hat's hier nicht mehr ausgehalten und ist in den Wald Richtung Norden gegangen.
	B_LogEntry (TOPIC_RosisFlucht,"Rosi ist von Sekobs Hof geflohen. Babera meint, sie sei von Sekobs Hof aus in den Wald Richtung Norden gegangen."); 
	B_LogEntry (TOPIC_bringRosiBackToSekob,"Rosi ist von Sekobs Hof geflohen. Babera meint, sie sei von Sekobs Hof aus in den Wald Richtung Norden gegangen."); 
};


///////////////////////////////////////////////////////////////////////
//	Info dustoerst
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_DUSTOERST		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	10;
	condition	 = 	DIA_Babera_DUSTOERST_Condition;
	information	 = 	DIA_Babera_DUSTOERST_Info;
	permanent	 = 	TRUE;

	description	 = 	"Und sonst?";
};

func int DIA_Babera_DUSTOERST_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Babera_BRONKO))
		{
				return TRUE;
		};
};

func void DIA_Babera_DUSTOERST_Info ()
{
	AI_Output			(other, self, "DIA_Babera_DUSTOERST_15_00"); //Und sonst?
	AI_Output			(self, other, "DIA_Babera_DUSTOERST_16_01"); //Ich hab zu tun.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Babera_PICKPOCKET (C_INFO)
{
	npc			= BAU_934_Babera;
	nr			= 900;
	condition	= DIA_Babera_PICKPOCKET_Condition;
	information	= DIA_Babera_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Babera_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Babera_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Babera_PICKPOCKET);
	Info_AddChoice		(DIA_Babera_PICKPOCKET, DIALOG_BACK 		,DIA_Babera_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Babera_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Babera_PICKPOCKET_DoIt);
};

func void DIA_Babera_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Babera_PICKPOCKET);
};
	
func void DIA_Babera_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Babera_PICKPOCKET);
};


