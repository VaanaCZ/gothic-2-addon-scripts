// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_7_EXIT_Condition;
	information	= DIA_MIL_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_7_JOIN_Condition;
	information	= DIA_MIL_7_JOIN_Info;
	permanent	= TRUE;
	description = "Voglio entrare a far parte della guardia cittadina.";
};                       

FUNC INT DIA_MIL_7_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //Voglio entrare a far parte della guardia cittadina.
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //Tu non sei nemmeno un cittadino di Khorinis! Perché Lord Andre dovrebbe accettarti?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //Tutti potrebbero proporsi per la guardia cittadina, ricevere un'arma e un'armatura e poi fuggire con esse.
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //Ma io parlo sul serio!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //È a Lord Andre che devi dare delle spiegazioni, non a me. Lo troverai nella caserma.
		};
	}
	else
	{
		B_Say (self, other, "$ABS_GOOD");
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_7_PEOPLE_Condition;
	information	= DIA_MIL_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Cosa sai sui paladini?";
};                       

FUNC INT DIA_MIL_7_PEOPLE_Condition()
{
	if (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_PEOPLE_15_00"); //Cosa sai sui paladini?
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //Non molto. Nessuno sa esattamente cosa ci facciano qui. Nemmeno noi della guardia cittadina.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //Hanno preso il controllo della città, cacciato il governatore dalla sua camera di consiglio e sollevato il giudice dal suo incarico.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //Se vuoi sapere la mia opinione, credo sia una cosa positiva. Quegli individui spocchiosi avevano bisogno di una bella lezione di umiltà.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_7_LOCATION_Condition;
	information	= DIA_MIL_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Quali alternative ho qui in città?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //Quali alternative ho qui in città?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Se non vuoi finire nei bassifondi del distretto del porto, faresti meglio a trovarti un lavoro. Chiedi in giro nella parte bassa della città, magari sarai fortunato.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Se hai intenzione di trattenerti più a lungo qui in città, dovresti arruolarti nella guardia cittadina o almeno addestrarti al combattimento.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Gli istruttori di combattimento nella caserma addestrano anche i civili.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Gli orchi arriveranno presto, quindi ogni ora trascorsa ad addestrarti sarà preziosa.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_7_STANDARD_Condition;
	information	= DIA_MIL_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //I cittadini spariscono da qui uno dopo l'altro. Fino ad ora non siamo stati in grado di scoprire che cosa stia succedendo loro. Potrebbe essere opera degli orchi?
			
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{		
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //Dicono che i contadini si siano ribellati. Non possiamo farci distrarre da questa faccenda nel bel mezzo di una guerra con gli orchi!
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Era ora che i paladini mettessero fine alla ribellione dei contadini. I trasgressori vanno puniti, specialmente ora che siamo in guerra.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //Pare che il mercenario accusato di aver ucciso Lothar sia innocente. Qualcuno ha trovato le prove che era stato incastrato.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Uno dei mercenari di Onar ha ucciso l'onorevole paladino Lothar. Ma quel bastardo è stato preso e gettato in prigione.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //Alcuni dei mercenari hanno già lasciato la fattoria di Onar. A volte i problemi si risolvono da soli.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //I draghi sono stati sconfitti, ma non è ancora finita. Ora tocca agli orchi. Daremo una bella ripulita a questo posto.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_7 (var c_NPC slf)
{
	DIA_MIL_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
