///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Dobar_EXIT   (C_INFO)
{
	npc         = VLK_4106_Dobar;
	nr          = 999;
	condition   = DIA_Dobar_EXIT_Condition;
	information = DIA_Dobar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Dobar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dobar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4106_Dobar;
	nr		 	 = 	2;
	condition	 = 	DIA_Dobar_HALLO_Condition;
	information	 = 	DIA_Dobar_HALLO_Info;
	permanent 	 =  FALSE;
	important	 =  TRUE;
};
func int DIA_Dobar_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Dobar_HALLO_Info ()
{
	
	AI_Output (self, other, "DIA_Dobar_HALLO_08_00"); //(nevrle) Co chce�?
};
///////////////////////////////////////////////////////////////////////
//	Info Ich verstehe mich auf's schmieden.
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Talent		(C_INFO)
{
	npc		 	 = 	VLK_4106_Dobar;
	nr		 	 = 	3;
	condition	 = 	DIA_Dobar_Talent_Condition;
	information	 = 	DIA_Dobar_Talent_Info;
	permanent 	 =  FALSE;
	description	 =  "V�m p�r v�ci o kova�in�.";
};
func int DIA_Dobar_Talent_Condition ()
{	
	if (Npc_GetTalentSkill (other, NPC_TALENT_SMITH) > 0)  
	{
		return TRUE;
	};
};
func void DIA_Dobar_Talent_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Talent_15_00"); //V�m p�r v�ci o kova�in�.
	AI_Output (self, other, "DIA_Dobar_Talent_08_01"); //Fajn, a co m� b�t?
};
///////////////////////////////////////////////////////////////////////
//	Info Schmiede
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Schmiede		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	3;
	condition	 = 	DIA_Dobar_Schmiede_Condition;
	information	 = 	DIA_Dobar_Schmiede_Info;
	permanent 	 =  FALSE;
	description	 = 	"Mohu si u tebe v kov�rn� n�co vyrobit?";
};

func int DIA_Dobar_Schmiede_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Dobar_Talent)
	{	
		return TRUE;
	};
};
func void DIA_Dobar_Schmiede_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Schmiede_15_00"); //Mohu si u tebe v kov�rn� n�co vyrobit?
	AI_Output (self, other, "DIA_Dobar_Schmiede_08_01"); //Te� zrovna nev�m, kam d��v sko�it, jenom bychom si tu p�ek�eli. Po�kej, a� se setm�.
	AI_Output (self, other, "DIA_Dobar_Schmiede_08_02"); //Pak p�jdeme s Parlafem na kut� a ty bude� m�t voln� pole p�sobnosti.
};
///////////////////////////////////////////////////////////////////////
//	Info beibringen
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_beibringen		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	2;
	condition	 = 	DIA_Dobar_beibringen_Condition;
	information	 = 	DIA_Dobar_beibringen_Info;
	permanent 	 =  FALSE;
	description	 = 	"M��e� m� n��emu nau�it?";
};

func int DIA_Dobar_beibringen_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Dobar_Talent)
	{	
		return TRUE;
	};
};
func void DIA_Dobar_beibringen_Info ()
{
	AI_Output (other, self, "DIA_Dobar_beibringen_15_00"); //M��e� m� n��emu nau�it?
	AI_Output (self, other, "DIA_Dobar_beibringen_08_01"); //Z�klady u� m�. M��u ti teda uk�zat, jak svou pr�ci je�t� vylep�it.
	AI_Output (self, other, "DIA_Dobar_beibringen_08_02"); //Pak bude� moci vyr�b�t lep�� zbran�.
	
	Dobar_Learnsmith = TRUE;
	Log_CreateTopic	(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher_OC, "Dobar m� nau�� kout lep�� zbran�.");
};
///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Teach		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	3;
	condition	 = 	DIA_Dobar_Teach_Condition;
	information	 = 	DIA_Dobar_Teach_Info;
	description	 = 	B_BuildLearnString ("Uka� mi, jak vykovat dobr� me�!", B_GetLearnCostTalent (other, NPC_TALENT_SMITH, WEAPON_1H_Special_01));
	permanent	 =  TRUE;
};
func int DIA_Dobar_Teach_Condition ()
{	
	if (Dobar_Learnsmith == TRUE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Dobar_Teach_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Teach_15_00"); //Uka� mi, jak vykovat dobr� me�!
	
	if B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_01) 
	{	
		AI_Output (self, other, "DIA_Dobar_Teach_08_01"); //Pokud m� dan� zbra� za n�co st�t, mus� nejd��v pe�liv� a stejnom�rn� roz�havit ocel.
		AI_Output (self, other, "DIA_Dobar_Teach_08_02"); //Kdy� to bude� m�t na pam�ti, �epele, kter� vykov�, budou tvrd�� a ost�ej��.
		AI_Output (self, other, "DIA_Dobar_Teach_08_03"); //V�c u� v�d�t nepot�ebuje�. Jestli chce� tady na hrad� n�kde sehnat ocel, promluv si s Engorem.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Waffe		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	80;
	condition	 = 	DIA_Dobar_Waffe_Condition;
	information	 = 	DIA_Dobar_Waffe_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mohl bys mi vyrobit zbra�?";
};
func int DIA_Dobar_Waffe_Condition ()
{
	return TRUE;
};
func void DIA_Dobar_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Dobar_Waffe_15_00"); //Mohl bys mi vyrobit zbra�?
	AI_Output (self, other, "DIA_Dobar_Waffe_08_01"); //Na to nem�m �as. Zbran� rozd�luje Tandor - j� je pouze vyr�b�m a Parlaf je pak brous�.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor na hrad� obchoduje se zbran�mi.");
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_NEWS		(C_INFO)
{
	npc			 = 	VLK_4106_Dobar;
	nr			 = 	900;
	condition	 = 	DIA_Dobar_NEWS_Condition;
	information	 = 	DIA_Dobar_NEWS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak jde pr�ce?";
};
func int DIA_Dobar_NEWS_Condition ()
{
	return TRUE;
};
func void DIA_Dobar_NEWS_Info ()
{
	
	
	AI_Output (other, self, "DIA_Dobar_NEWS_15_00"); //Jak jde pr�ce?
	
	if (Dobar_einmalig == FALSE)
	{
		AI_Output (self, other, "DIA_Dobar_NEWS_08_01"); //Zrovna kov�m zbran� pro ryt��e na hrad�. Od t� doby, co jsme tady, se mus�m �init, co mi s�ly sta��.
		AI_Output (self, other, "DIA_Dobar_NEWS_08_02"); //A taky �e je to zapot�eb�. Uk�eme t�m zatracen�m sk�et�m, jak ostr� jsou na�e b�ity!

		if ((Npc_IsDead(Parlaf)) == FALSE)
		{
			B_TurnToNpc (self, Parlaf);
			AI_Output (self, other, "DIA_Dobar_NEWS_08_03"); //(vol�) Hej, Parlafe - a� jsou tyhle me�e p�kn� a ostr�! Sk�eti jsou sakra tuz� protivn�ci!
			B_TurnToNpc (self, other); 
		};
		Dobar_einmalig = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Dobar_NEWS_08_04"); //Mohlo by to b�t lep��. Kdybys m� furt neru�il, ur�it� bych u� m�l hotovo aspo� n�co.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dobar_PICKPOCKET (C_INFO)
{
	npc			= VLK_4106_Dobar;
	nr			= 900;
	condition	= DIA_Dobar_PICKPOCKET_Condition;
	information	= DIA_Dobar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kr�de� jeho hrudky rudy by byla dosti riskantn�.)";
};                       

FUNC INT DIA_Dobar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItMI_Nugget) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (79 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Dobar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dobar_PICKPOCKET);
	Info_AddChoice		(DIA_Dobar_PICKPOCKET, DIALOG_BACK 		,DIA_Dobar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dobar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dobar_PICKPOCKET_DoIt);
};

func void DIA_Dobar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 79)
	{
		B_GiveInvItems (self, other, ItMI_Nugget, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Dobar_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Dobar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dobar_PICKPOCKET);
};
















