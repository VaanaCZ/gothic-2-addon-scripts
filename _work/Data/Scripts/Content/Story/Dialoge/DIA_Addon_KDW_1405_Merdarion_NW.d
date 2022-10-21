///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_EXIT   (C_INFO)
{
	npc         = KDW_1405_Addon_Merdarion_NW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1405_Addon_Merdarion_NW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re schwierig seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Hallo		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Hallo_Condition;
	information	 = 	DIA_Addon_Merdarion_Hallo_Info;

	description	 = 	"M� pr�ci?";
};

func int DIA_Addon_Merdarion_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Hallo_15_00"); //M� pr�ci?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //Tyhle hrobky jsou pro m� velkou z�hadou. Jen t�ko si dok�u p�edstavit, �e je dosud nikdo nena�el.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //Vchod jsme objevili bez probl�m�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //Lid� m�li v�dycky tolik pr�ce se starostmi v�edn�ch dn�, �e se na tuhle budovu nikdo nikdy bl�e nepod�val.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //M�m pro to jin� vysv�tlen�.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Aufgabe		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Aufgabe_Condition;
	information	 = 	DIA_Addon_Merdarion_Aufgabe_Info;

	description	 = 	"Co tady m� za �kol?";
};

func int DIA_Addon_Merdarion_Aufgabe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Aufgabe_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Aufgabe_15_00"); //A jak� je tv�j �kol?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //Sna��m se zjistit, kam vede tenhle kulat� port�l.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //A krom toho pom�h�m Nefariovi naj�t chyb�j�c� ornament.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //Je jist�, �e tento port�l vede do ��sti ostrova, o kter� jsme dosud nem�li ani tu�en�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //(uv�liv�) V�bec si nepamatuju, �e bych o n��em takov�m kdy sly�el nebo �etl.
	
	Npc_ExchangeRoutine (self, "START");
	B_StartOtherRoutine (Cronos_NW, "START");
	
	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry (TOPIC_Addon_KDW,"Nefarius hled� n�jak� ztracen� ornament."); 
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info DaDurch
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_DaDurch		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_DaDurch_Condition;
	information	 = 	DIA_Addon_Merdarion_DaDurch_Info;

	description	 = 	"To chce� opravdu proj�t t�m port�lem?";
};

func int DIA_Addon_Merdarion_DaDurch_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_DaDurch_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //V�n� chcete proj�t port�lem?
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //Samoz�ejm�. Pokud tedy najdeme ten ztracen� ornament.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //Ale p�izn�m se, �e je to cel� trochu riskantn�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //Ale rozhodn� mus�me zjistit, co p�sob� ta neust�l� zem�t�esen�.
};
///////////////////////////////////////////////////////////////////////
//	Info Bedrohung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Bedrohung		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Bedrohung_Condition;
	information	 = 	DIA_Addon_Merdarion_Bedrohung_Info;

	description	 = 	"Co v� o t�ch zem�t�esen�ch?";
};

func int DIA_Addon_Merdarion_Bedrohung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_DaDurch))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Bedrohung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //Co v� o t�ch zem�t�esen�ch?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //Ty zp�sobuje n�co na druh� stran�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //A ten sam� zdroj nejsp� probouz� i ty kamenn� str�ce.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //Ale to nen� moje pr�ce � o tom ti v�c pov� Saturas a Cronos.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasdahinter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Wasdahinter2		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information	 = 	DIA_Addon_Merdarion_Wasdahinter2_Info;

	description	 = 	"Co si mysl�, �e tam najde�?";
};

func int DIA_Addon_Merdarion_Wasdahinter2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //Co si mysl�, �e tu najdete?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //To opravdu nev�m.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //Na druhou stranu ale po��t�m, �e tam budou podobn� budovy jako tahle. A prot�j�ek k tomuto port�lu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //V�echno ostatn� zjist�me, a� se tam dostaneme.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_PERM		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Merdarion_PERM_Condition;
	information	 = 	DIA_Addon_Merdarion_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"M��e� m� nau�it n�jak� magii?";
};

func int DIA_Addon_Merdarion_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //M��e� m� nau�it n�jakou magii?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //A� tu skon��me, budu ti k dispozici.
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Teleportstein		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Teleportstein_Condition;
	information	 = 	DIA_Addon_Merdarion_Teleportstein_Info;

	description	 = 	"Jak se nejrychleji dostanu do m�sta?";
};

func int DIA_Addon_Merdarion_Teleportstein_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
	&& (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //Jak se nejrychleji dostanu do m�sta?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //Doporu�uju j�t stejnou cestou, jakou jsi p�i�el.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //(rozm��l�) Ale taky bys mohl... Ne, to by bylo moc nebezpe�n�.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //Ven s t�m.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //No, stavitel� t�chto s�n� m�li vlastn� metodu cestov�n�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //Pokud v�me, tak se dok�zali teleportovat.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //To nen� nic v�jime�n�ho.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //Teleporta�n� kameny, kter� jsme na�li v Khorinidu, jsou opravdu zvl�tn�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //Zdej�� teleporta�n� k�men by m�l v�st do p��stavn�ho m�sta.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //Ale nikdo z n�s nem� odvahu to vyzkou�et na vlastn� k��i.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "A co kdybych to vyzkou�el?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Kde je ten teleporta�n� k�men?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //Kde je ten teleporta�n� k�men?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //V m�stnosti s n�dr�kou jsou dve�e. K�men je zam�en� za nimi.
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Dej mi kl��, chci se na to pod�vat.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //A co kdy� bych ho cht�l pou��t?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //Ani n�pad. V�me o n�m p��li� m�lo a je mo�n�, �e bys to nep�e�il.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //Dej mi kl��, cht�l bych se na ten k�men pod�vat.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //(nejist�) Opravdu? Ale j� za to nenesu ��dnou zodpov�dnost.
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //Dej mi ho.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //Kdy� to ��k� � tady je.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Merdarion mi dal kl�� k zam�en�m dve��m v hrobce u port�lu. Za nimi jsem na�el teleporta�n� k�men, kter� mne p�enese zp�tky do p��stavu."); 

	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
};

///////////////////////////////////////////////////////////////////////
//	Info WHereOtherTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_WHereOtherTeleports		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Info;

	description	 = 	"Kde jsou dal�� teleporta�n� kameny?";
};

func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //Kde jsou ostatn� teleporta�n� kameny?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //Jeden jsme zat�m na�li kdesi uprost�ed Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //U hospody U Mrtv� harpyje.
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Dal�� teleporta�n� k�men by m�l b�t n�kde u hospody U Mrtv� harpyje."); 
};

///////////////////////////////////////////////////////////////////////
//	Info TeleportsteinSuccess
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_TeleportsteinSuccess		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Info;

	description	 = 	"Teleporta�n� k�men u� hezky funguje.";
};

func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
	&& (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info ()
{
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //Teleporta�n� kameny funguj� bez probl�m�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //Tys to opravdu ud�lal? Pou�il jsi je?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //Ano, a zjevn� jsou st�le funk�n�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //(fascinovan�) To je neuv��iteln�. Budu to pak muset bl�e prozkoumat.
};


