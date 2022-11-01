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
	AI_Output			(self, other, "DIA_Ritter_HERO_04_00"); //Tu aparición aquí es una señal para todos nosotros. Nos da fuerzas.

	if (DIA_Ritter_HERO_NoPerm == FALSE)
		{
			AI_Output			(self, other, "DIA_Ritter_HERO_04_01"); //Sabemos que nuestros compañeros de la ciudad no nos han olvidado. El Ojo de Innos nos protege.
			AI_Output			(self, other, "DIA_Ritter_HERO_04_02"); //Y si los orcos y los dragones asaltan las puertas, nos enfrentaremos a ellos. A vida o muerte.
			DIA_Ritter_HERO_NoPerm = TRUE;
		};
};


 



