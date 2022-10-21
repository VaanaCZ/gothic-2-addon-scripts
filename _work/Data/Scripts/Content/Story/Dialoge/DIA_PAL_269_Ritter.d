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
	AI_Output			(self, other, "DIA_Ritter_HERO_04_00"); //“вое по€вление здесь хороший знак дл€ нас всех. ћы все воспр€ли духом.

	if (DIA_Ritter_HERO_NoPerm == FALSE)
		{
			AI_Output			(self, other, "DIA_Ritter_HERO_04_01"); //ћы знаем, что наши товарищи в городе не забыли о нас. √лаз »нноса наблюдает за всеми нами.
			AI_Output			(self, other, "DIA_Ritter_HERO_04_02"); //» если орки и драконы будут ломитьс€ в ворота, мы встретим их с подн€тым забралом и будем сражатьс€ до победы или смерти.
			DIA_Ritter_HERO_NoPerm = TRUE;
		};
};


 



