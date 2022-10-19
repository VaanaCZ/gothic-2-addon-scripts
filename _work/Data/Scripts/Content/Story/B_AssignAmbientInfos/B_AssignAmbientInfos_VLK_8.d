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
	description = "Ich will Bürger dieser Stadt werden!";
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
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //Ich will Bürger dieser Stadt werden!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //Und warum erzählst du mir das? Geh zu einem der Handwerksmeister in der Unterstadt. Vielleicht hast du Glück und sie suchen noch einen Lehrling.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //Ansonsten müsstest du zum Statthalter gehen und dich als Bürger eintragen lassen.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //Aber das kannst du zurzeit vergessen. Der Statthalter hat nichts mehr zu sagen, seit die Paladine da sind.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //Und ihr Anführer, Lord Hagen, nimmt sich für solche Dinge garantiert keine Zeit.
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
	description = "Wer sind die wichtigsten Bürger dieser Stadt?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //Wer sind die wichtigsten Bürger dieser Stadt?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //Wenn man mal von den Paladinen absieht ... die Handwerksmeister aus der Unterstadt. Sie sind alle sehr hoch angesehen.
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
	description = "Was gibt es hier interessantes zu sehen?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //Was gibt es hier Interessantes zu sehen?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //Das große Schiff, mit dem die Paladine gekommen sind, liegt am Hafen. Es ist ein Riesenkahn! Den musst du dir mal ansehen.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //Allerdings kann ich mir nicht vorstellen, dass sie dich da drauf lassen. Die Paladine hüten das Schiff wie ihren Augapfel.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //Kein Wunder. Ist ja auch der einzige seetüchtige Kahn, der hier weit und breit vor Anker liegt.
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
	description = "Was gibt's Neues?";
};                       
func INT DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //Alle sind in letzter Zeit sehr beunruhigt.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //Nicht genug, dass die Paladine sich hier breit gemacht haben, jetzt verschwindet auch noch ständig irgendjemand auf merkwürdige Art und Weise.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //Es wird langsam Zeit, dass die Miliz endlich etwas dagegen unternimmt.
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
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Jeder wartet darauf, dass die Paladine verkünden, warum sie eigentlich hier sind. Ich vermute, es ist wegen der Orks. Sie greifen bestimmt bald an!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //Die Paladine mögen zwar den Segen Innos' haben, aber wenn hier die Orkhorden auflaufen, sind wir geliefert.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //Es heißt, die Paladine sind nur hier, um alles Erz von dieser Insel zu holen. Für den Krieg auf dem Festland, heißt es.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //Weißt du, was das heißt? Es ist dem König egal, ob wir hier alle verrecken, wenn die Orks angreifen.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //Ich werde zusehen, dass ich mit aufs Schiff komme, wenn die Paladine ablegen.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //Es heißt, die Orks reiten auf Drachen hierher, die so groß sind wie die halbe Stadt! Wir haben keine Chance!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_07"); //Die Leute erzählen sich, die Drachen wären besiegt worden. Ob das stimmt?
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
