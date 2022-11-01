// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_6_EXIT_Condition;
	information	= DIA_MIL_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_6_JOIN_Condition;
	information	= DIA_MIL_6_JOIN_Info;
	permanent	= TRUE;
	description = "Was muß ich tun, um mich der Miliz anzuschließen?";
};                       

FUNC INT DIA_MIL_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Was muss ich tun, um mich der Miliz anzuschließen?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Geh zu Lord Andre und rede mit ihm. Seit die Paladine in der Stadt sind, hat er das Kommando über die ganze Miliz.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //Du findest ihn in der Kaserne. Dort ist er eigentlich immer anzutreffen.
	};
};

// *************************************************************************
// 						MissingPeople
// *************************************************************************
instance DIA_Addon_MIL_6_MissingPeople		(C_INFO)
{
	nr		 = 	2;
	condition	 = 	DIA_Addon_MIL_6_MissingPeople_Condition;
	information	 = 	DIA_Addon_MIL_6_MissingPeople_Info;
	permanent	= TRUE;
	description	 = 	"Ich hab' gehört, es sind einige Bürger verschunden.";
};

func int DIA_Addon_MIL_6_MissingPeople_Condition ()
{
	if (Kapitel == 1)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_MIL_6_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //Ich hab' gehört, es sind einige Bürger verschwunden.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //In der Tat häufen sich die Berichte über Vermisste in den letzten Tagen.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Ich kann mir das beim besten Willen nicht erklären.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Aber mehr als die Augen offen halten und Wache schieben können wir auch nicht machen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_6_PEOPLE_Condition;
	information	= DIA_MIL_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Erzähl mir etwas über die Paladine.";
};                       

FUNC INT DIA_MIL_6_PEOPLE_Condition()
{
	IF (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Erzähl mir etwas über die Paladine.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Seit die Paladine in Khorinis angekommen sind, haben sie sich ins obere Viertel zurückgezogen.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Sie lassen niemanden mehr da rein. Außer die Bürger der Stadt und die Miliz natürlich.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Es gibt auch noch einige Paladine am Hafen, die das Schiff bewachen. Aber die sind alles andere als gesprächig.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_6_LOCATION_Condition;
	information	= DIA_MIL_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Was gibt es über diese Stadt zu wissen?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Was gibt es über diese Stadt zu wissen?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Die Paladine haben jetzt die Kontrolle über die ganze Stadt. Die gesamte Miliz untersteht ihnen.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Der Kommandant der Miliz ist Lord Andre, er übt auch gleichzeitig das Amt des Richters aus.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Wenn du jemals mit dem Gesetz in Konflikt geraten solltest, wirst du dich vor ihm rechtfertigen müssen.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Aber er ist recht gnädig, nach allem, was man hört. Die meisten Fälle lässt er mit einer Geldstrafe davonkommen.
	
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_6_STANDARD_Condition;
	information	= DIA_MIL_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Was gibt's Neues?";
};                       
func INT DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //In letzter Zeit kommt immer mehr Gesindel in die Stadt.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Die Diebstähle häufen sich und Lord Andre vermutet, dass eine Bande dahinter steckt.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Wir haben vor kurzem das gesamte Hafenviertel auf den Kopf gestellt, aber gefunden haben wir noch nichts.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Das Problem mit den Banditen bekommen wir langsam in den Griff, so wie's aussieht. Die Überfälle sind in letzter Zeit stark zurückgegangen.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Es wird immer schlimmer mit dem Gesindel, das in die Stadt kommt. Letzte Nacht habe ich einen Mann in schwarzer Robe durch das obere Viertel verfolgt.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Ich bin mir sicher, der führte was im Schilde. Aber als ich ihm um das Haus des Statthalters folgte, war er einfach verschwunden. Merkwürdige Gestalt ...
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //Es heißt, Lord Hagen hat Söldner angeheuert, um gegen die Drachen zu kämpfen. Mir soll's recht sein, ich hätte keine Lust, gegen einen Drachen anzutreten.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Es heißt, die Drachen sind besiegt worden! Lord Hagen sammelt seine Männer, um auch die restlichen Kreaturen aus dem Minental zu vertreiben.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_6 (var c_NPC slf)
{
	DIA_MIL_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
