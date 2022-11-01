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

	description	 = 	"Che lavoro fai?";
};

func int DIA_Haupttorwache_AUFGABE_Condition ()
{
	return TRUE;
};

func void DIA_Haupttorwache_AUFGABE_Info ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_AUFGABE_15_00"); //Qual è il tuo compito?
	AI_Output			(self, other, "DIA_Haupttorwache_AUFGABE_13_01"); //Il mio compito è semplice. Devo assicurarmi che gli orchi stiano ad almeno dieci metri di distanza dal portone.
	AI_Output			(self, other, "DIA_Haupttorwache_AUFGABE_13_02"); //Se dovessero provare a sfondare, io suono l'allarme. Tutto qui.
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

	description	 = 	"Cosa si deve fare per aprire il cancello principale?";
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
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_15_00"); //Cosa si deve fare per aprire il cancello principale?
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_13_01"); //Santo cielo. E perché vorresti saperlo?

	self.flags = 0;//Joly:zur sicherheit

	Info_ClearChoices	(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice	(DIA_Haupttorwache_TOROEFFNEN, "Sono preoccupato per la sicurezza del castello.", DIA_Haupttorwache_TOROEFFNEN_sicherheit );
	Info_AddChoice	(DIA_Haupttorwache_TOROEFFNEN, "Lascia stare. Semplice curiosità.", DIA_Haupttorwache_TOROEFFNEN_frage );
	
};
func void DIA_Haupttorwache_TOROEFFNEN_sicherheit ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00"); //Sono preoccupato per la sicurezza del castello.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01"); //È così anche per me, credimi.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02"); //E siccome sono un guardiano ligio al dovere, Garond mi ha finalmente affidato la chiave della stanza del portone.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03"); //(orgogliosamente) È una grande responsabilità. Dovrò fare attenzione. Ho prestato giuramento a Garond.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04"); //Sì. Immagina se qualcuno venisse qui a tirare la leva per aprire il cancello, facendo incastrare la vecchia inferriata arrugginita.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05"); //Nessuno potrebbe chiudere e non oso nemmeno immaginare cosa succederebbe dopo. È un bene che nessuno sappia che io ho la chiave.
	AI_StopProcessInfos (self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_frage_15_00"); //Lascia stare. Semplice curiosità.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_frage_13_01"); //Non parlarne troppo, non cercare guai. I tempi sono già abbastanza duri così. Ora vai. Sono occupato.
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
	description = "(Sarebbe un gioco da ragazzi sottrargli la chiave)";
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











