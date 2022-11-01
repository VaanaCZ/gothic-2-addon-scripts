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
	description = "Co słychać?";
};
FUNC INT DIA_Addon_Juan_HI_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Juan_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Juan_HI_15_00");//Co słychać?
	AI_Output (self,other,"DIA_Addon_Juan_HI_13_01");//Czego chcesz? Masz mi coś ważnego do powiedzenia? Jeśli nie, to zabieraj się stąd.
	
	if !Npc_IsDead (Freund)
	{
		AI_Output (self,other,"DIA_Addon_Juan_HI_13_02");//W przeciwnym razie mój kolega ci dołoży. No to chcesz czegoś?
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
	description = "Podobno masz wiele ciekawych rzeczy....";
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
	AI_Output (other,self,"DIA_Addon_Juan_Losung_15_00");//Podobno masz wiele ciekawych rzeczy....
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_01");//Naprawdę? Esteban żartuje sobie ze mnie? Odwaliłem całą robotę i siedzę w tej brudnej dziurze...
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_02");//A on po prostu przysyła kogoś po te rzeczy? Kto ja jestem? Magazynier?
	AI_Output (other,self,"DIA_Addon_Juan_Losung_15_03");//No i co? To nie mój problem.
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_04");//To BĘDZIE twój problem. Chcesz odebrać towar - świetnie, możesz go ode mnie kupić.
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_05");//Weź złoto od Estebana, Kruka, albo kogo tam chcesz. Nie obchodzi mnie to. Jak ktoś chce mieć towar, musi za niego zapłacić.
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
	description = "Nie przychodzę od Estebana!";
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
	AI_Output (other,self,"DIA_Addon_Juan_AufsMaul_15_00"); //Nie przychodzę od Estebana!
	AI_Output (self,other,"DIA_Addon_Juan_AufsMaul_13_01"); //Och? W takim razie... Poczekaj sekundkę, masz na ramieniu jakiegoś robaka...
	
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





