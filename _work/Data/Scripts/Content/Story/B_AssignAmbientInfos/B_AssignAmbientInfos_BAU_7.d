// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_7_EXIT_Condition;
	information	= DIA_BAU_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_7_JOIN_Condition;
	information	= DIA_BAU_7_JOIN_Info;
	permanent	= TRUE;
	description = "Was weißt du über die Söldner?";
};                       

FUNC INT DIA_BAU_7_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_JOIN_15_00"); //Was weißt du über die Söldner?
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_01"); //Onar hat sie angeheuert, damit sie seinen Hof verteidigen.
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_02"); //Die meisten benehmen sich, als ob ihnen der Hof gehören würde. Aber immerhin beschützen sie uns.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_7_PEOPLE_Condition;
	information	= DIA_BAU_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_BAU_7_PEOPLE_07_01"); //Der große Hof gehört Onar. Die kleinen Höfe hier in der Nähe auch. Aber die hat er verpachtet.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_7_LOCATION_Condition;
	information	= DIA_BAU_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Erzähl mir mehr über die Gegend.";
};                       

FUNC INT DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_LOCATION_15_00"); //Erzähl mir mehr über die Gegend.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_01"); //Der große Hof hier im Osten des Tals ist der von Onar, der Hof von Sekob liegt im Norden.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_02"); //Und Bengars Hof liegt auf der Hochebene im Südwesten. Du kannst sie vom Tal aus erreichen - es gibt eine große Steintreppe dorthin.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_7_STANDARD_Condition;
	information	= DIA_BAU_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Was gibt's Neues?";
};                       
func INT DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_01"); //Wir haben unsere Unabhängigkeit erklärt - wir machen keine Abgaben mehr an die Stadt. Der König hat nichts für uns getan - jetzt reicht es uns!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_02"); //Zurzeit ist hier nicht viel los.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_03"); //Man hört jetzt Geschichten von Drachen! Dem König fällt auch immer was Neues ein, um noch mehr Geld aus dem Volk zu pressen.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_04"); //Pass auf dich auf, durch den Pass kommen jede Menge finstere Gestalten und wilde Tiere.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_05"); //Jetzt, wo die Drachen tot sind, bequemen sich auch die Herren Paladine aus der Stadt. Wird Zeit, dass hier wieder Ordnung herrscht.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_7 (var c_NPC slf)
{
	DIA_BAU_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
