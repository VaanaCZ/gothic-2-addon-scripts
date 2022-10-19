//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Juan_EXIT   (C_INFO)
{
	npc         = BDT_10017_Addon_Juan;
	nr          = 999;
	condition   = DIA_Addon_Juan_EXIT_Condition;
	information = DIA_Addon_Juan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Juan_EXIT_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Juan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Juan_PICKPOCKET (C_INFO)
{
	npc			= BDT_10017_Addon_Juan;
	nr			= 900;
	condition	= DIA_Addon_Juan_PICKPOCKET_Condition;
	information	= DIA_Addon_Juan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Juan_PICKPOCKET_Condition()
{
	C_Beklauen (65, 73);
};
 
FUNC VOID DIA_Addon_Juan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Juan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Juan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Juan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Juan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Juan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Juan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Juan_PICKPOCKET);
};
	
func void DIA_Addon_Juan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Juan_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Juan_HI   (C_INFO)
{
	npc         = BDT_10017_Addon_Juan;
	nr          = 2;
	condition   = DIA_Addon_Juan_HI_Condition;
	information = DIA_Addon_Juan_HI_Info;
	permanent   = FALSE;
	description = "Jak se vede?";
};
FUNC INT DIA_Addon_Juan_HI_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Juan_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Juan_HI_15_00");//Jak to jde?
	AI_Output (self,other,"DIA_Addon_Juan_HI_13_01");//Co chce�? Chce� mi ��ct n�co d�le�it�ho? Jestli ne, tak m��e� zase j�t.
	
	if !Npc_IsDead (Freund)
	{
		AI_Output (self,other,"DIA_Addon_Juan_HI_13_02");//Jinak z tebe m�j k�mo� nad�l� sekanou. Tak co je?
		B_StartOtherRoutine (Freund,"STAND");
	};
};	

//---------------------------------------------------------------------
//	Info Losung
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Juan_Losung   (C_INFO)
{
	npc         = BDT_10017_Addon_Juan;
	nr          = 2;
	condition   = DIA_Addon_Juan_Losung_Condition;
	information = DIA_Addon_Juan_Losung_Info;
	permanent   = FALSE;
	description = "Pr� m� n�co zaj�mav�ho na prodej...";
};
FUNC INT DIA_Addon_Juan_Losung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Juan_HI)
	&& ( (Tom_tells == TRUE) || (MIS_Huno_Stahl == LOG_RUNNING) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Juan_Losung_Info()
{	
	AI_Output (other,self,"DIA_Addon_Juan_Losung_15_00");//Pr� m� na prodej n�co zaj�mav�ho.
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_01");//Tak�e Esteban m� chce vodit za nos? U� cel� dny mak�m jak barevnej a mus�m se schov�vat v t�hle mizern� d��e.
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_02");//A on mi sem kli��nko po�le n�koho s dal��ma kr�mama? J� nejsem ��dn� skladi�t�!
	AI_Output (other,self,"DIA_Addon_Juan_Losung_15_03");//No a? To nen� m�j probl�m.
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_04");//Ale to si pi�, �e jo, o to se postar�m. Chce� z�silku? Dob�e, m��e� za ni zaplatit!
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_05");//Se�e� si zlato u Estebana, u Havrana nebo j� nev�m kde. Mn� je to fuk. Ale ka�dej, kdo chce tohle zbo��, za n�j mus� zaplatit!
};

//---------------------------------------------------------------------
//	Info Aufs Maul
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Juan_AufsMaul (C_INFO)
{
	npc         = BDT_10017_Addon_Juan;
	nr          = 2;
	condition   = DIA_Addon_Juan_AufsMaul_Condition;
	information = DIA_Addon_Juan_AufsMaul_Info;
	permanent   = FALSE;
	description = "M� neposlal Esteban!";
};
FUNC INT DIA_Addon_Juan_AufsMaul_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Juan_Losung))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Juan_AufsMaul_Info()
{	
	AI_Output (other,self,"DIA_Addon_Juan_AufsMaul_15_00"); //Nep�ich�z�m od Estebana!
	AI_Output (self,other,"DIA_Addon_Juan_AufsMaul_13_01"); //Fakt? No, tak to teda... Moment! St�j, m� n�co na rameni.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	
};

//---------------------------------------------------------------------
//	Info Trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Juan_Trade   (C_INFO)
{
	npc         = BDT_10017_Addon_Juan;
	nr          = 99;
	condition   = DIA_Addon_Juan_Trade_Condition;
	information = DIA_Addon_Juan_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Juan_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Juan_Losung)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Juan_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
};	





