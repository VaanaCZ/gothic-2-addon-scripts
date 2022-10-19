// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Udar_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_EXIT_Condition;
	information	= DIA_Udar_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Udar_EXIT_Condition()
{
	if (Kapitel < 4)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Udar_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Udar_Hello (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 2;
	condition	= DIA_Udar_Hello_Condition;
	information	= DIA_Udar_Hello_Info;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Udar_Hello_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 4)
	{	
		return TRUE;
	}; 
};
FUNC VOID DIA_Udar_Hello_Info()
{	
	AI_Output	(self ,other,"DIA_Udar_Hello_09_00");//Vous avez vraiment une veine de pendu�! J'ai failli vous abattre quand vous �tes entr�!
	AI_Output	(other,self ,"DIA_Udar_Hello_15_01");//Dans ce cas, je peux m'estimer heureux que vous ayez une si bonne vue...
	AI_Output	(self ,other,"DIA_Udar_Hello_09_02");//Inutile de gaspiller votre salive. Si vous voulez quelque chose, c'est Sengrath qu'il vous faut aller voir.
	
	AI_StopProcessInfos (self);
};
//***************************************
//	Armbrustlehrer	
//***************************************

INSTANCE DIA_Udar_YouAreBest (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_YouAreBest_Condition;
	information	= DIA_Udar_YouAreBest_Info;
	permanent	= FALSE;
	Description = "J'ai entendu dire que vous �tiez le MEILLEUR arbal�trier.";
};                       

FUNC INT DIA_Udar_YouAreBest_Condition()
{
	IF (Npc_KnowsInfo (other,DIA_Keroloth_Udar))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_YouAreBest_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_YouAreBest_15_00");	//J'ai entendu dire que vous �tiez le meilleur arbal�trier de la r�gion.
	AI_Output	(self ,other,"DIA_Udar_YouAreBest_09_01");	//Si on le dit, c'est s�rement vrai. Qu'est-ce que vous me voulez�?
};

//***********************************
//	Bring wir was bei!
//***********************************

INSTANCE DIA_Udar_TeachMe (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_TeachMe_Condition;
	information	= DIA_Udar_TeachME_Info;
	permanent	= FALSE;
	Description = "Apprenez-moi � me servir d'une arbal�te.";
};                       

FUNC INT DIA_Udar_TeachMe_Condition()
{
	IF ((Npc_KnowsInfo (other,DIA_Udar_YouAreBest))
	&& (Udar_TeachPlayer != TRUE))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_TeachME_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Teacher_15_00");	//Apprenez-moi � me servir d'une arbal�te.
	AI_Output	(self ,other,"DIA_Udar_Teacher_09_01");	//Fichez-moi le camp�! Il y a bien assez de cibles mouvantes autour du ch�teau pour vous permettre de vous entra�ner tout seul.

};	

//***********************************
//	Ich bin auch nicht schlecht!
//***********************************

INSTANCE DIA_Udar_ImGood (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_ImGood_Condition;
	information	= DIA_Udar_ImGood_Info;
	permanent	= FALSE;
	Description = "Je suis le plus grand.";
};                       

FUNC INT DIA_Udar_ImGood_Condition()
{
	IF (Npc_KnowsInfo (other,DIA_Udar_YouAreBest))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_ImGood_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_ImGood_15_00");	//Je suis le meilleur.
	AI_Output	(self ,other,"DIA_Udar_ImGood_09_01");	//(�clate de rire) Vous me plaisez, vous�!
	AI_Output	(self ,other,"DIA_Udar_ImGood_09_02");	//Tr�s bien, si vous d�sirez apprendre, je suis d'accord pour vous aider.
	
	Udar_TeachPlayer = TRUE;
	B_LogEntry		(TOPIC_Teacher_OC, "Udar peut m'apprendre � utiliser les arbal�tes."); 
};

//***********************************
//	Bring mir was bei
//***********************************

INSTANCE DIA_Udar_Teach (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_Teach_Condition;
	information	= DIA_Udar_Teach_Info;
	permanent	= TRUE;
	Description = "Je veux que vous m'appreniez.";
};                       

FUNC INT DIA_Udar_Teach_Condition()
{
	IF (Udar_TeachPlayer== TRUE)
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_Teach_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Teach_15_00");	//Je souhaiterais b�n�ficier de votre enseignement.
	AI_Output	(self ,other,"DIA_Udar_Teach_09_01");   //Allez-y, tirez�!
	
	Info_ClearChoices (DIA_Udar_Teach);
	
	Info_AddChoice		(DIA_Udar_Teach,DIALOG_BACK,DIA_Udar_Teach_Back);
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))			,DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Udar_Teach_CROSSBOW_5);
};

FUNC VOID DIA_Udar_Teach_BACK()
{
	Info_ClearChoices (DIA_Udar_Teach);
};

FUNC VOID B_Udar_TeachNoMore1 ()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00"); //Vous connaissez d�j� les bases, mais nous n'avons pas le temps d'aller plus loin.
};

FUNC VOID B_Udar_TeachNoMore2 ()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00"); //Si vous voulez vous am�liorer, il va vous falloir trouver un autre mentor.
};

FUNC VOID DIA_Udar_Teach_Crossbow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 60);
	
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1 ();
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2 ();
		};
	};
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))			,DIA_Udar_Teach_Crossbow_1);
};

FUNC VOID DIA_Udar_Teach_Crossbow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 60);
	
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1 ();
	
		if (Npc_GetTalentSkill (other, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2 ();
		};
	};
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Udar_Teach_Crossbow_5);
};
//***********************************
//	Perm
//***********************************

INSTANCE DIA_Udar_Perm (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 11;
	condition	= DIA_Udar_Perm_Condition;
	information	= DIA_Udar_Perm_Info;
	permanent	= FALSE;
	Description = "Comment �a va au ch�teau ?";
};                       
FUNC INT DIA_Udar_Perm_Condition()
{
	if (Kapitel <= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_Perm_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Perm_15_00");	//Comment �a va au ch�teau�?
	AI_Output	(self ,other,"DIA_Udar_Perm_09_01");	//Quelques soldats s'entra�nent, mais nous attendons surtout que la situation �volue.
	AI_Output	(self ,other,"DIA_Udar_Perm_09_02");	//L'incertitude nous mine peu � peu le moral. C'est la strat�gie que les orques ont d�cid� d'employer�: attendre jusqu'� ce que nous craquions.
};	
//***********************************
//	Ring 
//***********************************

INSTANCE DIA_Udar_Ring (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 11;
	condition	= DIA_Udar_Ring_Condition;
	information	= DIA_Udar_Ring_Info;
	permanent	= FALSE;
	Description = "Je vous ai apport� l'anneau de Tengron...";
};                       
FUNC INT DIA_Udar_Ring_Condition()
{
	if (Npc_HasItems (other,ItRi_Tengron) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_Ring_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Ring_15_00");	//Tenez, voici l'anneau de Tengron, il est cens� vous prot�ger. Il m'a dit qu'il viendrait le r�cup�rer � son retour.
	AI_Output	(self ,other,"DIA_Udar_Ring_09_01");	//Quoi�? Savez-vous ce qu'est cet anneau�? Tengron l'a re�u en r�compense apr�s avoir montr� sa bravoure au combat.
	AI_Output	(self ,other,"DIA_Udar_Ring_09_02");	//Vous dites qu'il a l'intention de le r�cup�rer�? Dans ce cas, il le r�cup�rera en effet... Si Innos le veut...
	
	B_GiveInvItems (other,self,ItRi_Tengron,1);
	TengronRing = TRUE;
	B_GivePlayerXP (XP_TengronRing);
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

INSTANCE DIA_Udar_KAP4_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP4_EXIT_Condition;
	information	= DIA_Udar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP4_EXIT_Condition()
{
	if	(Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Kap4WiederDa		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	40;
	condition	 = 	DIA_Udar_Kap4WiederDa_Condition;
	information	 = 	DIA_Udar_Kap4WiederDa_Info;
	important	 = 	TRUE;
};

func int DIA_Udar_Kap4WiederDa_Condition ()
{
	if	(Kapitel >= 4)	
		{
				return TRUE;
		};
};

func void DIA_Udar_Kap4WiederDa_Info ()
{
	AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_00"); //C'est bon que vous soyez l�. L'enfer se d�cha�ne, ici...

	if (hero.guild != GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Udar_Kap4WiederDa_15_01"); //Que s'est-il pass� ?
		AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_02"); //Les chasseurs de dragons se pavanent comme des paons en se vantant d'�tre capable de r�soudre le probl�me pos� par les dragons.
		AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_03"); //Mais je vais vous dire... � les voir, �a m'�tonnerait qu'ils soient capables de tuer un saurinide asthmatique...
	};

	AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_04"); //Beaucoup d'entre nous commencent s�rieusement � s'inqui�ter et � se dire que nous n'en sortirons jamais en vie.
};

///////////////////////////////////////////////////////////////////////
//	Info Sengrath
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Sengrath		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	41;
	condition	 = 	DIA_Udar_Sengrath_Condition;
	information	 = 	DIA_Udar_Sengrath_Info;

	description	 = 	"N'y avait-il pas deux sentinelles ici ?";
};

func int DIA_Udar_Sengrath_Condition ()
{
	if	(Kapitel >= 4)	
		&& (Npc_KnowsInfo(other, DIA_Udar_Kap4WiederDa))
		&& (Sengrath_Missing == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Udar_Sengrath_Info ()
{
	AI_Output			(other, self, "DIA_Udar_Sengrath_15_00"); //Vous n'�tiez pas deux sentinelles ici la derni�re fois�?
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_01"); //Plus maintenant. Sengrath �tait l�, sur les remparts, quand il s'est endormi.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_02"); //Evidemment, il a laiss� son arbal�te tomber.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_03"); //Aussit�t, un orque a jailli, s'en est saisi et est reparti avec.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_04"); //Sengrath s'est �lanc� � sa suite en pleine nuit, en direction de la palissade ennemie. Il n'en est pas revenu.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_05"); //Innos nous garde�!

	Log_CreateTopic (TOPIC_Sengrath_Missing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing, LOG_RUNNING);
	B_LogEntry (TOPIC_Sengrath_Missing,"Udar, le garde du ch�teau, s'inqui�te de la disparition de son compagnon Sengrath. La derni�re fois qu'il l'a vu, c'�tait la nuit derni�re et il se dirigeait vers la palissade des orques pour r�cup�rer son arbal�te."); 
};


///////////////////////////////////////////////////////////////////////
//	Info SENGRATHgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_SENGRATHGEFUNDEN		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	42;
	condition	 = 	DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information	 = 	DIA_Udar_SENGRATHGEFUNDEN_Info;

	description	 = 	"J'ai trouv� Sengrath.";
};

func int DIA_Udar_SENGRATHGEFUNDEN_Condition ()
{
	if	(Kapitel >= 4)	
		&& (Npc_KnowsInfo(other, DIA_Udar_Sengrath))
		&& (Npc_HasItems (other,ItRw_SengrathsArmbrust_MIS))
		{
				return TRUE;
		};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info ()
{
	AI_Output			(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_00"); //J'ai retrouv� Sengrath.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_01"); //C'est vrai�? O� est-il�?
	AI_Output			(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_02"); //Il est mort. Voici son arbal�te. Il l'avait sur lui.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_03"); //Il a d� la r�cup�rer, mais les orques ont quand m�me r�ussi � le tuer.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_04"); //Quel idiot�! Je le savais. Nous allons tous mourir...

	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP (XP_SengrathFound);
};

///////////////////////////////////////////////////////////////////////
//	Info BadFeeling
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_BADFEELING		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	50;
	condition	 = 	DIA_Udar_BADFEELING_Condition;
	information	 = 	DIA_Udar_BADFEELING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Udar_BADFEELING_Condition ()
{
		if 	(Npc_RefuseTalk(self) == FALSE)
			&& (Npc_IsInState (self,ZS_Talk))
			&& (Npc_KnowsInfo(other, DIA_Udar_SENGRATHGEFUNDEN))
			&& (Kapitel >= 4)	
		{
				return TRUE;
		};			
};

func void DIA_Udar_BADFEELING_Info ()
{
	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_00"); //Encore une attaque de l�che comme celle-l� et nous sommes fichus.
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_01"); //Les orques sont inquiets. Quelque chose leur a flanqu� la frousse, je le sens.
	}
	else 
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_02"); //J'ai un mauvais pressentiment...
	};
	
	Npc_SetRefuseTalk (self,30);
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

INSTANCE DIA_Udar_KAP5_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP5_EXIT_Condition;
	information	= DIA_Udar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Udar_KAP6_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP6_EXIT_Condition;
	information	= DIA_Udar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Udar_PICKPOCKET (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 900;
	condition	= DIA_Udar_PICKPOCKET_Condition;
	information	= DIA_Udar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Udar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 15);
};
 
FUNC VOID DIA_Udar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Udar_PICKPOCKET);
	Info_AddChoice		(DIA_Udar_PICKPOCKET, DIALOG_BACK 		,DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Udar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Udar_PICKPOCKET);
};
	
func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Udar_PICKPOCKET);
};



































