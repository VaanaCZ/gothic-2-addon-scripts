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
	description = "Chci se pøidat k domobranì!";
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
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //Chci se pøidat k domobranì!
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //Ještì ses nestal obèanem Khorinidu! Proè si myslíš, že by tì mìl lord Andre pøijmout?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //Takhle by mohl pøijít každý - dostal by zbraò a nìjakou zbroj a pak s tím zmizel!
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //Ale já mám dobrou povìst!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //To nevysvìtluj mnì, ale lordu Andremu. Najdeš ho v kasárnách.
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
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //Nic moc. Nikdo poøádnì neví, proè jsou vlastnì tady. Alespoò nikdo z mìstské stráže.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //Pøevzali kontrolu nad mìstem, zabrali místodržícímu jeho zastupitelskou síò a ujali se funkce soudu.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //Pokud to chceš vìdìt, tak si myslím, že to je jen ku prospìchu vìci. Ti nafoukaní oslové už vážnì potøebovali lekci slušného chování.
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
	description = "Co mohu tady ve mìstì dìlat?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //Co mohu tady ve mìstì dìlat?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Pokud nechceš skonèit ve stoce v pøístavní ètvrti, najdi si slušné zamìstnání. Poptej se tady v dolní èásti mìsta - možná se na tebe usmìje štìstí.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Jestli se tu chystáš zùstat trochu déle, mìl by ses pøipojit k domobranì nebo alespoò zaèít s bojovým výcvikem.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Vedoucí výcviku, kterého najdeš v kasárnách, uèí i civilisty.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Skøeti pøijdou už brzo a pak budeš vdìèný za každou hodinu, kterou jsi strávil na cvièišti.
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
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //Lidé mizí jeden po druhém a dodneška jsme nezjistili, co se jim vlastnì stalo. Že by v tom mìli prsty skøeti?
			
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
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //Øíká se, že se farmáøi vzbouøili. Takový zatracený problémy nám byl èert dlužen, zrovna teï, když jsme uprostøed války se skøety!
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Je naèase, aby paladinové koneènì tu rebelii potlaèili. Každý, kdo poruší zákon, musí být potrestán. Zvláš teï, když jsme ve válce.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //Žoldnéø, co byl obvinìn z vraždy Lothara, je pravdìpodobnì nevinen. Kdosi pøinesl dùkaz o tom, že na nìj nìkdo ušil boudu.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Jeden z Onarových žoldnéøù zavraždil ctihodného paladina Lothara. Ale nakonec ho chytili a uvrhli do žaláøe.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //Nìkteøí ze žoldnéøù už Onarovu farmu opustili. Nìkteré problémy se vyøeší èasem samy.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //Draci to mají spoèítané, ale ještì není všemu konec. Další na øadì jsou skøeti. My své záležitosti øešíme s øádnou dùsledností!
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
