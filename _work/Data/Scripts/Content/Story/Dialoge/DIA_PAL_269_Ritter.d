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
	AI_Output			(self, other, "DIA_Ritter_HERO_04_00"); //Tv�j p��chod je znamen�m pro n�s v�echny. Dod�v� n�m to odvahu.

	if (DIA_Ritter_HERO_NoPerm == FALSE)
		{
			AI_Output			(self, other, "DIA_Ritter_HERO_04_01"); //V�me, �e na n�s na�i spolubojovn�ci z m�sta nezapomn�li. Innosovo oko na n�s dohl��.
			AI_Output			(self, other, "DIA_Ritter_HERO_04_02"); //A jestli sk�eti a draci vtrhnou na na�e br�ny, postav�me se jim hrd�, a� u� n�m bude souzeno p�e��t nebo zem��t.
			DIA_Ritter_HERO_NoPerm = TRUE;
		};
};


 



