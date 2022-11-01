///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_EXIT   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 999;
	condition   = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_Hallo   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Girion_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (MIS_ShipIsFree == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Girion_Hallo_Info()
{
	AI_Output (self, other, "DIA_Girion_Hallo_08_00"); //Je suis Girion, paladin du roi et maître du combat à deux mains. Pourquoi venez-vous m'importuner ?
};
///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CanTeach		(C_INFO)
{
	npc			 = 	PAL_207_Girion;
	nr			 = 	5;
	condition	 = 	DIA_Girion_CanTeach_Condition;
	information	 = 	DIA_Girion_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Pouvez-vous m'entraîner ?";
};
func int DIA_Girion_CanTeach_Condition ()
{	
	if (Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Girion_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Girion_CanTeach_15_00"); //Pouvez-vous m'entraîner ?
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Girion_CanTeach_08_01"); //Vous avez raison de vouloir vous entraîner à la pratique du plus noble des styles de combat comme tout bon guerrier se doit de le faire.
		AI_Output (self, other, "DIA_Girion_CanTeach_08_02"); //J'accepte de vous servir d'instructeur. Revenez me voir quand vous serez prêt.
		
		Girion_Teach2H = TRUE;	
		B_LogEntry (TOPIC_CityTeacher,"Le paladin Girion peut m'apprendre à combattre avec des armes à deux mains.");
	}
	else
	{
		AI_Output (self, other, "DIA_Girion_CanTeach_08_03"); //Si vous voulez apprendre quelque chose, il vous faudra vous tourner vers un maître ne faisant pas partie de notre ordre.
		AI_Output (self, other, "DIA_Girion_CanTeach_08_04"); //Je suis un guerrier, pas un instructeur.
	};
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Girion_Teach(C_INFO)
{
	npc			= PAL_207_Girion;
	nr			= 100;
	condition	= DIA_Girion_Teach_Condition;
	information	= DIA_Girion_Teach_Info;
	permanent	= TRUE;
	description = "Je suis prêt à m'entraîner.";
};                       
//----------------------------------
var int DIA_Girion_Teach_permanent;
//----------------------------------
FUNC INT DIA_Girion_Teach_Condition()
{
	if (Girion_Teach2H == TRUE)
	&& (DIA_Girion_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
// -------------------------------
var int  girion_merk2h;
// ------------------------------- 
FUNC VOID DIA_Girion_Teach_Info()
{	
	girion_merk2h = other.HitChance[NPC_TALENT_2H];  
	
	AI_Output (other,self ,"DIA_Girion_Teach_15_00"); //Je suis prêt à suivre votre enseignement.
	
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);

};
FUNC VOID DIA_Girion_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_00"); //Bien entendu, votre formation n'est pas terminée, mais je n'ai plus rien à vous apprendre.
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_01"); //Il vous faudra trouver un maître de l'épée si vous voulez continuer de vous améliorer au maniement de l'épée.
		AI_Output (other,self,"DIA_DIA_Girion_Teach_15_02"); //Où puis-je trouver un tel maître ?
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_03"); //Le seigneur Hagen est un maître de l'épée. Nul doute qu'il acceptera de vous prodiguer des leçons.
		
		DIA_Girion_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Girion_Teach);
};

FUNC VOID DIA_Girion_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_00"); //Battez-vous avec honneur. Le combat est toute notre vie, et qu'est-ce qu'une vie menée sans honneur ?
		};
		if (Girion_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_01"); //Faites preuve de vivacité et de prudence au combat. Surprenez votre adversaire.
		};
		if (Girion_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_02"); //N'engagez jamais la bataille sans vous y être préparé si vous ne voulez pas que ce soit votre dernière.
		};
		if (Girion_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_03"); //Un paladin se doit de toujours être prêt au combat. Mais il ne déclenche jamais une bataille quand il sait qu'il ne peut l'emporter.
		};
		
		Girion_Labercount = Girion_Labercount +1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;	
		};
	};
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);	
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);	
};

FUNC VOID DIA_Girion_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_00"); //Un paladin se bat aussi avec sa tête, pas seulement avec son bras.
		};
		if (Girion_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_01"); //Vous devez apprendre à savoir quand battre en retraite.
		};
		if (Girion_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_02"); //N'oubliez jamais : vous aurez l'avantage tant que vous imposerez votre rythme à l'adversaire et que vous l'empêcherez de vous imposer le sien.
		};
		if (Girion_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_03"); //Et vous n'avez pas perdu tant que vous n'avez pas abandonné.
		};
		
		Girion_Labercount = Girion_Labercount +1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;	
		};
	};
	
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);	
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);	
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info CatchPlayerStolenShip
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CATCHPLAYERSTOLENSHIP		(C_INFO)
{
	npc		 = 	PAL_207_Girion;
	nr		 = 	5;
	condition	 = 	DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information	 = 	DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important	 = 	TRUE;
};

func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition ()
{
	if (Kapitel >= 5)
	&& (MIS_ShipIsFree == TRUE) 
	&& (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25")<1000) //Joly: ist nur hier, wenn SC die Wachen überredet hat, ihm das Schiff zu geben.
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info ()
{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00"); //Hé ! Pouvez-vous me dire ce que vous faites ici ?

	Info_ClearChoices	(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Je ne vois pas de quoi vous parlez.", DIA_Girion_CATCHPLAYERSTOLENSHIP_no );
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Hors de mon chemin ou je devrai vous tuer.", DIA_Girion_CATCHPLAYERSTOLENSHIP_weg );
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "J'ai besoin d'un navire.", DIA_Girion_CATCHPLAYERSTOLENSHIP_ship );

};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00"); //J'ignore de quoi vous voulez parler.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01"); //Je parle de ce que vous avez mijoté avec les gardes du navire. Cela me semble extrêmement louche.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02"); //Même si vous êtes un magicien, je n'ai aucune confiance en vous.
	};
};
var int Girion_WantstoKillSC;
func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00"); //Hors de mon chemin, si vous ne voulez pas que je vous tue !
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01"); //Vous avez peut-être réussi à abuser les gardes du bateau, mais vous verrez que, moi, je suis un dur à cuire, mon jeune ami.
	if (hero.guild == GIL_PAL)
	{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02"); //Même si vous êtes des nôtres, cela ne vous donne pas le droit de voler ce qui appartient au roi. Faites vos prières, sale traître !
	};
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09"); //Quand cette affaire sera terminée, vous me remettrez le navire, c'est bien compris ?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00"); //J'ai besoin de ce bateau, alors je vais le prendre.
	
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01"); //Vous ne pouvez pas faire ça ! Le transporteur de minerai...
	}
	else
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02"); //Comment osez-vous, sale fils de...
	};
	
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03"); //Il n'y a pas assez de minerai dans la Vallée des mines pour satisfaire le roi. Je le sais, j'en viens. Il n'y a presque plus rien à extraire de la montagne. La mission d'Hagen n'est qu'une pantalonnade.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04"); //La véritable menace prend racine dans une île proche d'ici. Je vais m'y rendre afin d'étouffer le péril dans l'œuf.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05"); //Soit vous vous joignez à moi, soit je ferai sans vous. A vous de choisir.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06"); //Hmm... on dirait que je n'ai guère le choix...
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07"); //Exact.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08"); //Très bien, j'accepte de me joindre à vous, mais à une condition.

	B_GirionStayOnShip();

	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10"); //Ça me va.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11"); //Alors, faites ce que vous devez faire. Je vous attends ici.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	crewmember_Count = (Crewmember_Count +1);
	Girion_IsOnBoard = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Verrat 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_Verrat   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Verrat_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

FUNC INT DIA_Girion_Verrat_Condition()
{
	if (Girion_WantstoKillSC == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Girion_Verrat_Info()
{
	AI_Output			(self, other, "DIA_Girion_Verrat_08_00"); //Traître !
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


///////////////////////////////////////////////////////////////////////
//	Info OnShip 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_OnShip   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

FUNC INT DIA_Girion_OnShip_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Girion_IsOnBoard == LOG_SUCCESS)
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Girion_PICKPOCKET (C_INFO)
{
	npc			= PAL_207_Girion;
	nr			= 900;
	condition	= DIA_Girion_PICKPOCKET_Condition;
	information	= DIA_Girion_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Girion_PICKPOCKET_Condition()
{
	C_Beklauen (73, 280);
};
 
FUNC VOID DIA_Girion_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Girion_PICKPOCKET);
	Info_AddChoice		(DIA_Girion_PICKPOCKET, DIALOG_BACK 		,DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Girion_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Girion_PICKPOCKET);
};
	
func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Girion_PICKPOCKET);
};



