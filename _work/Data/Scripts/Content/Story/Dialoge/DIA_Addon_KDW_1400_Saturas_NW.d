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
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Kdy� u� t� nic neodrad�, abys ostatn� m�gy ru�il od pr�ce, m��e� jednomu z nich ode m� n�co vzk�zat.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Vy�i� Riordianovi, �e bych ho tu r�d vid�l.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Najde� ho v zadn� ��sti krypty.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas chce, abych za n�m poslal vodn�ho m�ga Riordiana. M�l by b�t na m�st� vykop�vek, n�kde vzadu v hrobce."); 
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
 
 	description	 = 	"M�m naj�t ztracen� ��sti Nefariova ornamentu.";
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
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //M�m naj�t ztracen� ��sti ornamentu pro Nefaria.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //Co�e? To je neuv��iteln�! To jsi zase ty?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //��dn� strach, p�inesu sem ty v�ci.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //(povzdech) V� alespo�, co m� hledat?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius mi dal tuhle mapu.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //Uka� mi ji!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmm, v tom velk�m hvozd� je to velmi nebezpe�n�. Nem�l bys tam chodit s�m.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //V Khorinidu se poohl�dni po n�kom, kdo t� doprovod�.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //Nechci, aby t� se�raly n�jak� nestv�ry � a s tebou i ten ornament.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Tady m� tu mapu.

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas m� nab�dal, abych zlomky ornamentu v lese nehledal s�m. M�l bych zaj�t do Khorinidu a poohl�dnout se po n�kom, kdo by m� doprovodil."); 
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
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_00"); //
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_01"); //
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_02"); //
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_wei�tdu_15_03"); //
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_04"); //
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_05"); //
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //Zbl�znil ses? B� odsud.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Tyhle hrobky jsou pro samozvan� dobrodruhy p��li� nebezpe�n�.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //(otr�ven�) Posly�, nezn�me my se? Samoz�ejm�! Ty hajzle!
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //(otr�ven�) Nemysli si, �e jsem ti zapomn�l, jak jsi n�s tenkr�t v Nov�m t�bo�e podrazil.

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "(rozpa�it�) J�...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //(otr�ven�) Vy�erpal jsi magickou moc z cel� hory rudy a pak ses prost� vypa�il.
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //(otr�ven�) Co sis v�bec myslel, �e d�l�?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Je mi to moc l�to. Nev�d�l jsem, co d�l�m.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Stejn� by v�m to nevy�lo.", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Bylo to nutn�. Nemohl jsem jinak.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Jinak to ne�lo. Bez s�ly rudy bych nikdy Sp��e neporazil.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //(rozzu�en�) Co to bl�bol�? Sp�� a pora�en�?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //V� pl�n by stejn� nefungoval. Odp�len� bari�ry pomoc� haldy rudy je nejv�t�� pitomost, jakou jsem kdy sly�el.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Nakonec byste do vzduchu vyhodili sami sebe.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //(rozzu�en�) To u� je vrchol! Kdo ti dal pr�vo soudit n�s a na�e �mysly?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Kdybych nebyl tak m�rumilovn�, seslal bych na tebe Adan�v hn�v, chlap�e.
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Je mi to l�to. Nev�d�l jsem, co d�l�m.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //V�n�? A to si mysl�, �e t� omlouv�?
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

	description	 = 	"Tak o tom nem�m ani �ajna.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //Nem�m tu�en�. ��kal jsem si, �e se jen tak zastav�m.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Jen m� p�ipravuje� o �as. Zmiz odsud.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //(k sob�) Vy��d�m si to s tebou pozd�ji.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Kone�n� jsem na�el vodn� m�gy. Nejd��v bych m�l zjistit, co tady ve skute�nosti d�laj�. Saturas, kter� st�le nem��e zapomenout na ud�losti z trestaneck� kolonie, mi to zjevn� ne�ekne."); 

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
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Ztra� se, ne� se ti n�co stane.
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

	description	 = 	"P�i�el jsem sem s Laresem.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //P�i�el jsem sem s Laresem.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //(znepokojen�) S Laresem? v�n�? Kde je?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Jsem tu s�m, Lares se vr�til do m�sta.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //Co�e? A to t� k n�m poslal samotn�ho? Co si v�bec mysl�?
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

	description	 = 	"P�inesl jsem ti ten ornament.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //P�inesl jsem ti ten ornament.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //Co to m� pro v�ecko na sv�t� znamenat? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //Kdo ti to dal? Ne��kej mi, �e to na tebe Lares jen tak p�ehr�l.
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Nech t�ch �e�� � tady to m�. Chce� to, ne?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Samoz�ejm�. Ale znerv�z�uje m�, �e ses do hry vlo�il zrovna TY.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //Pro� s tou starou histori� s horou rudy tolik nad�l�?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //V�dy� jsem ti to u� vynahradil. A nem��e� ��ct, �e jsem byl nespolehliv�.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //(povzdech) A co mi to nakonec p�ineslo? Pche, nemysli si, �e bych ti snad v��il.
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

	description	 = 	"Cht�l bych vstoupit do kruhu vody.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Chci se p�idat ke kruhu vody.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //(vztekle) CO�E? Jak o n�m m��e� v�d�t? Kdo...? Ten LARES! J� ho zabiju!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Poru�il nejd�le�it�j�� pravidlo � s nik�m o kruhu vody nemluvit.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //(�pln� perplex) Nev�m, co bych m�l ��ct. V���m ti, jen dokud t� m��u m�t na o��ch.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //O va�em kruhu mi ale pov�d�l Vatras.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //(rezignovan�) Co�e? Vatras? (sarkasticky) No to je ��asn�! Jedin� z vodn�ch m�g� na ostrov�, kter� t� nezn�, a ty na n�j zrovna natref�.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //Varuju t�, tentokr�t ned�lej ��dn� hlouposti.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //(sarkasticky) Pokus�m se.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas m� do kruhu vody nem��e p�ijmout. Rozhodnut� mus� nechat na Vatrasovi."); 

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

	description	 = 	"Co tady d�l�?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //Co tu d�l�?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //(uctiv�) V t�chto s�n�ch jsou skryta prad�vn� tajemstv�. Z�hadn� tajemstv�.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //N�pisy na st�n�ch poukazuj� na velmi starou kulturu.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //V�echno, co tu vid�, je ps�no v jazyce, kter� v�bec nezn�me.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Teprve mu za��n�me rozum�t a ch�pat, co znamen�.
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

	description	 = 	"Co je to za divn� zem�t�esen�?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //Co je to za podivn� zem�t�esen�?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //To je jedna z h�danek, kterou se sna��m vy�e�it.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //Kdesi za t�mito horami je n�jak naru�ena magick� struktura.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //N�kdo se evidentn� ze v�ech sil sna�� zlomit velice mocn� kouzlo.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Ob�v�m se, �e zanedlouho tahle zem�t�esen� postihnou cel� ostrov.
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

	description	 = 	"Pro� je pro tebe ten ornament tak d�le�it�?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //Pro� je pro tebe ten ornament tak d�le�it�?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //(otr�ven�) Je to kl�� k port�lu.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //V�c ti ne�eknu.
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

	description	 = 	"Nyn� pat��m ke kruhu vody.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Te� u� pat��m ke kruhu vody.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC tr�gt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese R�stung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Jak vid�m, nos� zbroj na�ich d�t�.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Jak vid�m, nos� na�e tajn� pozn�vac� znamen� � akvamar�nov� prsten.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //A tv� o�i mi napov�daj�, �e mluv� pravdu.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //(muml� si) No dob�e, p�ij�m�m t� do na�ich �ad.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Ale nezapome�, �e to znamen� i obrovskou zodpov�dnost.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //A ve tv�m vlastn�m z�jmu douf�m, �e bude� jednat �estn�.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas akceptoval, �e jsem vstoupil do kruhu vody."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //A jak ti m�m ��ct, �e jsi te� jedn�m z n�s?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //Ten akvamar�nov� prsten, co nos�, pat�� Laresovi � j� to pozn�m.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Sna�� se m� obelst�t, co? Nic jin�ho jsem ani ne�ekal.
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

	description	 = 	"Dej mi prsten, otev�u ten port�l.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Dej mi ten prsten, a� m��u otev��t port�l.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //(potuteln�) Dob�e! Jako na�e nov� d�tko bys m�l v�n� m�t tu �est.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //J� ale st�le �ek�m na zpr�vu od Vatrase. Dokud ji nedostanu, nemohu j�t.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //J� pro tebe zpr�vu od Vatrase M�M:
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //(otr�ven�) Ch�pu. A samoz�ejm� jsi to nevydr�el a musel jsi ji otev��t, co?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //No, j�...
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //(hroziv�) Ve tv�m vlastn�m z�jmu douf�m, �e nezklame� tu velice chabou d�v�ru, kterou k tob� chov�m.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //(p�ekvapen�) Velice zaj�mav�. Dob�e.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //Tum�, vezmi si prsten. Sejdeme se u port�lu � po�k�m na tebe.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Pokud m� Nefarius pravdu, port�l se otev�e, jakmile do n�j vlo�� prsten.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas mi dal zdoben� prsten. Ten sta�� vlo�it do mechanismu port�lu a m��u proj�t na druhou stranu."); 

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
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Vzhledem k tomu, �e mi Vatras nijak nenazna�il, �e by se ti dalo v��it, nech�m si ten prsten s�m.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas mi prsten ned�, dokud mu nep�inesu znamen� od Vatrase, �e se mi d� v��it."); 
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

	description	 = 	"M��e� m� nau�it n�jak� magii?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //M��e� m� nau�it n�co z oboru magie?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //Aby sis zase zahr�val se samotnou jej� podstatou?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //Ne. Na takov� hr�tky nem�m �as.
};
