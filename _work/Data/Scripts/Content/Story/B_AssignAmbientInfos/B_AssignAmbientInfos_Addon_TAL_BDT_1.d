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
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_01");//�ek�m, a� budou cht�t n�koho nov�ho. Jsem na �ad�.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_02");//Ze v�ech lid�, co tu jsou, m��e dovnit� jenom Franco.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_03");//Snad na tom te� budeme l�p, kdy� je Franco mrtv�.
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
	description = "Co mi m��e� ��ci o t�bo�e?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Lager_15_00");//Co bys mi �ekl o t�bo�e?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_01");//Bu� furt ve st�ehu a s nik�m se nezaplejtej! Kdy� se bezd�vodn� pust� do boje, v�ichni se na tebe okam�it� sesypou!
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_02");//V�t�ina lid� se stejn� furt boj� o sv� zlato a chlapi se sledujou navz�jem.
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
	description = "Co v� o Havranovi?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Raven_15_00");//Co bys mi pov�d�l o Havranovi?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_01");//To on a jeho chlapi sem p�i�li jako prvn�.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_02");//Je velitelem tohohle t�bora. Bejt tebou, tak si s n�m moc nezahr�v�m.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_03");//Jednou pot�ebovali p�t novejch chlap�, proto�e se vzteknul a vodkrouhnul vlastn� lidi.
};
FUNC VOID B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_NPC slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_HI.npc	  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Lager.npc   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Raven.npc  = Hlp_GetInstanceID (slf);
}; 


