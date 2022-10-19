///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kati_EXIT   (C_INFO)
{
	npc         = BAU_941_Kati;
	nr          = 999;
	condition   = DIA_Kati_EXIT_Condition;
	information = DIA_Kati_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kati_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Kati_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SLDnochda
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_SLDNOCHDA		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	4;
	condition	 = 	DIA_Kati_SLDNOCHDA_Condition;
	information	 = 	DIA_Kati_SLDNOCHDA_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Kati_SLDNOCHDA_Condition ()
{
	if  !(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))	
	&&  (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kati_SLDNOCHDA_Info ()
{
	//--------------------------------------
	var int Hilfe;
	//--------------------------------------
	
	if (Hilfe == FALSE)
	{
		AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_00"); //Mein Mann wird von diesen Halsabschneidern bedroht! Wir sind königstreue Bürger der Stadt, und die Söldner wollen uns ausrauben!
		Hilfe = TRUE;
	};
	AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_01"); //Jetzt steh doch da nicht herum. Tu doch irgendwas. Hilf uns.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akils Hof wird von Söldnern bedroht."); 

	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HALLO		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	5;
	condition	 = 	DIA_Kati_HALLO_Condition;
	information	 = 	DIA_Kati_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Bist du in Ordnung?";
};

func int DIA_Kati_HALLO_Condition ()
{	
	if (Npc_IsDead (Alvares))
	&& (Npc_IsDead (Engardo))
	{
		return TRUE;
	};
};
func void DIA_Kati_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Kati_HALLO_15_00"); //Bist du in Ordnung?
	
	if (Npc_IsDead (Akil))
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_01"); //(schluchzt) Mein geliebter Mann ist tot! Oh Innos, warum strafst du mich so hart?
		
		Npc_ExchangeRoutine	(self,"Start");
		B_StartOtherRoutine	(Randolph,"Start");

		B_GivePlayerXP (XP_Akil_Tot);	
	}
	else
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_02"); //Ja, mir geht's gut, danke.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Essen
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ESSEN		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	12;
	condition	 = 	DIA_Kati_ESSEN_Condition;
	information	 = 	DIA_Kati_ESSEN_Info;
	permanent 	 =  FALSE;
	description	 = 	"Akil meinte, du hättet eine Mahlzeit für mich.";
};

func int DIA_Kati_ESSEN_Condition ()
{
	if (Kati_Mahlzeit == TRUE)
	&& ((Npc_IsDead(Akil))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kati_ESSEN_Info ()
{
	AI_Output (other, self, "DIA_Kati_ESSEN_15_00"); //Akil meinte, du hättet eine Mahlzeit für mich.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_01"); //Es sind schwere Zeiten für uns angebrochen, seit die Barriere nicht mehr da ist und das Land unsicher geworden ist.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_02"); //Hier hast du einen Laib Brot, etwas Fleisch und einen Schluck Wasser. Mehr kann ich leider nicht entbehren.
	
	B_GiveInvItems (self, other, ItFo_Bread, 1);			
	B_GiveInvItems (self, other, ItFo_Water, 1);			
	B_GiveInvItems (self, other, ItFoMutton, 1);			

};

///////////////////////////////////////////////////////////////////////
//	Info Akil ist tot Kati ist der Ersatz 
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_Baltram		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	4;
	condition	 = 	DIA_Kati_Baltram_Condition;
	information	 = 	DIA_Kati_Baltram_Info;
	permanent	 = 	FALSE;
	description	 = "Baltram schickt mich... ";
};
func int DIA_Kati_Baltram_Condition ()
{
	if  (Npc_IsDead (Akil))
	&&  (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	&&  (Lieferung_Geholt == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kati_Baltram_Info ()
{
	AI_Output (other, self, "DIA_Kati_Baltram_15_00"); //Baltram schickt mich. Ich soll eine Lieferung für ihn abholen.
	AI_Output (self, other, "DIA_Kati_Baltram_16_01"); //Ja natürlich. Hier, ich habe schon alles zusammen gepackt.
	CreateInvItems 	(self, ItMi_BaltramPaket, 1 );
	B_GiveInvItems (self, other, ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};
	
///////////////////////////////////////////////////////////////////////
//	Info Bauernaufstand
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_BAUERNAUFSTAND		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	6;
	condition	 = 	DIA_Kati_BAUERNAUFSTAND_Condition;
	information	 = 	DIA_Kati_BAUERNAUFSTAND_Info;
	permanent    =  FALSE;
	description	 = 	"Warum wehrt ihr euch nicht gegen Onars Unterdrückung?";
};

func int DIA_Kati_BAUERNAUFSTAND_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Kati_BAUERNAUFSTAND_Info ()
{
	AI_Output (other, self, "DIA_Kati_BAUERNAUFSTAND_15_00"); //Warum wehrt ihr euch nicht gegen Onars Unterdrückung?
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_01"); //Wir stadtnahen Bauern sind besser beraten, uns mit der Miliz der Stadt gut zu stellen, als auf Onars Söldner zu bauen.
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_02"); //Es gibt da aber auch noch Bengar und Sekob, die lieber ihren Hof aufgeben würden, als für den König zu arbeiten.

};

///////////////////////////////////////////////////////////////////////
//	Info AndereHoefe
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ANDEREHOEFE		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	7;
	condition	 = 	DIA_Kati_ANDEREHOEFE_Condition;
	information	 = 	DIA_Kati_ANDEREHOEFE_Info;
	permanent	 =  FALSE;
	description	 = 	"Wo finde ich die Höfe von Bengar und Sekob?";
};

func int DIA_Kati_ANDEREHOEFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_ANDEREHOEFE_Info ()
{
	AI_Output (other, self, "DIA_Kati_ANDEREHOEFE_15_00"); //Wo finde ich die Höfe von Bengar und Sekob?
	AI_Output (self, other, "DIA_Kati_ANDEREHOEFE_16_01"); //Sie liegen nicht weit vom Hofe des Großbauern entfernt. Geh weiter nach Osten. Dort wirst du sie finden.
};

///////////////////////////////////////////////////////////////////////
//	Info HierWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HIERWEG		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	9;
	condition	 = 	DIA_Kati_HIERWEG_Condition;
	information	 = 	DIA_Kati_HIERWEG_Info;
	permanent	 =  FALSE;
	description	 = 	"Habt ihr nie daran gedacht, hier weg zu gehen?";
};

func int DIA_Kati_HIERWEG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_HIERWEG_Info ()
{
	AI_Output (other, self, "DIA_Kati_HIERWEG_15_00"); //Habt ihr nie daran gedacht, hier weg zu gehen?
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_01"); //Aus diesem Teil des Landes kommt man nicht so einfach weg. Das ganze Land ist umschlossen von einer hohen Felskette, die unüberwindlich ist.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_02"); //Die beiden einzigen Wege von hier fort sind der Pass ins alte Minental und der Hafen.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_03"); //Da wir uns die Überfahrt mit dem Schiff nicht leisten können, und das Minental ein Land ohne Wiederkehr ist, werden wir hier bleiben müssen.
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PASS		(C_INFO)
{
	npc		 	 = 	BAU_941_Kati;
	nr			 = 	10;
	condition	 = 	DIA_Kati_PASS_Condition;
	information	 = 	DIA_Kati_PASS_Info;
	permanent	 =  FALSE;
	description	 = 	"Was weißt du über den Pass?";
};

func int DIA_Kati_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HIERWEG))
	{
		return TRUE;
	};
};

func void DIA_Kati_PASS_Info ()
{
	AI_Output (other, self, "DIA_Kati_PASS_15_00"); //Was weißt du über den Pass?
	AI_Output (self, other, "DIA_Kati_PASS_16_01"); //Ich bin selbst noch nie dort gewesen. Er muss aber irgendwo bei Bengars Hof auf dem Weidenplateau sein.
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERMKAP1		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	11;
	condition	 = 	DIA_Kati_PERMKAP1_Condition;
	information	 = 	DIA_Kati_PERMKAP1_Info;
	permanent	 = 	TRUE;
	description	 = 	"Pass auf deinen Mann auf.";
};

func int DIA_Kati_PERMKAP1_Condition ()
{
	if 	(
		(!C_NpcIsDown (Akil))
		&& (Npc_KnowsInfo(other, DIA_KATI_HALLO))
		&& (Npc_KnowsInfo(other, DIA_KATI_BAUERNAUFSTAND))
		&& (Npc_KnowsInfo(other, DIA_KATI_ANDEREHOEFE))
		&& (Npc_KnowsInfo(other, DIA_KATI_HIERWEG))
		&& (Npc_KnowsInfo(other, DIA_KATI_PASS))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Kati_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Kati_PERMKAP1_15_00"); //Pass auf deinen Mann auf.
	AI_Output			(self, other, "DIA_Kati_PERMKAP1_16_01"); //Ich werde mich bemühen.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Kati_KAP3_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP3_EXIT_Condition;
	information	= DIA_Kati_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERM		(C_INFO)
{
	npc		 = 	BAU_941_Kati;
	nr		 = 	3;
	condition	 = 	DIA_Kati_PERM_Condition;
	information	 = 	DIA_Kati_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Immer noch alles in Ordnung bei dir?";
};

func int DIA_Kati_PERM_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Kati_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Kati_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Kati_PERM_15_00"); //Immer noch alles in Ordnung bei dir?
	AI_Output			(self, other, "DIA_Kati_PERM_16_01"); //Es geht schon. Ich frage mich nur, wie lange wir diese schwarzen Teufel noch erdulden müssen.
	AI_Output			(self, other, "DIA_Kati_PERM_16_02"); //Ich kann es nicht mehr ertragen. Sie schleichen ums Haus und machen so seltsame Geräusche.
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

INSTANCE DIA_Kati_KAP4_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP4_EXIT_Condition;
	information	= DIA_Kati_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP4_EXIT_Info()
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

INSTANCE DIA_Kati_KAP5_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP5_EXIT_Condition;
	information	= DIA_Kati_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP5_EXIT_Info()
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


INSTANCE DIA_Kati_KAP6_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP6_EXIT_Condition;
	information	= DIA_Kati_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kati_PICKPOCKET (C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 900;
	condition	= DIA_Kati_PICKPOCKET_Condition;
	information	= DIA_Kati_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Kati_PICKPOCKET_Condition()
{
	C_Beklauen (13, 15);
};
 
FUNC VOID DIA_Kati_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kati_PICKPOCKET);
	Info_AddChoice		(DIA_Kati_PICKPOCKET, DIALOG_BACK 		,DIA_Kati_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kati_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kati_PICKPOCKET_DoIt);
};

func void DIA_Kati_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kati_PICKPOCKET);
};
	
func void DIA_Kati_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kati_PICKPOCKET);
};






























