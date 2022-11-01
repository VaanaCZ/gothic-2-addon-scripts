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
	description = "Chciałbym zostać obywatelem tego miasta!";
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
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //Chciałbym zostać obywatelem tego miasta!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //Po co mi to mówisz? Idź do któregoś z rzemieślników w dolnej części miasta. Jeśli dopisze ci szczęście, któryś przyjmie cię na czeladnika.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //W innym wypadku będziesz musiał pójść do gubernatora i zostać zarejestrowany jako prawny obywatel.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //W chwili obecnej możesz jednak o tym zapomnieć. Dopóki w mieście stacjonują paladyni, dopóty gubernator nie ma władzy w mieście.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //Przywódca paladynów, Lord Hagen, z pewnością nie ma czasu na takie drobnostki.
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
	description = "Którzy z obywateli miasta są najważniejsi?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //Którzy z obywateli miasta są najważniejsi?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //Oprócz paladynów... Najważniejsi są rzemieślnicy z dolnej części miasta. Ich zdanie bardzo się tu liczy.
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
	description = "Czy są tutaj jakieś interesujące rzeczy?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //Jakie ciekawe miejsca warto tu zobaczyć?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //Niedawno do portu wpłynął statek paladynów. Jest wielki. Koniecznie musisz go zobaczyć.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //Wątpię jednak, by chcieli cię wpuścić na pokład. Paladyni bronią wstępu na statek jak klejnotów koronnych.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //Nic dziwnego. To jedyna pływająca jednostka zakotwiczona w okolicy.
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
	description = "Co nowego?";
};                       
func INT DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //Ostatnimi czasy wszyscy są bardzo nerwowi.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //Jakby mało było tego, że przybyli tu paladyni - teraz jeszcze znikają ludzie!
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //Najwyższa pora, żeby straż coś z tym zrobiła.
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
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Wszyscy czekają na ogłoszenie powodu wizyty paladynów. Domyślam się, że są tu z powodu orków. Bestie pewnie wkrótce zaatakują!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //Może i paladynów prowadzi łaska Innosa, lecz kiedy zjawią się orkowe hordy, wszyscy będziemy straceni.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //Ludzie powiadają, że jedynym powodem wizyty paladynów jest chęć zabrania rudy... na potrzeby wojny na kontynencie.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //Czy wiesz, co to oznacza? Król ma w głębokim poważaniu to, że orkowie wszystkich nas pozabijają.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //Zrobię wszystko, by być na tym statku, kiedy paladyni zaczną podnosić kotwicę.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //Ponoć orkowie lecą tutaj na grzbietach smoków, wielkich jak połowa miasta. Nie mamy żadnych szans na obronę!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_07"); //Ludzie mówią, że smoki zostały pokonane. Czy to prawda?
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
