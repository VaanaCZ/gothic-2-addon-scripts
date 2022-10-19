// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_16_EXIT_Condition;
	information	= DIA_VLK_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_16_JOIN_Condition;
	information	= DIA_VLK_16_JOIN_Info;
	permanent	= TRUE;
	description = "Chci se st�t ob�anem tohoto m�sta!";
};                       

FUNC INT DIA_VLK_16_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_16_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_JOIN_15_00"); //Chci se st�t ob�anem tohoto m�sta!
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_01"); //Pom��e� n�m br�nit m�sto proti sk�et�m?
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_02"); //Pokud jsi ob�anem Khorinidu, m��e� se p�idat k domobran� - promluv si n�k�m od m�stsk�ch str��.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_16_PEOPLE_Condition;
	information	= DIA_VLK_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?";
};                       

FUNC INT DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_PEOPLE_15_00"); //Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?
	AI_Output (self, other, "DIA_VLK_16_PEOPLE_16_01"); //Paladinov� obsadili horn� ��st m�sta.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_16_LOCATION_Condition;
	information	= DIA_VLK_16_LOCATION_Info;
	permanent	= TRUE;
	description = "Co je tu zaj�mav�ho k vid�n�?";
};                       

FUNC INT DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_LOCATION_15_00"); //Co je tu zaj�mav�ho k vid�n�?
	AI_Output (self, other, "DIA_VLK_16_LOCATION_16_01"); //Na tr�i�ti nalezne� vystaven� ve�ker� druhy zbo��.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_16_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_16_STANDARD_Condition;
	information	= DIA_VLK_16_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nov�ho?";
};                       
func INT DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_STANDARD_15_00"); //Co je nov�ho?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_00"); //Douf�m, �e domobrana kone�n� zjist�, pro� se khorinidsk� populace tak ten��.
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_01"); //Kdy� sly��, kolik lid� u� zmizelo, aby ses taky za�al b�t o �ivot.
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
		SC_HearedAboutMissingPeople = TRUE;
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_01"); //U� jsi to sly�el? Za hradbami byli vid�ni sk�eti. Doufejme, �e paladinov� maj� dostatek mu��.
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_02"); //R�d bych v�d�l, jestli to n�hodu nen� ten d�vod, pro� farm��i p�estali chodit na trh.
	};
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_03"); //�oldn��, o kter�m se ��kalo, �e zavra�dil Lothara, je nevinn�. Objevily se d�kazy o tom, �e na n�j n�kdo u�il boudu. Zaslechl jsem to na tr�i�ti.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_04"); //To je nesl�chan�. Ten statk��sk� �old�k zabil ctihodn�ho Lothara p��mo uprost�ed ulice.
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_05"); //Ale Innos ho za jeho h��chy potrest�. Nikdo nesm� vzt�hnout ruku na ryt��e na�eho P�na.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_06"); //Sly�el jsem, �e ti �ibeni�n�ci opustili Onarovu farmu. ��k� se, �e se ze strachu p�ed lordem Hagenem st�hli zp�t do Hornick�ho �dol�.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_07"); //Sly�el jsem, �e se odd�l paladin� vydal do Hornick�ho �dol� pob�t ty stra�n� draky.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_16 (var c_NPC slf)
{
	DIA_VLK_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_16_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
