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
	description = "Co mo�esz mi powiedzie� o najemnikach?";
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
	AI_Output (other, self, "DIA_BAU_7_JOIN_15_00"); //Co mo�esz mi powiedzie� o najemnikach?
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_01"); //Onar wynaj�� ich, by bronili jego farmy.
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_02"); //Wi�kszo�� z nich zachowuje si� tak, jakby farma by�a ich w�asno�ci�. Ale to prawda, �e nas ochraniaj�.
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
	description = "Kto tu dowodzi?";
};                       

FUNC INT DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_PEOPLE_15_00"); //Kto tu rz�dzi?
	AI_Output (self, other, "DIA_BAU_7_PEOPLE_07_01"); //Du�a farma nale�y do Onara. Mniejsze tak�e, ale te wynajmuje okolicznym mieszka�com.
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
	description = "Powiedz mi co� na temat okolicy.";
};                       

FUNC INT DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_LOCATION_15_00"); //Powiedz mi co� na temat okolicy.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_01"); //Du�a farma po wschodniej stronie doliny nale�y do Onara. Na p�noc st�d le�y farma Sekoba.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_02"); //Jest jeszcze farma Bengara, kt�ra le�y na wzniesieniu, na po�udniowy zach�d st�d. Mo�esz si� tam przedosta� z doliny - musisz jedynie wej�� po kamiennych schodach.
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
	description = "Co nowego?";
};                       
func INT DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_STANDARD_15_00"); //Co s�ycha�?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_01"); //Og�osili�my niepodleg�o�� - nie p�acimy ju� podatk�w na rzecz miasta. Kr�l nic nigdy dla nas nie zrobi� - mieli�my tego do��!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_02"); //W tej chwili niewiele si� tu dzieje.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_03"); //Ostatnio ludzie zacz�li opowiada� co� o smokach. A kr�l robi wszystko, �eby tylko wycisn�� z poddanych jak najwi�cej pieni�dzy.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_04"); //Uwa�aj na siebie, wzd�u� prze��czy pa��ta si� wiele podejrzanych typk�w i dzikich bestii.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_05"); //Teraz, po �mierci smok�w, paladyni zechcieli �askawie opu�ci� mury miasta. Czas najwy�szy, by na ulicach zn�w zapanowa� porz�dek.
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
