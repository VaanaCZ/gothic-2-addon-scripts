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
		AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_00"); //Te rzezimieszki grożą mojemu mężowi! Jesteśmy obywatelami miasta, lojalnymi wobec naszego Króla! A oni chcą nas obrabować!
		Hilfe = TRUE;
	};
	AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_01"); //Nie stój tak, zrób coś! Pomożesz nam?
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Farmie Akila zagrażają najemnicy."); 

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
	description	 = 	"Wszystko w porządku?";
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
	AI_Output (other, self, "DIA_Kati_HALLO_15_00"); //Czy wszystko w porządku?
	
	if (Npc_IsDead (Akil))
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_01"); //Mój ukochany mąż nie żyje! Innosie! Za jakie grzechy tak mnie pokarałeś?
		
		Npc_ExchangeRoutine	(self,"Start");
		B_StartOtherRoutine	(Randolph,"Start");

		B_GivePlayerXP (XP_Akil_Tot);	
	}
	else
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_02"); //Tak, wszystko w porządku, dziękuję.
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
	description	 = 	"Akil mówi, że masz dla mnie jedzenie.";
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
	AI_Output (other, self, "DIA_Kati_ESSEN_15_00"); //Akil mówi, że masz dla mnie jedzenie.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_01"); //Od czasu kiedy upadła Bariera, zrobiło się tutaj bardzo niebezpiecznie. To dla nas ciężkie czasy.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_02"); //Proszę, masz tu kawałek chleba, odrobinę mięsa i parę łyków wody. Obawiam się, że nie mogę sobie pozwolić na poczęstowanie cię czymś innym.
	
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
	description	 = "Baltram mnie przysłał...";
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
	AI_Output (other, self, "DIA_Kati_Baltram_15_00"); //Przysyła mnie Baltram. Mam odebrać dla niego dostawę.
	AI_Output (self, other, "DIA_Kati_Baltram_16_01"); //Ależ oczywiście. Proszę, wszystko zapakowałam.
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
	description	 = 	"Czemu nie bronicie się przed tyranią Onara?";
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
	AI_Output (other, self, "DIA_Kati_BAUERNAUFSTAND_15_00"); //Czemu nie bronicie się przed tyranią Onara?
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_01"); //Dla farmerów mieszkających w pobliżu miasta lepiej jest polegać na strażnikach niż na najemnikach Onara.
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_02"); //Z drugiej strony, Bengar i Sekob prędzej porzucą swoje farmy, niż zaczną pracować dla Króla.

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
	description	 = 	"Gdzie mają swoje farmy Bengar i Sekob?";
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
	AI_Output (other, self, "DIA_Kati_ANDEREHOEFE_15_00"); //Gdzie mają swoje farmy Bengar i Sekob?
	AI_Output (self, other, "DIA_Kati_ANDEREHOEFE_16_01"); //Mieszkają niedaleko posiadłości Onara. Udaj się stąd na wschód, a znajdziesz ich bez trudu.
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
	description	 = 	"Czy kiedykolwiek myślałaś o tym, żeby się stąd wyprowadzić?";
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
	AI_Output (other, self, "DIA_Kati_HIERWEG_15_00"); //Czy kiedykolwiek myślałaś o tym, żeby się stąd wyprowadzić?
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_01"); //Nie jest łatwo uciec z tej części kraju. Wokół naszych ziem roztacza się pasmo wysokich gór.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_02"); //Istnieją dwie drogi, którymi można się stąd wydostać: morze i przełęcz wiodąca do Górniczej Doliny.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_03"); //Ponieważ nie możemy sobie pozwolić na podróż statkiem, a Górnicza Dolina jest miejscem, z którego nie ma powrotu, będziemy musieli tu zostać.
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
	description	 = 	"Co wiesz na temat przełęczy?";
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
	AI_Output (other, self, "DIA_Kati_PASS_15_00"); //Co wiesz o przełęczy?
	AI_Output (self, other, "DIA_Kati_PASS_16_01"); //Nigdy na niej nie byłam, ale wiem, że znajduje się gdzieś w okolicy farmy Bengara.
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
	description	 = 	"Uważaj na swojego męża.";
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
	AI_Output			(other, self, "DIA_Kati_PERMKAP1_15_00"); //Uważaj na swojego męża.
	AI_Output			(self, other, "DIA_Kati_PERMKAP1_16_01"); //Zrobię, co w mojej mocy.
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

	description	 = 	"Wszystko w porządku?";
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
	AI_Output			(other, self, "DIA_Kati_PERM_15_00"); //Wszystko w porządku?
	AI_Output			(self, other, "DIA_Kati_PERM_16_01"); //Jakoś dajemy sobie radę. Zastanawiam się, jak długo jeszcze będziemy się musieli opierać tym czarnym diabłom.
	AI_Output			(self, other, "DIA_Kati_PERM_16_02"); //Dłużej już tego nie zniosę. Buszują po naszym domu i cały czas wydają z siebie te denerwujące dźwięki.
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






























