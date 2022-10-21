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
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_00"); //(agresivn�) KHROTOK JABARTH!!!
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //Po�kej! J� t� zn�t. Ty p��tel �lov�k s m�kk� hlas.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //P��tel zab�t zl� d�mon KRUSHAK.
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"Na�el jsem sv�ho star�ho sk�et�ho p��tele Ur-Shaka."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "Co tady d�l�?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "Mluv�c� sk�et?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //Mluv�c� sk�et?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //Ty zapomenout na Ur-Shak? To d�lat smutek.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //Ur-Shak pomoct p��tel mnoho dn� p�ed t�m, ne� ULU-MULU umo�nit j�t do moje vesnice. Sk�eti si v�it p��tel a p��tel nezem��t rukou sk�eta.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //P��tel pak j� do podzemn� sk�et� chr�m a zahnat zl� d�mon. P�ed mnoho dn�. Ty nepamatovat?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //To sis teda vybral �as k setk�n�. M�lem jsem t� zabil. Co tady d�l�?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //Ur-Shak d�vat pozor na zemi a vid�t, co se st�t zemi a jeho lidem.
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

	description	 = 	"Pro� sk�eti napadli lidi?";
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
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //Pro� sk�eti napadli lidi?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //Ur-Shak v�dycky ��kat sk�et�mu lidu, lid� ne zl� a mnoho dobr�ch p��tel mezi nima.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //Ale �aman neposlouchat Ur-Shak. Ur-Shak po��d u sv�ho lidu v nemilost.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //Tak Ur-Shak ne sly�et moc o velk� pl�n proti lidem.
	B_LogEntry (TOPIC_Urshak,"Je�t� st�le nep�im�l sv�j lid, aby mu naslouchal. Po��d z�st�v� vyhnancem."); 
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

	description	 = 	"Pro� je v�s tu najednou tolik?";
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
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //Jak to, �e je v�s tu najednou tolik?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //Sk�eti p�ij�t z hor, ale dal�� p�iplout na lod�ch a postavit velk� palis�da.
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

	description	 = 	"Co je ukryto za to dlouhou zd� na v�chod�?";
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
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //Co je ukryto za tou dlouhou zd� na v�chod�?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //Sk�eti v�dycky, kdy� v�lka, stav�t velk� palis�da a t�bor.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //Palis�da dobr� pro v�lka. Ukr�v� s�la vojska a chr�n� sk�ety.
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

	description	 = 	"Co bude� d�lat te�?";
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
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //Co bude� d�lat te�?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //Ur-Shak �ekat, a� sk�et� zv�d vz�t Ur-Shak k Hosh-Pak.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //Kdo je Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //Moc mocn� �aman. M�t velk� vliv na v�le�n�ky a d�lat pro sk�ety velk� pl�ny.

	B_LogEntry (TOPIC_Urshak,"Ur-Shak m� v pl�nu setkat se se sk�et�m �amanem Hosh-Pakem a p�esv�d�it ho, aby ho p�ijal do rady mezi ostatn� �amany."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Kde najdu toho Hosh-Paka?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Tak pro� teda za n�m nejde�?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //Tak pro� teda za n�m nejde�?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //Ur-Shak zkou�et znovu a znovu z�skat �est a star� m�sto v �aman� rada.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //Ale a� do te�, Hosh-Pak neposlouchat Ur-Shak. Sk�eti zab�t Ur-Shak, kdy� jeho vid�t bez zv�d. Ur-Shak muset mluvit s Hosh-Pak.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //Mo�n� dneska �t�st�.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //Kde najdu toho Hosh-Paka?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //Ut�bo�it se, kde vid�t sk�et� bojovn�ky p�es les u velk� sopka. Hosh-Pak tak moct ovl�dat v�le�n�ky.

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

	description	 = 	"Hosh-Pak je mrtv�.";
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
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //Hosh-Pak je mrtv�.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //Hosh-Pak mrtv�? RUSHTASOK!
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //M� srdce t�k� jako k�men. Ur-Shak nikdy nezapomenout velk� sk�et, co ud�lat Ur-Shak �aman.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //Rozum�m, byl tv�m u�itelem.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //Ur-Shak te� muset zbavit z�rmutku, muset d�t Hosh-Pak posledn� ob�ad. Ur-Shak muset j�t.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //P��tel rad�j hned proj�t pr�smyk. Tady moc nebezpe�n�.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //Ur-Shak smutn�, kdy� p��tel �lov�k um��t.

	B_LogEntry (TOPIC_Urshak,"Hosh-Pak je mrtev. M�j sk�et� p��tel nyn� m��� k jeho stanu a oplak�v� smrt sv�ho mentora. M�l bych ho nechat j�t."); 

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
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //P��tel rad�j hned proj�t pr�smyk.
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
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //(agresivn�) KHROTOK ! J� zjistit, �e ty tady, kdy� Hosh-Pak mrtv�. Ty ud�lal velk� chyba, cizinec.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //J� v�d�t, ty bude� tady. Ty hr�l na m� haba��ra.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //Tvoje pozice je d�le�it�j��, ne� jsi ochoten si p�ipustit. Te� v�ak nejsi ni��m ne� n�strojem zla.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //Cizinec m� pravda. Ur-Shaka te� napl�ovat jen nen�vist a chu� po pomsta.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //Ur-Shak vid� velk� chyba, �e v��it cizinci. Ur-Shak litovat, �e naz�vat �lov�ka p��tel a pom�hat mu, ne zab�jet.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //Cizinec nakonec opustit �dol� a proj�t pr�smyk. Ur-Shak nezab�t cizinec te�. �est �amana Ur-Shak velet nezab�jet.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //P��t� my potkat, my nep��tel�. Bude l�p, ty te� odej�t.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"Ur-Shak byl p�ijat zp�tky do rady sk�et�ch �aman� a ocitl se tedy na stran� nep��tele. Rad�i bych se mu m�l vyh�bat, dokud se mi nepoda�� tu z�le�itost se sk�ety n�jak urovnat. To by ho m�lo uklidnit."); 
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
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //Ty j�t. J� nemluvit s cizinci.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















