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
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //Fortem, a w³aœciwie tym, co z niego zosta³o, zarz¹dza Garond.
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //Jednak niczym nie zajmuje siê osobiœcie - chyba ¿e któryœ z jego ludzi wpadnie w jakiœ tarapaty.
	if (Npc_IsDead (Engor) == FALSE)
	{
		AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //Jeœli szukasz wyposa¿enia, porozmawiaj lepiej z Engorem. Znajdziesz go w budynku naprzeciw siedziby Garonda.
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
	description = "Powiedz mi coœ na temat sytuacji w Górniczej Dolinie.";
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
	AI_Output (other, self, "DIA_OCVLK_6_LOCATION_15_00"); //Powiedz mi coœ na temat sytuacji w Górniczej Dolinie.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_01"); //Martwiê siê orkow¹ palisad¹. Nie wiem nawet, co siê za ni¹ kryje.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_02"); //Na pocz¹tku kilku z nich wybudowa³o mur. Potem, pewnej nocy, sprowadzili machiny oblê¿nicze.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_03"); //Mamy szczêœcie, ¿e uda³o siê nam odeprzeæ atak.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_04"); //Za palisad¹ znajduje siê przystañ. Jeœli orkowie otrzymaj¹ dostawy zapasów drog¹ morsk¹, bêdziemy zgubieni.
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
	description = "Co s³ychaæ?";
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
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_01"); //Przy³¹cz siê do armii, mówili, zasmakuj przygody, mówili. A teraz... no, sam popatrz.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_02"); //W tej chwili nawet za zbli¿enie siê do zapasów jedzenia grozi kara œmierci. Garond chyba siê obawia, ¿e ukradniemy co siê da i damy drapaka.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_03"); //Jeœli te przeklête smoki nas nie pozabijaj¹, to pewnie wszyscy zdechniemy tu z g³odu.
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_04"); //£owcy smoków! Nie rozœmieszaj mnie! Ci ludzie niczego tu nie zmieni¹.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_05"); //Podobno smoki zosta³y zg³adzone. Mo¿e jednak jest dla nas jakaœ nadzieja!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_06"); //Przeklêta ruda. Powinniœmy zrzuciæ ca³y jej zapas z barykad. Mo¿e wtedy orkowie zostawiliby nas w spokoju.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_07"); //Te ¿a³osne skrzynie porozrzucane bez³adnie przed bram¹ nie zatrzymaj¹ orkowych ataków!
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
