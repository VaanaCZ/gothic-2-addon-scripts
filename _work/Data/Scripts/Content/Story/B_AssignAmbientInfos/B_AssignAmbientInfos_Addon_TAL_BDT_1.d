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
	description = "Jak se vede?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Hi_15_00");//Jak se vede?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_01");//Čekám, až budou chtít někoho novýho. Jsem na řadě.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_02");//Ze všech lidí, co tu jsou, může dovnitř jenom Franco.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_03");//Snad na tom teď budeme líp, když je Franco mrtvý.
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
	description = "Co mi můžeš říci o táboře?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Lager_15_00");//Co bys mi řekl o táboře?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_01");//Buď furt ve střehu a s nikým se nezaplejtej! Když se bezdůvodně pustíš do boje, všichni se na tebe okamžitě sesypou!
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_02");//Většina lidí se stejně furt bojí o svý zlato a chlapi se sledujou navzájem.
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
	description = "Co víš o Havranovi?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Raven_15_00");//Co bys mi pověděl o Havranovi?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_01");//To on a jeho chlapi sem přišli jako první.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_02");//Je velitelem tohohle tábora. Bejt tebou, tak si s ním moc nezahrávám.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_03");//Jednou potřebovali pět novejch chlapů, protože se vzteknul a vodkrouhnul vlastní lidi.
};
FUNC VOID B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_NPC slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_HI.npc	  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Lager.npc   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Raven.npc  = Hlp_GetInstanceID (slf);
}; 


