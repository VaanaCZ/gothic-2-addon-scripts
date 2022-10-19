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
	AI_Output			(self, other, "DIA_Ritter_HERO_04_00"); //Tv˘j p¯Ìchod je znamenÌm pro n·s vöechny. Dod·v· n·m to odvahu.

	if (DIA_Ritter_HERO_NoPerm == FALSE)
		{
			AI_Output			(self, other, "DIA_Ritter_HERO_04_01"); //VÌme, ûe na n·s naöi spolubojovnÌci z mÏsta nezapomnÏli. Innosovo oko na n·s dohlÌûÌ.
			AI_Output			(self, other, "DIA_Ritter_HERO_04_02"); //A jestli sk¯eti a draci vtrhnou na naöe br·ny, postavÌme se jim hrdÏ, aù uû n·m bude souzeno p¯eûÌt nebo zem¯Ìt.
			DIA_Ritter_HERO_NoPerm = TRUE;
		};
};


 



