// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Malcom_EXIT(C_INFO)
{
	npc			= PIR_1368_Addon_Malcom;
	nr			= 999;
	condition	= DIA_Addon_Malcom_EXIT_Condition;
	information	= DIA_Addon_Malcom_EXIT_Info;
	permanent	= TRUE;
	description = "Je dois y aller.";
};                       
FUNC INT DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Malcom_EXIT_Info()
{	
	AI_Output (other, self, "DIA_Addon_Malcom_perm_15_00"); //Je dois y aller.
	
	if (MalcomBotschaft == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_perm_04_01"); //Ne vous faites pas dévorer par les bêtes. Cet endroit est très dangereux.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_03"); //Hé ! Quand vous serez au camp, passez un message à Henry.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_04"); //Les arbres sont plutôt têtus par ici.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_05"); //Il devra encore attendre un peu pour son bois. Dites-lui ça.
		MalcomBotschaft = TRUE;
	};
	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Malcom_PICKPOCKET (C_INFO)
{
	npc			= PIR_1368_Addon_Malcom;
	nr			= 900;
	condition	= DIA_Addon_Malcom_PICKPOCKET_Condition;
	information	= DIA_Addon_Malcom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Malcom_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Addon_Malcom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Malcom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Malcom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Malcom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Malcom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Malcom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Malcom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Malcom_PICKPOCKET);
};
	
func void DIA_Addon_Malcom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Malcom_PICKPOCKET);
};
// ************************************************************
//								Hello
// ************************************************************
instance DIA_Addon_Malcom_Hello		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 1;
	condition	= DIA_Addon_Malcom_Hello_Condition;
	information	= DIA_Addon_Malcom_Hello_Info;

	important 	= TRUE;
};

func int DIA_Addon_Malcom_Hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_01"); //Vous n'êtes pas d'ici, n'est-ce pas ?
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_02"); //On dirait que vous venez de loin.
};

// ************************************************************
//					Hallo 2 	(Was machst du?)
// ************************************************************
instance DIA_Addon_Malcom_WasMachen		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 2;
	condition	= DIA_Addon_Malcom_WasMachen_Condition;
	information	= DIA_Addon_Malcom_WasMachen_Info;

	description	= "Occupé ?";
};
func int DIA_Addon_Malcom_WasMachen_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Malcom_WasMachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_00"); //Occupé ?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_01"); //M'en parlez pas. Henry veut que j'abatte tous les arbres du coin.
	if (Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_02"); //Henry ?
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_00"); //Il dirige notre bande.
	};
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_04"); //Il traîne à l'entrée du camp et nous fait de grands discours.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_05"); //Œuvrez plus pour le bien de la communauté, ce genre d'âneries.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_06"); //Mais lui, il ne lève pas le petit doigt, bien sûr.
};

// ************************************************************
// 					Holz - Nachricht für Henry
// ************************************************************
instance DIA_Addon_Malcom_Entertrupp		(C_INFO)
{
	npc		 = 	PIR_1368_Addon_Malcom;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Malcom_Entertrupp_Condition;
	information	 = 	DIA_Addon_Malcom_Entertrupp_Info;

	description	 = 	"Henry est votre chef ?";
};
func int DIA_Addon_Malcom_Entertrupp_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};
func void DIA_Addon_Malcom_Entertrupp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_Entertrupp_15_00"); //Henry est votre chef ?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_03"); //Oui, il commande notre groupe d'attaque.
	AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_01"); //Notre Capitaine, c'est Greg.
	if (GregIsBack == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_Add_04_02"); //Mais il n'est pas là pour l'instant.
	};
};

// ************************************************************
// 						Wo ist Lager
// ************************************************************
instance DIA_Addon_Malcom_Lager		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 3;
	condition	= DIA_Addon_Malcom_Lager_Condition;
	information	= DIA_Addon_Malcom_Lager_Info;

	description	= "Où est votre camp ?";
};
func int DIA_Addon_Malcom_Lager_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};
func void DIA_Addon_Malcom_Lager_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_Lager_15_00"); //Où est votre camp ?
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_01"); //Suivez ce chemin, là, vers l'Ouest.
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_02"); //Vous ne tarderez pas à voir Henry.
};

