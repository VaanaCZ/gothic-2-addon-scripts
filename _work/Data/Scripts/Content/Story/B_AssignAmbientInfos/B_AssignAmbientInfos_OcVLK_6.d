// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_6_EXIT_Condition;
	information	= DIA_OCVLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_6_PEOPLE_Condition;
	information	= DIA_OCVLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto tu dowodzi?";
};                       

FUNC INT DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_PEOPLE_15_00"); //Kto tu dowodzi?
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //Fortem, a właściwie tym, co z niego zostało, zarządza Garond.
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //Jednak niczym nie zajmuje się osobiście - chyba że któryś z jego ludzi wpadnie w jakiś tarapaty.
	if (Npc_IsDead (Engor) == FALSE)
	{
		AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //Jeśli szukasz wyposażenia, porozmawiaj lepiej z Engorem. Znajdziesz go w budynku naprzeciw siedziby Garonda.
	};
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_6_LOCATION_Condition;
	information	= DIA_OCVLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Powiedz mi coś na temat sytuacji w Górniczej Dolinie.";
};                       

FUNC INT DIA_OCVLK_6_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_LOCATION_15_00"); //Powiedz mi coś na temat sytuacji w Górniczej Dolinie.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_01"); //Martwię się orkową palisadą. Nie wiem nawet, co się za nią kryje.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_02"); //Na początku kilku z nich wybudowało mur. Potem, pewnej nocy, sprowadzili machiny oblężnicze.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_03"); //Mamy szczęście, że udało się nam odeprzeć atak.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_04"); //Za palisadą znajduje się przystań. Jeśli orkowie otrzymają dostawy zapasów drogą morską, będziemy zgubieni.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_6_STANDARD_Condition;
	information	= DIA_OCVLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Co słychać?";
};                       
func INT DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_STANDARD_15_00"); //Jak leci?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_01"); //Przyłącz się do armii, mówili, zasmakuj przygody, mówili. A teraz... no, sam popatrz.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_02"); //W tej chwili nawet za zbliżenie się do zapasów jedzenia grozi kara śmierci. Garond chyba się obawia, że ukradniemy co się da i damy drapaka.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_03"); //Jeśli te przeklęte smoki nas nie pozabijają, to pewnie wszyscy zdechniemy tu z głodu.
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_04"); //Łowcy smoków! Nie rozśmieszaj mnie! Ci ludzie niczego tu nie zmienią.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_05"); //Podobno smoki zostały zgładzone. Może jednak jest dla nas jakaś nadzieja!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_06"); //Przeklęta ruda. Powinniśmy zrzucić cały jej zapas z barykad. Może wtedy orkowie zostawiliby nas w spokoju.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_07"); //Te żałosne skrzynie porozrzucane bezładnie przed bramą nie zatrzymają orkowych ataków!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_6 (var c_NPC slf)
{
	DIA_OCVLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
