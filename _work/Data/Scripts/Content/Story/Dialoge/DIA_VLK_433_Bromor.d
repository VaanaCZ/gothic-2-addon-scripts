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
	description	 = 	"Ty to tady vede�?";
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
	AI_Output (other, self, "DIA_Addon_Bromor_GIRLS_15_00"); //Ty pat�� k t�m, co to tady vedou?
	//ADDON<

	//AI_Output (other, self, "DIA_Bromor_GIRLS_15_00"); //Chci se trochu pobavit.
	//AI_Output (self, other, "DIA_Bromor_GIRLS_07_01"); //Deshalb bist du ja hergekommen.

	AI_Output (self, other, "DIA_Bromor_GIRLS_07_02"); //Jsem Bromor. Tohle je m�j d�m a tohle jsou moje holky. M�m je r�d.
	AI_Output (self, other, "DIA_Bromor_GIRLS_07_03"); //A jestli se l�b� i tob�, pak za to mus� zaplatit - 50 zla��k�.
	AI_Output (self, other, "DIA_Bromor_GIRLS_07_04"); //A a� t� ani nenapadne d�lat tu n�jak� bordel.
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

	description	 = 	"V tom jsou zahrnut� i v�echny tvoje holky?";
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
	AI_Output	(other, self, "DIA_Addon_Bromor_MissingPeople_15_00"); //A jsou tu i v�ecky tv� holky?
	AI_Output	(self, other, "DIA_Addon_Bromor_MissingPeople_07_01"); //Samoz�ejm�. Nebo si mysl�, �e se nech�m zav��t za to, �e jim neplat�m?
	AI_Output	(other, self, "DIA_Addon_Bromor_MissingPeople_15_02"); //(na�tvan�) No, j� nemyslel tvou v�platn� listinu. Mysl�m t�m, jestli tu v�echny JSOU. Nechyb� ti n�kter�?
	AI_Output	(self, other, "DIA_Addon_Bromor_MissingPeople_07_03"); //No, vlastn� ano. Jedna z m�ch holek se odsud vypa�ila. Jmenovala se Lucia.
	AI_Output	(self, other, "DIA_Addon_Bromor_MissingPeople_07_04"); //Nahl�sil jsem to domobran�, ale tvrdili, �e po n� zat�m nena�li ani stopu.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Z nev�stince dole v p��stavu zmizela prostitutka jm�nem Lucia."); 
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

	description	 = 	"Jak dlouho u� Lucii poh�e�ujete?";
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
	AI_Output	(other, self, "DIA_Addon_Bromor_Lucia_15_00"); //Jak dlouho u� Lucii poh�e�ujete?
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_01"); //P�r dn�. Vlastn� ani nev�m, jak dlouho.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_02"); //Po��t�m, �e utekla s n�kter�m ze svejch ctitel�.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_03"); //Ta mrcha mi �majzla i ��st mejch �spor. Fakt cennou zlatou m�su.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_04"); //Jestli ji dostanu do pazour�, uk�u j�, za� je toho loket.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_05"); //A jak jdou k�efty TOB�? D�l� si ze m� �oufky, nebo co?

	Log_CreateTopic (TOPIC_Addon_BromorsGold, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BromorsGold,"Prostitutka Lucia ukradla sv�mu ��fovi Bromorovi zlatou m�su. Bromor ji chce zp�tky."); 

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

	description	 = 	"Na�el jsem tu m�su, co ti Lucia ukradla.";
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
	AI_Output	(other, self, "DIA_Addon_Bromor_LuciaGold_15_00"); //Na�el jsem tu zlatou m�su, co ti Lucia ukradla.
	AI_Output	(self, other, "DIA_Addon_Bromor_LuciaGold_07_01"); //V�born�! Nejvy��� �as, abych ji dostal zp�tky.
	
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
	if (Bromor_Hausverbot == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "A co takhle n�jakou odm�nu?", DIA_Addon_Bromor_LuciaGold_lohn );
	};
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Tady m� tu svou m�su.", DIA_Addon_Bromor_LuciaGold_einfachgeben );
	if (DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "To se ani nezept�, co se stalo s Luci�?", DIA_Addon_Bromor_LuciaGold_lucia );
	};
};
func void DIA_Addon_Bromor_LuciaGold_einfachgeben ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00"); //Tady m� tu svou m�su.
	B_GiveInvItems (other, self, ItMi_BromorsGeld_Addon,1);
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01"); //D�ky, to je od tebe velice �t�dr�. Je�t� n�co?
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP (XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
};
var int DIA_Addon_Bromor_LuciaGold_lucia_OneTime;
func void DIA_Addon_Bromor_LuciaGold_lucia ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_lucia_15_00"); //To ani nechce� v�d�t, co se s Luci� stalo?
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_lucia_07_01"); //Ne, pro�? Svou m�su jsem dostal zp�tky, ne?
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_lucia_07_02"); //Zat�m jsem se bez Lucie obe�el a obejdu se bez n� i d�l. Pro� bych se teda m�l starat o to, aby se vr�tila?
	DIA_Addon_Bromor_LuciaGold_lucia_OneTime = TRUE;
};
func void DIA_Addon_Bromor_LuciaGold_lohn ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_lohn_15_00"); //A co takhle n�jakou odm�nu?
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_lohn_07_01"); //M��e� se pobavit s n�kterou z m�ch holek - zadarmo. Co ty na to?

	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
	if (DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "To se ani nezept�, co se stalo s Luci�?", DIA_Addon_Bromor_LuciaGold_lucia );
	};	
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "To nesta��.", DIA_Addon_Bromor_LuciaGold_mehr );
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "No dob�e. Tady m� tu svou m�su.", DIA_Addon_Bromor_LuciaGold_geben );
};
func void DIA_Addon_Bromor_LuciaGold_mehr ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_mehr_15_00"); //To nesta��.
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_mehr_07_01"); //Ber, anebo u� se tu v�ckr�t neukazuj.
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Zapome� na to.", DIA_Addon_Bromor_LuciaGold_nein );
};
func void DIA_Addon_Bromor_LuciaGold_nein ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_nein_15_00"); //Zapome� na to.
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_nein_07_01"); //Pak odsud okam�it� vypadni, ty hajzle.
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_nein_07_02"); //A a� t� ani nenapadne d�lat tu n�jak� bordel.
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
	Bromor_Hausverbot = TRUE;
	Bromor_Pay = 0;
};
func void DIA_Addon_Bromor_LuciaGold_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_geben_15_00"); //Dobr�, tady m� tu m�su.
	B_GiveInvItems (other, self, ItMi_BromorsGeld_Addon,1);
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_geben_07_01"); //D�ky. B� za Nadjou, doprovod� t� nahoru.
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
	description	 = 	"Chci se trochu pobavit (zaplatit 50 zla��k�).";
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
	AI_Output (other, self, "DIA_Bromor_Pay_15_00"); //Chci se trochu pobavit.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other, "DIA_Bromor_Pay_07_01"); //Fajn (za�kleb� se). Na n�sleduj�c�ch p�r hodin nejsp� nikdy v �ivot� nezapomene�.
		AI_Output (self, other, "DIA_Bromor_Pay_07_02"); //Vyjdi s Nadjou po schodech nahoru a u�ij si to!
	
		if (DIA_Bromor_Pay_OneTime == FALSE)
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};
	
		Bromor_Pay = 1; 
	}
	else
	{
		AI_Output (self, other, "DIA_Bromor_Pay_07_03"); //Nesn��m, kdy� si ze m� n�kdo d�l� dobr� den. Jestli nem� na zaplacen�, tak odsud vymajzni.
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
	description	 = 	"M��u tu dostat i n�jak� 'zvl�tn�' zbo��?";
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
	AI_Output (other, self, "DIA_Bromor_DOPE_15_00"); //M��u tu dostat i n�jak� "zvl�tn�" zbo��?
	AI_Output (self, other, "DIA_Bromor_DOPE_07_01"); //Jasn�, v�echny holky jsou zvl�tn� (za�kleb� se).
	AI_Output (self, other, "DIA_Bromor_DOPE_07_02"); //Jestli m� dost zlata, m��e� j�t s Nadjou nahoru.
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

	description	 = 	"Jsi v po��dku?";
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

	description	 = 	"Ty jsi posedl�!";
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
	AI_Output			(other, self, "DIA_Bromor_Heilung_15_00"); //Ty jsi posedl�.
	AI_Output			(self, other, "DIA_Bromor_Heilung_07_01"); //Co�e? O �em to mluv�? Vypadni odsud!
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
	description = "(Kr�de� tohoto kl��e by byla riskantn�)";
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







