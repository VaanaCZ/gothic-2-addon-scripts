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
	description = "Ich will mehr über die Söldner wissen!";
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
	AI_Output (other, self, "DIA_BAU_13_JOIN_15_00"); //Ich will mehr über die Söldner wissen!
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_01"); //Wenn du mal Ärger mit ihnen hast, geh zu Lee. Das machen wir Bauern auch so. Er ist sehr hart zu seinen Leuten.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_02"); //Wenn sich einer von ihnen nicht benimmt, nimmt er ihn sich zur Brust.
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
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_01"); //Wenn du mich fragst, sind das die Söldner. Onar bezahlt sie zwar, aber Innos weiß, wie lange sie sich von ihm rumkommandieren lassen.
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_02"); //Wenn die Söldner irgendwann mal der Meinung sind, er wäre hier überflüssig, möchte ich nicht in seiner Haut stecken.
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
	description = "Was kannst du mir über die Gegend hier erzählen?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_LOCATION_15_00"); //Was kannst du mir über die Gegend hier erzählen?
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_01"); //Es gibt drei Höfe hier. Onars im Osten und Sekobs im Norden das Tals.
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_02"); //Im Südwesten gibt es einen Aufgang zur Hochebene. Dort liegt Bengars Hof.
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
	description = "Was gibt's Neues?";
};                       
func INT DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_13_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_01"); //Die Truppen aus der Stadt holen uns nicht mehr Vieh und Ernte weg! Die spielen das Spiel nicht mehr mit, wir können uns jetzt selbst verteidigen!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_02"); //Die Paladine in der Stadt kümmern sich nicht um uns Bauern. Wenn die Orks angreifen, sind wir auf uns allein gestellt.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_03"); //Drachen! Im Minental soll es Drachen geben. Sie kommen bestimmt bald über den Pass!
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_04"); //Es sollen sogar einige Banditen aus den Bergen ins Minental aufgebrochen sein. Also, mir wäre das zu gefährlich.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_05"); //Wenn die Steuern wieder runtergehen und man uns für unsere Arbeit angemessen bezahlt, werden wir auch wieder mit der Stadt handeln.
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
