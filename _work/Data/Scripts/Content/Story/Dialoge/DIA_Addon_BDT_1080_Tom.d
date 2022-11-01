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
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //Mam trochę kłopotów. Powrót do obozu nie byłby teraz najlepszym wyjściem.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //Co się stało?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //Miałem całkiem niezłe kontakty z piratami, wiesz?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Zawsze spotykaliśmy się nieopodal obozu, żeby pohandlować.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //Chłopie, kupowałem graty dla połowy ludzi z obozu. "Tom, załatw mi to, Tom załatw mi tamto".
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //A ten bydlak Esteban wszystko zrujnował!
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
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban wysłał jednego ze swoich ludzi, Juana. Koleś obserwował nas.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //A później, jak omawiałem interes z piratami, wyszedł z ciemności i ich pobił.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //Chłopie, ale ten gość był szybki! Na szczęście zdołałem uciec.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"A więc to Juan jest odpowiedzialny za zabójstwo Hanka i Angusa. Urządził na nich zasadzkę, a następnie zamordował.");
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
	description = "I od tamtej pory się tu ukrywasz?";
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
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //I od tamtej pory się tu ukrywasz?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Najpierw wróciłem do obozu i powiedziałem Fiskowi, Huno i innym chłopakom, żeby nie spodziewali się dostawy.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //I że mogą za to podziękować Estebanowi.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Jeśli Esteban dowie się, kto doniósł chłopakom, że to on za tym stoi, będę martwy.
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
	description = "Esteban nie żyje.";
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
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Esteban nie żyje.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //Naprawdę? Chłopie, TO się nazywa mieć szczęście.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //Kto go zabił?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //Powiedzmy, że ktoś, kogo znasz...
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Dziękuję, że tu przyszedłeś. Teraz mogę wrócić do obozu...
	
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
	description = "Coś jeszcze?";
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
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //Coś jeszcze?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Teraz będę mógł się cieszyć gorzałą Lucii.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //W końcu mogę wrócić!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //Hę? Przeważnie siedzę tutaj i liczę kamienie...
		};
	};
};




