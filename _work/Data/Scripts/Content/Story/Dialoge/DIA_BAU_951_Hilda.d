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
			AI_Output (self, other, "DIA_Hilda_Hallo_17_00"); //Hej, kto cię tu zapraszał? Natychmiast wynoś się z mojego domu. Nic tutaj nie dostaniesz.
		}
	else
		{
			AI_Output (self, other, "DIA_Hilda_Hallo_17_01"); //Tak, o co chodzi?
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
	description = "Czy możesz mi dać coś do jedzenia?";
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
			
			AI_Output (other, self, "DIA_Hilda_WasZuEssen_15_00"); //Czy możesz mi dać coś do jedzenia?
				
			if (MIS_Lobart_Rueben == LOG_SUCCESS)
				{
					if (! Npc_KnowsInfo (other, DIA_Hilda_PfanneTooLate))
					{
						if (Hilda_Stew_Day != Wld_GetDay())
						{
							B_GiveInvItems (self, other, ItFo_Stew, 1);
						
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_01"); //Proszę, to dla ciebie.
						
							Hilda_Stew_Day = Wld_GetDay();
						}
						
						else if (Wld_GetDay() == 0)
						&& 		(Rueben_TagNull == FALSE)
						{
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_02"); //Jutro możesz wrócić po więcej.
							B_GiveInvItems (self, other, ItFo_Stew, 1);
							Hilda_Stew_Day = Wld_GetDay();
							Rueben_TagNull = TRUE;
							
							Log_CreateTopic (Topic_Bonus,LOG_NOTE);
							B_LogEntry (Topic_Bonus,"Codziennie mogę dostać u Hildy trochę gotowanej rzepy.");
						}
						else //heute schon bekommen
						{
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_03"); //Przecież już dostałeś swoją dzisiejszą porcję! Przyjdź kiedy indziej.
						};
					}
					else //Pfanne zu spät
					{
						AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_04"); //Nie karmimy tutaj darmozjadów. Wynoś się!
						AI_StopProcessInfos (self); 
					};
				}
				else
				{
					AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_05"); //Tutaj jadają tylko uczciwie pracujący ludzie!
				};
		}
	else
		{
			AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_06"); //Jestem pewna, że stać cię na obiad w mieście.
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
	description	= "Mam tu dla ciebie kilka rzep...";
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
	AI_Output (other, self, "DIA_Hilda_BringBeet_15_00"); //Mam tu dla ciebie kilka rzep...
	
	if (Npc_HasItems (other,ItPl_Beet) >= 20)
	{
		B_GiveInvItems (other, self, ItPl_Beet, Npc_HasItems (other,ItPl_Beet));
		
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_01"); //Świetnie! To powinno wystarczyć do nakarmienia tych wszystkich głodomorów!
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_02"); //Skoro już tu jesteś - kilka minut temu przechodził tędy wędrowny handlarz.
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_03"); //Chyba zatrzymał się gdzieś po drodze do miasta. Znajdź go i zapytaj, czy nie ma dla mnie jakiejś porządnej patelni.
				
		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);//damit der Logeintrag verschwindet
	}
	else
	{
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_BringBeet_17_04"); //Co?! To ma być cały zbiór?!
		}
		else
		{
			AI_Output (self, other, "DIA_Hilda_BringBeet_17_05"); //To nie wystarczy.
		};
		
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_06"); //Idź na pole i przynieś więcej, przecież muszę jakoś nakarmić tych wszystkich ludzi!
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
	description	= "Daj mi złoto, a znajdę tego handlarza...";
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
	AI_Output (other, self, "DIA_Hilda_Einkaufen_15_00"); //Daj mi złoto, a znajdę tego handlarza...
		
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_Einkaufen_17_01"); //Chyba mogę ci zaufać... Tylko nie wydaj wszystkiego na gorzałę! Słyszysz?!
		};
		
	B_GiveInvItems (self, other, ItMi_Gold, 20); 
	
	MIS_Hilda_PfanneKaufen = LOG_RUNNING;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();
	
	Log_CreateTopic (TOPIC_Hilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda,LOG_RUNNING);
	B_LogEntry (TOPIC_Hilda,"Hilda, żona farmera Lobarta, chce, abym kupił dla niej u wędrownego handlarza patelnię.");
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
	description	= "Oto twoja patelnia.";
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
	AI_Output (other, self, "DIA_Hilda_PfanneGeholt_15_00"); //Oto twoja patelnia.
	B_GiveInvItems (other, self, itmi_pan, 1);
	AI_Output (self, other, "DIA_Hilda_PfanneGeholt_17_01"); //Dobrze. Wypróbujmy ją...
	
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
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_00"); //Masz czelność się tutaj pokazywać?! Gdzie są moje pieniądze, hultaju?!
		}
		else
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_01"); //Wystarczy tego dobrego. Gdzie są pieniądze, za które miałeś kupić patelnię?
		};
		
	if (Npc_HasItems(other, itmi_pan) > 0)
	{
		AI_Output (other, self, "DIA_Hilda_PfanneTooLate_15_02"); //Przepraszam, że zajęło mi to tyle czasu. Oto twoja patelnia!
	
		B_GiveInvItems (other, self, itmi_pan, 1);
	
		AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_03"); //Daj ją tutaj wreszcie. Coś niebywałego!
	
		MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
		B_GivePlayerXP (XP_HildaHolPfanne/2);
		
		
		AI_StopProcessInfos(self);
	}
	else //keine Pfanne
	{
		if (Npc_HasItems(other, itmi_gold) >= 20)
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_04"); //Ach! Jeszcze ją masz. Oddaj mi ją. W tej chwili.
			B_GiveInvItems (other, self, ItMi_Gold, 20); 
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_05"); //Coś niebywałego!
		}
		else //kein Gold
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_06"); //Gdzie jest moja patelnia? Dostałeś na nią 20 sztuk złota!
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_07"); //Wynoś się stąd, wstrętny złodzieju!
			
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

	description	 = 	"Źle się czujesz?";
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
	AI_Output			(other, self, "DIA_Hilda_KRANK_15_00"); //Źle się czujesz?
	AI_Output			(self, other, "DIA_Hilda_KRANK_17_01"); //Nie najlepiej. Znowu mam tę okropną gorączkę.
	AI_Output			(self, other, "DIA_Hilda_KRANK_17_02"); //Powinnam pójść do uzdrawiacza, ale nawet na to jestem za słaba.

	if (DIA_Hilda_KRANK_OnTime == FALSE)
	{
		Info_ClearChoices	(DIA_Hilda_KRANK);
		Info_AddChoice	(DIA_Hilda_KRANK, "Wracaj do zdrowia. Ja muszę już iść.", DIA_Hilda_KRANK_besserung );
		Info_AddChoice	(DIA_Hilda_KRANK, "Czy mogę jakoś pomóc?", DIA_Hilda_KRANK_helfen );
		
		DIA_Hilda_KRANK_OnTime = TRUE;
	};

	MIS_HealHilda = LOG_RUNNING;
};
func void DIA_Hilda_KRANK_besserung ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_besserung_15_00"); //Wracaj do zdrowia. Ja muszę już iść.
	AI_Output			(self, other, "DIA_Hilda_KRANK_besserung_17_01"); //Miejmy nadzieję, że wkrótce przyjdą lepsze czasy.
	AI_StopProcessInfos (self);
};

func void DIA_Hilda_KRANK_helfen ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_helfen_15_00"); //Czy mogę jakoś pomóc?
	AI_Output			(self, other, "DIA_Hilda_KRANK_helfen_17_01"); //Byłoby wspaniale, gdybyś udał się do Vatrasa i przyniósł mi od niego moje lekarstwo.
	AI_Output			(self, other, "DIA_Hilda_KRANK_helfen_17_02"); //On będzie wiedział, co zrobić!

	Log_CreateTopic (TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry (TOPIC_HealHilda,"Żona Lobarta, Hilda, zachorowała. Vatras ma lekarstwo, które może ją wyleczyć."); 
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

	description	 = 	"Przyniosłem twoje lekarstwo.";
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
	AI_Output			(other, self, "DIA_Hilda_HEILUNGBRINGEN_15_00"); //Przyniosłem twoje lekarstwo.
	B_GiveInvItems 		(other, self, ItPo_HealHilda_MIS,1);
	AI_Output			(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_01"); //Naprawdę, gdyby wszyscy byli tacy uczynni jak ty... Strasznie ci dziękuję.
	B_UseItem 			(self,ItPo_HealHilda_MIS);
	AI_Output			(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_02"); //Mam nadzieję, że tych kilka monet wystarczy.
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

	description	 = 	"Jak się masz?";
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
	AI_Output	(other, self, "DIA_Hilda_DISTURB_15_00"); //Jak się czujesz?
	AI_Output	(self, other, "DIA_Hilda_DISTURB_17_01"); //Dziękuję, dzięki tobie wracam do zdrowia.
	}
	else
	{
	AI_Output	(self, other, "DIA_Hilda_DISTURB_17_02"); //Niezbyt dobrze.
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


























































