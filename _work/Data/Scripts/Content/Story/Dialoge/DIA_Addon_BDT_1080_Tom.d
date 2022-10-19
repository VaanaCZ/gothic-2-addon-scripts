//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_EXIT   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 999;
	condition   = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tom_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Tom_PICKPOCKET (C_INFO)
{
	npc			= BDT_1080_Addon_Tom;
	nr			= 900;
	condition	= DIA_Addon_Tom_PICKPOCKET_Condition;
	information	= DIA_Addon_Tom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Tom_PICKPOCKET_Condition()
{
	C_Beklauen (40, 52);
};
 
FUNC VOID DIA_Addon_Tom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
	
func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_HI   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 1;
	condition   = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent   = FALSE;
	description = "Dlaczego tu siedzisz?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //Dlaczego tu siedzisz?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //Mam trochê k³opotów. Powrót do obozu nie by³by teraz najlepszym wyjœciem.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //Co siê sta³o?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //Mia³em ca³kiem niez³e kontakty z piratami, wiesz?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Zawsze spotykaliœmy siê nieopodal obozu, ¿eby pohandlowaæ.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //Ch³opie, kupowa³em graty dla po³owy ludzi z obozu. "Tom, za³atw mi to, Tom za³atw mi tamto".
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //A ten bydlak Esteban wszystko zrujnowa³!
};
//---------------------------------------------------------------------
//	Info Juan
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Juan   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 2;
	condition   = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent   = FALSE;
	description = "W jaki sposób?";
};
FUNC INT DIA_Addon_Tom_Juan_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Juan_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Juan_15_00"); //W jaki sposób?
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban wys³a³ jednego ze swoich ludzi, Juana. Koleœ obserwowa³ nas.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //A póŸniej, jak omawia³em interes z piratami, wyszed³ z ciemnoœci i ich pobi³.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //Ch³opie, ale ten goœæ by³ szybki! Na szczêœcie zdo³a³em uciec.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"A wiêc to Juan jest odpowiedzialny za zabójstwo Hanka i Angusa. Urz¹dzi³ na nich zasadzkê, a nastêpnie zamordowa³.");
};

//---------------------------------------------------------------------
//	Info Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Esteban   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 3;
	condition   = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent   = FALSE;
	description = "I od tamtej pory siê tu ukrywasz?";
};
FUNC INT DIA_Addon_Tom_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_Juan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Esteban_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //I od tamtej pory siê tu ukrywasz?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Najpierw wróci³em do obozu i powiedzia³em Fiskowi, Huno i innym ch³opakom, ¿eby nie spodziewali siê dostawy.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //I ¿e mog¹ za to podziêkowaæ Estebanowi.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Jeœli Esteban dowie siê, kto doniós³ ch³opakom, ¿e to on za tym stoi, bêdê martwy.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_04"); //Dlatego nie wracam do obozu.
	
	Tom_tells = TRUE;
};

//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Dead   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 4;
	condition   = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent   = FALSE;
	description = "Esteban nie ¿yje.";
};
FUNC INT DIA_Addon_Tom_Dead_Condition()
{	
	if (Npc_IsDead (Esteban))
	&& (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Dead_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Esteban nie ¿yje.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //Naprawdê? Ch³opie, TO siê nazywa mieæ szczêœcie.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //Kto go zabi³?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //Powiedzmy, ¿e ktoœ, kogo znasz...
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Dziêkujê, ¿e tu przyszed³eœ. Teraz mogê wróciæ do obozu...
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"LAGER");
};

//---------------------------------------------------------------------
// PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_PERM   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 5;
	condition   = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent   = TRUE;
	description = "Coœ jeszcze?";
};
FUNC INT DIA_Addon_Tom_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_PERM_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //Coœ jeszcze?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Teraz bêdê móg³ siê cieszyæ gorza³¹ Lucii.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //W koñcu mogê wróciæ!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //Hê? Przewa¿nie siedzê tutaj i liczê kamienie...
		};
	};
};




