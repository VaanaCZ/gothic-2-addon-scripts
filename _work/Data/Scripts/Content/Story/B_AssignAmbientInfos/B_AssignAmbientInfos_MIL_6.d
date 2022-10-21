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
	description = "Was muﬂ ich tun, um mich der Miliz anzuschlieﬂen?";
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
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Was muss ich tun, um mich der Miliz anzuschlieﬂen?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Geh zu Lord Andre und rede mit ihm. Seit die Paladine in der Stadt sind, hat er das Kommando ¸ber die ganze Miliz.
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
	description	 = 	"Ich hab' gehˆrt, es sind einige B¸rger verschunden.";
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
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //Ich hab' gehˆrt, es sind einige B¸rger verschwunden.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //In der Tat h‰ufen sich die Berichte ¸ber Vermisste in den letzten Tagen.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Ich kann mir das beim besten Willen nicht erkl‰ren.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Aber mehr als die Augen offen halten und Wache schieben kˆnnen wir auch nicht machen.
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
	description = "Erz‰hl mir etwas ¸ber die Paladine.";
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
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Erz‰hl mir etwas ¸ber die Paladine.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Seit die Paladine in Khorinis angekommen sind, haben sie sich ins obere Viertel zur¸ckgezogen.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Sie lassen niemanden mehr da rein. Auﬂer die B¸rger der Stadt und die Miliz nat¸rlich.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Es gibt auch noch einige Paladine am Hafen, die das Schiff bewachen. Aber die sind alles andere als gespr‰chig.
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
	description = "Was gibt es ¸ber diese Stadt zu wissen?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Was gibt es ¸ber diese Stadt zu wissen?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Die Paladine haben jetzt die Kontrolle ¸ber die ganze Stadt. Die gesamte Miliz untersteht ihnen.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Der Kommandant der Miliz ist Lord Andre, er ¸bt auch gleichzeitig das Amt des Richters aus.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Wenn du jemals mit dem Gesetz in Konflikt geraten solltest, wirst du dich vor ihm rechtfertigen m¸ssen.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Aber er ist recht gn‰dig, nach allem, was man hˆrt. Die meisten F‰lle l‰sst er mit einer Geldstrafe davonkommen.
	
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
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Die Diebst‰hle h‰ufen sich und Lord Andre vermutet, dass eine Bande dahinter steckt.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Wir haben vor kurzem das gesamte Hafenviertel auf den Kopf gestellt, aber gefunden haben wir noch nichts.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Das Problem mit den Banditen bekommen wir langsam in den Griff, so wie's aussieht. Die ‹berf‰lle sind in letzter Zeit stark zur¸ckgegangen.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Es wird immer schlimmer mit dem Gesindel, das in die Stadt kommt. Letzte Nacht habe ich einen Mann in schwarzer Robe durch das obere Viertel verfolgt.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Ich bin mir sicher, der f¸hrte was im Schilde. Aber als ich ihm um das Haus des Statthalters folgte, war er einfach verschwunden. Merkw¸rdige Gestalt ...
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //Es heiﬂt, Lord Hagen hat Sˆldner angeheuert, um gegen die Drachen zu k‰mpfen. Mir soll's recht sein, ich h‰tte keine Lust, gegen einen Drachen anzutreten.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Es heiﬂt, die Drachen sind besiegt worden! Lord Hagen sammelt seine M‰nner, um auch die restlichen Kreaturen aus dem Minental zu vertreiben.
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
