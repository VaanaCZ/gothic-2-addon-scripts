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
	description = "Chci se stát obèanem tohoto mêsta!";
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
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //Chci se stát obèanem tohoto mêsta!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //A proè to âíkáš mnê? Zajdi za jedním z âemeslnických mistrù v dolní èásti mêsta. Možná, když budeš mít štêstí, bude nêkterý z nich hledat uèedníka.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //Jindy bys mohl zajít za místodržícím a nechat se zapsat do registru mêšãanù.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //Ale teë na to mùžeš rovnou zapomenout. Od té doby, co sem pâišli paladinové, nemá místodržící žádné pravomoci.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //A jejich velitel, lord Hagen, zaruèenê nemá na podobné vêci èas.
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
	description = "Kdo v tomhle mêstê požívá nejvêtší vážnosti?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //Kdo v tomhle mêstê požívá nejvêtší vážnosti?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //Kromê paladinù... âemeslniètí mistâi v dolní èásti mêsta. Ti jsou také velmi vážení.
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
	description = "Co je tu zajímavého k vidêní?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //Co je tu zajímavého k vidêní?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //V pâístavu je obrovská loë, kterou paladinové pâipluli. Je to neuvêâitelnê velké plavidlo. Mêl by ses na nêj podívat.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //Ale nedokážu si pâedstavit, že by tê pustili na palubu. Paladinové stâeží svoji loë jako korunovaèní klenoty.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //Není divu. Taky to je jediná námoâní loë široko daleko.
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
	description = "Co je nového?";
};                       
func INT DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //V poslední dobê mají starosti všichni.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //Jako by nestaèilo, že se tu usadili paladinové. Teë tu ještê neustále mizejí lidi, a to tím nejpodivnêjším zpùsobem.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //Je èas, aby v tom domobrana koneènê nêco udêlala.
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
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Všichni èekají na to, až paladinové oznámí, proè tu doopravdy jsou. Pâedpokládám, že kvùli skâetùm. Urèitê co nevidêt zaútoèí!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //Paladinové možná mají Innosovo požehnání, ale až se objeví skâeti, bude to na nás.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //Âíká se, že tu paladinové jsou jen kvùli tomu, aby dostali všechnu rudu z ostrova. Prý kvùli válce na pevninê.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //Víš, co to znamená? Královi je úplnê volný, jestli tady chcípnem, až skâeti zaútoèí.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //Budu se snažit být na palubê, až budou paladinové zvedat kotvy.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //Âíká se, že skâeti pâiletí do našeho mêsta na dracích, co jsou velcí jako polovina mêsta! Nemáme žádnou šanci!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_07"); //Mezi lidmi se povídá, že draci byli poraženi. Mùže to být pravda?
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
