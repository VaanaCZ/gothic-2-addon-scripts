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
	AI_Output (self, other, "DIA_Alvares_HAUAB_11_00"); //J'ignore ce qui vous am�ne ici, mais n'y pensez plus et tirez-vous.
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"La ferme d'Akil est menac�e par des mercenaires."); 
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
	AI_Output (self, other, "DIA_Alvares_ATTACK_11_00"); //H�! Vous �tes encore l�? Bon, alors, je vous laisse le choix�: tirez-vous ou vous allez y rester.
	
	Info_ClearChoices (DIA_Alvares_ATTACK);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Qui �tes-vous les gars ? Un duo de clowns ?",DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Je veux me joindre aux mercenaires.",DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Sortez d'ici maintenant...",DIA_Alvares_ATTACK_Witz);	 
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Je ne veux pas d'ennuis.",DIA_Alvares_ATTACK_Aerger);
	
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		Info_AddChoice 	  (DIA_Alvares_ATTACK,"Je suis juste venu chercher quelque chose.",DIA_Alvares_ATTACK_Lieferung);
	};
	
	
};
FUNC VOID DIA_Alvares_ATTACK_Witz()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_00"); //Fichez le camp d'ici, les mecs. Pig�?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_01"); //Regardez-moi �a�! Un h�ros�! Stupide, certes, mais un h�ros...
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_02"); //Vous savez ce que je crois�?
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_03"); //Comme si quelqu'un en avait quoi que ce soit � faire...
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_04"); //Pour moi, les seuls vrais h�ros sont les h�ros morts. Alors, d�p�chez-vous d'aller crever�!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Kerle()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Kerle_15_00"); //Qui vous �tes, les gars�? Une paire de clowns�?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_01"); //Exactement. Et je me marrerai encore plus quand vous aurez mordu la poussi�re.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_02"); //(appelle son compagnon) Allez, on y va, Engardo ! Attrape le fermier. Moi, je me charge de ce plaisantin.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Aerger()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Aerger_15_00"); //Ecoutez, je ne veux pas d'ennuis.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_01"); //Mais nous, si. Et on vient de loin juste pour vous en causer.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_02"); //�a, oui. On va faire des ennuis � tout le monde ici. Et je commencerai par vous si vous ne d�gagez pas tout de suite.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Lieferung()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Lieferung_15_00"); //Je viens juste chercher quelque chose.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Lieferung_11_01"); //Nous aussi. Et on est arriv� les premiers. Alors, si vous ne videz pas les lieux, je vais �tre oblig� de vous faire mal.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Soeldner_15_00"); //Je veux devenir mercenaire.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Soeldner_11_01"); //Vraiment�? Je vais vous dire... tirez-vous si vous voulez avoir encore l'occasion de devenir quelque chose.
	
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
	AI_Output (self, other, "DIA_Alvares_Schluss_11_00"); //Bon, je vous ai laiss� votre chance. Mais je constate que vous n'�tes pas du genre � �couter la voix de la raison.
	AI_Output (self, other, "DIA_Alvares_Schluss_11_01"); //Je vais donc �tre dans l'obligation de vous tuer. (appelle son compagnon) C'est bon, Engardo, on les bute�!
	
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


