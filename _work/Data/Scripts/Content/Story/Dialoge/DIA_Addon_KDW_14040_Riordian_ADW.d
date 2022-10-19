
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Riordian_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14040_Addon_Riordian_ADW;
	nr          = 999;
	condition   = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HelloADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_HelloADW		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_HelloADW_Condition;
	information	 = 	DIA_Addon_Riordian_HelloADW_Info;

	description	 = 	"Hast du das hier erwartet?";
};

func int DIA_Addon_Riordian_HelloADW_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_HelloADW_15_00"); //Hast du DAS hier erwartet?
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_01"); //Auf keinen Fall. Ich bin überwältigt, wie groß die Stadt gewesen sein muss.
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_02"); //Die meisten Gebäude sind unter Stein und Erde verschüttet, aber die Ruinen, die die Zeit überdauert haben, sind über das ganze Land hier verteilt.
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_03"); //Es müssen Tausende gewesen sein, die hier gelebt haben.
};

///////////////////////////////////////////////////////////////////////
//	Info WhatToFind
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_WhatToFind		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_WhatToFind_Condition;
	information	 = 	DIA_Addon_Riordian_WhatToFind_Info;

	description	 = 	"Was werde ich da draussen finden?";
};

func int DIA_Addon_Riordian_WhatToFind_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Riordian_HelloADW))
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_WhatToFind_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_WhatToFind_15_00"); //Was werde ich da draußen finden?
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_01"); //Im Osten gibt es eine große Festung in einem riesigen Sumpf.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_02"); //Soweit wir das von hier aus beurteilen können, haben sich die Banditen dort verschanzt.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_03"); //Wenn ich du wäre, würde ich nicht da runter gehen. Sie haben viele Vorposten und Wachen aufgestellt.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_04"); //Du meidest besser den Sumpf, bis du mehr Erfahrung hast oder einen Weg findest, die Banditen zu umgehen.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_05"); //Im Westen haben wir einige Piraten entdeckt.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_06"); //Ich bin mir nicht sicher, aber ich glaube, sie haben uns entdeckt.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_07"); //Scheint sie aber nicht sonderlich zu stören, dass wir hier sind.
};

///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Gegend		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_Gegend_Condition;
	information	 = 	DIA_Addon_Riordian_Gegend_Info;
	permanent	 = 	TRUE;

	description	 = 	"Erzähl' mir mehr über diese Gegend.";
};

func int DIA_Addon_Riordian_Gegend_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Riordian_WhatToFind))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
var int DIA_Addon_Riordian_Gegend_Info_OneTime;
func void DIA_Addon_Riordian_Gegend_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_Gegend_15_00"); //Erzähl mir mehr über diese Gegend.
	AI_Output	(self, other, "DIA_Addon_Riordian_Gegend_10_01"); //Was willst du wissen?
	
	Info_ClearChoices	(DIA_Addon_Riordian_Gegend);
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, DIALOG_BACK, DIA_Addon_Riordian_Gegend_Back );
	
	if (DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_AddonWorld) == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Gibt es eine Karte dieser Gegend?", DIA_Addon_Riordian_Gegend_map );
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Wo hast du die Piraten gesehen?", DIA_Addon_Riordian_Gegend_Piraten );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Wo waren die Banditen nochmal?", DIA_Addon_Riordian_Gegend_bandits );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Warst du schon mal im Westen?", DIA_Addon_Riordian_Gegend_west );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Was war nochmal im Osten?", DIA_Addon_Riordian_Gegend_ost );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Wo komme ich hin, wenn ich nach Süden gehe?", DIA_Addon_Riordian_Gegend_sued );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Was ist im Norden?", DIA_Addon_Riordian_Gegend_nord );
};
func void DIA_Addon_Riordian_Gegend_Back ()
{
	Info_ClearChoices	(DIA_Addon_Riordian_Gegend);
};
func void DIA_Addon_Riordian_Gegend_map ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_map_15_00"); //Gibt es eine Karte dieser Gegend?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_map_10_01"); //Cronos hat eine angefertigt. Er überlässt sie dir bestimmt.
};
func void DIA_Addon_Riordian_Gegend_bandits ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_bandits_15_00"); //Wo waren die Banditen noch mal?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_01"); //Sie haben eine Art Festung mit vielen Vorposten im Osten.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_02"); //Um da hin zu gelangen, musst du durch den großen Sumpf marschieren.
};
func void DIA_Addon_Riordian_Gegend_Piraten ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_Piraten_15_00"); //Wo hast du die Piraten gesehen?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_01"); //Sie liefen nicht weit von hier im Westen umher.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_02"); //Ich glaube, sie waren auf der Jagd.
};

func void DIA_Addon_Riordian_Gegend_nord ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_nord_15_00"); //Was ist im Norden?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_nord_10_01"); //Wenn ich den Aufzeichnungen der Erbauer Glauben schenken darf, dann wirst du dort ein großes von hohen Felsen umringtes Tal finden.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_nord_10_02"); //Dürre und Wüstensand bestimmen dort die Landschaft.
};

func void DIA_Addon_Riordian_Gegend_sued ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_sued_15_00"); //Wo komme ich hin, wenn ich nach Süden gehe?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_sued_10_01"); //Das Land im Süden ist sehr zerklüftet.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_sued_10_02"); //Serpentinenartige Wege, Wasserfälle und in Felsen gehauene Ruinen wirst du dort finden.
};

func void DIA_Addon_Riordian_Gegend_ost ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_ost_15_00"); //Was war nochmal im Osten?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_01"); //Der große Sumpf. Die Gegend ist sehr gefährlich.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_02"); //Nicht nur die Banditen lauern dort, sondern auch äußerst gefährliche Tiere.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_03"); //Du solltest vorsichtig sein.
};
var int DIA_Addon_Riordian_Gegend_west_OneTime;
func void DIA_Addon_Riordian_Gegend_west ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_west_15_00"); //Warst du schon mal im Westen?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_01"); //Nein. Aber irgendwo dort muss die Küste sein.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_02"); //Ich vermute, dass die Piraten dort ihr Lager haben.

	if (DIA_Addon_Riordian_Gegend_west_OneTime == FALSE)
	&& (Npc_HasItems (VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_03"); //Nicht weit von hier im Osten haben wir die Leiche eines Fischers gefunden.
		AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_04"); //Das solltest du dir mal ansehen.
		B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HousesOfRulers
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_HousesOfRulers		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_HousesOfRulers_Condition;
	information	 = 	DIA_Addon_Riordian_HousesOfRulers_Info;

	description	 = 	"Saturas schickt mich.";
};

func int DIA_Addon_Riordian_HousesOfRulers_Condition ()
{
	if (MIS_Saturas_LookingForHousesOfRulers == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_HousesOfRulers_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_HousesOfRulers_15_00"); //Saturas schickt mich. Ich soll die fünf Herrenhäuser von Jharkendar durchsuchen.
	AI_Output	(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_01"); //Ich habe lange dafür gebraucht, aus den Niederschriften der Erbauer den Standort der Herrenhäuser zu finden.
	AI_Output	(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_02"); //Aber jetzt kann ich es dir genau sagen.
	MIS_Riordian_HousesOfRulers = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info WhereAreHouses
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_WhereAreHouses		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_WhereAreHouses_Condition;
	information	 = 	DIA_Addon_Riordian_WhereAreHouses_Info;

	description	 = 	"Wo finde ich die fünf Herrenhäuser?";
};

func int DIA_Addon_Riordian_WhereAreHouses_Condition ()
{
	if (MIS_Riordian_HousesOfRulers == LOG_RUNNING)
	&& (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};
var int B_WhreAreHousesOfRulersOneTime;
func void B_WhreAreHousesOfRulers ()
{
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_00"); //Das Haus der Gelehrten ist eine große Bibliothek. Sie muss irgendwo weit im Norden sein.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_01"); //Das Haus der Krieger war damals eine von Felsen umringte Festung im Osten.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_02"); //Die Priester und die Totenwächter hatten ihre Behausungen nahe beieinander. Du solltest sie im Südwesten finden.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_03"); //Und die Heiler hatten ihr Haus der Genesung im Südosten.

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_04"); //Wenn diese Häuser noch stehen, dann wirst du sie an ihrer Bauweise erkennen.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_05"); //Sie sind erhöht. Eine steile Treppe führt in den von hohen Säulen verdeckten Eingang.

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_06"); //Ich hoffe, das hilft dir weiter.
	};

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Das Haus der Gelehrten ist eine grosse Bibliothek. Sie muss irgendwo weit im Norden sein."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Das Haus der Krieger war damals eine von Felsen umringte Festung im Osten. "); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Die Priester und die Tötenwächter hatten ihre Behausungen nahe bei einander. Ich sollte sie im Südwesten finden. "); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Die Heiler hatten ihr Haus der Genesung im Südosten."); 
};

func void DIA_Addon_Riordian_WhereAreHouses_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_WhereAreHouses_15_00"); //Wo finde ich die 5 Herrenhäuser?
	B_WhreAreHousesOfRulers ();
};

///////////////////////////////////////////////////////////////////////
//	Info FoundHouse
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_FoundHouse		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_FoundHouse_Condition;
	information	 = 	DIA_Addon_Riordian_FoundHouse_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wegen der Herrenhäuser...";
};

func int DIA_Addon_Riordian_FoundHouse_Condition ()
{
	if (MIS_Riordian_HousesOfRulers == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Riordian_WhereAreHouses))
	&& (RiordianHousesFoundCount < 5)
		{
			return TRUE;
		};
};
var int FOUNDHOUSEINFO[6];
const int Library = 1;
const int Heiler  = 2;
const int Warrior = 3;
const int Priest  = 4;
const int Totenw  = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;
func void DIA_Addon_Riordian_FoundHouse_Info ()
{
	RiordianHouseNeuigkeit = 0;
	
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_00"); //Äh, wegen der Herrenhäuser ...
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_01"); //Ja?
	
	if (SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE)
	&& (FOUNDHOUSEINFO [Library] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_02"); //Die Orks scheinen sich für die Bibliothek der Gelehrten zu interessieren.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_03"); //Denkst du, dass sie die alte Sprache lesen können?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_04"); //Ich denke nicht, aber wer weiß das schon.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_05"); //Vielleicht solltest du trotzdem besser dafür sorgen, dass sie verschwinden.
		FOUNDHOUSEINFO[Library] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
		
		Log_CreateTopic (TOPIC_Addon_CanyonOrcs, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_CanyonOrcs,"Dem Wassermagier Riordian wäre es lieber, wenn die Orks aus dem Canyon verschwinden."); 
	};
	
	if ((Npc_IsDead(StoneGuardian_Heiler)) || (Npc_HasItems (other,ItMi_Addon_Stone_04)) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE) )
	&& (FOUNDHOUSEINFO [Heiler] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_06"); //Das Haus der Heiler steht mitten in der Sumpfregion und wurde von einer Menge Steinwächtern verteidigt.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_07"); //Es steht also immer noch?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_08"); //Ja, fragt sich nur, wie lange noch ...
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_09"); //Mich schmerzt es in der Seele, wenn ich die Zeugen der Vergangeheit in diesem zerfallenen Zustand sehe.
		FOUNDHOUSEINFO[Heiler] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if (RavenIsInTempel == TRUE)
	&& (FOUNDHOUSEINFO [Warrior] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_10"); //Das Herrenhaus der Krieger wurde von Raven als Unterschlupf verwendet.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_11"); //(zynisch) Da hat er eine gute Wahl getroffen.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_12"); //Vermutlich ist es die sicherste Festung, die in dieser Region noch zu finden ist.
		FOUNDHOUSEINFO[Warrior] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if ((Npc_IsDead(Minecrawler_Priest)) || (Npc_HasItems (other,ItMi_Addon_Stone_03)) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE))
	&& (FOUNDHOUSEINFO [Priest] == FALSE)//crawler
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_13"); //Im Haus der Priester waren jede Menge Minecrawler ...
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_14"); //Ist so eine Gegend nicht sehr ungewöhnlich für diese Tiere?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_15"); //Allerdings.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_16"); //Bei Adanos. Seltsame Dinge geschehen in dieser Region.
		
		FOUNDHOUSEINFO[Priest] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if ((Npc_IsDead(MayaZombie04_Totenw)) || (Npc_HasItems (other,ItMi_Addon_Stone_02)) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE))
	&& (FOUNDHOUSEINFO [Totenw] == FALSE)//Zombies
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_17"); //Das Haus der Totenwächter wird beherrscht von der Macht des Bösen.
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_18"); //Ich glaub, ich habe selten so viele Zombies auf einem Haufen gesehen.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_19"); //Das ist bedauerlich. Die Totenwächter wurden offenbar Opfer ihrer speziellen Fähigkeiten.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_20"); //Ihre Verbundenheit zur Totenwelt hat ihnen schwer geschadet. Ich hoffe, du hast sie von ihrem Leid erlösen können.
		FOUNDHOUSEINFO[Totenw] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	
	
	if (RiordianHouseNeuigkeit > 0)
	{
		var int RiordianHouseXPs;
		RiordianHouseXPs = (XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit);
		B_GivePlayerXP (RiordianHouseXPs);
		
		RiordianHousesFoundCount = (RiordianHousesFoundCount + RiordianHouseNeuigkeit);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_21"); //Erzähl mir nochmal, wo sich jedes einzelne befindet.
		B_WhreAreHousesOfRulers ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info OrksWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_OrksWeg		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_OrksWeg_Condition;
	information	 = 	DIA_Addon_Riordian_OrksWeg_Info;

	description	 = 	"Die Orks werden das Interesse an dieser Region bald verlieren.";
};

func int DIA_Addon_Riordian_OrksWeg_Condition ()
{
	if (Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey))
	&& (FOUNDHOUSEINFO [Library] == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_OrksWeg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_00"); //Die Orks werden das Interesse an dieser Region bald verlieren.
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_01"); //Wie kommst du darauf?

	if (OrcShaman_Sit_CanyonLibraryKey.aivar [AIV_KilledByPlayer] == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_02"); //Ich habe ihren Anführer getötet.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_03"); //Ihr Anführer ist tot.
	};
	
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_04"); //Wollen wir hoffen, dass du Recht hast.
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_05"); //Störungen dieser Art können wir jetzt nun wirklich nicht gebrauchen.
	
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP (XP_Addon_Riordian_OrksWeg);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAllHouses
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_FoundAllHouses		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_FoundAllHouses_Condition;
	information	 = 	DIA_Addon_Riordian_FoundAllHouses_Info;

	description	 = 	"Ich habe alle Herrenhäuser gefunden.";
};

func int DIA_Addon_Riordian_FoundAllHouses_Condition ()
{
	if (RiordianHousesFoundCount >= 5)
	&& (MIS_Riordian_HousesOfRulers == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_FoundAllHouses_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_00"); //Ich habe alle Herrenhäuser gefunden.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_01"); //Waren sie alle dort, wo ich es gesagt habe?
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_02"); //Mehr oder weniger schon.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_03"); //Sehr gut. Dann hat sich meine Arbeit ja DOCH gelohnt.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_04"); //Ich danke dir.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_FoundAllHouses);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_ADW_PreTeach		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information	 = 	DIA_Addon_Riordian_ADW_PreTeach_Info;

	description	 = 	"Kannst du mir deine Fähigkeiten beibringen?";
};

func int DIA_Addon_Riordian_ADW_PreTeach_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_ADW_PreTeach_15_00"); //Kannst du mir deine Fähigkeiten beibringen?
	AI_Output	(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_01"); //Ich kann dich in der Kunst der Alchemie unterrichten.

	if  (Npc_HasItems (other,ItAm_Addon_WispDetector))
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_02"); //Und ich kann dir zeigen, wie du deinem Irrlicht beibringst, nach Gegenständen zu suchen.
	
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		Log_AddEntry		(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeach);
	};

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry	(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeachAlchemy);

	Riordian_ADW_ADDON_TeachWisp = TRUE;
	Riordian_ADW_ADDON_TeachAlchemy = TRUE;
	
};

instance DIA_Addon_Riordian_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Riordian_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Riordian_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Zeig mir, wie ich mein Irrlicht unterrichte.";
};
var int DIA_Addon_Riordian_ADW_Teach_NoPerm;

func int DIA_Addon_Riordian_ADW_Teach_Condition ()
{
	if (DIA_Addon_Riordian_ADW_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	&& (Riordian_ADW_ADDON_TeachWisp == TRUE)
	&& (Npc_HasItems (other,ItAm_Addon_WispDetector))
		{
			return TRUE;
		};
};
func void DIA_Addon_Riordian_ADW_Teach_Info ()
{
	B_DIA_Addon_Riordian_Teach_15_00 ();

	if ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF]	 	== FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF]		== FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] 	== FALSE)	
	{                                            
		Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
		Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,DIALOG_BACK,DIA_Addon_Riordian_ADW_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01 ();
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_FF, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FF)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_NONE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_NONE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE);
		};	
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_RUNE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_RUNE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_MAGIC, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_MAGIC)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_FOOD, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FOOD)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_POTIONS, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_POTIONS)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS);
		};
	}
	else 
	{
		B_DIA_Addon_Riordian_Teach_10_08 ();
		DIA_Addon_Riordian_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00 ();
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF ()
{
	if B_TeachPlayerTalentWispDetector  (self, other, WISPSKILL_FF)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_NONE)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_RUNE)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_MAGIC)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_FOOD)
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_POTIONS)
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};


///////////////////////////////////////////////////////////////////////
//	Info TeachAlchemy
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Riordian_ADW_TeachAlchemy   (C_INFO)
{
	npc         = KDW_14040_Addon_Riordian_ADW;
	nr          = 2;
	condition   = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent   = TRUE;
	description = "Lehre mich die Kunst des Tränkebrauens.";
};
//----------------------------------------
var int DIA_Riordian_ADW_TeachAlchemy_permanent;
//----------------------------------------

FUNC INT DIA_Riordian_ADW_TeachAlchemy_Condition()
{	
	if (DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE)
	&& (Riordian_ADW_ADDON_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");//Lehre mich die Kunst des Tränkebrauens.

	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	{
		Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,DIALOG_BACK,DIA_Riordian_ADW_TeachAlchemy_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Elixier des Geistes", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Elixier der Geschicklichkeit", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01"); //Magische Tränke braut man an einem Alchemietisch. Wir haben einen davon in unserer Behausung hier oben.
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02"); //Dafür benötigst du eine leere Laborflasche, die nötigen Ingredienzien und das Wissen, wie man den Trank herstellt.
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03"); //Von mir kannst du das Wissen darüber bekommen. Die anderen Dinge wirst du dir selbst zusammensuchen müssen.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04"); //Was willst du brauen?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05"); //Ich kann dir nichts mehr zeigen, was du nicht schon kennst.
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_BACK ()
{
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Health_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};
FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Health_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Mana_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Mana_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Mana_03 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Perm_Mana ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Perm_Dex ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};





