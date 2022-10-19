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
	description = "Chci se pâidat k domobranê!";
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
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //Chci se pâidat k domobranê!
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //Ještê ses nestal obèanem Khorinidu! Proè si myslíš, že by tê mêl lord Andre pâijmout?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //Takhle by mohl pâijít každý - dostal by zbraà a nêjakou zbroj a pak s tím zmizel!
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //Ale já mám dobrou povêst!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //To nevysvêtluj mnê, ale lordu Andremu. Najdeš ho v kasárnách.
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
	description = "Co víš o paladinech?";
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
	AI_Output (other, self, "DIA_MIL_7_PEOPLE_15_00"); //Co víš o paladinech?
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //Nic moc. Nikdo poâádnê neví, proè jsou vlastnê tady. Alespoà nikdo z mêstské stráže.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //Pâevzali kontrolu nad mêstem, zabrali místodržícímu jeho zastupitelskou síà a ujali se funkce soudu.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //Pokud to chceš vêdêt, tak si myslím, že to je jen ku prospêchu vêci. Ti nafoukaní oslové už vážnê potâebovali lekci slušného chování.
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
	description = "Co mohu tady ve mêstê dêlat?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //Co mohu tady ve mêstê dêlat?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Pokud nechceš skonèit ve stoce v pâístavní ètvrti, najdi si slušné zamêstnání. Poptej se tady v dolní èásti mêsta - možná se na tebe usmêje štêstí.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Jestli se tu chystáš zùstat trochu déle, mêl by ses pâipojit k domobranê nebo alespoà zaèít s bojovým výcvikem.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Vedoucí výcviku, kterého najdeš v kasárnách, uèí i civilisty.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Skâeti pâijdou už brzo a pak budeš vdêèný za každou hodinu, kterou jsi strávil na cvièišti.
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
	description = "Co je nového?";
};                       
func INT DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //Lidé mizí jeden po druhém a dodneška jsme nezjistili, co se jim vlastnê stalo. Že by v tom mêli prsty skâeti?
			
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
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //Âíká se, že se farmáâi vzbouâili. Takový zatracený problémy nám byl èert dlužen, zrovna teë, když jsme uprostâed války se skâety!
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Je naèase, aby paladinové koneènê tu rebelii potlaèili. Každý, kdo poruší zákon, musí být potrestán. Zvlášã teë, když jsme ve válce.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //Žoldnéâ, co byl obvinên z vraždy Lothara, je pravdêpodobnê nevinen. Kdosi pâinesl dùkaz o tom, že na nêj nêkdo ušil boudu.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Jeden z Onarových žoldnéâù zavraždil ctihodného paladina Lothara. Ale nakonec ho chytili a uvrhli do žaláâe.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //Nêkteâí ze žoldnéâù už Onarovu farmu opustili. Nêkteré problémy se vyâeší èasem samy.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //Draci to mají spoèítané, ale ještê není všemu konec. Další na âadê jsou skâeti. My své záležitosti âešíme s âádnou dùsledností!
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
