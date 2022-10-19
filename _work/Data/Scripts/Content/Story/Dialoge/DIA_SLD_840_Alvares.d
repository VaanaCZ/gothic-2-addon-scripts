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
	AI_Output (self, other, "DIA_Alvares_HAUAB_11_00"); //Nie wiem, co ci� tu przygna�o, ale lepiej zapomnij o tym i ruszaj w dalsz� drog�.
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Farmie Akila zagra�aj� najemnicy."); 
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
	AI_Output (self, other, "DIA_Alvares_ATTACK_11_00"); //Hej, ci�gle tu jeste�? Dam ci szans�, przybyszu: wyno� si� st�d albo zginiesz.
	
	Info_ClearChoices (DIA_Alvares_ATTACK);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Kim jeste�cie, ch�opaki - w�drownymi b�aznami?",DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Chc� si� do was zaci�gn��.",DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Wyno�cie si� st�d, zrozumiano?",DIA_Alvares_ATTACK_Witz);	 
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Nie chc� �adnych k�opot�w.",DIA_Alvares_ATTACK_Aerger);
	
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		Info_AddChoice 	  (DIA_Alvares_ATTACK,"Przyszed�em tylko co� zabra�.",DIA_Alvares_ATTACK_Lieferung);
	};
	
	
};
FUNC VOID DIA_Alvares_ATTACK_Witz()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_00"); //Wyno�cie si� st�d, zrozumiano?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_01"); //No patrzcie, wpad� nam w �apy bohater - prawdziwy, durny bohater.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_02"); //Wiesz, co my�l�?
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_03"); //A kogo obchodzi, co my�lisz?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_04"); //My�l�, �e dobry bohater to martwy bohater. Wi�c zr�b co� dla mnie - umieraj szybko!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Kerle()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Kerle_15_00"); //Kim jeste�cie, ch�opaki - w�drownymi b�aznami?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_01"); //Sam tego chcia�e�. Wci�� b�d� si� �mia�, kiedy ty b�dziesz le�a� z g�b� w b�ocie.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_02"); //Engardo, zaczynamy! Ty �ap wie�niaka - ja zajm� si� tym pajacem!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Aerger()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Aerger_15_00"); //Nie chc� �adnych k�opot�w.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_01"); //Ale my w�a�nie szukamy k�opot�w. Przebyli�my d�ug� drog� w�a�nie po to, �eby narobi� troch� zamieszania.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_02"); //Tak, zamierzamy narobi� sporo k�opot�w. I zaczn� od ciebie, je�li zaraz st�d nie znikniesz.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Lieferung()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Lieferung_15_00"); //Przyszed�em tylko co� zabra�.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Lieferung_11_01"); //My te�. I byli�my pierwsi. Wi�c spadaj, bo b�d� musia� zrobi� ci krzywd�.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Soeldner_15_00"); //Chc� si� do was zaci�gn��.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Soeldner_11_01"); //Och, naprawd�? No to spad�wa - bo ju� si� nigdy nigdzie nie zaci�gniesz.
	
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
	AI_Output (self, other, "DIA_Alvares_Schluss_11_00"); //Mia�e� szans�. Ale chyba nie chcesz pos�ucha� m�drej rady.
	AI_Output (self, other, "DIA_Alvares_Schluss_11_01"); //Dobra - no to teraz ci� zabij�. Engardo, za�atwmy ich!
	
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


