///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_298_EXIT   (C_INFO)
{
	npc         = PAL_298_Ritter;
	nr          = 999;
	condition   = DIA_PAL_298_EXIT_Condition;
	information = DIA_PAL_298_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_PAL_298_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_PAL_298_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Pass		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_Pass_Condition;
	information	 = 	DIA_PAL_298_Pass_Info;
	permanent	 = 	FALSE;
	description	 = 	"O� conduit cette passe ?";
};
func int DIA_PAL_298_Pass_Condition ()
{	
	if (Kapitel == 1) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_Pass_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Pass_15_00");//O� conduit ce chemin�?
	AI_Output (self, other, "DIA_PAL_298_Pass_09_01");//Le col conduisant � la Vall�e des mines se trouve de l'autre c�t� de cette porte.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_02");//Nous tenons ce c�t�, mais les orques se sont barricad�s de l'autre c�t�.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_03");//Vous avez int�r�t � faire demi-tour. Vous ne passerez pas par ici.
};
///////////////////////////////////////////////////////////////////////
//	Info TRESPASS
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_TRESPASS		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_TRESPASS_Condition;
	information	 = 	DIA_PAL_298_TRESPASS_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_PAL_298_TRESPASS_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_TRESPASS_Info ()
{
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_00");//Vous voulez vraiment y aller�? Je crains fort que vous n'alliez pas loin, les orques nous attendent de l'autre c�t�.
	AI_Output (other, self, "DIA_PAL_298_TRESPASS_15_01");//S'il y a un moyen d'entrer dans la Vall�e des mines, je le trouverai.
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_02");//Bien. Dans ce cas, Innos vous garde.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm1		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm1_Condition;
	information	 = 	DIA_PAL_298_Perm1_Info;
	permanent	 = 	TRUE;
	description	 = 	"Et si j'y vais � mes risques et p�rils ?";
};
func int DIA_PAL_298_Perm1_Condition ()
{	
	if (Kapitel == 1)
	&& Npc_KnowsInfo (other, DIA_PAL_298_Pass)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm1_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm1_15_00");//Et si j'y vais � mes risques et p�rils�?
	AI_Output (self, other, "DIA_PAL_298_Perm1_09_01");//Alors, vous mourrez. C'est pour cela que nous sommes ici... pour �viter que les gens comme vous ne fassent une grosse b�tise.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm2		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm2_Condition;
	information	 = 	DIA_PAL_298_Perm2_Info;
	permanent	 = 	TRUE;
	description	 = 	"Comment �a se passe ?";
};
func int DIA_PAL_298_Perm2_Condition ()
{	
	if  (Kapitel >= 2)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm2_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm2_15_00");//Comment �a va ?
	AI_Output (self, other, "DIA_PAL_298_Perm2_09_01");//C'est calme. Nous contr�lons la situation.
};


