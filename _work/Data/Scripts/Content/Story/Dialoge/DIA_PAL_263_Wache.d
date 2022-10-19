///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_263_EXIT   (C_INFO)
{
	npc         = PAL_263_Wache;
	nr          = 999;
	condition   = DIA_PAL_263_EXIT_Condition;
	information = DIA_PAL_263_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_PAL_263_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_263_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_263_PERM		(C_INFO)
{
	npc			 = 	PAL_263_Wache;
	nr			 = 	2;
	condition	 = 	DIA_PAL_263_PERM_Condition;
	information	 = 	DIA_PAL_263_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Au rapport, soldat !";
};

func int DIA_PAL_263_PERM_Condition ()
{
	if hero.guild == GIL_MIL
	|| hero.guild == GIL_PAL
	{
		return TRUE;
	};
};
func void DIA_PAL_263_PERM_Info ()
{
	AI_Output			(other, self, "DIA_PAL_263_PERM_15_00"); //Au rapport, soldat�!
	AI_Output			(self, other, "DIA_PAL_263_PERM_04_01"); //Oui, monsieur�! Nous tenons la position. Pas de pertes depuis la derni�re fois. Les provisions se font rares, mais les orques sont calmes.
	AI_Output			(self, other, "DIA_PAL_263_PERM_04_02"); //La derni�re attaque de dragon en date a compl�tement d�truit le mur ext�rieur, mais il ne s'est rien produit d'inhabituel depuis.
	AI_Output			(other, self, "DIA_PAL_263_PERM_15_03"); //Tr�s bien, continuez comme �a.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM_OTH
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_263_PERM_OTH		(C_INFO)
{
	npc			 = 	PAL_263_Wache;
	nr			 = 	2;
	condition	 = 	DIA_PAL_263_PERM_OTH_Condition;
	information	 = 	DIA_PAL_263_PERM_OTH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Comment �a se passe ?";
};

func int DIA_PAL_263_PERM_OTH_Condition ()
{
	if hero.guild != GIL_MIL
	|| hero.guild != GIL_PAL
	{
		return TRUE;
	};
};
func void DIA_PAL_263_PERM_OTH_Info ()
{
	AI_Output			(other, self, "DIA_PAL_263_PERM_OTH_15_00"); //Comment �a va ?
	AI_Output			(self, other, "DIA_PAL_263_PERM_OTH_04_01"); //Nous contr�lons la situation. Ne vous inqui�tez pas, citoyen. Tout va bien se passer.
};



 




