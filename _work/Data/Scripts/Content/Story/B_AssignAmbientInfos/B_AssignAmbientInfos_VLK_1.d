// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_1_EXIT_Condition;
	information	= DIA_VLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_1_JOIN_Condition;
	information	= DIA_VLK_1_JOIN_Info;
	permanent	= TRUE;
	description = "Wie kann ich B¸rger dieser Stadt werden?";
};                       

FUNC INT DIA_VLK_1_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_JOIN_15_00"); //Wie kann ich B¸rger dieser Stadt werden?
	AI_Output (self, other, "DIA_VLK_1_JOIN_01_01"); //Such dir 'ne ordentliche Arbeit! Jeder, der hier in Khorinis einer festen Besch‰ftigung nachgeht, z‰hlt zu den B¸rgern der Stadt.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_1_PEOPLE_Condition;
	information	= DIA_VLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer sind hier die wichtigen Persˆnlichkeiten?";
};                       

FUNC INT DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_PEOPLE_15_00"); //Wer sind hier die wichtigen Persˆnlichkeiten?
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_01"); //(lacht) Bis vor kurzem waren das noch der Statthalter und der Richter. Aber dann kamen die Paladine, und die haben die Stadt ¸bernommen.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_02"); //Lord Hagen ist ihr Anf¸hrer. Er ist jetzt gewissermaﬂen der neue Statthalter.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_03"); //Lord Andre ist seine rechte Hand. Er leitet die Stadtwache und ist auch gleichzeitig Richter.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_04"); //Jeder, der sich hier in der Stadt etwas zu schulden kommen l‰sst, muss sich vor ihm verantworten.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_1_LOCATION_Condition;
	information	= DIA_VLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Was gibt es interessantes in dieser Stadt?";
};                       

FUNC INT DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_LOCATION_15_00"); //Was gibt es Interessantes in dieser Stadt?
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_01"); //Hier kannst du fast alles kaufen, was du dir vorstellen kannst. Entweder bei den H‰ndlern am Marktplatz oder in der Unterstadt.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_02"); //Aber fast alles, was du hier kaufen kannst, kostet auch ne Kleinigkeit.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_03"); //Wenn du nicht viel Geld hast, kann dir vielleicht Lehmar, der Geldverleiher, weiterhelfen. Sein Haus ist am Anfang des Hafenviertels, wenn du von der Unterstadt kommst.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_1_STANDARD_Condition;
	information	= DIA_VLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Was gibt's Neues?";
};                       
func INT DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_01"); //Der offene Handel mit dem Groﬂbauern ist seit dem Fall der Barriere abrupt abgebrochen. Wer weiﬂ, was der im Schilde f¸hrt. Ich traue dem Braten nicht.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_02"); //Onar treibt es zu weit! Er beliefert die Stadt immer noch nicht. Wenn die Miliz nicht bald eingreift, machen auch die anderen Hˆfe bald, was sie wollen.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_03"); //Ich habe gehˆrt, die Banditen sollen sich mit Magiern zusammengetan haben. M‰chtige Schwarzmagier in schwarzen Kutten. Ich kˆnnte schwˆren, dass ich letzte Nacht einen von ihnen in der Stadt gesehen habe.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_04"); //Ich hab gehˆrt, dass einige von Onars Sˆldnern losgezogen sind, um die Drachen zu tˆten. Jetzt machen die endlich mal was N¸tzliches!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_05"); //Es heiﬂt, die Drachen sind besiegt worden! Lord Hagen sammelt seine M‰nner, um auch die restlichen Kreaturen aus dem Minental zu vertreiben.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_1 (var c_NPC slf)
{
	DIA_VLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
