///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bromor_EXIT   (C_INFO)
{
	npc         = VLK_433_Bromor;
	nr          = 999;
	condition   = DIA_Bromor_EXIT_Condition;
	information = DIA_Bromor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bromor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bromor_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GIRLS
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_GIRLS		(C_INFO)
{
	npc			 = 	VLK_433_Bromor;
	nr			 = 	2;
	condition	 = 	DIA_Bromor_GIRLS_Condition;
	information	 = 	DIA_Bromor_GIRLS_Info;
	permanent	 = 	FALSE;
	description	 = 	"To tw�j interes?";
};

func int DIA_Bromor_GIRLS_Condition ()
{	
	if (NpcObsessedByDMT_Bromor == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Bromor_GIRLS_Info ()
{
	//ADDON>
	AI_Output (other, self, "DIA_Addon_Bromor_GIRLS_15_00"); //To tw�j interes?
	//ADDON<

	//AI_Output (other, self, "DIA_Bromor_GIRLS_15_00"); //Chc� si� zabawi�.
	//AI_Output (self, other, "DIA_Bromor_GIRLS_07_01"); //Deshalb bist du ja hergekommen.

	AI_Output (self, other, "DIA_Bromor_GIRLS_07_02"); //Jestem Bromor. To m�j przybytek, a to moje dziewczyny. Lubi� je.
	AI_Output (self, other, "DIA_Bromor_GIRLS_07_03"); //A je�li ty te� je lubisz, to za nie zap�acisz - 50 sztuk z�ota.
	AI_Output (self, other, "DIA_Bromor_GIRLS_07_04"); //I lepiej nie my�l o wszczynaniu tutaj burd.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bromor_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Bromor_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bromor_MissingPeople_Info;

	description	 = 	"Wszystkie dziewczyny w porz�dku?";
};

func int DIA_Addon_Bromor_MissingPeople_Condition ()
{
	if (NpcObsessedByDMT_Bromor == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Bromor_GIRLS))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bromor_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bromor_MissingPeople_15_00"); //Wszystkie dziewczyny w porz�dku?
	AI_Output	(self, other, "DIA_Addon_Bromor_MissingPeople_07_01"); //Oczywi�cie! S�dzisz, �e chcia�bym p�j�� do wi�zienia z powodu czego� takiego?
	AI_Output	(other, self, "DIA_Addon_Bromor_MissingPeople_15_02"); //Nie chodzi mi o ich wiek. �adna nie zagin�a?
	AI_Output	(self, other, "DIA_Addon_Bromor_MissingPeople_07_03"); //A, rozumiem. Owszem, jednej brakuje - ma na imi� Lucia.
	AI_Output	(self, other, "DIA_Addon_Bromor_MissingPeople_07_04"); //Powiadomi�em o tym stra�, ale nie zdo�ali trafi� na jej trop.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Zagin�a jedna z dziewcz�t z portowego burdelu, Lucia."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Lucia
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bromor_Lucia		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bromor_Lucia_Condition;
	information	 = 	DIA_Addon_Bromor_Lucia_Info;

	description	 = 	"Jak d�ugo jej nie ma?";
};

func int DIA_Addon_Bromor_Lucia_Condition ()
{
	if (NpcObsessedByDMT_Bromor == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Bromor_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bromor_Lucia_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bromor_Lucia_15_00"); //Jak d�ugo jej nie ma?
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_01"); //Pewnie kilka dni. Nie pami�tam dok�adnie.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_02"); //Musia�a uciec z jednym z klient�w.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_03"); //Nie m�wi�c ju� o tym, �e ukrad�a moj� cenn� mis� ze z�ota.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_04"); //Jak tylko j� dorw�... Na d�ugo mnie zapami�ta.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_05"); //Co ci� to obchodzi? Chcesz si� zabawi� czy nie?

	Log_CreateTopic (TOPIC_Addon_BromorsGold, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BromorsGold,"Weso�a panienka Lucia ukrad�a z�ot� mis� swojemu szefowi, Bromorowi. Bromor chce odzyska� swoj� w�asno��."); 

	MIS_Bromor_LuciaStoleGold = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info LuciaGold
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bromor_LuciaGold		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bromor_LuciaGold_Condition;
	information	 = 	DIA_Addon_Bromor_LuciaGold_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mam mis�, kt�r� ukrad�a ci Lucia.";
};

func int DIA_Addon_Bromor_LuciaGold_Condition ()
{
	if (NpcObsessedByDMT_Bromor == FALSE)
	&& (MIS_Bromor_LuciaStoleGold == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_BromorsGeld_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bromor_LuciaGold_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bromor_LuciaGold_15_00"); //Mam mis�, kt�r� ukrad�a ci Lucia.
	AI_Output	(self, other, "DIA_Addon_Bromor_LuciaGold_07_01"); //No, czas najwy�szy.
	
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
	if (Bromor_Hausverbot == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "A mo�e jaka� nagroda?", DIA_Addon_Bromor_LuciaGold_lohn );
	};
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Oto misa.", DIA_Addon_Bromor_LuciaGold_einfachgeben );
	if (DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Nie chcesz wiedzie�, co si� sta�o z Luci�?", DIA_Addon_Bromor_LuciaGold_lucia );
	};
};
func void DIA_Addon_Bromor_LuciaGold_einfachgeben ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00"); //Oto misa.
	B_GiveInvItems (other, self, ItMi_BromorsGeld_Addon,1);
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01"); //Dzi�ki - robisz dobr� rzecz. Chcesz czego� jeszcze?
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP (XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
};
var int DIA_Addon_Bromor_LuciaGold_lucia_OneTime;
func void DIA_Addon_Bromor_LuciaGold_lucia ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_lucia_15_00"); //Nie chcesz wiedzie�, co si� sta�o z Luci�?
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_lucia_07_01"); //Nie. Niby czemu? Misa w ko�cu do mnie wr�ci�a.
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_lucia_07_02"); //A interes dzia�a�, dzia�a i b�dzie dzia�a�, i bez niej. Przecie� nie mog� jej zmusza� do pracy dla mnie...
	DIA_Addon_Bromor_LuciaGold_lucia_OneTime = TRUE;
};
func void DIA_Addon_Bromor_LuciaGold_lohn ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_lohn_15_00"); //A mo�e jaka� nagroda?
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_lohn_07_01"); //Mo�esz za darmo zabawi� si� z jedn� z moich dziewcz�t. Pasuje?

	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
	if (DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Nie chcesz wiedzie�, co si� sta�o z Luci�?", DIA_Addon_Bromor_LuciaGold_lucia );
	};	
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Nie bardzo.", DIA_Addon_Bromor_LuciaGold_mehr );
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Umowa stoi - oto twoja misa.", DIA_Addon_Bromor_LuciaGold_geben );
};
func void DIA_Addon_Bromor_LuciaGold_mehr ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_mehr_15_00"); //Nie bardzo.
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_mehr_07_01"); //To mo�esz r�wnie dobrze si� odwali�.
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Niewa�ne.", DIA_Addon_Bromor_LuciaGold_nein );
};
func void DIA_Addon_Bromor_LuciaGold_nein ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_nein_15_00"); //Niewa�ne.
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_nein_07_01"); //Won st�d, bandziorze!
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_nein_07_02"); //Nie licz na to, �e kto� ci� tu kiedy� jeszcze obs�u�y.
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
	Bromor_Hausverbot = TRUE;
	Bromor_Pay = 0;
};
func void DIA_Addon_Bromor_LuciaGold_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_geben_15_00"); //Umowa stoi - oto twoja misa.
	B_GiveInvItems (other, self, ItMi_BromorsGeld_Addon,1);
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_geben_07_01"); //Dzi�kuj�. Id� do Nadji - ona uda si� z tob� na pi�terko.
	Bromor_Pay = 1; 
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP (XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
};

///////////////////////////////////////////////////////////////////////
//	Info bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_Pay		(C_INFO)
{
	npc			 = 	VLK_433_Bromor;
	nr			 = 	2;
	condition	 = 	DIA_Bromor_Pay_Condition;
	information	 = 	DIA_Bromor_Pay_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chc� si� troszk� zabawi� (zap�a� 50 sztuk z�ota).";
};

func int DIA_Bromor_Pay_Condition ()
{	
	if (Bromor_Pay == FALSE)
	&& (Bromor_Hausverbot == FALSE)//ADDON
	&& Npc_KnowsInfo (other,DIA_Bromor_GIRLS)
	&& (NpcObsessedByDMT_Bromor == FALSE)
	&& (Npc_IsDead (Nadja) == FALSE)
	{	
		return TRUE;
	};
};

var int DIA_Bromor_Pay_OneTime;
func void DIA_Bromor_Pay_Info ()
{
	AI_Output (other, self, "DIA_Bromor_Pay_15_00"); //Chc� si� zabawi�.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other, "DIA_Bromor_Pay_07_01"); //Dobra. Najbli�szych kilku godzin d�ugo nie zapomnisz.
		AI_Output (self, other, "DIA_Bromor_Pay_07_02"); //Zatem id� na g�r� z Nadj�.
	
		if (DIA_Bromor_Pay_OneTime == FALSE)
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};
	
		Bromor_Pay = 1; 
	}
	else
	{
		AI_Output (self, other, "DIA_Bromor_Pay_07_03"); //Nie znosz�, kiedy ludzie pr�buj� ze mnie �artowa�. Skoro nie mo�esz zap�aci�, to wyno� si� st�d.
	};
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_DOPE		(C_INFO)
{
	npc			 = 	VLK_433_Bromor;
	nr			 = 	3;
	condition	 = 	DIA_Bromor_DOPE_Condition;
	information	 = 	DIA_Bromor_DOPE_Info;
	permanent	 =  FALSE;
	description	 = 	"Czy mog� tutaj dosta� tak�e 'wyj�tkowe' towary?";
};

func int DIA_Bromor_DOPE_Condition ()
{	
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (NpcObsessedByDMT_Bromor == FALSE)
	&& (Bromor_Hausverbot == FALSE)//ADDON
	{
		return TRUE;
	};
};
func void DIA_Bromor_DOPE_Info ()
{
	AI_Output (other, self, "DIA_Bromor_DOPE_15_00"); //Czy mog� tutaj dosta� tak�e 'wyj�tkowe' towary?
	AI_Output (self, other, "DIA_Bromor_DOPE_07_01"); //Pewnie, wszystkie moje dziewczyny s� wyj�tkowe.
	AI_Output (self, other, "DIA_Bromor_DOPE_07_02"); //Je�eli masz do�� z�ota, mo�esz i�� na g�r� z Nadj�.
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_Obsession		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	30;
	condition	 = 	DIA_Bromor_Obsession_Condition;
	information	 = 	DIA_Bromor_Obsession_Info;

	description	 = 	"Wszystko w porz�dku?";
};

func int DIA_Bromor_Obsession_Condition ()
{
	if (Kapitel >= 3)
	&& (NpcObsessedByDMT_Bromor == FALSE)
	&& (hero.guild == GIL_KDF)
		{
				return TRUE;
		};
};

var int DIA_Bromor_Obsession_GotMoney;

func void DIA_Bromor_Obsession_Info ()
{
	B_NpcObsessedByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_Heilung		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	55;
	condition	 = 	DIA_Bromor_Heilung_Condition;
	information	 = 	DIA_Bromor_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jeste� op�tany.";
};

func int DIA_Bromor_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Bromor == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Bromor_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Bromor_Heilung_15_00"); //Jeste� op�tany.
	AI_Output			(self, other, "DIA_Bromor_Heilung_07_01"); //Co? O czym ty gadasz? Wynocha.
	B_NpcClearObsessionByDMT (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bromor_PICKPOCKET (C_INFO)
{
	npc			= VLK_433_Bromor;
	nr			= 900;
	condition	= DIA_Bromor_PICKPOCKET_Condition;
	information	= DIA_Bromor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tego klucza b�dzie ryzykownym zadaniem)";
};                       

FUNC INT DIA_Bromor_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKE_Bromor) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Bromor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bromor_PICKPOCKET);
	Info_AddChoice		(DIA_Bromor_PICKPOCKET, DIALOG_BACK 		,DIA_Bromor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bromor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bromor_PICKPOCKET_DoIt);
};

func void DIA_Bromor_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems (self, other, ItKE_Bromor, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices (DIA_Bromor_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel (); 
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Bromor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bromor_PICKPOCKET);
};







