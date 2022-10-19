///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Tandor_EXIT   (C_INFO)
{
	npc         = PAL_260_Tandor;
	nr          = 999;
	condition   = DIA_Tandor_EXIT_Condition;
	information = DIA_Tandor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Tandor_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Tandor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Hallo		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	2;
	condition	 = 	DIA_Tandor_Hallo_Condition;
	information	 = 	DIA_Tandor_Hallo_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tandor_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
			return TRUE;
	};
};
func void DIA_Tandor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Tandor_Hallo_08_00"); //Vous avez franchi le col ? Bien joué ! Nous avons déjà perdu beaucoup d'hommes là-bas.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_01"); //Je sais quelle est la situation là-bas. J'ai fait partie d'une unité de reconnaissance pour un temps.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_02"); //Vous avez une arme ? S'il vous en faut une bonne, je suis votre homme.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor vend des armes au château.");
};
///////////////////////////////////////////////////////////////////////
//	Info Spähtrupp
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trupp		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	2;
	condition	 = 	DIA_Tandor_Trupp_Condition;
	information	 = 	DIA_Tandor_Trupp_Info;
	permanent 	 =  FALSE;
	description  =  "Qu'est-il advenu de l'unité ?";
};
func int DIA_Tandor_Trupp_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Tandor_Hallo)
	{
			return TRUE;
	};
};
func void DIA_Tandor_Trupp_Info ()
{
	AI_Output (other, self, "DIA_Tandor_Trupp_15_00"); //Qu'est-il advenu de votre unité ?
	AI_Output (self, other, "DIA_Tandor_Trupp_08_01"); //Nous explorions la région et nous comptions progresser jusqu'à la côte. Nous nous sommes installés dans une grotte pour dormir.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_02"); //Les orques sont arrivés tard dans la nuit. Chargeant au rythme des tambours, ils ont gravi la pente au pas de course avec leurs torches... et ils nous ont découverts.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_03"); //Nous avons bien essayé de fuir, mais moi seul ai réussi à passer.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_04"); //Peu après, ils ont érigé leur grande palissade et je me suis replié sur le château.
};	
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trade		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	900;
	condition	 = 	DIA_Tandor_Trade_Condition;
	information	 = 	DIA_Tandor_Trade_Info;
	permanent 	 =  TRUE;
	trade		 =	TRUE;
	description	 = 	"Montrez-moi vos marchandises.";
};
func int DIA_Tandor_Trade_Condition ()
{
		return TRUE;
};
func void DIA_Tandor_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Tandor_Trade_15_00"); //Montrez-moi vos marchandises.
};		
///////////////////////////////////////////////////////////////////////
//	Info DIA_Tandor_Equipment
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Equipment		(C_INFO)
{
	npc		 	 = 	PAL_260_Tandor;
	nr		 	 =  3;
	condition	 = 	DIA_Tandor_Equipment_Condition;
	information	 = 	DIA_Tandor_Equipment_Info;
	description	 = 	"Garond m'envoie… J'ai besoin d'équipement.";
};

func int DIA_Tandor_Equipment_Condition ()
{
	if  Npc_KnowsInfo (hero, DIA_Garond_Equipment)
	&& (other.guild == GIL_MIL)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Tandor_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_15_00"); //C'est Garond qui m'envoie. J'ai besoin d'équipement.
	AI_Output (self, other, "DIA_Tandor_Equipment_08_01"); //Pour le combat au corps à corps ou à distance ?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Combat au corps à corps.",DIA_Tandor_Equipment_Nah);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Combat à distance.",DIA_Tandor_Equipment_Fern);
};
FUNC VOID DIA_Tandor_Equipment_Nah()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Nah_15_00"); //Pour le corps à corps.
	AI_Output (self, other, "DIA_Tandor_Equipment_Nah_08_01"); //Vous préférez les armes à une ou deux mains ?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Armes à une main.",DIA_Tandor_Equipment_Ein);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Armes à deux mains.",DIA_Tandor_Equipment_Zwei);
};
FUNC VOID DIA_Tandor_Equipment_Fern()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Fern_15_00"); //Pour le combat à distance.
	AI_Output (self, other, "DIA_Tandor_Equipment_Fern_08_01"); //Arc ou arbalète ?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Arc",DIA_Tandor_Equipment_Bow);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Arbalète",DIA_Tandor_Equipment_Crossbow);
};	
FUNC VOID DIA_Tandor_Equipment_Ein()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Ein_15_00"); //Une main.
	AI_Output (self, other, "DIA_Tandor_Equipment_Ein_08_01"); //Alors prenez ce brise-roche. C'est une bonne arme.
	B_GiveInvItems (self,other, ItMw_Steinbrecher,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Zwei()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Zwei_15_00"); //Deux mains.
	AI_Output (self, other, "DIA_Tandor_Equipment_Zwei_08_01"); //Cette épée à deux mains est exactement ce qu'il vous faut.
	B_GiveInvItems (self,other,ItMw_Zweihaender1 ,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Bow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Bow_15_00"); //Arc.
	AI_Output (self, other, "DIA_Tandor_Equipment_Bow_08_01"); //Cette arc de chasse est fait pour vous. Je vais vous donner des flèches.
	B_GiveInvItems (self,other,ItRw_Bow_L_03 ,1);
	B_GiveInvItems (self,other, ItRw_Arrow,50);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Crossbow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Crossbow_15_00"); //Arbalète.
	AI_Output (self, other, "DIA_Tandor_Equipment_Crossbow_08_01"); //Dans ce cas, prenez cette arbalète. Et je peux également vous fournir en carreaux.
	B_GiveInvItems (self,other, ItRw_Crossbow_L_02,1);
	B_GiveInvItems (self,other, ItRw_Bolt,50);
	Info_ClearChoices (DIA_Tandor_Equipment);
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

INSTANCE DIA_Tandor_KAP3_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP3_EXIT_Condition;
	information	= DIA_Tandor_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Tandor_KAP4_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP4_EXIT_Condition;
	information	= DIA_Tandor_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_News		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	40;
	condition	 = 	DIA_Tandor_News_Condition;
	information	 = 	DIA_Tandor_News_Info;
	permanent	 = 	TRUE;
	description	 = 	"Avez-vous des nouvelles ?";
};

func int DIA_Tandor_News_Condition ()
{
	if (Kapitel	== 4)
	&& (Npc_KnowsInfo (hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_News_Info ()
{
	AI_Output (other, self, "DIA_Tandor_News_15_00"); //Quelles sont les nouvelles ?

	if (hero.guild == GIL_DJG)
		{
			AI_Output (self, other, "DIA_Tandor_News_08_01"); //L'arrivée des chasseurs de dragons est la seule chose qui se soit produite récemment.
		}
	else
		{
			AI_Output (self, other, "DIA_Tandor_News_08_02"); //Les chasseurs de dragons sont arrivés.
			AI_Output (self, other, "DIA_Tandor_News_08_03"); //Ça m'a l'air d'être des durs. Et j'espère qu'ils le sont, sans quoi ils ne survivront pas longtemps.
		};
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

INSTANCE DIA_Tandor_KAP5_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP5_EXIT_Condition;
	information	= DIA_Tandor_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_WASISTLOS		(C_INFO)
{
	npc		 = 	PAL_260_Tandor;
	nr		 = 	51;
	condition	 = 	DIA_Tandor_WASISTLOS_Condition;
	information	 = 	DIA_Tandor_WASISTLOS_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous n'avez pas l'air joyeux.";
};

func int DIA_Tandor_WASISTLOS_Condition ()
{
	if (Kapitel == 5)	
		&& (Npc_KnowsInfo (hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_WASISTLOS_Info ()
{
	AI_Output			(other, self, "DIA_Tandor_WASISTLOS_15_00"); //Vous n'avez guère l'air heureux...

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_01"); //Les orques vont continuer d'affluer jusqu'à ce que nous soyons tous morts.
	}
	else
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_02"); //Cela fait des semaines que nous n'avons pas eu de vrai repas. Je meurs de faim.
	};
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


INSTANCE DIA_Tandor_KAP6_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP6_EXIT_Condition;
	information	= DIA_Tandor_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Tandor_PICKPOCKET (C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 900;
	condition	= DIA_Tandor_PICKPOCKET_Condition;
	information	= DIA_Tandor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Tandor_PICKPOCKET_Condition()
{
	C_Beklauen (47, 90);
};
 
FUNC VOID DIA_Tandor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Tandor_PICKPOCKET);
	Info_AddChoice		(DIA_Tandor_PICKPOCKET, DIALOG_BACK 		,DIA_Tandor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Tandor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Tandor_PICKPOCKET_DoIt);
};

func void DIA_Tandor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Tandor_PICKPOCKET);
};
	
func void DIA_Tandor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Tandor_PICKPOCKET);
};







































