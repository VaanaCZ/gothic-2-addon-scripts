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
	description = "°Wie sieht's aus?   °<<FTSTAMP005751017_CINFODESCRIPTION>>";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Hi_15_00");//°Wie sieht's aus?   °<<FTSTAMP005752061_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_01");//°Entweder du wirst von 'nem Vieh gefressen oder du wirst von 'nem Vieh gefressen.   °<<FTSTAMP005753061_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_02");//°Dieser Sumpf wird noch unser Grab ...   °<<FTSTAMP005754061_AIOUTPUT>>
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
	description = "°Was weißt du über dieses Tal?   °<<FTSTAMP005755017_CINFODESCRIPTION>>";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Tal_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Tal_15_00");//°Was weißt du über dieses Tal?   °<<FTSTAMP005756062_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_01");//°Hier gibt's haufenweise altes Zeug. Raven hat uns den Auftrag gegeben, alles einzusammeln.   °<<FTSTAMP005757062_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_02");//°Keine Ahnung, was er damit will, aber niemand, der bei Verstand ist, wird seinen Hals für ein paar alte Steine riskieren ...   °<<FTSTAMP005758062_AIOUTPUT>>
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
	description = "°Gibt's was Neues?   °<<FTSTAMP005759017_CINFODESCRIPTION>>";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_News_15_00");//°Gibt's was Neues?   °<<FTSTAMP005760063_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_01");//°Diese Piraten haben wir ganz schön über's Ohr gehauen.   °<<FTSTAMP005761063_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_02");//°Sie haben uns Gefangene besorgt, aber nicht eine Münze dafür gesehen. Kein Wunder, dass die sauer sind.   °<<FTSTAMP005762063_AIOUTPUT>>
	
	if (BDT_13_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_03");//°Aber was wollen sie machen? Das Lager angreifen? (lacht) HAHAHA.   °<<FTSTAMP005763064_AIOUTPUT>>
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


