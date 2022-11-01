///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_269_EXIT   (C_INFO)
{
	npc         = PAL_269_Ritter;
	nr          = 999;
	condition   = DIA_PAL_269_EXIT_Condition;
	information = DIA_PAL_269_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_PAL_269_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_269_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HERO
///////////////////////////////////////////////////////////////////////
instance DIA_Ritter_HERO		(C_INFO)
{
	npc			 = 	PAL_269_Ritter;
	condition	 = 	DIA_PAL_269_HERO_Condition;
	information	 = 	DIA_PAL_269_HERO_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_PAL_269_HERO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
var int DIA_Ritter_HERO_NoPerm;
func void DIA_PAL_269_HERO_Info ()
{
	AI_Output			(self, other, "DIA_Ritter_HERO_04_00"); //Tvůj příchod je znamením pro nás všechny. Dodává nám to odvahu.

	if (DIA_Ritter_HERO_NoPerm == FALSE)
		{
			AI_Output			(self, other, "DIA_Ritter_HERO_04_01"); //Víme, že na nás naši spolubojovníci z města nezapomněli. Innosovo oko na nás dohlíží.
			AI_Output			(self, other, "DIA_Ritter_HERO_04_02"); //A jestli skřeti a draci vtrhnou na naše brány, postavíme se jim hrdě, ať už nám bude souzeno přežít nebo zemřít.
			DIA_Ritter_HERO_NoPerm = TRUE;
		};
};


 



