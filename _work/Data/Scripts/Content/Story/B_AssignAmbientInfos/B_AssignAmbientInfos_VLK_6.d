// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_6_EXIT_Condition;
	information	= DIA_VLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_JOIN_Condition;
	information	= DIA_VLK_6_JOIN_Info;
	permanent	= TRUE;
	description = "Cosa devo fare per diventare un cittadino di questa città?";
};                       

FUNC INT DIA_VLK_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //Cosa devo fare per diventare un cittadino di questa città?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //Vuoi venire a vivere qui? Adesso? Proprio quando tutti i segnali lasciano presagire la fine del mondo?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //Non voglio rimanere qui per sempre.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Beh, se vuoi il mio consiglio, dovresti abbandonare in fretta questo posto finché sei in tempo, ma se proprio insisti, parla con una delle persone influenti qui.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_6_PEOPLE_Condition;
	information	= DIA_VLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Quali sono i cittadini di potere di Khorinis?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //Quali sono i cittadini di potere di Khorinis?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Prova con il fabbro o il falegname nella parte bassa della città. Lì troverai anche alcuni maestri molto rispettati.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //Se c'è qualcuno qui che ha qualcosa da dire, oltre ai paladini e alle guardie cittadine, sono proprio questi uomini.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_6_LOCATION_Condition;
	information	= DIA_VLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa devo fare per orientarmi in questa città?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //Cosa devo fare per orientarmi in questa città?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //Non è facile orientarsi da queste parti, vero? Persino i segnali a volte non aiutano.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Se hai scarso senso dell'orientamento, faresti meglio a scendere giù al porto e cercare la casa del cartografo, sempre che tu sia in grado di trovare la strada...
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //Si trova vicino alla taverna, al molo. Brahim avrà sicuramente una mappa della città da darti.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_6_STANDARD_Condition;
	information	= DIA_VLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Da quando la Barriera è crollata, questa città è stata oggetto di continui attacchi da parte dei briganti senza che i paladini si degnassero di muovere un dito. Che diavolo ci fanno qui allora?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Ultimamente, il problema dei briganti non è stato così urgente. Sembra come se qualcuno si sia deciso finalmente ad affrontarlo.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Hanno lasciato andare lo sporco mercenario che ha ucciso quel paladino. Non sarebbe stata una cattiva idea impiccarlo.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //Dicono che uno dei mercenari di Onar abbia ucciso un paladino. L'hanno catturato e messo in prigione. Presto lo vedremo pendere dalla forca.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //Mi chiedo se ci sia qualcosa di vero in quelle storie sui draghi...
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //Dicono che Lord Hagen stia radunando i suoi uomini per liberare la Valle delle Miniere. Finalmente le cose si stanno muovendo!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_6 (var c_NPC slf)
{
	DIA_VLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
