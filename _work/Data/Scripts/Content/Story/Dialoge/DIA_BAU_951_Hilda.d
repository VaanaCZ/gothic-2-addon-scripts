///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hilda_EXIT   (C_INFO)
{
	npc         = BAU_951_Hilda;
	nr          = 999;
	condition   = DIA_Hilda_EXIT_Condition;
	information = DIA_Hilda_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hilda_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Hilda_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_Hallo (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_Hallo_Condition;
	information	= DIA_Hilda_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hilda_Hallo_Condition ()
{
	if (MIS_Lobart_Rueben != LOG_SUCCESS)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_Hallo_Info ()
{
	if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_Hallo_17_00"); //Eh ! Qui vous a invité ? Sortez de cette maison tout de suite. N'espérez aucune aumône ici.
		}
	else
		{
			AI_Output (self, other, "DIA_Hilda_Hallo_17_01"); //Oui, qu'y a-t-il ?
		};
		
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Was zu essen? 		(PERM)
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_WasZuEssen (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_WasZuEssen_Condition;
	information	= DIA_Hilda_WasZuEssen_Info;
	permanent	= TRUE;
	description = "Pouvez-vous m'offrir quelque chose à manger ?";
};

func int DIA_Hilda_WasZuEssen_Condition ()
{
	if ( (Npc_KnowsInfo (other, DIA_Hilda_Hallo)) || (MIS_Lobart_Rueben == LOG_SUCCESS) )
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_WasZuEssen_Info ()
{
	if (hero.guild == GIL_NONE)
		{
			var int Rueben_TagNull;
			
			AI_Output (other, self, "DIA_Hilda_WasZuEssen_15_00"); //Pouvez-vous me donner quelque chose à manger ?
				
			if (MIS_Lobart_Rueben == LOG_SUCCESS)
				{
					if (! Npc_KnowsInfo (other, DIA_Hilda_PfanneTooLate))
					{
						if (Hilda_Stew_Day != Wld_GetDay())
						{
							B_GiveInvItems (self, other, ItFo_Stew, 1);
						
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_01"); //Prenez ceci. Vous êtes un bon gars.
						
							Hilda_Stew_Day = Wld_GetDay();
						}
						
						else if (Wld_GetDay() == 0)
						&& 		(Rueben_TagNull == FALSE)
						{
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_02"); //Vous pourrez revenir demain pour en avoir encore.
							B_GiveInvItems (self, other, ItFo_Stew, 1);
							Hilda_Stew_Day = Wld_GetDay();
							Rueben_TagNull = TRUE;
							
							Log_CreateTopic (Topic_Bonus,LOG_NOTE);
							B_LogEntry (Topic_Bonus,"Chaque jour, Hilda peut me donner du ragoût de navets.");
						}
						else //heute schon bekommen
						{
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_03"); //Vous avez eu votre portion pour aujourd'hui ! Revenez plus tard.
						};
					}
					else //Pfanne zu spät
					{
						AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_04"); //On ne nourrit pas les paresseux ici. Allez-vous-en !
						AI_StopProcessInfos (self); 
					};
				}
				else
				{
					AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_05"); //Seuls ceux qui travaillent ici peuvent avoir à manger !
				};
		}
	else
		{
			AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_06"); //Je suis certaine que vous avez assez d'argent pour vous acheter à manger en ville.
		};
};


///////////////////////////////////////////////////////////////////////
//	Rüben bringen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_BringBeet (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 1;
	condition	= DIA_Hilda_BringBeet_Condition;
	information	= DIA_Hilda_BringBeet_Info;
	permanent	= FALSE;
	description	= "J'ai quelques navets pour vous...";
};

func int DIA_Hilda_BringBeet_Condition ()
{
	if (MIS_Lobart_RuebenToHilda == LOG_RUNNING)
	&& (Npc_HasItems (other,ItPl_Beet) >= 1)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_BringBeet_Info ()
{
	AI_Output (other, self, "DIA_Hilda_BringBeet_15_00"); //J'ai des navets pour vous...
	
	if (Npc_HasItems (other,ItPl_Beet) >= 20)
	{
		B_GiveInvItems (other, self, ItPl_Beet, Npc_HasItems (other,ItPl_Beet));
		
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_01"); //Fantastique ! (elle rit) Cela devrait suffire à leur remplir la panse !
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_02"); //Puisque vous êtes ici... j'ai aperçu un marchand ambulant passer par ici il y a quelques minutes.
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_03"); //Je crois qu'il a fait une halte avant de se rendre en ville. Allez le voir et regardez s'il vend une bonne casserole.
				
		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);//damit der Logeintrag verschwindet
	}
	else
	{
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_BringBeet_17_04"); //Quoi ?! C'est tout ?
		}
		else
		{
			AI_Output (self, other, "DIA_Hilda_BringBeet_17_05"); //Cela ne suffit pas.
		};
		
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_06"); //Retournez en ramasser d'autres dans le champ. Les hommes sont affamés !
		AI_StopProcessInfos (self);
	};
};


///////////////////////////////////////////////////////////////////////
//	Einkaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_Einkaufen (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_Einkaufen_Condition;
	information	= DIA_Hilda_Einkaufen_Info;
	permanent	= FALSE;
	description	= "Donnez-moi l'or et j'irai voir le marchand à votre place...";
};

func int DIA_Hilda_Einkaufen_Condition ()
{
	if (MIS_Lobart_RuebenToHilda == LOG_SUCCESS)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_Einkaufen_Info ()
{
	AI_Output (other, self, "DIA_Hilda_Einkaufen_15_00"); //Donnez-moi l'or et j'irai voir le marchand...
		
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_Einkaufen_17_01"); //Suggérez-vous que je puisse vous faire confiance ? Ne dépensez pas cet argent en boisson, vous m'entendez ?
		};
		
	B_GiveInvItems (self, other, ItMi_Gold, 20); 
	
	MIS_Hilda_PfanneKaufen = LOG_RUNNING;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();
	
	Log_CreateTopic (TOPIC_Hilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda,LOG_RUNNING);
	B_LogEntry (TOPIC_Hilda,"Hilda, la femme de Lobart, veut que je récupère une casserole chez le marchand itinérant.");
};


///////////////////////////////////////////////////////////////////////
//	Pfanne geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_PfanneGeholt (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_PfanneGeholt_Condition;
	information	= DIA_Hilda_PfanneGeholt_Info;
	permanent	= FALSE;
	description	= "Voilà votre casserole.";
};

func int DIA_Hilda_PfanneGeholt_Condition ()
{
	if (MIS_Hilda_PfanneKaufen == LOG_RUNNING)
	&& (Npc_HasItems(other, itmi_pan) > 0)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneGeholt_Info ()
{
	AI_Output (other, self, "DIA_Hilda_PfanneGeholt_15_00"); //Voici votre casserole.
	B_GiveInvItems (other, self, itmi_pan, 1);
	AI_Output (self, other, "DIA_Hilda_PfanneGeholt_17_01"); //Très bien. Voyons voir si elle vaut quelque chose...
	
	MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
	B_GivePlayerXP (XP_HildaHolPfanne);
	
	
};


///////////////////////////////////////////////////////////////////////
//	Pfanne zu spät
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_PfanneTooLate (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 1;
	condition	= DIA_Hilda_PfanneTooLate_Condition;
	information	= DIA_Hilda_PfanneTooLate_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hilda_PfanneTooLate_Condition ()
{
	if (MIS_Hilda_PfanneKaufen == LOG_RUNNING)
	&& (MIS_Hilda_PfanneKaufen_Day <= (Wld_GetDay()-1))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneTooLate_Info ()
{
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_00"); //Vous osez revenir ici ? Qu'avez-vous fait de mon argent, espèce de bon à rien ?
		}
		else
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_01"); //Je vous ai laissé assez de temps comme ça. Où est l'argent que je vous ai donné pour la poêle ?
		};
		
	if (Npc_HasItems(other, itmi_pan) > 0)
	{
		AI_Output (other, self, "DIA_Hilda_PfanneTooLate_15_02"); //Désolé, ça m'a pris du temps. Voici votre casserole.
	
		B_GiveInvItems (other, self, itmi_pan, 1);
	
		AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_03"); //Ah ! Alors donnez-la-moi. Quel toupet, incroyable !
	
		MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
		B_GivePlayerXP (XP_HildaHolPfanne/2);
		
		
		AI_StopProcessInfos(self);
	}
	else //keine Pfanne
	{
		if (Npc_HasItems(other, itmi_gold) >= 20)
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_04"); //Ah ! Vous l'avez encore ! Rendez-le-moi. Maintenant.
			B_GiveInvItems (other, self, ItMi_Gold, 20); 
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_05"); //Quel culot, incroyable !
		}
		else //kein Gold
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_06"); //Vous ne l'avez plus ! Je vous ai donné 20 pièces d'or !
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_07"); //Hors de ma vue, sale voleur !
			
			B_MemorizePlayerCrime (self, other, CRIME_THEFT);
		};
		
		MIS_Hilda_PfanneKaufen = LOG_FAILED;
		B_CheckLog ();
		AI_StopProcessInfos(self);
	};
};


///////////////////////////////////////////////////////////////////////
//	Klamotten uas Truhe geklaut
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Hilda_TruheRumgemacht (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_TruheRumgemacht_Condition;
	information	= DIA_Hilda_TruheRumgemacht_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hilda_TruheRumgemacht_Condition ()
{
	if (Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == FALSE)
	&& (Lobart_Kleidung_Verkauft == FALSE)
	&& (! ( Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) && (Lobart_Kleidung_gestohlen == FALSE) ) )
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_TruheRumgemacht_Info ()
{
	AI_Output (self, other, "DIA_Hilda_TruheRumgemacht_17_00"); //Denk´ bloss nicht, ich hätte nicht gesehen, wie du an der Kiste 'rumgemacht hast.
	AI_Output (self, other, "DIA_Hilda_TruheRumgemacht_17_01"); //Raus hier aber schnell. Sonst hol´ ich meinen Mann!
	
	AI_StopProcessInfos(self);
};
*/


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

INSTANCE DIA_Hilda_KAP3_EXIT(C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 999;
	condition	= DIA_Hilda_KAP3_EXIT_Condition;
	information	= DIA_Hilda_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hilda_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hilda_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Krank
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_KRANK		(C_INFO)
{
	npc		 = 	BAU_951_Hilda;
	nr		 = 	30;
	condition	 = 	DIA_Hilda_KRANK_Condition;
	information	 = 	DIA_Hilda_KRANK_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous ne vous sentez pas bien ?";
};

func int DIA_Hilda_KRANK_Condition ()
{
	if (Kapitel >= 3)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	&& (MIS_HealHilda != LOG_SUCCESS)
		{
			return TRUE;
		};
};
var int DIA_Hilda_KRANK_OnTime;
func void DIA_Hilda_KRANK_Info ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_15_00"); //Vous ne vous sentez pas bien ?
	AI_Output			(self, other, "DIA_Hilda_KRANK_17_01"); //Non, pas bien du tout. J'ai encore cette terrible fièvre.
	AI_Output			(self, other, "DIA_Hilda_KRANK_17_02"); //Je devrais vraiment aller voir le guérisseur de la ville mais je suis bien trop faible.

	if (DIA_Hilda_KRANK_OnTime == FALSE)
	{
		Info_ClearChoices	(DIA_Hilda_KRANK);
		Info_AddChoice	(DIA_Hilda_KRANK, "Ça ne prendra pas longtemps. Je dois y aller.", DIA_Hilda_KRANK_besserung );
		Info_AddChoice	(DIA_Hilda_KRANK, "Puis-je être utile ?", DIA_Hilda_KRANK_helfen );
		
		DIA_Hilda_KRANK_OnTime = TRUE;
	};

	MIS_HealHilda = LOG_RUNNING;
};
func void DIA_Hilda_KRANK_besserung ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_besserung_15_00"); //Remettez-vous vite. Je dois y aller.
	AI_Output			(self, other, "DIA_Hilda_KRANK_besserung_17_01"); //Espérons que les choses vont s'arranger.
	AI_StopProcessInfos (self);
};

func void DIA_Hilda_KRANK_helfen ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_helfen_15_00"); //Puis-je vous aider ?
	AI_Output			(self, other, "DIA_Hilda_KRANK_helfen_17_01"); //Ce serez merveilleux si vous pouviez aller voir Vatras pour qu'il me donne un remède.
	AI_Output			(self, other, "DIA_Hilda_KRANK_helfen_17_02"); //Il saura ce qu'il faut faire ! Je n'en peux plus.

	Log_CreateTopic (TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry (TOPIC_HealHilda,"Hilda, la femme de Lobart, est malade mais Vatras a quelque chose qui pourrait la soigner."); 
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilungbringen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_HEILUNGBRINGEN		(C_INFO)
{
	npc		 = 	BAU_951_Hilda;
	nr		 = 	31;
	condition	 = 	DIA_Hilda_HEILUNGBRINGEN_Condition;
	information	 = 	DIA_Hilda_HEILUNGBRINGEN_Info;

	description	 = 	"J'ai votre remède.";
};

func int DIA_Hilda_HEILUNGBRINGEN_Condition ()
{
	if (Npc_HasItems (other,ItPo_HealHilda_MIS))
		{
				return TRUE;
		};
};

func void DIA_Hilda_HEILUNGBRINGEN_Info ()
{
	AI_Output			(other, self, "DIA_Hilda_HEILUNGBRINGEN_15_00"); //J'ai votre remède.
	B_GiveInvItems 		(other, self, ItPo_HealHilda_MIS,1);
	AI_Output			(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_01"); //Vraiment ? Nous aurions bien besoin de plus de gens comme vous. Merci beaucoup.
	B_UseItem 			(self,ItPo_HealHilda_MIS);
	AI_Output			(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_02"); //J'espère que ces quelques pièces suffiront.
	CreateInvItems 		(self, ItMi_Gold, 50);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 50);	
	MIS_HealHilda = LOG_SUCCESS;
	B_GivePlayerXP (XP_HealHilda);
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info disturb
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_DISTURB		(C_INFO)
{
	npc		 = 	BAU_951_Hilda;
	nr		 = 	32;
	condition	 = 	DIA_Hilda_DISTURB_Condition;
	information	 = 	DIA_Hilda_DISTURB_Info;
	permanent	 = 	TRUE;

	description	 = 	"Comment allez-vous ?";
};

func int DIA_Hilda_DISTURB_Condition ()
{
	if (MIS_HealHilda == LOG_SUCCESS)
	||	( 
		((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) )
		&& (Kapitel > 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Hilda_DISTURB_Info ()
{
	if (MIS_HealHilda == LOG_SUCCESS)
	{
	AI_Output	(other, self, "DIA_Hilda_DISTURB_15_00"); //Comment allez-vous ?
	AI_Output	(self, other, "DIA_Hilda_DISTURB_17_01"); //Je vais déjà mieux, grâce à vous.
	}
	else
	{
	AI_Output	(self, other, "DIA_Hilda_DISTURB_17_02"); //Pas très bien.
	};
};

//#####################################################################
//##
//##
//##						KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Hilda_KAP4_EXIT(C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 999;
	condition	= DIA_Hilda_KAP4_EXIT_Condition;
	information	= DIA_Hilda_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hilda_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hilda_KAP4_EXIT_Info()
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

INSTANCE DIA_Hilda_KAP5_EXIT(C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 999;
	condition	= DIA_Hilda_KAP5_EXIT_Condition;
	information	= DIA_Hilda_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hilda_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hilda_KAP5_EXIT_Info()
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


INSTANCE DIA_Hilda_KAP6_EXIT(C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 999;
	condition	= DIA_Hilda_KAP6_EXIT_Condition;
	information	= DIA_Hilda_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hilda_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hilda_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hilda_PICKPOCKET (C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 900;
	condition	= DIA_Hilda_PICKPOCKET_Condition;
	information	= DIA_Hilda_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Hilda_PICKPOCKET_Condition()
{
	C_Beklauen (26, 35);
};
 
FUNC VOID DIA_Hilda_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hilda_PICKPOCKET);
	Info_AddChoice		(DIA_Hilda_PICKPOCKET, DIALOG_BACK 		,DIA_Hilda_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hilda_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hilda_PICKPOCKET_DoIt);
};

func void DIA_Hilda_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hilda_PICKPOCKET);
};
	
func void DIA_Hilda_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hilda_PICKPOCKET);
};


























































