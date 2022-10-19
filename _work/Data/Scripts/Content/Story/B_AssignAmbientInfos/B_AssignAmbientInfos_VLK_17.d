// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_17_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_17_EXIT_Condition;
	information	= DIA_VLK_17_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_17_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_17_JOIN_Condition;
	information	= DIA_VLK_17_JOIN_Info;
	permanent	= TRUE;
	description = "Was muss ich tun, um Bürger dieser Stadt zu werden?";
};                       

FUNC INT DIA_VLK_17_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_17_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_JOIN_15_00"); //Was muss ich tun, um Bürger dieser Stadt zu werden?
	AI_Output (self, other, "DIA_VLK_17_JOIN_17_01"); //Die Handwerksmeister in der Unterstadt haben großen Einfluss hier in Khorinis. Du solltest mit einem von ihnen reden.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_17_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_17_PEOPLE_Condition;
	information	= DIA_VLK_17_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer sind die wichtigsten Persönlichkeiten dieser Stadt?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_PEOPLE_15_00"); //Wer sind die wichtigsten Persönlichkeiten dieser Stadt?
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_01"); //Seit die Paladine hier sind, haben sie die Kontrolle über die ganze Stadt übernommen.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_02"); //Lord Andre vertritt das Gesetz. Du findest ihn in der Kaserne.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_03"); //Aber solange du nicht gegen das Gesetz verstoßen hast, oder dich der Miliz anschließen willst, brauchst du nicht zu ihm zu gehen.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_17_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_17_LOCATION_Condition;
	information	= DIA_VLK_17_LOCATION_Info;
	permanent	= TRUE;
	description = "Was sind die interessantesten Orte hier in Khorinis?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_LOCATION_15_00"); //Was sind die interessantesten Orte hier in Khorinis?
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_01"); //(lacht) Vielleicht solltest du das besser einen Mann fragen. Wenn dir nach Unterhaltung ist, solltest du dich am Hafen umsehen.
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_02"); //Aber wenn es dir darum geht, etwas zu kaufen, geh zum Marktplatz am Osttor oder in die Unterstadt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_17_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_17_STANDARD_Condition;
	information	= DIA_VLK_17_STANDARD_Info;
	permanent	= TRUE;
	description = "Was gibt's Neues?";
};                       
func INT DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_17_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	|| (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_01"); //Ich frage mich, was die Paladine eigentlich hier wollen. Sie haben das Rathaus, die Kaserne und den Hafen besetzt, aber bis jetzt noch nichts unternommen.
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_02"); //Wenn sie wegen der Orks oder der Banditen hier wären, hätten sie schon längst was unternommen. Es muss einen anderen Grund geben ...
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_03"); //Gerade ist mir klar geworden, warum die Paladine hier sind. Es geht ihnen nur ums Erz. Die Kerle sollten lieber unsere Stadt verteidigen.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_04"); //Ich hoffe, dass an den Geschichten über die Drachen etwas dran ist. Dann wird Lord Hagen gezwungen sein, etwas zu unternehmen. Er kann uns hier nicht einfach den Drachen ausliefern.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_05"); //Jetzt, wo die Drachen tot sind, werden die Paladine mit dem restlichen Gesindel kurzen Prozess machen.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_17 (var c_NPC slf)
{
	DIA_VLK_17_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
