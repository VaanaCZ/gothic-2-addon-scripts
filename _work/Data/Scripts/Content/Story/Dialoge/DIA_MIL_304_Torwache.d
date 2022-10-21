///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mil_304_Torwache_EXIT   (C_INFO)
{
	npc         = Mil_304_Torwache;
	nr          = 999;
	condition   = DIA_Mil_304_Torwache_EXIT_Condition;
	information = DIA_Mil_304_Torwache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Mil_304_Torwache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Mil_304_Torwache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Mil_304_Torwache_WASMACHSTDU		(C_INFO)
{
	npc			 = 	Mil_304_Torwache;
	nr			 =  3;
	condition	 = 	DIA_Mil_304_Torwache_WASMACHSTDU_Condition;
	information	 = 	DIA_Mil_304_Torwache_WASMACHSTDU_Info;
	permanent	 =  TRUE;	
	description	 = 	"Wie geht's denn so?";
};
func int DIA_Mil_304_Torwache_WASMACHSTDU_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Mil_304_Torwache_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Mil_304_Torwache_WASMACHSTDU_15_00"); //Wie geht's denn so?
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Mil_304_Torwache_WASMACHSTDU_08_01"); //Ich kann nicht klagen. Ich verrichte meine Pflicht, so wie Innos es von mir verlangt.
	}
	else
	{
		AI_Output			(self, other, "DIA_Mil_304_Torwache_WASMACHSTDU_08_02"); //Hey, versuch hier nicht die 'Hey, wie geht's'-Nummer abzuziehen. Geh mir einfach aus den Augen, okay?
	};
	 
	AI_StopProcessInfos (self);
};
