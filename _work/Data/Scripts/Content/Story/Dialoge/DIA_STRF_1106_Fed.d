///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fed_EXIT   (C_INFO)
{
	npc         = STRF_1106_Fed;
	nr          = 999;
	condition   = DIA_Fed_EXIT_Condition;
	information = DIA_Fed_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_HALLO		(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  2;
	condition	 = 	DIA_Fed_HALLO_Condition;
	information	 = 	DIA_Fed_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};

func int DIA_Fed_HALLO_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Fed_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Fed_HALLO_08_00"); //Qu'est-ce que vous me voulez ? Je ne bougerai pas d'ici !
	AI_Output (other, self, "DIA_Fed_HALLO_15_01"); //Du calme. Détendez-vous, personne ne veut que vous alliez quelque part.
	AI_Output (self, other, "DIA_Fed_HALLO_08_02"); //Innos soit loué. Vous savez, au cours des derniers jours, plusieurs hommes ont quitté le camp... et aucun n'est revenu.
	AI_Output (self, other, "DIA_Fed_HALLO_08_03"); //Tous se sont fait dévorer par les saurinides. Mais pas moi. Oh, non ! Moi, je reste là jusqu'à ce que tout ça soit fini.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Snapper	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  3;
	condition	 = 	DIA_Fed_Snapper_Condition;
	information	 = 	DIA_Fed_Snapper_Info;
	permanent	 =  FALSE;
	description	 = 	"Que savez-vous au sujet des saurinides ?";
};
func int DIA_Fed_Snapper_Condition ()
{	
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fed_Snapper_Info ()
{
	AI_Output (other, self, "DIA_Fed_Snapper_15_00"); //Que savez-vous au sujet des saurinides ?
	AI_Output (self, other, "DIA_Fed_Snapper_08_01"); //Bilgot les surveille à la nuit tombée. Il y en a quelques-uns au niveau du bassin qui s'étend au pied de la tour noire.
	AI_Output (self, other, "DIA_Fed_Snapper_08_02"); //Les autres sont au-dessus de nous, au sommet de la falaise. Ils attendent juste que nous soyons épuisés.
	AI_Output (self, other, "DIA_Fed_Snapper_08_03"); //Nous sommes pris au piège ici. Bientôt, ils attaqueront notre campement... et ce sera un carnage.
	AI_Output (other, self, "DIA_Fed_Snapper_15_04"); //Je vois.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Perm	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  5;
	condition	 = 	DIA_Fed_Perm_Condition;
	information	 = 	DIA_Fed_Perm_Info;
	permanent	 =  TRUE;
	description	 = 	"Etes-vous fou ?";
};
func int DIA_Fed_Perm_Condition ()
{	
		return TRUE;
};
func void DIA_Fed_Perm_Info ()
{
	AI_Output (other, self, "DIA_Fed_Perm_15_00"); //Vous allez bien ?
	
	if (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_01"); //Les saurinides sont là, tout près. Vous les sentez ? Moi, oui.
	}
	else 
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_02"); //On dirait que les saurinides se sont repliés. Mais ça ne veut rien dire. Ils reviendront. Ou si ce n'est pas eux, ce sera les loups, les lézards ou les orques.
		AI_Output (self, other, "DIA_Fed_Perm_08_03"); //Un jour ou l'autre, ils nous tueront et se repaîtront de nos dépouilles.
	};
	AI_StopProcessInfos(self);
	

};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fed_PICKPOCKET (C_INFO)
{
	npc			= STRF_1106_Fed;
	nr			= 900;
	condition	= DIA_Fed_PICKPOCKET_Condition;
	information	= DIA_Fed_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fed_PICKPOCKET_Condition()
{
	C_Beklauen (32, 8);
};
 
FUNC VOID DIA_Fed_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fed_PICKPOCKET);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_BACK 		,DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};
	
func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};




















