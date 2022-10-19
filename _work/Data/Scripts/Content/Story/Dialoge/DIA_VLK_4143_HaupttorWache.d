///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Haupttorwache_EXIT   (C_INFO)
{
	npc         = VLK_4143_HaupttorWache;
	nr          = 999;
	condition   = DIA_Haupttorwache_EXIT_Condition;
	information = DIA_Haupttorwache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Haupttorwache_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Haupttorwache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Haupttorwache_AUFGABE		(C_INFO)
{
	npc		 = 	VLK_4143_HaupttorWache;
	nr		 = 	4;
	condition	 = 	DIA_Haupttorwache_AUFGABE_Condition;
	information	 = 	DIA_Haupttorwache_AUFGABE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co je tvoje práce?";
};

func int DIA_Haupttorwache_AUFGABE_Condition ()
{
	return TRUE;
};

func void DIA_Haupttorwache_AUFGABE_Info ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_AUFGABE_15_00"); //Co je tvým úkolem?
	AI_Output			(self, other, "DIA_Haupttorwache_AUFGABE_13_01"); //Mùj úkol je jednoduchý. Mám zajistit, aby se skâeti drželi dál než 30 stop od brány.
	AI_Output			(self, other, "DIA_Haupttorwache_AUFGABE_13_02"); //Když se pokusí dostat pâes padací mâíž, spustím poplach. Toã vše.
};

///////////////////////////////////////////////////////////////////////
//	Info Toroeffnen
///////////////////////////////////////////////////////////////////////
instance DIA_Haupttorwache_TOROEFFNEN		(C_INFO)
{
	npc		 = 	VLK_4143_HaupttorWache;
	nr		 = 	5;
	condition	 = 	DIA_Haupttorwache_TOROEFFNEN_Condition;
	information	 = 	DIA_Haupttorwache_TOROEFFNEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak by se dala hlavní brána otevâít?";
};

func int DIA_Haupttorwache_TOROEFFNEN_Condition ()
{
	if (Kapitel >= 5)
		{
				return TRUE;
		};
};
func void DIA_Haupttorwache_TOROEFFNEN_Info ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_15_00"); //Jak by se dala hlavní brána otevâít?
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_13_01"); //Proè bys to proboha chtêl vêdêt?

	self.flags = 0;//Joly:zur sicherheit

	Info_ClearChoices	(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice	(DIA_Haupttorwache_TOROEFFNEN, "Obávám se o bezpeènost hradu.", DIA_Haupttorwache_TOROEFFNEN_sicherheit );
	Info_AddChoice	(DIA_Haupttorwache_TOROEFFNEN, "To nic, jen jsem se tak ptal.", DIA_Haupttorwache_TOROEFFNEN_frage );
	
};
func void DIA_Haupttorwache_TOROEFFNEN_sicherheit ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00"); //Mám starost o bezpeènost hradu.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01"); //Já taky - v jednom kuse, vêâ mi.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02"); //A Garond mi jako vêrnému strážci koneènê svêâil klíè od brány.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03"); //(hrdê) To je obrovská zodpovêdnost. Budu jej hlídat jako oko v hlavê, musel jsem to Garondovi odpâísáhnout.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04"); //Ano. Jen si pâedstav, že nêkdo pâijde, zatáhne za páku, aby bránu otevâel, a ta stará rezavá ocelová mâíž se zasekne.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05"); //Nikdo by pak tu bránu už nemohl zavâít. Radši si ani nebudu domýšlet, co by se stalo potom. Proto je dobâe, že nikdo neví, že ten klíè mám u sebe zrovna já.
	AI_StopProcessInfos (self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_frage_15_00"); //To nic, jen jsem se tak ptal.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_frage_13_01"); //Ne abys to nêkde vyžvanil - jen by sis tím nadêlal problémy. Èasy jsou už takhle dost zlé. A teë bêž, mám spoustu práce.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Haupttorwache_PICKPOCKET (C_INFO)
{
	npc			= VLK_4143_HaupttorWache;
	nr			= 900;
	condition	= DIA_Haupttorwache_PICKPOCKET_Condition;
	information	= DIA_Haupttorwache_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Tento klíè by ukradlo i malé dítê.)";
};                       

FUNC INT DIA_Haupttorwache_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ITKE_OC_MAINGATE_MIS) >= 1)
	&& (Kapitel >= 5)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Haupttorwache_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Haupttorwache_PICKPOCKET);
	Info_AddChoice		(DIA_Haupttorwache_PICKPOCKET, DIALOG_BACK 		,DIA_Haupttorwache_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Haupttorwache_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Haupttorwache_PICKPOCKET_DoIt);
};

func void DIA_Haupttorwache_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ITKE_OC_MAINGATE_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Haupttorwache_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Haupttorwache_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Haupttorwache_PICKPOCKET);
};











