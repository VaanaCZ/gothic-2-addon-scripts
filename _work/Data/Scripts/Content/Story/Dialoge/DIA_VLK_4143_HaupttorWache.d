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

	description	 = 	"Quel est votre travail ?";
};

func int DIA_Haupttorwache_AUFGABE_Condition ()
{
	return TRUE;
};

func void DIA_Haupttorwache_AUFGABE_Info ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_AUFGABE_15_00"); //Quel est votre rôle ?
	AI_Output			(self, other, "DIA_Haupttorwache_AUFGABE_13_01"); //Ma mission est simple. Je suis censé m'assurer que les orques n'approchent pas à moins de dix mètres de la porte.
	AI_Output			(self, other, "DIA_Haupttorwache_AUFGABE_13_02"); //S'ils essayent d'enfoncer la herse, je dois sonner l'alerte, c'est tout.
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

	description	 = 	"Que faudrait-il faire pour ouvrir la porte principale ?";
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
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_15_00"); //Que faut-il faire pour ouvrir la porte principale ?
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_13_01"); //Au nom du ciel, pourquoi voulez-vous le savoir ?

	self.flags = 0;//Joly:zur sicherheit

	Info_ClearChoices	(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice	(DIA_Haupttorwache_TOROEFFNEN, "Je m'inquiète au sujet de la sécurité du château.", DIA_Haupttorwache_TOROEFFNEN_sicherheit );
	Info_AddChoice	(DIA_Haupttorwache_TOROEFFNEN, "Laissez tomber. Simple curiosité.", DIA_Haupttorwache_TOROEFFNEN_frage );
	
};
func void DIA_Haupttorwache_TOROEFFNEN_sicherheit ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00"); //Je me fais du souci au sujet de la sécurité du château.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01"); //Moi aussi, vous pouvez me croire.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02"); //Mais Garond sait bien que je suis un garde d'une fidélité absolue. C'est pour cela qu'il m'a confié la clé de la porte.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03"); //(fièrement) C'est une grande responsabilité, mais j'en suis digne. Je garderai cette clé jusqu'à mon dernier souffle. D'ailleurs, j'ai dû le jurer à Garond.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04"); //Vous vous rendez compte, si quelqu'un tirait le levier pour ouvrir la vieille herse rouillée et si cette dernière se bloquait en position haute ?
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05"); //Il deviendrait alors impossible de refermer la porte et je n'ose imaginer ce qui se passerait ensuite. Heureusement, personne ne sait que c'est moi qui ai la clé !
	AI_StopProcessInfos (self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_frage_15_00"); //Simple curiosité de ma part.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_frage_13_01"); //Ne parlez pas comme ça, ça pourrait nous porter la poisse, et nous n'en avons vraiment pas besoin en ce moment.. Et maintenant, partez, j'ai à faire.
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
	description = "(Ce serait un jeu d'enfant de lui voler sa clef)";
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











