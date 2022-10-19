///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Engrom_EXIT   (C_INFO)
{
	npc         = VLK_4131_Engrom;
	nr          = 999;
	condition   = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Engrom_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_HALLO		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr          = 5;
	condition	 = 	DIA_Engrom_HALLO_Condition;
	information	 = 	DIA_Engrom_HALLO_Info;

	description	 = 	"Qu'y a-t-il?";
};

func int DIA_Engrom_HALLO_Condition ()
{
	if (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Engrom_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Engrom_HALLO_15_00"); //Comment ça se passe ?
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_01"); //Mal !
	AI_Output			(other, self, "DIA_Engrom_HALLO_15_02"); //Hmm...
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_03"); //Que voulez-vous que je vous dise d'autre ? Ça fait plusieurs jours que je ne fais que descendre et remonter cette fichue rivière !
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_04"); //Les orques à gauches, les brigands à droite, et rien d'autre à manger que de la viande de guetteur ! Je n'en peux vraiment plus !
};

///////////////////////////////////////////////////////////////////////
//	Info WhatAboutLeaving
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_WhatAboutLeaving		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr          = 6;
	condition	 = 	DIA_Engrom_WhatAboutLeaving_Condition;
	information	 = 	DIA_Engrom_WhatAboutLeaving_Info;

	description	 = 	"N'avez-vous jamais envisagé de partir d'ici ?";
};

func int DIA_Engrom_WhatAboutLeaving_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Engrom_HALLO))
	&& (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Engrom_WhatAboutLeaving_Info ()
{
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_00"); //Vous avez déjà pensé à partir d'ici ?
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_01"); //Ben voyons. Aucun problème...
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_02"); //Pour commencer, je me fraye un passage au milieu de toutes ces hordes d'orques, puis je fais un petit coucou à tous les autres monstres qui rôdent dans le coin, et je termine en franchissant le col en sifflotant.
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_03"); //Pas mal, hein ?
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_04"); //Je suis bien arrivé jusqu'ici moi.
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_05"); //Vous voulez dire que vous avez franchi le col ?
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_06"); //Plus ou moins, oui.
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_07"); //Alors, vous avez eu beaucoup de chance. Mais moi, hors de question que je bouge de là tant que c'est autant la pagaille.

};

///////////////////////////////////////////////////////////////////////
//	Info Jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_Jagd		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr          = 6;
	condition	 = 	DIA_Engrom_Jagd_Condition;
	information	 = 	DIA_Engrom_Jagd_Info;
	permanent	 = 	TRUE;

	description	 = 	"Comment va la chasse ?";
};

func int DIA_Engrom_Jagd_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Engrom_HALLO))
	&& (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Engrom_Jagd_Info ()
{
	B_WasMachtJagd ();
	//Joly:AI_Output			(other, self, "DIA_Engrom_Jagd_15_00"); //Schon mal dran gedacht, hier abzuhauen?
	AI_Output			(self, other, "DIA_Engrom_Jagd_12_01"); //La chasse est ma seule consolation, mais j'aimerais bien trouver un de ces jours un autre gibier que ces saletés de guetteurs.
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Engrom_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP3_EXIT_Condition;
	information	= DIA_Engrom_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Engrom_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP4_EXIT_Condition;
	information	= DIA_Engrom_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_B_NpcObsessedByDMT		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr		 = 	32;
	condition	 = 	DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information	 = 	DIA_Engrom_B_NpcObsessedByDMT_Info;

	description	 = 	"Tout va bien ?";
};

func int DIA_Engrom_B_NpcObsessedByDMT_Condition ()
{
	if (NpcObsessedByDMT_Engrom == FALSE)
	&& (Kapitel >= 4)	
	 {
				return TRUE;
	 };
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info ()
{
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bessen
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_BESSEN		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr		 = 	55;
	condition	 = 	DIA_Engrom_BESSEN_Condition;
	information	 = 	DIA_Engrom_BESSEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous êtes possédé par le Mal.";
};

func int DIA_Engrom_BESSEN_Condition ()
{
 	if (NpcObsessedByDMT_Engrom == TRUE)
 	&& (NpcObsessedByDMT == FALSE)
	&& (Kapitel >= 4)	
	 {
				return TRUE;
	 };
};

func void DIA_Engrom_BESSEN_Info ()
{
	AI_Output			(other, self, "DIA_Engrom_BESSEN_15_00"); //Le mal a pris possession de vous.

	AI_Output			(other, self, "DIA_Engrom_BESSEN_15_01"); //Laissez-moi vous aider...
	AI_Output			(self, other, "DIA_Engrom_BESSEN_12_02"); //(hurle) Ne me touchez pas !

	B_NpcClearObsessionByDMT (self);
		
	Npc_SetTarget 		(self, other);
	
	self.aivar[AIV_INVINCIBLE] = FALSE; //HACK, weil durch AI_StartState (böse) Flag nicht zurückgesetzt wird 
	other.aivar[AIV_INVINCIBLE] = FALSE;
			
	AI_StartState 		(self, ZS_Flee, 0, "");	
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Engrom_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP5_EXIT_Condition;
	information	= DIA_Engrom_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Engrom_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP6_EXIT_Condition;
	information	= DIA_Engrom_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Engrom_PICKPOCKET (C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 900;
	condition	= DIA_Engrom_PICKPOCKET_Condition;
	information	= DIA_Engrom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Engrom_PICKPOCKET_Condition()
{
	C_Beklauen (10, 5);
};
 
FUNC VOID DIA_Engrom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Engrom_PICKPOCKET);
	Info_AddChoice		(DIA_Engrom_PICKPOCKET, DIALOG_BACK 		,DIA_Engrom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Engrom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Engrom_PICKPOCKET_DoIt);
};

func void DIA_Engrom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Engrom_PICKPOCKET);
};
	
func void DIA_Engrom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Engrom_PICKPOCKET);
};


