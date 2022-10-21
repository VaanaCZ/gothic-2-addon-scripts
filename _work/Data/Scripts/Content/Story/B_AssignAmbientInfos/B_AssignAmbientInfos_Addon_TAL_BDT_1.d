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
	description = "Co s³ychaæ?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Hi_15_00");//Co s³ychaæ?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_01");//Poczekam, a¿ poprosz¹ o nowego, a wtedy bêdzie moja kolej.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_02");//Z tych wszystkich ludzi na zewn¹trz tylko Franko wchodzi do œrodka.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_03");//Teraz, gdy Franko nie ¿yje, powinienem mieæ wiêksze szanse.
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
	description = "Co mo¿esz mi powiedzieæ o obozowisku?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Lager_15_00");//Co mo¿esz mi powiedzieæ o obozowisku?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_01");//Uwa¿aj, z kim zadzierasz! Je¿eli zaczniesz bójkê bez powodu, wszyscy zwróc¹ siê przeciwko tobie!
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_02");//Wiêkszoœæ z nich nie chce straciæ swojego z³ota - dlatego chroni¹ siê nawzajem.
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
	description = "Co wiesz o Kruku?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Raven_15_00");//Co wiesz o Kruku?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_01");//To goœæ, który jako pierwszy przyby³ tu ze swoimi ch³opcami.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_02");//To przywódca obozu. Lepiej z nim nie zadzieraj.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_03");//Kiedyœ przyjêli piêciu nowych, bo wy³adowa³ gniew na swoich ludziach.
};
FUNC VOID B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_NPC slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_HI.npc	  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Lager.npc   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Raven.npc  = Hlp_GetInstanceID (slf);
}; 


