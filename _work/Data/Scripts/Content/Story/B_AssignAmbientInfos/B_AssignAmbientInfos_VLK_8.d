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
	description = "Chci se stát obèanem tohoto mìsta!";
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
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //Chci se stát obèanem tohoto mìsta!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //A proè to øíkáš mnì? Zajdi za jedním z øemeslnických mistrù v dolní èásti mìsta. Možná, když budeš mít štìstí, bude nìkterý z nich hledat uèedníka.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //Jindy bys mohl zajít za místodržícím a nechat se zapsat do registru mìšanù.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //Ale teï na to mùžeš rovnou zapomenout. Od té doby, co sem pøišli paladinové, nemá místodržící žádné pravomoci.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //A jejich velitel, lord Hagen, zaruèenì nemá na podobné vìci èas.
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
	description = "Kdo v tomhle mìstì požívá nejvìtší vážnosti?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //Kdo v tomhle mìstì požívá nejvìtší vážnosti?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //Kromì paladinù... øemeslniètí mistøi v dolní èásti mìsta. Ti jsou také velmi vážení.
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
	description = "Co je tu zajímavého k vidìní?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //Co je tu zajímavého k vidìní?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //V pøístavu je obrovská loï, kterou paladinové pøipluli. Je to neuvìøitelnì velké plavidlo. Mìl by ses na nìj podívat.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //Ale nedokážu si pøedstavit, že by tì pustili na palubu. Paladinové støeží svoji loï jako korunovaèní klenoty.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //Není divu. Taky to je jediná námoøní loï široko daleko.
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
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //V poslední dobì mají starosti všichni.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //Jako by nestaèilo, že se tu usadili paladinové. Teï tu ještì neustále mizejí lidi, a to tím nejpodivnìjším zpùsobem.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //Je èas, aby v tom domobrana koneènì nìco udìlala.
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
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Všichni èekají na to, až paladinové oznámí, proè tu doopravdy jsou. Pøedpokládám, že kvùli skøetùm. Urèitì co nevidìt zaútoèí!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //Paladinové možná mají Innosovo požehnání, ale až se objeví skøeti, bude to na nás.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //Øíká se, že tu paladinové jsou jen kvùli tomu, aby dostali všechnu rudu z ostrova. Prý kvùli válce na pevninì.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //Víš, co to znamená? Královi je úplnì volný, jestli tady chcípnem, až skøeti zaútoèí.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //Budu se snažit být na palubì, až budou paladinové zvedat kotvy.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //Øíká se, že skøeti pøiletí do našeho mìsta na dracích, co jsou velcí jako polovina mìsta! Nemáme žádnou šanci!
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
