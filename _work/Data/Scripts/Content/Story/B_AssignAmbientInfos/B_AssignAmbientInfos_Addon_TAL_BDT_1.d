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
	description = "Qu'y a-t-il?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Hi_15_00");//Comment �a va ?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_01");//J'attends qu'ils demandent l'aide d'une nouvelle personne, et mon tour sera venu.
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_02");//De toutes les personnes que vous voyez ici, seul Franco est autoris� � rentrer.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Hi_01_03");//Maintenant que Franco est mort, j'aurais peut-�tre plus de chance.
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
	description = "Que pouvez-vous me dire sur le camp ?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Lager_15_00");//Que pouvez-vous me dire � propos du camp ?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_01");//Faites attention � ne pas vous brouiller avec n'importe qui ! Si vous d�clenchez une bagarre sans raison, tout le monde se dressera rapidement contre vous !
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Lager_01_02");//La plupart des hommes sont assez nerveux au sujet de leur or, et certains n'attendent qu'un regard de travers pour se sauter � la gorge.
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
	description = "Que savez-vous de Raven ?";
};                       

FUNC INT DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_1_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_1_Raven_15_00");//Que savez-vous sur Raven ?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_01");//Lui et ses gars sont les premiers � �tre venus ici.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_02");//C'est le chef du camp. Vous n'avez pas int�r�t � lui chercher des ennuis, je vous le promets.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_1_Raven_01_03");//Un jour, ils ont eu besoin de cinq nouveaux types parce que Raven avait pass� sa col�re sur ses propres hommes.
};
FUNC VOID B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_NPC slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_HI.npc	  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Lager.npc   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_1_Raven.npc  = Hlp_GetInstanceID (slf);
}; 


