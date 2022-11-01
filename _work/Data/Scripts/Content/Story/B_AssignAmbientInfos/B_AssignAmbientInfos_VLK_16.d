// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_16_EXIT_Condition;
	information	= DIA_VLK_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_16_JOIN_Condition;
	information	= DIA_VLK_16_JOIN_Info;
	permanent	= TRUE;
	description = "Chciałbym zostać obywatelem tego miasta!";
};                       

FUNC INT DIA_VLK_16_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_16_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_JOIN_15_00"); //Chciałbym zostać obywatelem miasta!
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_01"); //Czy pomożesz nam w obronie miasta przed atakami orków?
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_02"); //Jeśli jesteś obywatelem Khorinis, możesz przyłączyć się do oddziałów straży - w tej sprawie porozmawiaj z którymś ze strażników.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_16_PEOPLE_Condition;
	information	= DIA_VLK_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto jest najważniejszy w mieście?";
};                       

FUNC INT DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_PEOPLE_15_00"); //Kto jest najważniejszy w mieście?
	AI_Output (self, other, "DIA_VLK_16_PEOPLE_16_01"); //Paladyni, ich siedziba znajduje się w górnym mieście.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_16_LOCATION_Condition;
	information	= DIA_VLK_16_LOCATION_Info;
	permanent	= TRUE;
	description = "Czy są tutaj jakieś interesujące rzeczy?";
};                       

FUNC INT DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_LOCATION_15_00"); //Które miejsca warto tutaj odwiedzić?
	AI_Output (self, other, "DIA_VLK_16_LOCATION_16_01"); //Na targowisku odnajdziesz wszelkie możliwe towary.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_16_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_16_STANDARD_Condition;
	information	= DIA_VLK_16_STANDARD_Info;
	permanent	= TRUE;
	description = "Co nowego?";
};                       
func INT DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_STANDARD_15_00"); //Co nowego?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_00"); //Mam nadzieję, że straż w końcu dowie się, dlaczego Khorinis ma coraz mniej mieszkańców.
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_01"); //Wiedząc, ile osób już zaginęło, człowiek zaczyna się bać o swoje życie.
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
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_01"); //Nie słyszałeś, że ponoć na obrzeżach miasta dostrzeżono orków? Miejmy nadzieję, że paladyni sobie z nimi poradzą.
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_02"); //Zastanawiam się, czy właśnie to jest powodem, dla którego farmerzy nie zjawiają się na targu.
	};
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_03"); //Najemnik, którego oskarżono o zabójstwo Lothara, jest niewinny. Znaleziono dowód na to, że biedaka wrobiono! Słyszałam o tym na targowisku...
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_04"); //To oburzające. Najemnicy zarządcy bez żadnych skrupułów zamordowali czcigodnego paladyna Lothara!
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_05"); //Jednak sprawiedliwa ręka Innosa dosięgnie tych grzeszników. Nikt nie ma prawa podnosić miecza na wojowników naszego Pana.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_06"); //Ponoć przestępcy opuszczają farmę Onara. Mówią, że boją się ludzi Lorda Hagena, i dlatego wracają do Górniczej Doliny.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_07"); //Doszły mnie słuchy, że straszliwe smoki w Górniczej Dolinie zostały pokonane przez oddziały paladynów.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_16 (var c_NPC slf)
{
	DIA_VLK_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_16_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
