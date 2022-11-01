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
	description = "Chci se stát občanem tohoto města!";
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
	AI_Output (other, self, "DIA_VLK_16_JOIN_15_00"); //Chci se stát občanem tohoto města!
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_01"); //Pomůžeš nám bránit město proti skřetům?
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_02"); //Pokud jsi občanem Khorinidu, můžeš se přidat k domobraně - promluv si někým od městských stráží.
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
	description = "Kdo v tomhle městě požívá největší vážnosti?";
};                       

FUNC INT DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_PEOPLE_15_00"); //Kdo v tomhle městě požívá největší vážnosti?
	AI_Output (self, other, "DIA_VLK_16_PEOPLE_16_01"); //Paladinové obsadili horní část města.
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
	description = "Co je tu zajímavého k vidění?";
};                       

FUNC INT DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_LOCATION_15_00"); //Co je tu zajímavého k vidění?
	AI_Output (self, other, "DIA_VLK_16_LOCATION_16_01"); //Na tržišti nalezneš vystavené veškeré druhy zboží.
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
	description = "Co je nového?";
};                       
func INT DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_00"); //Doufám, že domobrana konečně zjistí, proč se khorinidská populace tak tenčí.
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_01"); //Když slyšíš, kolik lidí už zmizelo, aby ses taky začal bát o život.
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
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_01"); //Už jsi to slyšel? Za hradbami byli viděni skřeti. Doufejme, že paladinové mají dostatek mužů.
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_02"); //Rád bych věděl, jestli to náhodu není ten důvod, proč farmáři přestali chodit na trh.
	};
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_03"); //Žoldnéř, o kterém se říkalo, že zavraždil Lothara, je nevinný. Objevily se důkazy o tom, že na něj někdo ušil boudu. Zaslechl jsem to na tržišti.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_04"); //To je neslýchané. Ten statkářský žoldák zabil ctihodného Lothara přímo uprostřed ulice.
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_05"); //Ale Innos ho za jeho hříchy potrestá. Nikdo nesmí vztáhnout ruku na rytíře našeho Pána.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_06"); //Slyšel jsem, že ti šibeničníci opustili Onarovu farmu. Říká se, že se ze strachu před lordem Hagenem stáhli zpět do Hornického údolí.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_07"); //Slyšel jsem, že se oddíl paladinů vydal do Hornického údolí pobít ty strašné draky.
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
