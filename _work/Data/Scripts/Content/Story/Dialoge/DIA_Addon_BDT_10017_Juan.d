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
	description = "How's it going?";
};
FUNC INT DIA_Addon_Juan_HI_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Juan_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Juan_HI_15_00");//How's it going?
	AI_Output (self,other,"DIA_Addon_Juan_HI_13_01");//What do you want? Have you got anything to say to me? If not, you can just go away.
	
	if !Npc_IsDead (Freund)
	{
		AI_Output (self,other,"DIA_Addon_Juan_HI_13_02");//Otherwise my friend will make mincemeat of you. So what is it?
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
	description = "They say you have some interesting wares to offer...";
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
	AI_Output (other,self,"DIA_Addon_Juan_Losung_15_00");//They say you have some interesting wares to offer...
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_01");//So what. Esteban wants to jerk me around, eh? I do all the work and hide away here for days in this miserable hole...
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_02");//...and he just sends someone to fetch the stuff? I'm not a warehouse!
	AI_Output (other,self,"DIA_Addon_Juan_Losung_15_03");//Yeah, and? That isn't my problem.
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_04");//But I'm MAKING it your problem. You want the delivery - fine, you can pay for it!
	AI_Output (self,other,"DIA_Addon_Juan_Losung_13_05");//Get the gold from Esteban or Raven or I don't know where. I don't care. Whoever wants these goods will pay for them!
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
	description = "I don't come from Esteban!";
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
	AI_Output (other,self,"DIA_Addon_Juan_AufsMaul_15_00"); //I don't come from Esteban!
	AI_Output (self,other,"DIA_Addon_Juan_AufsMaul_13_01"); //Oh? Well then... eh ... Just a moment! Hold still for a bit, you have a critter on your shoulder.
	
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





