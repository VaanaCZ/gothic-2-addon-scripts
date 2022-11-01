
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornOW_EXIT(C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 999;
	condition	= DIA_GornOW_EXIT_Condition;
	information	= DIA_GornOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_GornOW_Hello (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_Hello_Condition;
	information	= DIA_GornOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_Hello_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_GornOW_Hello_Info()
{	

	VAR C_NPC Milten;
	Milten			= Hlp_GetNpc(PC_Mage_OW);
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Dość tego wylegiwania! Jesteś wolny!
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //Najwyższy czas, żeby ktoś mnie stąd wyciągnął.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//Ale w życiu bym się nie spodziewał, że to będziesz ty! Dobrze cię znowu widzieć!
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//Garond narzeka, że za dużo jesz i nie może sobie pozwolić na utrzymywanie takiego darmozjada.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Skoro już o tym mowa - napiłbym się dobrego piwa! Chodźmy stąd, zbrzydła mi ta cela.
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Czekaj chwilę. Mam tutaj coś, co może ci się przydać.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //Znalazłem w celi tę zbroję. Jakiś więzień musiał ją tutaj ukryć.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //Na mnie jest za mała, ale na ciebie powinna pasować.
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //Dzięki! Zobaczymy się u Miltena...
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//W porządku. Zobaczymy się u Miltena.
	};
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_06");	//Jasna sprawa!
	
	AI_StopProcessInfos (self);
	
	Npc_ExchangeRoutine	(self,"FREE"); 
	B_StartOtherRoutine (Milten,"GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP (XP_RescueGorn);
};

// ************************************************************
// 			Bei Milten
// ************************************************************
INSTANCE DIA_GornOW_MetMilten (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_MetMilten_Condition;
	information	= DIA_GornOW_MetMilten_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_MetMilten_Condition()
{
	if (Mis_RescueGorn == LOG_SUCCESS)
	&& (Npc_GetDistToWP	(self,"OC_MAGE_LIBRARY_IN") <=	500) 
	&&  Npc_IsInState (self, ZS_Talk)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_GornOW_MetMilten_Info()
{	
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//Słuchaj, dość się już tutaj wynudziłem. Mam wielką ochotę rozejrzeć się trochę poza doliną.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//Jak się przedostałeś przez przełęcz?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//Znalazłem ukrytą ścieżkę, która prowadzi przez opuszczoną kopalnię.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//Świetnie. Zaczekam na właściwą chwilę, a potem dam stąd nogę.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//Dokąd pójdziesz?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//Podobno Lee jeszcze żyje. Spróbuję znowu do niego dołączyć.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//W takim razie idź na farmę Onara. Znajdziesz tam Lee i jego chłopców. Na pewno ucieszą się na twój widok.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//Tak zrobię! Dzięki za cynk.
	};
};	

// ************************************************************
// 	Perm Kap.2
// ************************************************************
INSTANCE DIA_GornOW_SeeYou (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 900;
	condition	= DIA_GornOW_SeeYou_Condition;
	information	= DIA_GornOW_Seeyou_Info;
	permanent	= TRUE;
	description = "Jeszcze się spotkamy.";
};                       
FUNC INT DIA_GornOW_SeeYou_Condition()
{
	if Npc_KnowsInfo (other,DIA_GornOW_MetMilten)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_GornOW_SeeYou_Info()
{	
	AI_Output	(other,self ,"DIA_GornOW_SeeYou_15_00");//Jeszcze się spotkamy.
	AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//Możesz na to liczyć.
	
	/*
	if (other.guild == GIL_KDF)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else //SLD
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	};
	*/
	AI_StopProcessInfos (self);
};	
