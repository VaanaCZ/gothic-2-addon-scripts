///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_EXIT   (C_INFO)
{
	npc         = KDW_1400_Addon_Saturas_NW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Saturas_EXIT_Info()
{
	if (MIS_Addon_Saturas_BringRiordian2Me == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Da du dir ohnehin nicht nehmen lassen wirst, auch die anderen Magier von ihrer Arbeit abzuhalten, kannst du einem von ihnen auch eine Nachricht von mir �berbringen.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Sag Riordian, dass ich ihn hier bei mir zu sehen w�nsche.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Er h�lt sich im hinteren Bereich des Gew�lbes auf. Du wirst ihn schon finden.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas will, dass ich den Wassermagier Riordian zu ihm schicke. Er soll sich im hinteren Bereich des Gew�lbes der Ausgrabungsstelle aufhalten."); 
	};
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nefarius
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Nefarius		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Nefarius_Condition;
	information	 = 	DIA_Addon_Saturas_Nefarius_Info;
 
 	description	 = 	"Ich soll f�r Nefarius die verlorenen Teile des Ornamentes finden.";
};

func int DIA_Addon_Saturas_Nefarius_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Nefarius_Info ()
{
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //Ich soll f�r Nefarius die verlorenen Teile des Ornamentes finden.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //Was? Das ist ja unglaublich! Du steckst schon wieder mit drin?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //Keine Angst, ich bringe die Dinger schon her.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //(seufzt) Wei�t du wenigstens, wo du suchen musst?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius hat mir diese Karte gegeben ...
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //Zeig her!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmmm. Im gro�en Wald ist es ziemlich gef�hrlich. Du solltest nicht alleine gehen.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //Such dir in Khorinis jemanden, der dich begleitet.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //Ich will nicht, dass du von Monstern gefressen wirst - und das Ornament mit dir.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Hier hast du deine Karte wieder ...

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas meinte, ich soll nicht alleine gehen, wenn ich im gro�en Wald nach einem der Ornamentfragmente suche. Ich soll nach Khorinis gehen und mir jemanden suchen, der mich begleitet."); 
	};
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Hallo		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Hallo_Condition;
	information	 = 	DIA_Addon_Saturas_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition ()
{
	Npc_PerceiveAll (self);
	if (Wld_DetectNpc (self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Hallo_wei�tdu ()
{
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_00"); //Hast du eigentlich die leiseste Ahnung, was du da getan hast?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_01"); //Du hast das Gef�ge der Magie derart durcheinander gebracht, dass es bis nach Khorinis zu h�ren war.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_02"); //Du kannst von Gl�ck sagen, dass die Barriere eines Tages einfach in sich zusammen gefallen ist.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_wei�tdu_15_03"); //Wor�ber beschwerst du dich dann? Hat doch alles gut geklappt.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_04"); //(poltert) H�te deine Zunge!
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_05"); //(aufbrausent) Was zum Henker willst du hier �berhaupt?
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //Bist du denn von Sinnen? Mach, dass du hier raus kommst.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //In diesen Gew�lben ist es zu gef�hrlich f�r M�chtegernabenteurer.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //(ver�rgert) Aber sag mal, kenne ich dich nicht? Nat�rlich. Du Mistkerl ...
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //(ver�rgert) Glaube ja nicht, dass ich vergessen habe, wie du uns betrogen hast damals im neuen Lager.

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Ich...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //(ver�rgert) Du hast unserem Erzhaufen alle magische Macht entzogen und dann bist du einfach verschwunden!
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //(ver�rgert) Was hast du dir eigentlich dabei gedacht?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Tut mir leid. Ich wusste nicht, was ich tat.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Euer Plan h�tte sowieso nicht funktioniert.", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Es war notwendig.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Es war notwendig. Ohne die Macht des Erzes h�tte ich den Schl�fer niemals besiegen k�nnen.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //(sauer) Was ist das f�r ein Gefasel? Schl�fer? Besiegt?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Euer Plan h�tte sowieso nicht funktioniert. Die Barriere mit dem Erzhaufen zu sprengen, ist der gr��te Unfug, den je geh�rt habe.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Ihr h�ttet euch am Ende damit noch selbst in die Luft gejagt.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //(sauer) Das ist doch der Gipfel. Wer gibt dir das Recht, �ber uns und unsere Absichten zu richten?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Wenn ich nicht so ein friedliebender Mensch w�re, w�rde ich den Zorn Adanos' auf dich heraufbeschw�ren, mein Junge.
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Tut mir Leid. Ich wusste nicht, was ich tat.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //Ach? Und du glaubst, damit w�re das erledigt?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};



///////////////////////////////////////////////////////////////////////
//	Info keineAhnung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_keineAhnung		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_keineAhnung_Condition;
	information	 = 	DIA_Addon_Saturas_keineAhnung_Info;

	description	 = 	"Ich habe keine Ahnung.";
};

func int DIA_Addon_Saturas_keineAhnung_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_keineAhnung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //Ich habe keine Ahnung. Ich dachte, ich schau mal vorbei.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Du verschwendest meine Zeit. Verschwinde hier.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //(zu sich) Ich werde dich mir sp�ter noch mal vorkn�pfen.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Ich habe die Wassermagier an ihrer Ausgrabungsstelle gefunden. Ich muss erst noch heraus finden, was die Jungs hier eigentlich machen. Saturas war nicht bereit, es mir zu sagen. Er ist immer noch sehr unentspannt, wegen der alten Geschichten aus der Strafkolonie."); 

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info raus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_raus		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_raus_Condition;
	information	 = 	DIA_Addon_Saturas_raus_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Saturas_raus_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_keineAhnung))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Saturas_raus_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Sieh zu, dass du hier wieder raus kommst, bevor dir hier noch was passiert.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Lares
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Lares		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Lares_Condition;
	information	 = 	DIA_Addon_Saturas_Lares_Info;

	description	 = 	"Ich bin mit Lares hierher gekommen.";
};

func int DIA_Addon_Saturas_Lares_Condition ()
{
	if (Lares_Angekommen == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Lares_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //Ich bin mit Lares hierher gekommen.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //(besorgt) Lares? Wirklich? Wo ist er?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Ich bin allein. Lares ist zur�ck in die Stadt gegangen.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //Was? Und er hat dich ganz allein zu uns geschickt? Was denkt er sich eigentlich?
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Ornament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Ornament_Condition;
	information	 = 	DIA_Addon_Saturas_Ornament_Info;

	description	 = 	"Ich habe euer Ornament mitgebracht.";
};

func int DIA_Addon_Saturas_Ornament_Condition ()
{
	//if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Lares))
	//&& (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	if ( Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE) )
	|| ( (Lares_Angekommen == TRUE) && Npc_KnowsInfo(other, DIA_Addon_Saturas_Lares) && Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Ich habe euer Ornament mitgebracht.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //Was in aller Welt soll das bedeuten? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //Wer hat dir das gegeben? Sag nicht, dass Lares es dir einfach �berlassen hat.
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Jetzt komm mal wieder runter. Ich habe es dir gebracht. Das wolltest du doch, oder?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Schon. Aber es beunruhigt mich, dass DU schon wieder deine Finger im Spiel hast.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //Warum machst du so ein Theater um die alte Geschichte mit dem Erzhaufen?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Immerhin habe ich damals schon f�r dich gearbeitet. Hast du dich da etwa nicht auf mich verlassen k�nnen?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //(seufzt) Und was hat es mir schlussendlich eingebracht? Mpfh, denk ja nicht, dass ich dir traue ...
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;

	//Joly: Monster auff�llen, die bei Lares gest�rt haben
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc 	(Giant_Bug, 	"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc 	(Lurker, 		"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 

	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
  	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, "NW_CITY_TO_FARM2_02"); //auf Treppe
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
};

///////////////////////////////////////////////////////////////////////
//	Info geheimbund
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_geheimbund		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_geheimbund_Condition;
	information	 = 	DIA_Addon_Saturas_geheimbund_Info;

	description	 = 	"Ich will mich dem 'Ring des Wassers' anschlie�en.";
};

func int DIA_Addon_Saturas_geheimbund_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_geheimbund_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Ich will mich dem 'Ring des Wassers' anschlie�en.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //(erbost) WAS? Woher wei�t du das denn schon wieder? Wer �?  LARES ... Ich bring ihn um!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Er hat gegen unsere erste Regel verstossen. Niemand spricht �ber den 'Ring des Wassers'.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //(v�llig fertig) Ich wei� nicht, was ich dazu sagen soll. Ich traue dir nur, solange ich dich im Auge habe.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //Es war Vatras, der mir alles �ber den Ring erz�hlt hat.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //(resigniert) Was? Vatras? (sarkastisch) Gro�artig! Von allen Wassermagiern auf der Insel musstest du ausgerechnet an den einen geraten, der dich NICHT kennt ...
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //Ich warne dich: Mach dieses Mal keine Dummheiten!
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //(trocken) Ich werd' mir M�he geben ...
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas ist nicht bereit mich in den 'Ring des Wassers' aufzunehmen. Er �berl�sst Vatras die Entscheidung dar�ber."); 

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_wasmachstdu		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_wasmachstdu_Condition;
	information	 = 	DIA_Addon_Saturas_wasmachstdu_Info;

	description	 = 	"Was machst du hier unten?";
};

func int DIA_Addon_Saturas_wasmachstdu_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_wasmachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //Was machst du hier unten?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //(ehrf�rchtig) Diese Hallen beherbergen alte Geheimnisse. R�tselhafte Geheimnisse.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Die Inschriften und Wandmalereien lassen auf eine sehr alte Kultur schlie�en.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Alles, was du hier sehen kannst, ist in einer uns g�nzlich unbekannten Sprache geschrieben.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Wir fangen gerade erst an, sie zu lernen und ihren Sinn zu erfassen.
};

///////////////////////////////////////////////////////////////////////
//	Info Erdbeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Erdbeben		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	6;
	condition	 = 	DIA_Addon_Saturas_Erdbeben_Condition;
	information	 = 	DIA_Addon_Saturas_Erdbeben_Info;

	description	 = 	"Was sind das f�r seltsame Erdbeben?";
};

func int DIA_Addon_Saturas_Erdbeben_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_wasmachstdu))
	&& (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Bedrohung))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Erdbeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //Was sind das f�r seltsame Erdbeben?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //Das ist eins der R�tsel, die ich versuche zu l�sen.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //Das Gef�ge der Magie wird irgendwo hinter diesen Bergen gest�rt.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //Ganz offensichtlich versucht da jemand mit aller Gewalt, einen m�chtigen Zauber zu brechen.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Ich f�rchte, es dauert nicht lange, bis die ganze Insel von diesen Beben heimgesucht wird.
};
///////////////////////////////////////////////////////////////////////
//	Info WhatsOrnament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_WhatsOrnament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_WhatsOrnament_Condition;
	information	 = 	DIA_Addon_Saturas_WhatsOrnament_Info;

	description	 = 	"Warum ist euch dieses Ornament so wichtig?";
};

func int DIA_Addon_Saturas_WhatsOrnament_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsOrnament == FALSE)
	&& (RitualRingRuns == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //Warum ist euch dieses Ornament so wichtig?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //(genervt) Es ist der Schl�ssel zu einem Portal.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //Mehr werde ich dir dazu nicht sagen.
};
///////////////////////////////////////////////////////////////////////
//	Info ScRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ScRanger		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_ScRanger_Condition;
	information	 = 	DIA_Addon_Saturas_ScRanger_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ich geh�re jetzt zum 'Ring des Wassers'.";
};

func int DIA_Addon_Saturas_ScRanger_Condition ()
{
	if (SaturasKnows_SC_IsRanger == FALSE)
	&& (SC_IsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ScRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Ich geh�re jetzt zum 'Ring des Wassers'.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC tr�gt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese R�stung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Wie ich sehe, tr�gst du die R�stung unserer Kinder.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Wie ich sehe, tr�gst du unser geheimes Erkennungszeichen. Den Aquamarinring.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //Und ich erkenne in deinen Augen, dass du die Wahrheit sagst.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //(grummelt) Ist gut. Ich werde deine Aufnahme in unsere Reihen akzeptieren.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Aber bedenke, dass es auch mit einer gro�en Verantwortung verbunden ist.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //Und ich will f�r dich hoffen, dass du ihr auch gerecht wirst.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas akzeptiert meine Aufnahme in den 'Ring des Wassers'."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //Und woran soll ich jetzt erkennen, dass du zu uns geh�rst?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //Der Aquamarinring, den du da tr�gst, geh�rt Lares. Das seh' ich doch.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Willst mich wohl verarschen, was? Ich habe auch nichts anderes erwartet.
			AI_StopProcessInfos (self);		
		};
};

///////////////////////////////////////////////////////////////////////
//	Info OpenPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_OpenPortal		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_OpenPortal_Condition;
	information	 = 	DIA_Addon_Saturas_OpenPortal_Info;
	permanent	 = 	TRUE;

	description	 = 	"Gib mir den Ring. Ich werde das Portal �ffnen.";
};
var int DIA_Addon_Saturas_OpenPortal_NoPerm;
func int DIA_Addon_Saturas_OpenPortal_Condition ()
{
	if (RitualRingRuns == LOG_SUCCESS)
	&& (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_OpenPortal_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Gib mir den Ring. Ich werde das Portal �ffnen.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //(schlau) Gut! Als neues Mitglied unserer Kinder soll dir diese Ehre zuteil werden.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Doch warte ich noch auf eine Nachricht von Vatras. Bevor ich sie nicht erhalten habe, k�nnen wir noch nicht gehen.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //Ich HABE eine Nachricht von Vatras f�r dich.
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //(ver�rgert)So so. Und du konntest nat�rlich nicht an dich halten und musstest sie unbedingt �ffnen, ja?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //Nun, �hh ...
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //(droht) Ich will nur f�r dich hoffen, dass mein noch sehr zartes Vertrauen in dich nicht bestraft wird.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //(verwundert) H�chst interessant. Nun gut.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //Hier, nimm den Ring. Wir werden uns am Portal versammeln und auf dich warten.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Wenn Nefarius Recht hat, wird sich das Portal �ffnen, sobald du Ring dort einsetzt.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas gab mir den Ornamentring. Ich soll ihn nun in den Mechanismus des Portals einsetzen und durch das Portal gehen."); 

			AI_StopProcessInfos (self);		
			Npc_ExchangeRoutine	(self,"OpenPortal");
			B_StartOtherRoutine	(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos (self);		
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Solange Vatras mir kein eindeutiges Zeichen �bermittelt, dass dir zu trauen ist, werde ich den Ring bei mir behalten.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas will mir den Ornamentring nicht geben, solange er kein Zeichen von Vatras erhalten hat, dass mir zu trauen ist."); 
		AI_StopProcessInfos (self);		
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PERM		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Saturas_PERM_Condition;
	information	 = 	DIA_Addon_Saturas_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kannst du mir etwas �ber die Magie beibringen?";
};

func int DIA_Addon_Saturas_PERM_Condition ()
{
	if (MIS_Addon_Saturas_BringRiordian2Me != 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //Kannst du mir etwas �ber die Magie beibringen?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //Damit du noch mehr im magischen Gef�ge herumpfuschen kannst?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //Nein. F�r solche Sp��e habe ich jetzt keine Zeit.
};
