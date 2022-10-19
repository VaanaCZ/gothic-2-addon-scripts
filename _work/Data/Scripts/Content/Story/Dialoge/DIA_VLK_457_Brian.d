// *****************************************************
// 							EXIT 
// *****************************************************
INSTANCE DIA_Brian_EXIT   (C_INFO)
{
	npc         = VLK_457_Brian;
	nr          = 999;
	condition   = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brian_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Brian_PICKPOCKET (C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 900;
	condition	= DIA_Brian_PICKPOCKET_Condition;
	information	= DIA_Brian_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Brian_PICKPOCKET_Condition()
{
	C_Beklauen (55, 100);
};
 
FUNC VOID DIA_Brian_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Brian_PICKPOCKET);
	Info_AddChoice		(DIA_Brian_PICKPOCKET, DIALOG_BACK 		,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Brian_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Brian_PICKPOCKET);
};
	
func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Brian_PICKPOCKET);
};
// *****************************************************
// 							Hallo 
// *****************************************************
instance DIA_Brian_HALLO		(C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_HALLO_Condition;
	information	= DIA_Brian_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Brian_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Brian_HALLO_04_00"); //Vous venez d'arriver en ville, hein ? Je suis Brian, l'apprenti de maître Harad.
};

// *****************************************************
// 					Wie ist Lehrling? 
// *****************************************************
instance DIA_Brian_AboutLehrling (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_AboutLehrling_Condition;
	information	= DIA_Brian_AboutLehrling_Info;
	permanent 	= FALSE;
	description = "Comment est-ce d'être l'apprenti du forgeron ?";
};

func int DIA_Brian_AboutLehrling_Condition ()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};

func void DIA_Brian_AboutLehrling_Info ()
{
	AI_Output (other, self, "DIA_Brian_AboutLehrling_15_00"); //Qu'est-ce que cela fait, d'être apprenti forgeron ?
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_01"); //Pourquoi cette question ? Vous avez l'intention de prendre ma place ?
	AI_Output (other, self, "DIA_Brian_AboutLehrling_15_02"); //Peut-être.
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_03"); //Pourquoi pas, après tout. J'en ai presque terminé et, à ce moment-là, je compte bien quitter la ville.
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_04"); //Pas à cause d'Harad, non... c'est un bon maître et j'ai énormément appris à son contact.
	
};

// *****************************************************
// 					Warum Stadt verlassen? 
// *****************************************************
instance DIA_Brian_WhyLeave (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_WhyLeave_Condition;
	information	= DIA_Brian_WhyLeave_Info;
	permanent 	= FALSE;
	description = "Pourquoi voulez-vous quitter la ville ?";
};

func int DIA_Brian_WhyLeave_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info ()
{
	AI_Output (other,self , "DIA_Brian_WhyLeave_15_00"); //Pourquoi voulez-vous partir ?
	AI_Output (self,other , "DIA_Brian_WhyLeave_04_00"); //Parce que les habitants de la ville commencent à me porter sur les nerfs, surtout les autres maîtres.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_01"); //Je n'ai pas oublié tout ce qu'il m'a fallu faire pour me faire accepter en tant qu'apprenti d'Harad.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_02"); //Chacun de ces rigolos avait son avis sur le sujet.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_03"); //Mais quand je m'installerai, c'est moi, et moi seul, qui déciderai qui prendre comme apprenti.
};

// *****************************************************
// 						Other Masters
// *****************************************************
instance DIA_Brian_OtherMasters (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_OtherMasters_Condition;
	information	= DIA_Brian_OtherMasters_Info;
	permanent 	= FALSE;
	description = "Qui sont les autres maîtres ?";
};
func int DIA_Brian_OtherMasters_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_WhyLeave))
	&&  (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Brian_Add_15_00"); //Qui sont les autres maîtres ?
	AI_Output (self ,other, "DIA_Brian_Add_04_01"); //Eh bien, il y a Thorben, le charpentier, Bosper, le fabricant d'arcs, Constantino, l'alchimiste, et Mattéo.
	AI_Output (self ,other, "DIA_Brian_Add_04_02"); //Lui vend des armures, mais c'est d'abord et avant tout un marchand.
	AI_Output (self ,other, "DIA_Brian_Add_04_03"); //Tous les maîtres habitent dans cette rue.
	AI_Output (self ,other, "DIA_Brian_Add_04_04"); //La boutique de Constantino se trouve dans le passage sous-jacent menant au temple.
};



// *****************************************************
// 					Über Meister Harad
// *****************************************************
instance DIA_Brian_AboutHarad (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 2;
	condition	= DIA_Brian_AboutHarad_Condition;
	information	= DIA_Brian_AboutHarad_Info;
	permanent 	= FALSE;
	description = "Dites-m'en plus au sujet de maître Harad.";
};

func int DIA_Brian_AboutHarad_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info ()
{
	AI_Output (other, self, "DIA_Brian_AboutHarad_15_00"); //Parlez-moi encore de maître Harad.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_01"); //Il n'est pas de bonne humeur en ce moment.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_02"); //Il faut dire qu'il y a quelques jours, les paladins sont arrivés et lui ont ordonné de forger des épées pour eux.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_03"); //Il lui ont même interdit de vendre des épées à qui que ce soit d'autre !
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_04"); //Alors, depuis, il travaille jour et nuit pour avoir fini le plus vite possible.
};

// *****************************************************
// 					Waffen kaufen?
// *****************************************************
instance DIA_Brian_NEEDWEAPONS		(C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 4;
	condition	= DIA_Brian_NEEDWEAPONS_Condition;
	information	= DIA_Brian_NEEDWEAPONS_Info;
	permanent 	= FALSE;
	description	= "Puis-je vous acheter des armes ?";
};

func int DIA_Brian_NEEDWEAPONS_Condition ()
{
	return TRUE;
};

func void DIA_Brian_NEEDWEAPONS_Info ()
{
	AI_Output (other, self, "DIA_Brian_NEEDWEAPONS_15_00"); //Puis-je vous acheter une arme ?
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_01"); //Pas vraiment, je ne suis qu'un assistant.
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_02"); //Les miliciens viennent chercher les armes fabriquées dans cette forge pour les entreposer dans les tours.
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_03"); //Mais si vous voulez quelque chose qui soit en rapport avec l'art de la forge, je peux peut-être vous aider.
};


// *****************************************************
// 					Schmiede-Stuff kaufen
// *****************************************************

//------------------------------------------------------
var int Brian_Trade_einmal;

instance DIA_Brian_WASKAUFEN		(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 4;
	condition	= DIA_Brian_WASKAUFEN_Condition;
	information	= DIA_Brian_WASKAUFEN_Info;
	permanent	= TRUE;
	description	= "Que pouvez-vous me proposer ?";
	trade		= TRUE;
};

func int DIA_Brian_WASKAUFEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info ()
{
	AI_Output			(other, self, "DIA_Brian_WASKAUFEN_15_00"); //Que pouvez-vous me procurer ?
	B_GiveTradeInv (self);

	if (Npc_IsDead(Harad))
	{
		AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_01"); //J'ai encore quelques billettes en acier. Si vous les voulez, pas de problème. Mais c'est tout ce qu'il me reste, hélas.
		
		if (MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_02"); //La milice m'a à l'œil depuis qu'Harad n'est plus là.
			AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_03"); //Je n'ai pas le droit de continuer à travailler à la forge. J'imagine que les autorités redoutent que je la vende et que je file avec l'argent.
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_05"); //Je peux vous vendre des billettes d'acier.
	};
	
	if (Brian_Trade_Einmal == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"L'assistant d'Harad, Brian, vend des billes d'acier."); 
		Brian_Trade_Einmal = TRUE;
	};
	Npc_RemoveInvItems (self,ItMiSwordblade,Npc_HasItems (self,ItMiSwordblade));
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

INSTANCE DIA_Brian_KAP3_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP3_EXIT_Condition;
	information	= DIA_Brian_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Brian_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_457_Brian;
	nr           = 	8;
	condition	 = 	DIA_Brian_RepairNecklace_Condition;
	information	 = 	DIA_Brian_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pouvez-vous réparer un bijou ?";
};

func int DIA_Brian_RepairNecklace_Condition ()
{
	if 	(
		(MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
		&&	 	(
				(Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
				|| 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE)
				)
		) 
		{
			return TRUE;
		};
};

func void DIA_Brian_RepairNecklace_Info ()
{
	AI_Output (other,self ,"DIA_Brian_RepairNecklace_15_00"); //Vous réparez les bijoux ?
	AI_Output (self	,other,"DIA_Brian_RepairNecklace_04_01"); //Je suis juste un assistant. Déjà, quand j'ai le droit de fabriquer une dague, c'est jour de fête !
	
	if ((Npc_IsDead (Harad))== FALSE)
	{
		AI_Output (self ,other,"DIA_Brian_RepairNecklace_04_02"); //Les bijoux ? Il vous faut voir ça avec le maître.
	};
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
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

INSTANCE DIA_Brian_KAP4_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP4_EXIT_Condition;
	information	= DIA_Brian_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Brian_KAP5_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP5_EXIT_Condition;
	information	= DIA_Brian_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NewLighthouseOfficer
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_NEWLIGHTHOUSEOFFICER		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	51;
	condition	 = 	DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information	 = 	DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;

	description	 = 	"J'ai entendu dire que vous vous intéressiez au vieux phare de Jack.";
};

func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition ()
{
	if (Kapitel == 5)	
	&& (MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	
	&& (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS))
		{
			return TRUE;
		};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info ()
{
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00"); //Je me suis laissé dire que vous étiez intéressé par le phare du vieux Jack.
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01"); //Jack pense sérieusement à reprendre la mer. Le problème, c'est qu'il n'y aurait plus de gardien au phare, alors...
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02"); //Mais Jack doit bien savoir que je transformerai son phare en forge dès qu'il aura le dos tourné, non ?
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03"); //Et alors ? C'est problématique ?
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04"); //(éclate de rire) Pas pour moi ! De toute façon, je sais bien que je n'hériterai jamais de la forge d'Harad. Je ne me fais plus aucune illusion à ce sujet.
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05"); //D'accord. Je vous retrouve chez Jack.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
};


///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	8;
	condition	 = 	DIA_Brian_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"Alors qu'en dites-vous ?";
};

func int DIA_Brian_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01")<1000)
		&& (Kapitel == 5) 
		{
				return TRUE;
		};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Brian_LIGHTHOUSEFREE_15_00"); //Alors, qu'en dites-vous ?
	AI_Output			(self, other, "DIA_Brian_LIGHTHOUSEFREE_04_01"); //Bon sang, quelle pagaille ! Jack ne reconnaîtra pas les lieux quand j'aurai tout arrangé à ma manière...
};






























