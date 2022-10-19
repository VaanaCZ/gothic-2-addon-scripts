// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_TAL_BDT_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_TAL_BDT_1_EXIT_Condition;
	information	= DIA_Addon_TAL_BDT_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_TAL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 							Hi
// *************************************************************************
instance DIA_Addon_TAL_BDT_1_Hi(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_TAL_BDT_1_Hi_Condition;
	information	= DIA_Addon_TAL_BDT_1_Hi_Info;
	permanent	= TRUE;
	description = " ак дела?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Hi_15_00");// ак дела?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_01");//я жду, пока они им не понадобитс€ кто-нибудь новый и не придет мо€ очередь.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_02");//»з всех людей, кто снаружи, только ‘ранко мог войти сюда.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_03");//ј теперь ‘ранко мертв, и, может быть, у мен€ по€витс€ шанс.
	};
};
// *************************************************************************
// 							Lager
// *************************************************************************
instance DIA_Addon_TAL_BDT_1_Lager(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_TAL_BDT_1_Lager_Condition;
	information	= DIA_Addon_TAL_BDT_1_Lager_Info;
	permanent	= TRUE;
	description = "ћожешь рассказать мне что-нибудь о лагере.";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Lager_15_00");//ћожешь рассказать мне что-нибудь о лагере.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_01");//—мотри, с кем св€зываешьс€! ≈сли ты начнешь дратьс€ без причины, они все очень быстро наброс€тс€ на теб€!
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_02");//Ѕольшинство из них чересчур пекутс€ о своем золоте и некоторые внимательно след€т за другими.
};
// *************************************************************************
// 							News
// *************************************************************************
instance DIA_Addon_TAL_BDT_1_Raven(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_TAL_BDT_1_Raven_Condition;
	information	= DIA_Addon_TAL_BDT_1_Raven_Info;
	permanent	= TRUE;
	description = "„то тебе известно про ¬орона?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Raven_15_00");//„то тебе известно про ¬орона?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_01");//Ётот человек первым оказалс€ здесь со своими реб€тами.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_02");//ќн - командир лагер€. я тебе советую не крутитьс€ вокруг него.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_03");//ќднажды им потребовались п€ть новых бойцов, потому что он сорвал свою злость на своих же люд€х.
};
FUNC VOID B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_NPC slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_HI.npc	  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Lager.npc   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Raven.npc  = Hlp_GetInstanceID (slf);
}; 


