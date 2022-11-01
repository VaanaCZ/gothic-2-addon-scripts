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
	description = "Chcę wstąpić do straży.";
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
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //Chcę się przyłączyć do straży!
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //Nie jesteś nawet obywatelem Khorinis! Dlaczego myślisz, że Lord Andre zechce cię przyjąć?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //Gdyby tak było, każdy mógłby sobie przyjść, wziąć przydziałową broń i zbroję, a później zniknąć na dobre!
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //Ja mówię poważnie!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //Nie wyjaśniaj tego mnie, tylko Lordowi Andre. Znajdziesz go w koszarach.
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
	description = "Co wiesz o paladynach?";
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
	AI_Output (other, self, "DIA_MIL_7_PEOPLE_15_00"); //Co wiesz o paladynach?
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //Niewiele. Nikt właściwie nie wie, dlaczego tu przybyli. Nawet ci z nas, którzy służą w straży.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //Przejęli kontrolę nad miastem, przegonili gubernatora z jego komnat, zwolnili też sędziego z urzędu.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //Jeśli chcesz znać moje zdanie, to dobrze się stało. Tym nadętym osłom przyda się lekcja pokory.
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
	description = "Jakie perspektywy daje to miasto?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //Jakie perspektywy daje to miasto?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Jeśli nie chcesz skończyć w rynsztoku dzielnicy portowej, znajdź sobie jakąś stałą pracę. Popytaj w dolnej części miasta, może tam uda ci się coś znaleźć.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Jeśli chcesz dłużej pozostać w mieście, powinieneś przyłączyć się do straży lub chociaż podszkolić się w walce.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Instruktorzy w koszarach szkolą także cywili.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Wkrótce pojawią się tu orkowie, a wtedy docenisz wojskowy trening i godziny na nim spędzone.
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
	description = "Co nowego?";
};                       
func INT DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //Ludzie znikają jeden po drugim. Nie udało nam się jeszcze dowiedzieć, co się z nimi dzieje.
			
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
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //Ponoć chłopi się buntują. Nie dość, że jesteśmy w środku wojny z orkami, to jeszcze musimy się użerać z tymi prostakami.
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Czas już, by paladyni zajęli się rebelią chłopów. Kto łamie prawo, powinien ponieść tego surowe konsekwencje. Szczególnie teraz, kiedy toczy się wojna.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //Najemnik, którego oskarżono o zabójstwo Lothara, jest prawdopodobnie niewinny. Ponoć ktoś znalazł dowód na to, że go wrobiono.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Jeden z najemników Onara zamordował Lothara, czcigodnego paladyna. Na szczęście drań został złapany i wtrącony do więzienia.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //Niektórzy z najemników opuścili farmę Onara. Jak widać, problem rozwiązuje się sam.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //Pozbyliśmy się smoków, ale to nie koniec. Następni w kolejce są orkowie. Niedługo wszystkim się zajmiemy!
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
