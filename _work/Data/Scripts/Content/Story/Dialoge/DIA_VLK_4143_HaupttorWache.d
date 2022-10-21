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

	description	 = 	"Was ist deine Aufgabe?";
};

func int DIA_Haupttorwache_AUFGABE_Condition ()
{
	return TRUE;
};

func void DIA_Haupttorwache_AUFGABE_Info ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_AUFGABE_15_00"); //Was ist deine Aufgabe?
	AI_Output			(self, other, "DIA_Haupttorwache_AUFGABE_13_01"); //Mein Auftrag ist simpel. Ich muss darauf achten, dass sich die Orks nicht näher als 30 Schritt ans Tor heran machen.
	AI_Output			(self, other, "DIA_Haupttorwache_AUFGABE_13_02"); //Wenn sie versuchen sollten, das Torgitter zu durchbrechen, werde ich Alarm schlagen. Das ist alles.
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

	description	 = 	"Was müsste jemand tun, wenn er das Haupttor öffnen wollte?";
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
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_15_00"); //Was müsste jemand tun, wenn er das Haupttor öffnen wollte?
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_13_01"); //Um Himmels Willen. Warum willst du das wissen?

	self.flags = 0;//Joly:zur sicherheit

	Info_ClearChoices	(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice	(DIA_Haupttorwache_TOROEFFNEN, "Ich mache mir Sorgen über die Sicherheit der Burg.", DIA_Haupttorwache_TOROEFFNEN_sicherheit );
	Info_AddChoice	(DIA_Haupttorwache_TOROEFFNEN, "Schon gut. War nur so ´ne Frage.", DIA_Haupttorwache_TOROEFFNEN_frage );
	
};
func void DIA_Haupttorwache_TOROEFFNEN_sicherheit ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00"); //Ich mache mir Sorgen über die Sicherheit der Burg.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01"); //Das mache ich mir auch jeden Tag, das kannst du mir glauben.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02"); //Und weil ich ein so gewissenhafter Wachmann bin, hat mir Garond jetzt endlich auch den Schlüssel zum Torraum anvertraut.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03"); //(stolz) Eine verantwortungsvolle Aufgabe. Ich werde gut darauf aufpassen. Das habe ich Garond schwören müssen.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04"); //Ja. Denn stell dir mal vor, da würde einer kommen und einfach den Hebel des Tores ziehen und das alte morsche Stahlgatter würde sich verkanten.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05"); //Dann könnte niemand mehr das Gitter schließen. Nicht auszudenken, was dann passieren würde. Zum Glück weiß das ja keiner, dass ich den Schlüssel habe.
	AI_StopProcessInfos (self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage ()
{
	AI_Output			(other, self, "DIA_Haupttorwache_TOROEFFNEN_frage_15_00"); //Schon gut. War nur so 'ne Frage.
	AI_Output			(self, other, "DIA_Haupttorwache_TOROEFFNEN_frage_13_01"); //Mal den Teufel nicht an die Wand. Die Zeiten sind SO schon schwer genug. Jetzt geh. Ich habe zu tun.
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
	description = "(Es wäre ein Kinderspiel seinen Schlüssel zu stehlen)";
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











