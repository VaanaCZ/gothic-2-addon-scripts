// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_TAL_BDT_13_EXIT_Condition;
	information	= DIA_Addon_TAL_BDT_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_TAL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 							Hi
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_Hi(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_TAL_BDT_13_Hi_Condition;
	information	= DIA_Addon_TAL_BDT_13_Hi_Info;
	permanent	= TRUE;
	description = "Как дела?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Hi_15_00");//Как дела?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_01");//Или тебя съест монстр... или тебя съест монстр...
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_02");//Это болото станет нам могилой...
};
// *************************************************************************
// 							Tal
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_Tal(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_TAL_BDT_13_Tal_Condition;
	information	= DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent	= TRUE;
	description = "Что ты знаешь про эту долину?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Tal_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Tal_15_00");//Что ты знаешь про эту долину?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_01");//Здесь множество вещей, оставшихся с древних времен. Ворон велел нам собирать их все.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_02");//Не знаю, зачем они ему нужны, но ни один нормальный человек не будет рисковать собственной жизнью за несколько старых камней...
};
// *************************************************************************
// 							News
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_News(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_TAL_BDT_13_News_Condition;
	information	= DIA_Addon_TAL_BDT_13_News_Info;
	permanent	= TRUE;
	description = "Есть какие-нибудь новости?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_News_15_00");//Есть какие-нибудь новости?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_01");//Мы действительно довели этих пиратов.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_02");//Они привозили нам пленников, но ни разу не получили и монеты. Ничего удивительного, что они разозлились.
	
	if (BDT_13_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_03");//Но что они могут сделать? Напасть на лагерь? (смеется) ХА-ХА.
		BDT_13_einmal = TRUE;
	};
};


FUNC VOID B_AssignAmbientInfos_Addon_TAL_BDT_13(var C_NPC slf)
{
	DIA_Addon_TAL_BDT_13_EXIT.npc  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_13_HI.npc	   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_13_TAL.npc   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_13_NEWS.npc  = Hlp_GetInstanceID (slf);
}; 


