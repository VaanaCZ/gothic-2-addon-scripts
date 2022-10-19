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
	AI_Output (self,other,"DIA_Addon_Juan_HI_13_01");//Co chceš? Chceš mi âíct nêco dùležitýho? Jestli ne, tak mùžeš zase jít.
	
	if !Npc_IsDead (Freund)
	{
		AI_Output (self,other,"DIA_Addon_Juan_HI_13_02");//Jinak z tebe mùj kámoš nadêlá sekanou. Tak co je?
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
	description = "Prý máš nêco zajímavého na prodej...";
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
	AI_Output (other,self,"DIA_Addon_Juan_Losung_15_00");//Prý máš na prodej nêco zajímavého.
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_01");//Takže Esteban mê chce vodit za nos? Už celý dny makám jak barevnej a musím se schovávat v týhle mizerný díâe.
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_02");//A on mi sem kliëánko pošle nêkoho s dalšíma krámama? Já nejsem žádný skladištê!
	AI_Output (other,self,"DIA_Addon_Juan_Losung_15_03");//No a? To není mùj problém.
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_04");//Ale to si piš, že jo, o to se postarám. Chceš zásilku? Dobâe, mùžeš za ni zaplatit!
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_05");//Sežeà si zlato u Estebana, u Havrana nebo já nevím kde. Mnê je to fuk. Ale každej, kdo chce tohle zboží, za nêj musí zaplatit!
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
	description = "Mê neposlal Esteban!";
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
	AI_Output (other,self,"DIA_Addon_Juan_AufsMaul_15_00"); //Nepâicházím od Estebana!
	AI_Output (self,other,"DIA_Addon_Juan_AufsMaul_13_01"); //Fakt? No, tak to teda... Moment! Stùj, máš nêco na rameni.
	
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





