// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_7_EXIT_Condition;
	information	= DIA_MIL_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_7_JOIN_Condition;
	information	= DIA_MIL_7_JOIN_Info;
	permanent	= TRUE;
	description = "Chci se p�idat k domobran�!";
};                       

FUNC INT DIA_MIL_7_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //Chci se p�idat k domobran�!
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //Je�t� ses nestal ob�anem Khorinidu! Pro� si mysl�, �e by t� m�l lord Andre p�ijmout?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //Takhle by mohl p�ij�t ka�d� - dostal by zbra� a n�jakou zbroj a pak s t�m zmizel!
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //Ale j� m�m dobrou pov�st!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //To nevysv�tluj mn�, ale lordu Andremu. Najde� ho v kas�rn�ch.
		};
	}
	else
	{
		B_Say (self, other, "$ABS_GOOD");
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_7_PEOPLE_Condition;
	information	= DIA_MIL_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Co v� o paladinech?";
};                       

FUNC INT DIA_MIL_7_PEOPLE_Condition()
{
	if (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_PEOPLE_15_00"); //Co v� o paladinech?
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //Nic moc. Nikdo po��dn� nev�, pro� jsou vlastn� tady. Alespo� nikdo z m�stsk� str�e.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //P�evzali kontrolu nad m�stem, zabrali m�stodr��c�mu jeho zastupitelskou s�� a ujali se funkce soudu.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //Pokud to chce� v�d�t, tak si mysl�m, �e to je jen ku prosp�chu v�ci. Ti nafoukan� oslov� u� v�n� pot�ebovali lekci slu�n�ho chov�n�.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_7_LOCATION_Condition;
	information	= DIA_MIL_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mohu tady ve m�st� d�lat?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //Co mohu tady ve m�st� d�lat?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Pokud nechce� skon�it ve stoce v p��stavn� �tvrti, najdi si slu�n� zam�stn�n�. Poptej se tady v doln� ��sti m�sta - mo�n� se na tebe usm�je �t�st�.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Jestli se tu chyst� z�stat trochu d�le, m�l by ses p�ipojit k domobran� nebo alespo� za��t s bojov�m v�cvikem.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Vedouc� v�cviku, kter�ho najde� v kas�rn�ch, u�� i civilisty.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Sk�eti p�ijdou u� brzo a pak bude� vd��n� za ka�dou hodinu, kterou jsi str�vil na cvi�i�ti.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_7_STANDARD_Condition;
	information	= DIA_MIL_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nov�ho?";
};                       
func INT DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_STANDARD_15_00"); //Co je nov�ho?
		
	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //Lid� miz� jeden po druh�m a dodne�ka jsme nezjistili, co se jim vlastn� stalo. �e by v tom m�li prsty sk�eti?
			
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{		
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //��k� se, �e se farm��i vzbou�ili. Takov� zatracen� probl�my n�m byl �ert dlu�en, zrovna te�, kdy� jsme uprost�ed v�lky se sk�ety!
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Je na�ase, aby paladinov� kone�n� tu rebelii potla�ili. Ka�d�, kdo poru�� z�kon, mus� b�t potrest�n. Zvl�� te�, kdy� jsme ve v�lce.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //�oldn��, co byl obvin�n z vra�dy Lothara, je pravd�podobn� nevinen. Kdosi p�inesl d�kaz o tom, �e na n�j n�kdo u�il boudu.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Jeden z Onarov�ch �oldn��� zavra�dil ctihodn�ho paladina Lothara. Ale nakonec ho chytili a uvrhli do �al��e.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //N�kte�� ze �oldn��� u� Onarovu farmu opustili. N�kter� probl�my se vy�e�� �asem samy.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //Draci to maj� spo��tan�, ale je�t� nen� v�emu konec. Dal�� na �ad� jsou sk�eti. My sv� z�le�itosti �e��me s ��dnou d�slednost�!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_7 (var c_NPC slf)
{
	DIA_MIL_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
