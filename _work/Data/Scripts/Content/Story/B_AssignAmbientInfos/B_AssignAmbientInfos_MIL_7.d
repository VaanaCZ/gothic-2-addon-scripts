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
	description = "Chcê wst¹piæ do stra¿y.";
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
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //Chcê siê przy³¹czyæ do stra¿y!
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //Nie jesteœ nawet obywatelem Khorinis! Dlaczego myœlisz, ¿e Lord Andre zechce ciê przyj¹æ?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //Gdyby tak by³o, ka¿dy móg³by sobie przyjœæ, wzi¹æ przydzia³ow¹ broñ i zbrojê, a póŸniej znikn¹æ na dobre!
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //Ja mówiê powa¿nie!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //Nie wyjaœniaj tego mnie, tylko Lordowi Andre. Znajdziesz go w koszarach.
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
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //Niewiele. Nikt w³aœciwie nie wie, dlaczego tu przybyli. Nawet ci z nas, którzy s³u¿¹ w stra¿y.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //Przejêli kontrolê nad miastem, przegonili gubernatora z jego komnat, zwolnili te¿ sêdziego z urzêdu.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //Jeœli chcesz znaæ moje zdanie, to dobrze siê sta³o. Tym nadêtym os³om przyda siê lekcja pokory.
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
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Jeœli nie chcesz skoñczyæ w rynsztoku dzielnicy portowej, znajdŸ sobie jak¹œ sta³¹ pracê. Popytaj w dolnej czêœci miasta, mo¿e tam uda ci siê coœ znaleŸæ.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Jeœli chcesz d³u¿ej pozostaæ w mieœcie, powinieneœ przy³¹czyæ siê do stra¿y lub chocia¿ podszkoliæ siê w walce.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Instruktorzy w koszarach szkol¹ tak¿e cywili.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Wkrótce pojawi¹ siê tu orkowie, a wtedy docenisz wojskowy trening i godziny na nim spêdzone.
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
	AI_Output (other, self, "DIA_MIL_7_STANDARD_15_00"); //Co s³ychaæ?
		
	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //Ludzie znikaj¹ jeden po drugim. Nie uda³o nam siê jeszcze dowiedzieæ, co siê z nimi dzieje.
			
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
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //Ponoæ ch³opi siê buntuj¹. Nie doœæ, ¿e jesteœmy w œrodku wojny z orkami, to jeszcze musimy siê u¿eraæ z tymi prostakami.
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Czas ju¿, by paladyni zajêli siê rebeli¹ ch³opów. Kto ³amie prawo, powinien ponieœæ tego surowe konsekwencje. Szczególnie teraz, kiedy toczy siê wojna.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //Najemnik, którego oskar¿ono o zabójstwo Lothara, jest prawdopodobnie niewinny. Ponoæ ktoœ znalaz³ dowód na to, ¿e go wrobiono.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Jeden z najemników Onara zamordowa³ Lothara, czcigodnego paladyna. Na szczêœcie drañ zosta³ z³apany i wtr¹cony do wiêzienia.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //Niektórzy z najemników opuœcili farmê Onara. Jak widaæ, problem rozwi¹zuje siê sam.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //Pozbyliœmy siê smoków, ale to nie koniec. Nastêpni w kolejce s¹ orkowie. Nied³ugo wszystkim siê zajmiemy!
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
