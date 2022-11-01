// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_13_EXIT_Condition;
	information	= DIA_BAU_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_13_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_13_JOIN_Condition;
	information	= DIA_BAU_13_JOIN_Info;
	permanent	= TRUE;
	description = "Powiedz mi coś więcej o tych najemnikach!";
};                       

FUNC INT DIA_BAU_13_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_JOIN_15_00"); //Powiedz mi coś więcej o tych najemnikach.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_01"); //Jeśli dadzą ci się we znaki, to porozmawiaj z Lee. My, chłopi, zawsze tak robimy, a on trzyma swoich ludzi krótko.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_02"); //Jeśli któryś z nich źle się zachowuje, od razu dostaje nauczkę.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_13_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_13_PEOPLE_Condition;
	information	= DIA_BAU_13_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto tu dowodzi?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_PEOPLE_15_00"); //Kto tu rządzi?
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_01"); //Jeśli chcesz znać moje zdanie, najemnicy. Fakt, Onar ich opłaca, ale chyba tylko sam Innos wie, jak długo jeszcze będą go słuchać.
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_02"); //Niech no tylko najemnicy pójdą po rozum do głowy, a szybko wpadną na to, że nie jest im potrzebny. Nie chciałbym być wtedy w jego skórze.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_13_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_13_LOCATION_Condition;
	information	= DIA_BAU_13_LOCATION_Info;
	permanent	= TRUE;
	description = "Co możesz mi powiedzieć o tym miejscu?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_LOCATION_15_00"); //Co możesz mi powiedzieć o tym miejscu?
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_01"); //W pobliżu znajdują się trzy farmy. Farma Onara na wschodzie, zaś u północnego ujścia doliny gospodarstwo Sekoba.
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_02"); //Ścieżka pnąca się na wyżynę, na południowy zachód stąd, prowadzi na farmę Bengara.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_13_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_13_STANDARD_Condition;
	information	= DIA_BAU_13_STANDARD_Info;
	permanent	= TRUE;
	description = "Co nowego?";
};                       
func INT DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_13_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_01"); //Od kiedy zaczęliśmy się bronić, oddziały stacjonujące w mieście przestały rozkradać nasze zbiory i inwentarz! Chyba zbytnio się nas boją!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_02"); //Paladyni z miasta nie za bardzo przejmują się naszym losem. Jeśli orkowie zaatakują, będziemy zdani tylko na siebie.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_03"); //I jeszcze smoki! Plotka głosi, że bestie pojawiły się w Górniczej Dolinie. Ponoć wkrótce mają przeprawić się przez przełęcz!
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_04"); //Mówi się nawet o tym, jakoby bandyci z gór zmierzali w stronę Górniczej Doliny. Jak dla mnie, to trochę za dużo niebezpieczeństw.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_05"); //Kiedy podatki spadną do jakichś sensownych wartości, a my będziemy przyzwoicie zarabiać, wtedy znów zaczniemy handlować z miastem.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_13 (var c_NPC slf)
{
	DIA_BAU_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
