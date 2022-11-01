///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Alvares_EXIT   (C_INFO)
{
	npc         = SLD_840_Alvares;
	nr          = 999;
	condition   = DIA_Alvares_EXIT_Condition;
	information = DIA_Alvares_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Alvares_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alvares_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HauAb
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_HAUAB		(C_INFO)
{
	npc			 = 	SLD_840_Alvares;
	nr			 = 	4;
	condition	 = 	DIA_Alvares_HAUAB_Condition;
	information	 = 	DIA_Alvares_HAUAB_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Alvares_HAUAB_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Alvares_HAUAB_Info ()
{
	Akils_SLDStillthere = TRUE;
	AI_Output (self, other, "DIA_Alvares_HAUAB_11_00"); //Aă už tę sem pâivedlo cokoliv, radši na to zapomeŕ a bęž dál.
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akilův statek ohrožují žoldáci."); 
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Attack
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_ATTACK		(C_INFO)
{
	npc			 = 	SLD_840_Alvares;
	nr			 = 	6;
	condition	 = 	DIA_Alvares_ATTACK_Condition;
	information	 = 	DIA_Alvares_ATTACK_Info;
	permanent	 = 	FALSE;
	important	 = 	TRUE;
};
func int DIA_Alvares_ATTACK_Condition ()
{
	if	(Npc_KnowsInfo(other, DIA_Alvares_HAUAB))
	&&  (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Alvares_ATTACK_Info ()
{
	AI_Output (self, other, "DIA_Alvares_ATTACK_11_00"); //Hej, tys ještę tady? Dal jsem ti na výbęr, cizinče: buë vypadni, nebo chcípni.
	
	Info_ClearChoices (DIA_Alvares_ATTACK);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Co jste zač? Párek vtipálků?",DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Chci se k vám pâidat.",DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Teëka odsud hezky rychle vypadnete...",DIA_Alvares_ATTACK_Witz);	 
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Nestojím o žádné problémy.",DIA_Alvares_ATTACK_Aerger);
	
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		Info_AddChoice 	  (DIA_Alvares_ATTACK,"Jen jsem si pâišel nęco vyzvednout.",DIA_Alvares_ATTACK_Lieferung);
	};
	
	
};
FUNC VOID DIA_Alvares_ATTACK_Witz()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_00"); //Hele, kluci, prostę odtuë hnedka zmizíte, jasný?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_01"); //A helemese, máme tu nového hrdinu - a je to opravdový blbec.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_02"); //Víš, co si myslím?
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_03"); //Koho zajímá, co si myslíš?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_04"); //Myslím, že dobrý hrdina je jedinę mrtvý hrdina. Udęlej mi teda laskavost - chcípni co nejrychlejc!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Kerle()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Kerle_15_00"); //Co jste zač? Párek vtipálků?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_01"); //Tos uhodl. Ale poâádnę se zasmęju, teprve až budeš ležet držkou v blátę.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_02"); //(volá) Engardo, do toho! Ty chytni toho sedláka a já se vypoâádám s tímhle šaškem!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Aerger()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Aerger_15_00"); //Nestojím o žádné problémy.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_01"); //A my zase máme problémy moc rádi. Urazili jsme pękný kus cesty, jenom abysme nęjaké vyvolali.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_02"); //Jo, tęch problémů nebude zrovna málo. A jestli okamžitę nezmizíš, začneme rovnou s tebou.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Lieferung()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Lieferung_15_00"); //Jen jsem si pâišel nęco vyzvednout.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Lieferung_11_01"); //To my taky, a my jsme tu byli první. Takže buë vypadneš, nebo ti budu muset ublížit.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Soeldner_15_00"); //Chci se k vám žoldnéâům pâidat.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Soeldner_11_01"); //Ou, vážnę? Tak to koukej mazat, nebo už se nikdy k nikomu nepâidáš.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Schluss
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_Schluss		(C_INFO)
{
	npc			 = 	SLD_840_Alvares;
	nr			 = 	4;
	condition	 = 	DIA_Alvares_Schluss_Condition;
	information	 = 	DIA_Alvares_Schluss_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Alvares_Schluss_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other,DIA_Alvares_ATTACK))
	{
		return TRUE;
	};
};
func void DIA_Alvares_Schluss_Info ()
{
	AI_Output (self, other, "DIA_Alvares_Schluss_11_00"); //Dostal jsi šanci. Ale vypadá to, že rozumný důvody prostę ignoruješ.
	AI_Output (self, other, "DIA_Alvares_Schluss_11_01"); //Jak chceš - tak to tę prostę teë hned zabiju. (volá) Engardo, oddęlej ho!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);	

	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Alvares_PICKPOCKET (C_INFO)
{
	npc			= SLD_840_Alvares;
	nr			= 900;
	condition	= DIA_Alvares_PICKPOCKET_Condition;
	information	= DIA_Alvares_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Alvares_PICKPOCKET_Condition()
{
	C_Beklauen (20, 15);
};
 
FUNC VOID DIA_Alvares_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alvares_PICKPOCKET);
	Info_AddChoice		(DIA_Alvares_PICKPOCKET, DIALOG_BACK 		,DIA_Alvares_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alvares_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alvares_PICKPOCKET_DoIt);
};

func void DIA_Alvares_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alvares_PICKPOCKET);
};
	
func void DIA_Alvares_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alvares_PICKPOCKET);
};


