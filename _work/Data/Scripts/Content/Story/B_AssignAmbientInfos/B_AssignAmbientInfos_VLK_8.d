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
	description = "Chci se stát občanem tohoto męsta!";
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
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //Chci se stát občanem tohoto męsta!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //A proč to âíkáš mnę? Zajdi za jedním z âemeslnických mistrů v dolní části męsta. Možná, když budeš mít štęstí, bude nękterý z nich hledat učedníka.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //Jindy bys mohl zajít za místodržícím a nechat se zapsat do registru męšăanů.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //Ale teë na to můžeš rovnou zapomenout. Od té doby, co sem pâišli paladinové, nemá místodržící žádné pravomoci.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //A jejich velitel, lord Hagen, zaručenę nemá na podobné vęci čas.
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
	description = "Kdo v tomhle męstę požívá nejvętší vážnosti?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //Kdo v tomhle męstę požívá nejvętší vážnosti?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //Kromę paladinů... âemeslničtí mistâi v dolní části męsta. Ti jsou také velmi vážení.
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
	description = "Co je tu zajímavého k vidęní?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //Co je tu zajímavého k vidęní?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //V pâístavu je obrovská loë, kterou paladinové pâipluli. Je to neuvęâitelnę velké plavidlo. Męl by ses na nęj podívat.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //Ale nedokážu si pâedstavit, že by tę pustili na palubu. Paladinové stâeží svoji loë jako korunovační klenoty.
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
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //V poslední dobę mají starosti všichni.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //Jako by nestačilo, že se tu usadili paladinové. Teë tu ještę neustále mizejí lidi, a to tím nejpodivnęjším způsobem.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //Je čas, aby v tom domobrana konečnę nęco udęlala.
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
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Všichni čekají na to, až paladinové oznámí, proč tu doopravdy jsou. Pâedpokládám, že kvůli skâetům. Určitę co nevidęt zaútočí!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //Paladinové možná mají Innosovo požehnání, ale až se objeví skâeti, bude to na nás.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //Âíká se, že tu paladinové jsou jen kvůli tomu, aby dostali všechnu rudu z ostrova. Prý kvůli válce na pevninę.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //Víš, co to znamená? Královi je úplnę volný, jestli tady chcípnem, až skâeti zaútočí.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //Budu se snažit být na palubę, až budou paladinové zvedat kotvy.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //Âíká se, že skâeti pâiletí do našeho męsta na dracích, co jsou velcí jako polovina męsta! Nemáme žádnou šanci!
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
