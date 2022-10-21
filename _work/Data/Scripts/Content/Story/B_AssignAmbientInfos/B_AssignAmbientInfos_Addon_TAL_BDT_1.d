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
	description = "Wie sieht's aus?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Hi_15_00");//Wie sieht's aus?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_01");//Ich warte, bis sie einen Neuen anfordern und ich an die Reihe komme.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_02");//Von allen Leuten, die hier draußen sind, kommt nur Franco rein.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_03");//Jetzt, da Franco tot ist, habe ich hoffentlich bessere Chancen.
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
	description = "Was kannst du mir über das Lager erzählen?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Lager_15_00");//Was kannst du mir über das Lager erzählen?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_01");//Pass bloß auf, mit wem du dich anlegst! Wenn du grundlos einen Kampf anfängst, hast du schnell alle gegen dich!
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_02");//Die meisten haben Angst um ihr Gold und einige der Jungs beschützen sich untereinander.
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
	description = "Was weißt du über Raven?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Raven_15_00");//Was weißt du über Raven?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_01");//Er ist der Typ, der hier mit seinen Jungs als erster aufgetaucht ist.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_02");//Er der Anführer des Lagers. Mit ihm ist nicht gut Kirschen essen, glaube ich.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_03");//Einmal haben sie fünf neue Leute angefordert, weil er seine Wut an seinen eigenen Leuten ausgelassen hat.
};
FUNC VOID B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_NPC slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_HI.npc	  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Lager.npc   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Raven.npc  = Hlp_GetInstanceID (slf);
}; 


