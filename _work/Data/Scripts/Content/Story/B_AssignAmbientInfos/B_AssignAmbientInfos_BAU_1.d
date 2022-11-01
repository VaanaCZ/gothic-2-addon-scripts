// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_1_EXIT_Condition;
	information	= DIA_BAU_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_1_JOIN_Condition;
	information	= DIA_BAU_1_JOIN_Info;
	permanent	= TRUE;
	description = "Powiedz mi coś więcej o tych najemnikach!";
};                       

FUNC INT DIA_BAU_1_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_JOIN_15_00"); //Powiedz mi coś więcej o tych najemnikach!
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_01"); //Najlepiej, żebyś ich omijał szerokim łukiem. To moja jedyna rada.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_02"); //Wystarczy, że któremuś nie spodoba się twoja gęba i dostaniesz w nos bez ostrzeżenia.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_03"); //Jasne, zawsze możesz o tym donieść Lee, ale nos i tak nie będzie już taki jak kiedyś.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_1_PEOPLE_Condition;
	information	= DIA_BAU_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto tu dowodzi?";
};                       

FUNC INT DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_PEOPLE_15_00"); //Kto tu rządzi?
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_01"); //To farma Onara i on podejmuje tu wszystkie ważne decyzje.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_02"); //Pozwól, że dam ci pewną radę: nie wdawaj się w bójki z jego najemnikami. Ci chłopcy nie lubią, kiedy wchodzi im się w drogę.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_03"); //Szczególnie ten Sylvio to strasznie wredny łotr. Jednak ich przywódca, Lee, jest jak najbardziej w porządku.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_1_LOCATION_Condition;
	information	= DIA_BAU_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Co możesz mi powiedzieć o tej okolicy?";
};                       

FUNC INT DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_LOCATION_15_00"); //Co możesz mi powiedzieć o tej okolicy?
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_01"); //Na około tylko pola i farmy. I najemnicy, co to włóczą się zwłaszcza na wschód od farmy Onara.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_02"); //Na północ stąd leży farma Sekoba, ale najemnicy pojawiają się tam tylko po to, by zebrać czynsz.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_03"); //Na południowym zachodzie leży farma Bengara.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_1_STANDARD_Condition;
	information	= DIA_BAU_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Co nowego?";
};                       
func INT DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_01"); //Onar wynajął najemników, którzy mają odstraszać strażników miejskich. Inaczej rozkradliby nasz dobytek do ostatniej owcy!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_02"); //Niewiele się dzieje. Wciąż te same problemy. Straż, orkowie, polne bestie.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_03"); //Ostatnio dzieją się tu dziwne rzeczy. Kilka nocy temu widziałem czarną postać. To nie był człowiek.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_04"); //Pojawia się coraz więcej orków. Czasem tak sobie myślę, że miejsce każdego zabitego zajmują dwaj nowi.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_05"); //Paladyni wyruszają do Górniczej Doliny. O co w tym wszystkim chodzi? Jak tak dalej pójdzie, nie będzie nikogo, by powstrzymać straż miejską.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_1 (var c_NPC slf)
{
	DIA_BAU_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
