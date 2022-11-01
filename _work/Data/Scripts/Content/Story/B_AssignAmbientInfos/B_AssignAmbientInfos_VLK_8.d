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
	description = "Chci se stát občanem tohoto města!";
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
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //Chci se stát občanem tohoto města!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //A proč to říkáš mně? Zajdi za jedním z řemeslnických mistrů v dolní části města. Možná, když budeš mít štěstí, bude některý z nich hledat učedníka.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //Jindy bys mohl zajít za místodržícím a nechat se zapsat do registru měšťanů.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //Ale teď na to můžeš rovnou zapomenout. Od té doby, co sem přišli paladinové, nemá místodržící žádné pravomoci.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //A jejich velitel, lord Hagen, zaručeně nemá na podobné věci čas.
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
	description = "Kdo v tomhle městě požívá největší vážnosti?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //Kdo v tomhle městě požívá největší vážnosti?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //Kromě paladinů... řemeslničtí mistři v dolní části města. Ti jsou také velmi vážení.
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
	description = "Co je tu zajímavého k vidění?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //Co je tu zajímavého k vidění?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //V přístavu je obrovská loď, kterou paladinové připluli. Je to neuvěřitelně velké plavidlo. Měl by ses na něj podívat.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //Ale nedokážu si představit, že by tě pustili na palubu. Paladinové střeží svoji loď jako korunovační klenoty.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //Není divu. Taky to je jediná námořní loď široko daleko.
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
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //V poslední době mají starosti všichni.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //Jako by nestačilo, že se tu usadili paladinové. Teď tu ještě neustále mizejí lidi, a to tím nejpodivnějším způsobem.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //Je čas, aby v tom domobrana konečně něco udělala.
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
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Všichni čekají na to, až paladinové oznámí, proč tu doopravdy jsou. Předpokládám, že kvůli skřetům. Určitě co nevidět zaútočí!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //Paladinové možná mají Innosovo požehnání, ale až se objeví skřeti, bude to na nás.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //Říká se, že tu paladinové jsou jen kvůli tomu, aby dostali všechnu rudu z ostrova. Prý kvůli válce na pevnině.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //Víš, co to znamená? Královi je úplně volný, jestli tady chcípnem, až skřeti zaútočí.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //Budu se snažit být na palubě, až budou paladinové zvedat kotvy.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //Říká se, že skřeti přiletí do našeho města na dracích, co jsou velcí jako polovina města! Nemáme žádnou šanci!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_07"); //Mezi lidmi se povídá, že draci byli poraženi. Může to být pravda?
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
