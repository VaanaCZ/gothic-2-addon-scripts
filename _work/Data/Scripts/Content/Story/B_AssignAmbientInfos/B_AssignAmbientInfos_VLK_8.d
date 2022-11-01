// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_8_EXIT_Condition;
	information	= DIA_VLK_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_8_JOIN_Condition;
	information	= DIA_VLK_8_JOIN_Info;
	permanent	= TRUE;
	description = "Voglio diventare un cittadino di questa città!";
};                       

FUNC INT DIA_VLK_8_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //Voglio diventare un cittadino di questa città!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //E perché lo dici a me? Vai da uno dei maestri artigiani nella parte bassa della città. Se sei fortunato, può darsi che uno di loro stia cercando un apprendista.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //Altrimenti dovrai recarti dal governatore e farti registrare come cittadino.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //Ma, al momento, puoi scordartelo. Da quando sono arrivati i paladini il governatore non è più in carica.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //E il loro capo, Lord Hagen, non ha sicuramente tempo per questo genere di cose.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_8_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_8_PEOPLE_Condition;
	information	= DIA_VLK_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Quali sono i cittadini più importanti in questa città?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //Quali sono i cittadini più importanti in questa città?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //A parte i paladini... i maestri artigiani nella parte bassa della città. Sono tutte persone molto influenti.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_8_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_8_LOCATION_Condition;
	information	= DIA_VLK_8_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa c’è di interessante da vedere, qui?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //Cosa c’è di interessante da vedere, qui?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //La grossa nave con la quale sono arrivati i paladini. Si trova al porto. È davvero enorme! Devi andarla a vedere.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //Ma non credo che ti faranno salire a bordo. I paladini sorvegliano la nave come se si trattasse dei gioielli della corona.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //C'è poco da meravigliarsi. In fondo si tratta dell'unico vascello di una certa stazza ancorato nel raggio di parecchie miglia.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_8_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_8_STANDARD_Condition;
	information	= DIA_VLK_8_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //Ultimamente sono stati tutti preoccupati.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //Non basta che i paladini si siano installati qui, ora la gente sparisce un po' per volta in un modo stranissimo.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //È ora che la milizia si decida a fare qualcosa.
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
		SC_HearedAboutMissingPeople = TRUE;
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Tutti stanno aspettando che i paladini annuncino il vero motivo della loro venuta. Sospetto che sia a causa degli orchi. È certo che attaccheranno a breve!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //I paladini avranno anche la benedizione di Innos, ma quando le orde degli orchi arriveranno qui, per noi saranno guai.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //Dicono che i paladini siano qui solo per prendere tutto il metallo dell'isola. Dicono che è per la guerra e per il continente.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //Sai cosa significa questo? Che al re non gliene frega niente se moriamo tutti come cani durante l'attacco degli orchi.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //Farò in modo di essere su quella nave quando i paladini salperanno.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //Dicono che gli orchi stiano venendo in questa direzione a cavallo di draghi grossi quanto mezza città! Non abbiamo nessuna speranza!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_07"); //La gente va dicendo che i draghi sono stati sconfitti. Sarà vero?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_8 (var c_NPC slf)
{
	DIA_VLK_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
