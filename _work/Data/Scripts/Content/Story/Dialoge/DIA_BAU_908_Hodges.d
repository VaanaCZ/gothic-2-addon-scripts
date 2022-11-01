//##################################################
//##
//##	Kapitel 1
//##
//##################################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Hodges_Kap1_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap1_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap1_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap1_EXIT_Condition ()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};

func void DIA_Hodges_Kap1_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Hodges_HALLO		(C_INFO)
{
	npc		 	= BAU_908_Hodges;
	nr		 	= 1;
	condition	= DIA_Hodges_HALLO_Condition;
	information	= DIA_Hodges_HALLO_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hodges_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Hodges_HALLO_15_00"); //Bonjour, je suis nouveau.
	AI_Output (self, other, "DIA_Hodges_HALLO_03_01"); //Ne le prenez pas mal mais je ne suis pas d'humeur à papoter. Je suis complètement débordé.
	AI_Output (other, self, "DIA_Hodges_HALLO_15_02"); //Vous êtes très occupé, hein ?
	AI_Output (self, other, "DIA_Hodges_HALLO_03_03"); //On peut dire ça. Bennet fabrique tant d'armes que je n'arrive pas à les polir toutes.
};

// ************************************************************
// 			  				 About Farm
// ************************************************************
instance DIA_Hodges_TellAboutFarm	(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	2;
	condition	 = 	DIA_Hodges_TellAboutFarm_Condition;
	information	 = 	DIA_Hodges_TellAboutFarm_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Que pouvez-vous me dire au sujet de la ferme ?";
};

func int DIA_Hodges_TellAboutFarm_Condition ()
{
	if ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};	
};

func void DIA_Hodges_TellAboutFarm_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_TellAboutFarm_15_00"); //Que pouvez-vous me dire au sujet de la ferme ?
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_01"); //C'est la ferme d'Onar.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_02"); //Ce grand bâtiment est sa maison. Il a libéré une aile pour les mercenaires.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_03"); //Depuis, nous autres les fermiers, on doit s'entasser dans la grange.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_04"); //(rapidement) Mais ça me va, c'est rassurant d'avoir des gens qui protègent la ferme.
	
	if (Npc_GetDistToWP (self, "NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_05"); //Ce bâtiment-ci, c'est les cuisines.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_06"); //Les cuisines sont dans le bâtiment en face de la forge.
	};
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_07"); //Avec un peu de chance, Thékla aura quelque chose à manger pour vous.
};

// ************************************************************
// 			  				   AboutSld 
// ************************************************************
instance DIA_Hodges_AboutSld	(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	2;
	condition	 = 	DIA_Hodges_AboutSld_Condition;
	information	 = 	DIA_Hodges_AboutSld_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Et en ce qui concerne les mercenaires ?";
};

func int DIA_Hodges_AboutSld_Condition ()
{
	if (hero.guild != GIL_SLD) 
	&& (hero.guild != GIL_DJG)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_AboutSld_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_AboutSld_15_00"); //Et en ce qui concerne les mercenaires ?
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_01"); //Onar les a engagés pour nous débarrasser de la milice.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_02"); //Mais ils protègent aussi la ferme, les moutons et les fermiers.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_03"); //Alors ne songez même pas à voler quoi que ce soit ou à trifouiller dans la malle de quelqu'un.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_04"); //Ils n'attendent qu'une occasion pour vous faire une grosse tête.
};

// ************************************************************
// 			  				   TRADE 
// ************************************************************
instance DIA_Hodges_TRADE	(C_INFO)
{
	npc			= BAU_908_Hodges;
	nr			= 2;
	condition	= DIA_Hodges_TRADE_Condition;
	information	= DIA_Hodges_TRADE_Info;
	permanent 	= TRUE;
	description	= "Puis-je vous acheter des armes ?";
	trade		= TRUE;
};

func int DIA_Hodges_TRADE_Condition ()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info ()
{	
	AI_Output (other, self ,"DIA_Hodges_TRADE_15_00"); //Puis-je vous acheter une arme ?
	AI_Output (self, other, "DIA_Hodges_TRADE_03_01"); //Je n'en ai pas beaucoup. Presque toutes les épées et les haches sont dans la maison d'Onar.
	
	Npc_RemoveInvItems (self,ItMiSwordblade,Npc_HasItems (self,ItMiSwordblade));
};


//##################################################
//##
//##	Kapitel 2
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap2_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap2_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap2_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap2_EXIT_Condition ()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap2_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

//##################################################
//##
//##	Kapitel 3
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap3_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap3_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap3_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap3_EXIT_Condition ()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap3_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Warum arbeitest du nicht?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_DontWork		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	31;
	condition	 = 	DIA_Hodges_DontWork_Condition;
	information	 = 	DIA_Hodges_DontWork_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Pourquoi ne travaillez-vous pas ?";
};

func int DIA_Hodges_DontWork_Condition ()
{
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_DontWork_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_DontWork_15_00"); //Pourquoi ne travaillez-vous pas ?
	AI_Output (self ,other,"DIA_Hodges_DontWork_03_01"); //Vous n'êtes pas au courant ? Les paladins ont arrêté Bennet.

	MIS_RescueBennet = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet le forgeron a été arrêté par les paladins de la ville."); 

};

///////////////////////////////////////////////////////////////////////
//	Was ist passiert?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_WhatHappened		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	31;
	condition	 = 	DIA_Hodges_WhatHappened_Condition;
	information	 = 	DIA_Hodges_WhatHappened_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Que s'est-il passé ?";
};

func int DIA_Hodges_WhatHappened_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_WhatHappened_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_WhatHappened_15_00"); //Que s'est-il passé ?
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_01"); //Eh bien, nous étions en ville pour faire des courses quand nous avons entendu un hurlement. Quelqu'un a crié : ils sont là, attrapez-les !
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_02"); //J'ai eu la peur de ma vie ! J'ai pris mes jambes à mon cou et j'ai détalé comme si tous les démons de l'enfer étaient à mes trousses.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_03"); //Bennet était juste derrière moi. J'ignore ce qui s'est passé mais quand je suis sorti de la ville, il avait disparu.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_04"); //J'ai dû le perdre en ville.
};

///////////////////////////////////////////////////////////////////////
//	Weswegen wurde Bennet denn verhaftet?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetsCrime			(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	32;
	condition	 = 	DIA_Hodges_BennetsCrime_Condition;
	information	 = 	DIA_Hodges_BennetsCrime_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Alors pourquoi Bennet a-t-il été arrêté ?";
};

func int DIA_Hodges_BennetsCrime_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetsCrime_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_00"); //Alors pourquoi Bennet a-t-il été arrêté ?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_01"); //Pour meurtre ! Bennet est accusé d'avoir assassiné un paladin. Quelle ineptie ! Je suis resté avec lui tout le temps.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_02"); //Alors pourquoi ne pas aller en ville et expliquer toute l'affaire ?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_03"); //Ils me jetteraient en prison comme complice. Nan, je n'irai pas, pas en ce moment avec ce qui se passe.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_04"); //Ce qui se passe ?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_05"); //Vous savez... Onar et la ville... tout ça va mal finir.

	B_LogEntry (TOPIC_RESCUEBENNET,"Ils disent que Bennet a assassiné un paladin. Hodges, son apprenti, dit qu'il est innocent mais il n'ose pas entrer en ville."); 
};


///////////////////////////////////////////////////////////////////////
//	Wie reagieren die Söldner?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetAndSLD			(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	33;
	condition	 = 	DIA_Hodges_BennetAndSLD_Condition;
	information	 = 	DIA_Hodges_BennetAndSLD_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Comment ont réagi les mercenaires de la ferme ?";
};

func int DIA_Hodges_BennetAndSLD_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetAndSLD_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_00"); //Comment ont réagit les mercenaires à la ferme ?
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_01"); //J'ignore ce qu'ils envisagent de faire mais certains d'entre eux sont vraiment furieux.
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_02"); //Je le comprends aisément.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_03"); //Si cela ne dépendait que d'eux, ils attaqueraient la ville tout de suite pour libérer Bennet.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_04"); //Allez voir Lee, peut-être que vous pouvez faire quelque chose.
};
//##################################################
//##
//##	Kapitel 4
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap4_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap4_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap4_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap4_EXIT_Condition ()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap4_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

//##################################################
//##
//##	Kapitel 5
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap5_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap5_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap5_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap5_EXIT_Condition ()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap5_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hodges_PICKPOCKET (C_INFO)
{
	npc			= BAU_908_Hodges;
	nr			= 900;
	condition	= DIA_Hodges_PICKPOCKET_Condition;
	information	= DIA_Hodges_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Hodges_PICKPOCKET_Condition()
{
	C_Beklauen (15, 10);
};
 
FUNC VOID DIA_Hodges_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hodges_PICKPOCKET);
	Info_AddChoice		(DIA_Hodges_PICKPOCKET, DIALOG_BACK 		,DIA_Hodges_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hodges_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hodges_PICKPOCKET_DoIt);
};

func void DIA_Hodges_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};
	
func void DIA_Hodges_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};




