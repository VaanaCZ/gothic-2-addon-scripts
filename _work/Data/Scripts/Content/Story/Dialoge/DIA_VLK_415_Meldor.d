// ***********************************************************
// 						 	EXIT
// ***********************************************************
INSTANCE DIA_Meldor_EXIT   (C_INFO)
{
	npc         = VLK_415_Meldor;
	nr          = 999;
	condition   = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 						 	Hallo
// ***********************************************************
instance DIA_Meldor_Hallo		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Hallo_Condition;
	information	= DIA_Meldor_Hallo_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Meldor_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Meldor_Hallo_07_00"); //Che vuoi?
	AI_Output (other, self, "DIA_Meldor_Hallo_15_01"); //Volevo dare un'occhiata da queste parti...
	AI_Output (self, other, "DIA_Meldor_Hallo_07_02"); //E dove sei diretto esattamente?
};

// ***********************************************************
// 						 	Interessantes
// ***********************************************************
instance DIA_Meldor_Interessantes		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Interessantes_Condition;
	information	= DIA_Meldor_Interessantes_Info;
	permanent 	= FALSE;
	description	= "Cosa c’è di interessante da vedere, qui?";
};

func int DIA_Meldor_Interessantes_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Interessantes_15_00"); //Cosa c’è di interessante da vedere, qui?
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_01"); //Qui ci sono un bordello e una taverna. Il locandiere si chiama Kardif. Se cerchi informazioni, è la persona giusta con cui parlare.
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_02"); //A proposito, hai bisogno di soldi?
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, il locandiere del pub del porto, commercia in informazioni.");
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************
instance DIA_Meldor_Lehmar		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 3;
	condition	= DIA_Meldor_Lehmar_Condition;
	information	= DIA_Meldor_Lehmar_Info;
	permanent 	= FALSE;
	description	= "Lo stai regalando?";
};

func int DIA_Meldor_Lehmar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Lehmar_15_00"); //Lo stai regalando?
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_01"); //(annoiato) No. Ma attraversando la strada troverai la casa di Lehmar, l'usuraio.
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_02"); //Sono sicuro che ti presterà qualcosa, vai pure.
	Npc_ExchangeRoutine (self, "START");
};


// ***********************************************************
// 						 	Arbeitest
// ***********************************************************
instance DIA_Meldor_Arbeitest		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 4;
	condition	= DIA_Meldor_Arbeitest_Condition;
	information	= DIA_Meldor_Arbeitest_Info;
	permanent 	= FALSE;
	description	= "Lavori per Lehmar?";
};

func int DIA_Meldor_Arbeitest_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Arbeitest_15_00"); //Lavori per Lehmar?
	AI_Output (self, other, "DIA_Meldor_Arbeitest_07_01"); //Furbetto.
};

// ***********************************************************
// 						 	InsOV
// ***********************************************************
instance DIA_Meldor_InsOV		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_InsOV_Condition;
	information	= DIA_Meldor_InsOV_Info;
	permanent 	= FALSE;
	description	= "Veramente, mi stavo dirigendo al quartiere alto...";
};

func int DIA_Meldor_InsOV_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info ()
{
	AI_Output (other, self, "DIA_Meldor_InsOV_15_00"); //Veramente, mi stavo dirigendo al quartiere alto...
	AI_Output (self, other, "DIA_Meldor_InsOV_07_01"); //(sarcasticamente) Sì, certo. E stavo per imbarcarmi a bordo di una nave per un'udienza con il Re.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_02"); //Da quando sono arrivati i paladini la gente come me e te non ha accesso ai quartieri alti.
};

// ***********************************************************
// 						 	Citizen
// ***********************************************************
instance DIA_Meldor_Citizen		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 6;
	condition	= DIA_Meldor_Citizen_Condition;
	information	= DIA_Meldor_Citizen_Info;
	permanent 	= FALSE;
	description	= "Sei un cittadino di questa città?";
};

func int DIA_Meldor_Citizen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Citizen_15_00"); //Sei un cittadino di questa città?
	AI_Output (self, other, "DIA_Meldor_Citizen_07_01"); //Se intendi dire se vivo qui, sì. Ma non mi fanno ancora passare nei quartieri alti.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_02"); //Solo i damerini possono entrare, oppure mercanti e artigiani dei bassifondi della città.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_03"); //Quelli del distretto del porto non contano molto a Khorinis. Non esiste nemmeno una pattuglia regolare dell'esercito laggiù.

};
// ***********************************************************
// 						 Smoke
// ***********************************************************
instance DIA_Meldor_Smoke		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_Smoke_Condition;
	information	= DIA_Meldor_Smoke_Info;
	permanent 	= FALSE;
	description	= "Sai dove posso comprare dell’erba?";
};

func int DIA_Meldor_Smoke_Condition ()
{	
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Meldor_Smoke_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Meldor_Smoke_15_00"); //Sai dove posso comprare dell’erba?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_01"); //(giudicando) No, non ne ho idea.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_02"); //Se fossi in te, proverei alla Lanterna Rossa.
	};
};

// ***********************************************************
// 						 	PERM
// ***********************************************************
var int Meldor_DGNews;
// --------------------

instance DIA_Meldor_PERM		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 7;
	condition	= DIA_Meldor_PERM_Condition;
	information	= DIA_Meldor_PERM_Info;
	permanent 	= TRUE;
	description	= "È accaduto qualcosa di rilevante qui, ultimamente?";
};

func int DIA_Meldor_PERM_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info ()
{
	AI_Output (other, self, "DIA_Meldor_PERM_15_00"); //È accaduto qualcosa di particolare, ultimamente?
	
	if (Kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_01"); //Non tanto tempo fa, la guardia cittadina ha messo a ferro e fuoco l'intero distretto del porto.
		AI_Output (self, other, "DIA_Meldor_PERM_07_02"); //Stavano cercando della merce rubata. Ci sono stati un sacco di furti, ultimamente, specialmente nei quartieri più elevati.
		AI_Output (self, other, "DIA_Meldor_PERM_07_03"); //Stanno ovviamente cercando di incolpare quei poveri diavoli al porto di tutto quanto.
	}
	else if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	&&		(Meldor_DGNews == FALSE)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_04"); //Ho sentito dire che hanno sbaragliato una banda di ladri nelle fogne. Sono tutti morti.
		Meldor_DGNews = TRUE;
	}
	else if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_05"); //Dicono che ci siano dei draghi nella Valle delle Miniere. Sono curioso di vedere quando i paladini si decideranno ad affrontarli.
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_06"); //Secondo quanto riferito, tutti i draghi sono morti. Qualcuno deve averli spazzati via con una scopa di ferro.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_07"); //No.
	};
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************

instance DIA_Meldor_VonLehmar		(C_INFO)
{
	npc			 = 	VLK_415_Meldor;
	nr			 =  1;
	condition	 = 	DIA_Meldor_VonLehmar_Condition;
	information	 = 	DIA_Meldor_VonLehmar_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Meldor_VonLehmar_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Meldor_VonLehmar_Info ()
{
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_00"); //Ehi, aspetta...
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_01"); //Ho un messaggio per te da parte di Lehmar...

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Meldor_PICKPOCKET (C_INFO)
{
	npc			= VLK_415_Meldor;
	nr			= 900;
	condition	= DIA_Meldor_PICKPOCKET_Condition;
	information	= DIA_Meldor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Meldor_PICKPOCKET_Condition()
{
	C_Beklauen (34, 55);
};
 
FUNC VOID DIA_Meldor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Meldor_PICKPOCKET);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_BACK 		,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
	
func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
































