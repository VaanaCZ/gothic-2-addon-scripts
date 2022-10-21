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
	description	 = 	"Allora, come vanno le cose?";
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
	AI_Output			(other, self, "DIA_Mil_304_Torwache_WASMACHSTDU_15_00"); //Allora, come vanno le cose?
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Mil_304_Torwache_WASMACHSTDU_08_01"); //Non posso lamentarmi. Faccio il mio dovere come vuole Innos.
	}
	else
	{
		AI_Output			(self, other, "DIA_Mil_304_Torwache_WASMACHSTDU_08_02"); //Ehi, non cercare di ammorbidirmi dicendomi 'come vanno le cose?'. È un trucco vecchio ormai. Sparisci dalla mia vista, capito?
	};
	 
	AI_StopProcessInfos (self);
};
