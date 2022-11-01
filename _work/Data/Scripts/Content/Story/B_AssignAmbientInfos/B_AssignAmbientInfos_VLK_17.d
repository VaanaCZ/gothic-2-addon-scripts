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
	description = "Co powinienem zrobić, by zostać obywatelem miasta?";
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
	AI_Output (other, self, "DIA_VLK_17_JOIN_15_00"); //Co powinienem zrobić, by zostać obywatelem miasta?
	AI_Output (self, other, "DIA_VLK_17_JOIN_17_01"); //Mistrzowie rzemiosła z dolnej części miasta posiadają bardzo duże wpływy. Powinieneś porozmawiać z którymś z nich.
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
	description = "Kim są najważniejsze osoby w mieście?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_PEOPLE_15_00"); //Kim są najważniejsze osoby w mieście?
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_01"); //Od swojego przybycia paladyni kontrolują właściwie całe Khorinis.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_02"); //Przedstawicielem prawa w mieście jest Lord Andre, znajdziesz go w koszarach.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_03"); //Są tylko dwa sposoby na spotkanie się z nim - można złamać prawo albo przyłączyć się do straży miejskiej.
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
	description = "Które z miejsc w Khorinis warto odwiedzić?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_LOCATION_15_00"); //Które z miejsc w Khorinis warto odwiedzić?
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_01"); //Może powinieneś zapytać o to jakiegoś mężczyznę. Jeśli szukasz rozrywki, udaj się do dzielnicy portowej.
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_02"); //Jeśli jednak chcesz coś kupić, udaj się na targowisko niedaleko wschodniej bramy, lub do dolnej części miasta.
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
	description = "Co nowego?";
};                       
func INT DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_17_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel == 1)
	|| (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_01"); //Zastanawiam się, po co paladyni pojawili się w mieście. Niby przejęli kontrolę nad ratuszem, koszarami i portem, ale, jak dotąd, nic nie robią.
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_02"); //Gdyby przyjechali tu zająć się orkami lub bandytami, już dawno powinni coś z tym zrobić. Musi być inny powód...
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_03"); //Chyba już wiem, co sprowadziło tu paladynów. Chodzi o rudę. Zajęliby się lepiej ochroną miasta.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_04"); //Mam nadzieję, że w opowieściach o smokach jest trochę prawdy. Lord Hagen będzie musiał coś zrobić, nie narazi nas przecież na atak bestii.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_05"); //Teraz, kiedy smoki zostały pokonane, paladyni nie powinni mieć problemu ze stłumieniem pozostałych niepokojów.
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
