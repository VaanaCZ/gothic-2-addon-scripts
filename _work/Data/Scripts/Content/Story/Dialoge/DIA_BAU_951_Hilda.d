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
			AI_Output (self, other, "DIA_Hilda_Hallo_17_00"); //Hej, kdo t� sem zval? Okam�it� vypadni. Nikdo t� tu nechce.
		}
	else
		{
			AI_Output (self, other, "DIA_Hilda_Hallo_17_01"); //Jo, co je?
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
	description = "M��e� mi d�t n�co k j�dlu?";
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
			
			AI_Output (other, self, "DIA_Hilda_WasZuEssen_15_00"); //M��e� mi d�t n�co k j�dlu?
				
			if (MIS_Lobart_Rueben == LOG_SUCCESS)
				{
					if (! Npc_KnowsInfo (other, DIA_Hilda_PfanneTooLate))
					{
						if (Hilda_Stew_Day != Wld_GetDay())
						{
							B_GiveInvItems (self, other, ItFo_Stew, 1);
						
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_01"); //Tady, vezmi si to. Jsi dobrej pracant.
						
							Hilda_Stew_Day = Wld_GetDay();
						}
						
						else if (Wld_GetDay() == 0)
						&& 		(Rueben_TagNull == FALSE)
						{
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_02"); //Pro dal�� si m��e� p�ij�t zase z�tra.
							B_GiveInvItems (self, other, ItFo_Stew, 1);
							Hilda_Stew_Day = Wld_GetDay();
							Rueben_TagNull = TRUE;
							
							Log_CreateTopic (Topic_Bonus,LOG_NOTE);
							B_LogEntry (Topic_Bonus,"Ka�d� den dostanu od Hildy trochu du�en�ch tu��n�.");
						}
						else //heute schon bekommen
						{
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_03"); //Dne�n� porci u� jsi dostal! Vra� se pozd�ji.
						};
					}
					else //Pfanne zu sp�t
					{
						AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_04"); //Fl�ka�e tu nekrm�me. Vypadni!
						AI_StopProcessInfos (self); 
					};
				}
				else
				{
					AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_05"); //Naj�st dostanou jen ti, co tu pracuj�!
				};
		}
	else
		{
			AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_06"); //Ur�it� m� dost zlata, aby sis mohl s�m n�co koupit ve m�st�.
		};
};


///////////////////////////////////////////////////////////////////////
//	R�ben bringen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_BringBeet (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 1;
	condition	= DIA_Hilda_BringBeet_Condition;
	information	= DIA_Hilda_BringBeet_Info;
	permanent	= FALSE;
	description	= "M�m tady pro tebe p�r tu��n�...";
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
	AI_Output (other, self, "DIA_Hilda_BringBeet_15_00"); //M�m tady pro tebe p�r tu��n�.
	
	if (Npc_HasItems (other,ItPl_Beet) >= 20)
	{
		B_GiveInvItems (other, self, ItPl_Beet, Npc_HasItems (other,ItPl_Beet));
		
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_01"); //V�born�! (sm�ch) To by mohlo na nakrmen� t�ch chlap� i sta�it!
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_02"); //Ka�dop�dne, dokud jsi tady - vid�la jsem tudy p�ed p�r minutami proch�zet ko�ovn�ho kupce.
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_03"); //M�m dojem, �e na cest� do m�sta na chv�li zastavil. B� se ho zeptat, jestli by pro m� nem�l po��dnou p�nev.
				
		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);//damit der Logeintrag verschwindet
	}
	else
	{
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_BringBeet_17_04"); //Co?! A to m� b�t jako v�echno?
		}
		else
		{
			AI_Output (self, other, "DIA_Hilda_BringBeet_17_05"); //To nen� moc.
		};
		
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_06"); //B� na pole a p�ines mi dal��. Chlapi maj� hlad!
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
	description	= "Dej mi zlato a j� za t�m kupcem zajdu.";
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
	AI_Output (other, self, "DIA_Hilda_Einkaufen_15_00"); //Dej mi zlato a j� za t�m kupcem zajdu.
		
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_Einkaufen_17_01"); //��k�, �e ti m�m v��it? Tak hlavn� ty pen�ze nevyho� za chlast, sly��?!
		};
		
	B_GiveInvItems (self, other, ItMi_Gold, 20); 
	
	MIS_Hilda_PfanneKaufen = LOG_RUNNING;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();
	
	Log_CreateTopic (TOPIC_Hilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda,LOG_RUNNING);
	B_LogEntry (TOPIC_Hilda,"Hilda, �ena sedl�ka Lobarta, m� po��dala, abych j� u podomn�ho obchodn�ka koupil n�jakou p�nev.");
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
	description	= "Tady je tvoje p�nev.";
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
	AI_Output (other, self, "DIA_Hilda_PfanneGeholt_15_00"); //Tady m� tu svoji p�nev.
	B_GiveInvItems (other, self, itmi_pan, 1);
	AI_Output (self, other, "DIA_Hilda_PfanneGeholt_17_01"); //Fajn. To se pod�vejme, je�t� se d� narazit na poctivce.
	
	MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
	B_GivePlayerXP (XP_HildaHolPfanne);
	
	
};


///////////////////////////////////////////////////////////////////////
//	Pfanne zu sp�t
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
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_00"); //To si je�t� dovol� se sem vracet? Cos ud�lal s m�mi pen�zi, ty darmo�lape?!
		}
		else
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_01"); //M�ls na to dost �asu. Kde jsou pen�ze, co jsem ti dala na tu p�nev?
		};
		
	if (Npc_HasItems(other, itmi_pan) > 0)
	{
		AI_Output (other, self, "DIA_Hilda_PfanneTooLate_15_02"); //Promi�, zapomn�l jsem. Tady je tvoje p�nev!
	
		B_GiveInvItems (other, self, itmi_pan, 1);
	
		AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_03"); //Arrh, tak sem tu v�c dej. Takov� drzost - neuv��iteln�!
	
		MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
		B_GivePlayerXP (XP_HildaHolPfanne/2);
		
		
		AI_StopProcessInfos(self);
	}
	else //keine Pfanne
	{
		if (Npc_HasItems(other, itmi_gold) >= 20)
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_04"); //Ach! Ty to je�t� po��d m� u sebe! Vra� mi to. Hned.
			B_GiveInvItems (other, self, ItMi_Gold, 20); 
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_05"); //Takov� drzost - neuv��iteln�!
		}
		else //kein Gold
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_06"); //Ty to je�t� nem�! Dala jsem ti 20 zlat�ch!
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_07"); //Jdi mi z o��, ty mizernej zlod�ji!
			
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
	AI_Output (self, other, "DIA_Hilda_TruheRumgemacht_17_00"); //Denk� bloss nicht, ich h�tte nicht gesehen, wie du an der Kiste 'rumgemacht hast.
	AI_Output (self, other, "DIA_Hilda_TruheRumgemacht_17_01"); //Raus hier aber schnell. Sonst hol� ich meinen Mann!
	
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

	description	 = 	"C�t� se dob�e?";
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
	AI_Output			(other, self, "DIA_Hilda_KRANK_15_00"); //C�t� se dob�e?
	AI_Output			(self, other, "DIA_Hilda_KRANK_17_01"); //Ne, v�bec ne. M�m zase tu stra�nou hore�ku.
	AI_Output			(self, other, "DIA_Hilda_KRANK_17_02"); //M�la bych zaj�t za m�stsk�m l��itelem, ale jsem na to moc slab�.

	if (DIA_Hilda_KRANK_OnTime == FALSE)
	{
		Info_ClearChoices	(DIA_Hilda_KRANK);
		Info_AddChoice	(DIA_Hilda_KRANK, "Tak se brzo uzdrav. U� mus�m j�t.", DIA_Hilda_KRANK_besserung );
		Info_AddChoice	(DIA_Hilda_KRANK, "Mohu n�jak pomoci?", DIA_Hilda_KRANK_helfen );
		
		DIA_Hilda_KRANK_OnTime = TRUE;
	};

	MIS_HealHilda = LOG_RUNNING;
};
func void DIA_Hilda_KRANK_besserung ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_besserung_15_00"); //Tak se brzo uzdrav. U� mus�m j�t.
	AI_Output			(self, other, "DIA_Hilda_KRANK_besserung_17_01"); //Doufejme, �e p�ijdou lep�� �asy.
	AI_StopProcessInfos (self);
};

func void DIA_Hilda_KRANK_helfen ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_helfen_15_00"); //Mohu n�jak pomoci?
	AI_Output			(self, other, "DIA_Hilda_KRANK_helfen_17_01"); //Bylo by od tebe moc mil�, kdybys za�el za Vatrasem a z�skal od n�j l�k.
	AI_Output			(self, other, "DIA_Hilda_KRANK_helfen_17_02"); //On u� bude v�d�t, co m� ud�lat! J� u� to sama nezvl�dnu.

	Log_CreateTopic (TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry (TOPIC_HealHilda,"Lobartov� �en� Hild� je �patn�, ale Vatras by pro ni m�l m�t n�jak� l�k."); 
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

	description	 = 	"M�m pro tebe ten l�k.";
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
	AI_Output			(other, self, "DIA_Hilda_HEILUNGBRINGEN_15_00"); //M�m pro tebe ten l�k.
	B_GiveInvItems 		(other, self, ItPo_HealHilda_MIS,1);
	AI_Output			(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_01"); //V�n�. Na�e spole�nost by pot�ebovala v�c lid� jako ty. Mockr�t d�ky.
	B_UseItem 			(self,ItPo_HealHilda_MIS);
	AI_Output			(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_02"); //Douf�m, �e t�chhle p�r zlat�ch bude sta�it.
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

	description	 = 	"Jak se m�?";
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
	AI_Output	(other, self, "DIA_Hilda_DISTURB_15_00"); //Jak se m�?
	AI_Output	(self, other, "DIA_Hilda_DISTURB_17_01"); //U� je mi l�p, d�ky tob�.
	}
	else
	{
	AI_Output	(self, other, "DIA_Hilda_DISTURB_17_02"); //��dn� sl�va.
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


























































