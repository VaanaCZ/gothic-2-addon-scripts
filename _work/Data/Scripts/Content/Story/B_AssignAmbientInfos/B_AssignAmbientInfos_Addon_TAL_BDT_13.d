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
	description = "Jak se vede?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Hi_15_00");//Jak se vede?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_01");//Buë tę sežere nęjaká potvora, nebo tę sežere nęjaká potvora.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_02");//Tahle bažina bude naše smrt.
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
	description = "Víš nęco zajímavého o tomhle údolí?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Tal_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Tal_15_00");//Co bys mi âekl o tomhle údolí?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_01");//Je tu spousta starejch krámů. Havran nám nakázal, abysme to všecko nakupili na jednu hromadu.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_02");//Netuším, co s tím chce dęlat, ale nikdo, kdo má všech pęt pohromadę, by pro pár starejch šutrů neriskoval krk.
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
	description = "Co je nového?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_News_15_00");//Sebęhlo se tu nęco nového?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_01");//Pęknę ty piráty vodíme za nos.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_02");//Zásobujou nás vęznęma, ale od nás ještę nevidęli ani vindru. Nedivím se, že jsou nakrknutý.
	
	if (BDT_13_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_03");//Co ale můžou dęlat? Pâepadnout tábor? (smęje se) HAHAHA.
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


