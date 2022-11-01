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
	description = "Chci se pâidat k domobranę!";
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
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //Chci se pâidat k domobranę!
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //Ještę ses nestal občanem Khorinidu! Proč si myslíš, že by tę męl lord Andre pâijmout?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //Takhle by mohl pâijít každý - dostal by zbraŕ a nęjakou zbroj a pak s tím zmizel!
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //Ale já mám dobrou povęst!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //To nevysvętluj mnę, ale lordu Andremu. Najdeš ho v kasárnách.
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
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //Nic moc. Nikdo poâádnę neví, proč jsou vlastnę tady. Alespoŕ nikdo z męstské stráže.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //Pâevzali kontrolu nad męstem, zabrali místodržícímu jeho zastupitelskou síŕ a ujali se funkce soudu.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //Pokud to chceš vędęt, tak si myslím, že to je jen ku prospęchu vęci. Ti nafoukaní oslové už vážnę potâebovali lekci slušného chování.
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
	description = "Co mohu tady ve męstę dęlat?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //Co mohu tady ve męstę dęlat?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Pokud nechceš skončit ve stoce v pâístavní čtvrti, najdi si slušné zamęstnání. Poptej se tady v dolní části męsta - možná se na tebe usmęje štęstí.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Jestli se tu chystáš zůstat trochu déle, męl by ses pâipojit k domobranę nebo alespoŕ začít s bojovým výcvikem.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Vedoucí výcviku, kterého najdeš v kasárnách, učí i civilisty.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Skâeti pâijdou už brzo a pak budeš vdęčný za každou hodinu, kterou jsi strávil na cvičišti.
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
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //Lidé mizí jeden po druhém a dodneška jsme nezjistili, co se jim vlastnę stalo. Že by v tom męli prsty skâeti?
			
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
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //Âíká se, že se farmáâi vzbouâili. Takový zatracený problémy nám byl čert dlužen, zrovna teë, když jsme uprostâed války se skâety!
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Je načase, aby paladinové konečnę tu rebelii potlačili. Každý, kdo poruší zákon, musí být potrestán. Zvlášă teë, když jsme ve válce.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //Žoldnéâ, co byl obvinęn z vraždy Lothara, je pravdępodobnę nevinen. Kdosi pâinesl důkaz o tom, že na nęj nękdo ušil boudu.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Jeden z Onarových žoldnéâů zavraždil ctihodného paladina Lothara. Ale nakonec ho chytili a uvrhli do žaláâe.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //Nękteâí ze žoldnéâů už Onarovu farmu opustili. Nękteré problémy se vyâeší časem samy.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //Draci to mají spočítané, ale ještę není všemu konec. Další na âadę jsou skâeti. My své záležitosti âešíme s âádnou důsledností!
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
