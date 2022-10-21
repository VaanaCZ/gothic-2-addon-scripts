var int URSHAK_SUCKED;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Urshak_EXIT   (C_INFO)
{
	npc         = NONE_110_Urshak;
	nr          = 999;
	condition   = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HALLO		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	5;
	condition	 = 	DIA_Urshak_HALLO_Condition;
	information	 = 	DIA_Urshak_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (URSHAK_SUCKED	== FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Urshak_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_00"); //(agressiv) KHROTOK JABARTH!!!
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //Warte! Ich dich wieder erkennen. Du Freund Mensch mit weicher Stimme.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //Freund t�ten b�sen D�mon KRUSHAK.
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"Ich habe meinen alten orkischen Freund Ur-Shak gefunden."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "Was machst du hier?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "Ein sprechender Ork?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //Ein sprechender Ork?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //Du vergessen Ur-Shak? Machen traurig mich.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //Ur-Shak helfen Freund viele Tage vorher zu bekommen ULU-MULU f�r Gehen in mein Dorf. So Orks respektieren Freund und Freund nicht sterben durch Hand von Orks.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //Freund dann gehen in tiefen Orktempel und verbannen b�sen D�mon. Viele Tage vorher. Du nicht mehr wissen?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //Du hast dir einen merkw�rdigen Zeitpunkt ausgesucht, mir �ber den Weg zu laufen. Fast h�tte ich dich get�tet. Was machst du hier?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //Ur-Shak schauen �ber Land und sehen, was aus Land und mein Volk geworden.
	Info_ClearChoices	(DIA_Urshak_HALLO);
};



///////////////////////////////////////////////////////////////////////
//	Info WasmachenOrks
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASMACHENORKS		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	6;
	condition	 = 	DIA_Urshak_WASMACHENORKS_Condition;
	information	 = 	DIA_Urshak_WASMACHENORKS_Info;

	description	 = 	"Warum greifen die Orks die Menschen an?";
};

func int DIA_Urshak_WASMACHENORKS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASMACHENORKS_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //Warum greifen die Orks die Menschen an?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //Ur-Shak immer sagen zu Volk der Orks, dass Menschen nicht b�se und geben viele gute Freunde dort.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //Aber Schamane nicht h�ren auf Ur-Shak. Ur-Shak immer noch in Ungnade bei meinem Volk.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //So Ur-Shak auch nicht genau wissen, was ist gro�er Plan von Krieg gegen Menschen.
	B_LogEntry (TOPIC_Urshak,"Er hat es immer noch nicht geschafft, sich bei seinem Volk Geh�r zu verschaffen. Er ist immer noch ein Ausgestossener."); 
};


///////////////////////////////////////////////////////////////////////
//	Info soviele
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_SOVIELE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	7;
	condition	 = 	DIA_Urshak_SOVIELE_Condition;
	information	 = 	DIA_Urshak_SOVIELE_Info;

	description	 = 	"Warum seid ihr auf einmal so viele?";
};

func int DIA_Urshak_SOVIELE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_SOVIELE_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //Warum seid ihr auf einmal so viele?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //Orks kommen aus den Bergen. Andere aber kamen mit Schiff und machten gro�en Zaun.
};


///////////////////////////////////////////////////////////////////////
//	Info Zaun
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_ZAUN		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	8;
	condition	 = 	DIA_Urshak_ZAUN_Condition;
	information	 = 	DIA_Urshak_ZAUN_Info;

	description	 = 	"Was verbirgt sich hinter dem langen Orkzaun im Osten?";
};

func int DIA_Urshak_ZAUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_ZAUN_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //Was verbirgt sich hinter dem langen Orkzaun im Osten?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //Orks immer errichten gro�en Zaun und Heimatlager f�r Krieg.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //Zaun gut f�r Krieg. Verbergen St�rke von Orkarmee und dienen als Schutz.
};



///////////////////////////////////////////////////////////////////////
//	Info washastduvor
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASHASTDUVOR		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_WASHASTDUVOR_Condition;
	information	 = 	DIA_Urshak_WASHASTDUVOR_Info;

	description	 = 	"Was hast du jetzt vor?";
};

func int DIA_Urshak_WASHASTDUVOR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASHASTDUVOR_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //Was hast du jetzt vor?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //Ur-Shak warten auf Orksp�htrupp, zu bringen Ur-Shak zu Hosh-Pak.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //Wer ist Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //Seien sehr gro�e Schamane. Haben gro�en Einfuss auf Krieger und machen gro�e Pl�ne f�r Orks.

	B_LogEntry (TOPIC_Urshak,"Ur-Shaks Plan sieht vor, sich mit dem Orkshamanen Hosh-Pak zu treffen, damit er Ur-Shak wieder seinen alten Platz im Rat der Shamane zur�ck gibt."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Wo finde ich diesen Hosh-Pak?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Warum gehst du nicht zu Ihm?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //Warum gehst du nicht zu ihm??
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //Ur-Shak immer wieder versuchen zu bekommen wieder W�rde und alten Platz im Rat der Schamane.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //Aber bis heute Hosh-Pak nicht erh�ren Ur-Shak. Orks t�ten Ur-Shak, wenn sehen ohne Sp�htrupp. Ur-Shak m�ssen sprechen mit Hosh-Pak.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //Vielleicht haben Gl�ck heute.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //Wo finde ich diesen Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //Haben Aussichtsplatz �ber Burg bei gro�en Vulkan. So Hosh-Pak kann kontrollieren Orkkrieger.

};

func void DIA_Urshak_WASHASTDUVOR_weiter ()
{
	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);
};



///////////////////////////////////////////////////////////////////////
//	Info hoshpakDead
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKDEAD		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_HOSHPAKDEAD_Condition;
	information	 = 	DIA_Urshak_HOSHPAKDEAD_Info;

	description	 = 	"Hosh-Pak ist tot.";
};

func int DIA_Urshak_HOSHPAKDEAD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_WASHASTDUVOR))
		&& (Npc_IsDead(Hosh_pak))
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //Hosh-Pak ist tot.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //Hosh-Pak tot? RUSHTASOK!
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //Mein Herz tragen schwere Last. Ur-Shak niemals vergessen gro�er Ork gegeben Ur-Shak W�rde von Schamane.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //Ich verstehe. Hosh-Pak war dein Mentor.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //Ur-Shak muss nun tragen B�rde der Trauer und bringen Hosh-Pak letzte Ehre. Ur-Shak m�ssen gehen.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //Freund besser gehen �ber Pass. Hier zu gef�hrlich.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //Ur-Shak traurig, wenn Freundmensch auch sterben.

	B_LogEntry (TOPIC_Urshak,"Hosh-Pak ist tot. Mein Orkfreund hat sich auf den Weg zu Hosh-Paks Zelten gemacht. Er trauert um seinen Mentor. Ich sollte ihn ziehen lassen."); 

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,20);
	Npc_ExchangeRoutine	(self,"Start");
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");	
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");	
};


///////////////////////////////////////////////////////////////////////
//	Info geh
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_GEH		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_GEH_Condition;
	information	 = 	DIA_Urshak_GEH_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_GEH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<1000) == FALSE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_GEH_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //Freund besser gehen jetzt �ber Pass.
	Npc_SetRefuseTalk (self,10);
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info HoshpakRache
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKRACHE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_HOSHPAKRACHE_Condition;
	information	 = 	DIA_Urshak_HOSHPAKRACHE_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HOSHPAKRACHE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<=1000))
		&& (URSHAK_SUCKED == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKRACHE_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //(agressiv) KHROTOK! Ich erfahren du dabei als Hosh-Pak get�tet. Du begehen gro�er Fehler, Fremder.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //Ich sehe, du hast hier seinen Platz eingenommen. Du hast mir nur was vorgemacht.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //Deine Stellung bei deinem Volk ist h�her als du zugeben wolltest. Du bist jetzt auch nichts anderes mehr als ein Werkzeug des B�sen.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //Fremder haben Recht. Ur-Shak nur noch erf�llt von Hass und Rache.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //Ur-Shak erkennen gro�en Fehler zu vertrauen b�sen Menschen. Zu nennen Freund und helfen nicht zu werden get�tet Ur-Shak zutiefst bedauern.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //Fremder endlich verlassen Tal und gehen �ber Pass. Urshak Fremder nicht k�nnen t�ten jetzt. Ehre der Schamanen Ur-Shak befehlen so zu handeln.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //Bei n�chster Begegnung wir Feinde sein werden. Du besser jetzt gehen.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"Urshak geh�rt wieder dem Rat der Orkshamane an. Er steht jetzt auf der feindlichen Seite und ist ein wenig gereizt. Ich sollte ihm besser aus dem Weg gehen, bis ich die Geschichte mit den Orks geregelt habe. Bis dahin wird er sich wieder beruhigt haben."); 
	B_GivePlayerXP (XP_UrshakBecomesShaman);
};


///////////////////////////////////////////////////////////////////////
//	Info keineWahl
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_KEINEWAHL		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_KEINEWAHL_Condition;
	information	 = 	DIA_Urshak_KEINEWAHL_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_KEINEWAHL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKRACHE))
	&& (Npc_IsInState (self,ZS_Talk))
		{
				return TRUE;
		};
};

func void DIA_Urshak_KEINEWAHL_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //Du gehen. Ich nicht mehr mit Fremder reden.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















