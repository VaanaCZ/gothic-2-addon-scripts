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
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_00"); //(agresivnê) KHROTOK JABARTH!!!
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //Poèkej! Já tê znát. Ty pâítel èlovêk s mêkký hlas.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //Pâítel zabít zlý démon KRUSHAK.
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"Našel jsem svého starého skâetího pâítele Ur-Shaka."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "Co tady dêláš?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "Mluvící skâet?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //Mluvící skâet?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //Ty zapomenout na Ur-Shak? To dêlat smutek.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //Ur-Shak pomoct pâítel mnoho dní pâed tím, než ULU-MULU umožnit jít do moje vesnice. Skâeti si vážit pâátel a pâítel nezemâít rukou skâeta.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //Pâítel pak jí do podzemní skâetí chrám a zahnat zlý démon. Pâed mnoho dnù. Ty nepamatovat?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //To sis teda vybral èas k setkání. Málem jsem tê zabil. Co tady dêláš?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //Ur-Shak dávat pozor na zemi a vidêt, co se stát zemi a jeho lidem.
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

	description	 = 	"Proè skâeti napadli lidi?";
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
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //Proè skâeti napadli lidi?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //Ur-Shak vždycky âíkat skâetímu lidu, lidé ne zlí a mnoho dobrých pâátel mezi nima.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //Ale šaman neposlouchat Ur-Shak. Ur-Shak poâád u svého lidu v nemilost.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //Tak Ur-Shak ne slyšet moc o velký plán proti lidem.
	B_LogEntry (TOPIC_Urshak,"Ještê stále nepâimêl svùj lid, aby mu naslouchal. Poâád zùstává vyhnancem."); 
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

	description	 = 	"Proè je vás tu najednou tolik?";
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
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //Jak to, že je vás tu najednou tolik?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //Skâeti pâijít z hor, ale další pâiplout na lodích a postavit velká palisáda.
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

	description	 = 	"Co je ukryto za to dlouhou zdí na východê?";
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
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //Co je ukryto za tou dlouhou zdí na východê?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //Skâeti vždycky, když válka, stavêt velká palisáda a tábor.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //Palisáda dobrá pro válka. Ukrývá síla vojska a chrání skâety.
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

	description	 = 	"Co budeš dêlat teë?";
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
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //Co budeš dêlat teë?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //Ur-Shak èekat, až skâetí zvêd vzít Ur-Shak k Hosh-Pak.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //Kdo je Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //Moc mocný šaman. Mít velký vliv na váleèníky a dêlat pro skâety velké plány.

	B_LogEntry (TOPIC_Urshak,"Ur-Shak má v plánu setkat se se skâetím šamanem Hosh-Pakem a pâesvêdèit ho, aby ho pâijal do rady mezi ostatní šamany."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Kde najdu toho Hosh-Paka?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Tak proè teda za ním nejdeš?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //Tak proè teda za ním nejdeš?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //Ur-Shak zkoušet znovu a znovu získat èest a staré místo v šamaní rada.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //Ale až do teë, Hosh-Pak neposlouchat Ur-Shak. Skâeti zabít Ur-Shak, když jeho vidêt bez zvêd. Ur-Shak muset mluvit s Hosh-Pak.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //Možná dneska štêstí.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //Kde najdu toho Hosh-Paka?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //Utáboâit se, kde vidêt skâetí bojovníky pâes les u velká sopka. Hosh-Pak tak moct ovládat váleèníky.

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

	description	 = 	"Hosh-Pak je mrtvý.";
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
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //Hosh-Pak je mrtvý.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //Hosh-Pak mrtvý? RUSHTASOK!
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //Mé srdce têžké jako kámen. Ur-Shak nikdy nezapomenout velký skâet, co udêlat Ur-Shak šaman.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //Rozumím, byl tvým uèitelem.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //Ur-Shak teë muset zbavit zármutku, muset dát Hosh-Pak poslední obâad. Ur-Shak muset jít.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //Pâítel radêj hned projít prùsmyk. Tady moc nebezpeèný.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //Ur-Shak smutná, když pâítel èlovêk umâít.

	B_LogEntry (TOPIC_Urshak,"Hosh-Pak je mrtev. Mùj skâetí pâítel nyní míâí k jeho stanu a oplakává smrt svého mentora. Mêl bych ho nechat jít."); 

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,20);
	Npc_ExchangeRoutine	(self,"Zaèít");
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
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //Pâítel radêj hned projít prùsmyk.
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
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //(agresivnê) KHROTOK ! Já zjistit, že ty tady, když Hosh-Pak mrtvý. Ty udêlal velká chyba, cizinec.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //Já vêdêt, ty budeš tady. Ty hrál na mê habaëùra.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //Tvoje pozice je dùležitêjší, než jsi ochoten si pâipustit. Teë však nejsi nièím než nástrojem zla.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //Cizinec má pravda. Ur-Shaka teë naplàovat jen nenávist a chuã po pomsta.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //Ur-Shak vidí velká chyba, že vêâit cizinci. Ur-Shak litovat, že nazývat èlovêka pâítel a pomáhat mu, ne zabíjet.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //Cizinec nakonec opustit údolí a projít prùsmyk. Ur-Shak nezabít cizinec teë. Èest šamana Ur-Shak velet nezabíjet.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //Pâíštê my potkat, my nepâátelé. Bude líp, ty teë odejít.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"Ur-Shak byl pâijat zpátky do rady skâetích šamanù a ocitl se tedy na stranê nepâítele. Radši bych se mu mêl vyhýbat, dokud se mi nepodaâí tu záležitost se skâety nêjak urovnat. To by ho mêlo uklidnit."); 
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
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //Ty jít. Já nemluvit s cizinci.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















