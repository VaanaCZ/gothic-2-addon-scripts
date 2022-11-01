//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap1_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap1_EXIT_Condition;
	information = DIA_Igaraz_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Igaraz_Kap1_EXIT_Condition ()
{
	if (kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	ABSCHNITT 1  IM KLOSTER, SPIELER IST NOVIZE 
//**************************************************************************

//**************************************************************************
//	Info Hello
//**************************************************************************
INSTANCE DIA_Igaranz_Hello   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Hello_Condition;
	information = DIA_Igaraz_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Igaraz_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Hello_Info()
{
	if (other.guild == GIL_NOV)
	{
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_00"); //Que puis-je faire pour vous, mon frère ?
	}
	else
	{
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_01"); //Que puis-je pour vous ?
	};	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Igaraz_Wurst(C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr			= 2;
	condition	= DIA_Igaraz_Wurst_Condition;
	information	= DIA_Igaraz_Wurst_Info;
	permanent	= FALSE;
	description = "Je suis occupé à distribuer les saucisses.";
};                       

FUNC INT DIA_Igaraz_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Igaraz_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Igaraz_Wurst_15_00"); //Je suis occupé à distribuer des saucisses.
	AI_Output (self, other, "DIA_Igaraz_Wurst_13_01"); //Ainsi, vous travaillez pour Gorax, hein ? Très bien, donnez-moi cette saucisse.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
///////////////////////////////////////////////////////////////////////
//Wieso arbeitest Du nicht?
///////////////////////////////////////////////////////////////////////	
INSTANCE DIA_Igaranz_NotWork   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 3;
	condition   = DIA_Igaraz_NotWork_Condition;
	information = DIA_Igaraz_NotWork_Info;
	permanent   = FALSE;
	description	= "Pourquoi ne travaillez-vous pas ?";
};
FUNC INT DIA_Igaraz_NotWork_Condition()
{	
	if (Npc_GetDistToWP (self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild == GIL_NOV)
	{
			return TRUE;	
	};
};
FUNC VOID DIA_Igaraz_NotWork_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_NotWork_15_00"); //Pourquoi ne travaillez-vous pas ?
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_01"); //J'ai la permission d'étudier l'enseignement d'Innos. Je cherche la sagesse dans ses paroles.
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_02"); //Un jour, il me choisira, et je pourrai alors passer l'épreuve de magie pour rejoindre le Cercle du feu.
};
///////////////////////////////////////////////////////////////////////
//Wer sind die Erwählten?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Igaranz_Choosen   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Choosen_Condition;
	information = DIA_Igaraz_Choosen_Info;
	permanent   = TRUE;
	description	= "Qui sont les Elus ?";
};

FUNC INT DIA_Igaraz_Choosen_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_NotWork))
	&& (Npc_GetDistToWP (self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Choosen_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_15_00"); //Qui sont les élus ?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_01"); //Les novices qu'Innos autorise à passer l'épreuve de magie.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_02"); //Ceux qui la réussissent sont acceptés dans les rangs du Cercle du feu.
	
	Info_ClearChoices (DIA_Igaranz_Choosen);
	Info_AddChoice 	(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Qu'est-ce que le Test de magie ?",DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Comment puis-je être Elu ?",DIA_Igaranz_Choosen_HowChoosen);
};	

FUNC VOID DIA_Igaranz_Choosen_back ()
{
	Info_ClearChoices (DIA_Igaranz_Choosen);
};

FUNC VOID DIA_Igaranz_Choosen_TestOfMagic ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_TestOfMagic_15_00"); //Quelle est cette épreuve de magie ?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01"); //Une épreuve annoncée par le Haut Conseil à tous les novices choisis.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02"); //Il s'agit d'une tâche testant leur foi et leur intelligence.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03"); //Tous les novices y prennent part mais un seul peut la mener à bien.
};

FUNC VOID DIA_Igaranz_Choosen_HowChoosen ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_HowChoosen_15_00"); //Que dois-je faire pour être choisi ?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_HowChoosen_13_01"); //Vous ne pouvez rien faire à ce sujet. C'est Innos seul qui choisit et le Haut Conseil est là pour faire part de sa volonté à tous.
};
///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über Innos Lehren
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Igaranz_StudyInnos   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_StudyInnos_Condition;
	information = DIA_Igaraz_StudyInnos_Info;
	permanent   = FALSE;
	description	= "Comment puis-je étudier les saintes écritures ?";
};

FUNC INT DIA_Igaraz_StudyInnos_Condition()
{
	if Npc_KnowsInfo (other,DIA_Igaranz_NotWork)
	&& (Npc_GetDistToWP (self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (Parlan_Erlaubnis == FALSE)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_StudyInnos_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_StudyInnos_15_00"); //Comment puis-je étudier les textes sacrés ?
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_01"); //Il faut pour cela avoir accès à la bibliothèque.
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_02"); //Mais père Parlan ne vous en remettra la clé que si vous avez fini votre travail.
};
//**************************************************************************
//	ABSCHNITT 2  DIE PRÜFUNG DER MAGIE 
//**************************************************************************
///////////////////////////////////////////////////////////////////////
//	Info CHOOSEN
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_IMTHEMAN		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	2;
	condition	 = 	DIA_Igaraz_IMTHEMAN_Condition;
	information	 = 	DIA_Igaraz_IMTHEMAN_Info;
	important	 = 	TRUE;
};
func int DIA_Igaraz_IMTHEMAN_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_05") <= 3500) 
	&& (Npc_IsInState 	(self, ZS_Talk))
	&& (other.guild == GIL_NOV) 
	{
		return TRUE;
	};
};
func void DIA_Igaraz_IMTHEMAN_Info ()
{
	AI_Output (self, other, "DIA_Igaraz_IMTHEMAN_13_00"); //(fièrement) Ça y est. Innos m'a choisi et je vais prendre part à l'épreuve de magie.
};
///////////////////////////////////////////////////////////////////////
//	Info METOO
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_METOO		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	19;
	condition	 = 	DIA_Igaraz_METOO_Condition;
	information	 = 	DIA_Igaraz_METOO_Info;
	permanent	 =  FALSE;
	description	 = 	"J'y suis jusqu'au cou, aussi...";
};
var int DIA_Igaraz_METOO_NOPERM ;

func int DIA_Igaraz_METOO_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_05") <= 3500)
	//&&  Npc_KnowsInfo (hero,DIA_Igaraz_IMTHEMAN)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Igaraz_METOO_Info ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_15_00"); //Moi aussi. J'ai demandé à passer l'Epreuve du feu.
	AI_Output (self, other, "DIA_Igaraz_METOO_13_01"); //Vous avez fait quoi ? Dans ce cas, soit vous avez la faveur d'Innos, soit vous êtes complètement fou...
	AI_Output (other, self, "DIA_Igaraz_METOO_15_02"); //J'ai déjà mené à bien un tas de choses démentes, alors, une de plus ou une de moins...
	AI_Output (self, other, "DIA_Igaraz_METOO_13_03"); //La main d'Innos est sur moi. Je sais que je passerai l'épreuve avec succès.
	

	Info_ClearChoices	 (DIA_Igaraz_METOO);
	Info_AddChoice 		 (DIA_Igaraz_METOO,DIALOG_BACK,DIA_Igaraz_METOO_BACK);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Peut-être pourrions-nous travailler ensemble...",DIA_Igaraz_METOO_HELP);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Alors avez-vous trouvé quelque chose ?",DIA_Igaraz_METOO_TELL);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Avez-vous vu Agon ou Ulf ?",DIA_Igaraz_METOO_AGON);
};
FUNC VOID DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices	 (DIA_Igaraz_METOO);
};
FUNC VOID DIA_Igaraz_METOO_TELL ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_TELL_15_00"); //Vous avez déjà découvert quelque chose ?
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_01"); //Comme vous n'avez pas la moindre chance de toute façon, je peux bien vous le dire...
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_02"); //Inutile de chercher à proximité des fermes, il n'y a rien d'intéressant, là-bas...
};
FUNC VOID DIA_Igaraz_METOO_HELP ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_HELP_15_00"); //Peut-être pourrions-nous faire équipe...
	AI_Output (self, other, "DIA_Igaraz_METOO_HELP_13_01"); //N'y songez même pas. J'accomplirai cette mission seul. Vous ne feriez que me gêner.
};
FUNC VOID DIA_Igaraz_METOO_AGON ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_AGON_15_00"); //Avez-vous vu Agon ou Ulf ?
	AI_Output (self, other, "DIA_Igaraz_METOO_AGON_13_01"); //Nous nous sommes séparés à l'auberge. Je me suis rendu aux fermes alors qu'eux deux partaient ensemble, mais j'ignore pour où...
};
///////////////////////////////////////////////////////////////////////
//	Info ADD
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_ADD		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	23;
	condition	 = 	DIA_Igaraz_ADD_Condition;
	information	 = 	DIA_Igaraz_ADD_Info;
	permanent	 =  FALSE;
	description	 = 	"Savez-vous quoi que ce soit au sujet d'un 'rocher vivant' ?";
};
func int DIA_Igaraz_ADD_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_05") <= 3500) 
	&& (MIS_GOLEM == LOG_RUNNING) 
	&& (Npc_IsDead (Magic_Golem) == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Igaraz_Stein) == FALSE)
	&& Npc_KnowsInfo (other,DIA_Igaraz_METOO)
	{
		return TRUE;
	};
};
func void DIA_Igaraz_ADD_Info ()
{
	AI_Output (other, self, "DIA_Igaraz_Add_15_00"); //Est-ce que le terme de 'pierre vivante' vous dit quelque chose ?
	AI_Output (self, other, "DIA_Igaraz_Add_13_01"); //(glousse) Non. Est-ce Serpentes qui vous a confié cette épreuve ?
	AI_Output (other, self, "DIA_Igaraz_Add_15_02"); //Oui, pourquoi ?
	AI_Output (self, other, "DIA_Igaraz_Add_13_03"); //J'imagine ce qu'il a voulu dire...
	AI_Output (self, other, "DIA_Igaraz_Add_13_04"); //Vous ne seriez pas le premier à échouer dans cette épreuve...
	AI_Output (other, self, "DIA_Igaraz_Add_15_05"); //Où puis-je trouver cette pierre vivante, au juste ?
	AI_Output (self, other, "DIA_Igaraz_Add_13_06"); //Suivez le chemin. Au bout de quelque temps, vous arriverez à un cours d'eau.
	AI_Output (self, other, "DIA_Igaraz_Add_13_07"); //Suivez le chemin le long des pentes de la montagne. Vous devriez la trouver quelque part par là.
	AI_Output (self, other, "DIA_Igaraz_Add_13_08"); //Si vous atteignez un pont, c'est que vous êtes allé trop loin.
	AI_Output (self, other, "DIA_Igaraz_Add_13_09"); //(éclate de rire) Evidemment, il faudrait que vous soyez capable de survivre jusque-là...
	AI_Output (self, other, "DIA_Igaraz_Add_13_10"); //C'est tout ce que vous apprendrez de moi. (sarcastique) Après tout, c'est vous qui êtes censé passer cette épreuve...
};
///////////////////////////////////////////////////////////////////////
//	Info Perm Prüfung 
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_Pruefung		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	22;
	condition	 = 	DIA_Igaraz_Pruefung_Condition;
	information	 = 	DIA_Igaraz_Pruefung_Info;
	description	 =  "Avez-vous découvert quelque chose de nouveau ?";
};
func int DIA_Igaraz_Pruefung_Condition ()
{	
	if (other.guild == GIL_NOV) 
	&& (Npc_HasItems (other, ItMi_Runeblank) < 1)
	&& (Npc_KnowsInfo (other,DIA_Igaraz_METOO))
	{
		return TRUE;
	};
};
func void DIA_Igaraz_Pruefung_Info ()
{
	AI_Output (other, self, "DIA_Igaraz_Pruefung_15_00"); //Avez-vous découvert autre chose ?
	AI_Output (self, other, "DIA_Igaraz_Pruefung_13_01"); //Pas encore, mais je continue de chercher.
	
	AI_StopProcessInfos (self); 
	
	if (Igaraz_Wait == FALSE) 
	{
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self,"CONTESTWAIT");
		Igaraz_Wait = TRUE;
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info Stein
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_Stein		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	1;
	condition	 = 	DIA_Igaraz_Stein_Condition;
	information	 = 	DIA_Igaraz_Stein_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE; 
};
func int DIA_Igaraz_Stein_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_66") <= 3500) 
	&& (other.guild == GIL_NOV) 
	&& (Npc_HasItems (other, ItMi_Runeblank) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Igaraz_Stein_Info ()
{
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_00"); //Hé, attendez ! Il faut que nous parlions.
	AI_Output (other, self, "DIA_Igaraz_Seufz_15_01"); //Je ne pense pas en fait.
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_02"); //Cela fait des années que j'attends de passer cette épreuve. Innos est avec moi. Je dois réussir !
	
	if Npc_KnowsInfo (other, DIA_Ulf_Abrechnung)
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_03"); //Voilà qui me rappelle quelque chose...
	}
	else
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_04"); //Vous n'êtes pas le seul à dire cela.
	};
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_05"); //Assez bavassé. Il me faut ce que vous avez trouvé... Ce qui signifie que vous allez mourir !
	
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};


//################################################
//##
//##	Kapitel 2
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap2_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap2_EXIT_Condition;
	information = DIA_Igaraz_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap2_EXIT_Condition()
{
	if (kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//################################################
//##
//##	Kapitel 3
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap3_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap3_EXIT_Condition;
	information = DIA_Igaraz_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap3_EXIT_Condition()
{
	if (kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//**************************************************************************
//	Info TalkAboutBabo
//**************************************************************************
INSTANCE DIA_Igaranz_TalkAboutBabo   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_TalkAboutBabo_Condition;
	information = DIA_Igaraz_TalkAboutBabo_Info;
	permanent   = FALSE;
	description = "Nous devons parler de Babo.";
};
FUNC INT DIA_Igaraz_TalkAboutBabo_Condition()
{
	if (MIS_BabosDocs == LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_TalkAboutBabo_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_TalkAboutBabo_15_00"); //Nous devons parler de Babo.
	AI_Output (self ,other,"DIA_Igaranz_TalkAboutBabo_13_01"); //(réservé) Oui... qu'y a-t-il ?
};

//**************************************************************************
//	Du hast etwas was Babo gehört
//**************************************************************************
INSTANCE DIA_Igaranz_BabosBelongings   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BabosBelongings_Condition;
	information = DIA_Igaraz_BabosBelongings_Info;
	permanent   = FALSE;
	description = "Vous avez quelque chose qui appartient à Babo.";
};
FUNC INT DIA_Igaraz_BabosBelongings_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_TalkAboutBabo))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_BabosBelongings_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_00"); //Vous détenez quelque chose qui lui appartient.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_01"); //De quoi peut-il bien s'agir ?
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_02"); //De documents. Il désire les récupérer.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_03"); //(moqueur) Cela ne m'étonne pas. Malheureusement, je préfère les conserver, ce qui nous pose un sérieux dilemme...
};

//**************************************************************************
//	Wo hast du die Papiere?
//**************************************************************************
INSTANCE DIA_Igaranz_WhereDocs   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_WhereDocs_Condition;
	information = DIA_Igaraz_WhereDocs_Info;
	permanent   = FALSE;
	description = "Où avez-vous eu les papiers ?";
};
FUNC INT DIA_Igaraz_WhereDocs_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_WhereDocs_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_00"); //Où les avez-vous mis ?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_01"); //(suffisant) Je ne les ai pas sur moi, c'est l'évidence même ! Et j'ai bien peur de ne pas pouvoir vous en dire davantage.
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_02"); //Où sont-ils ?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_03"); //A l'abri. Et je ne vous donnerai jamais la clé permettant de les récupérer.
};

//**************************************************************************
//	Was soll Babo für dich tun?
//**************************************************************************
INSTANCE DIA_Igaranz_BabosJob   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BabosJob_Condition;
	information = DIA_Igaraz_BabosJob_Info;
	permanent   = FALSE;
	description = "Que devait faire Babo pour vous ?";
};
FUNC INT DIA_Igaraz_BabosJob_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_BabosJob_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_00"); //Qu'est-ce que Babo était censé faire pour vous ?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_01"); //Si j'avais su que ce bébé se mettrait dans un tel état pour un peu d'herbe des marais, j'aurais veillé à ce que quelqu'un d'autre se charge du jardin du monastère.
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_02"); //Il est censé faire pousser de l'herbe des marais ?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_03"); //Bien sûr. Son prix a triplé en ville depuis qu'il n'en arrive plus de l'autre côté de la Barrière.
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_04"); //Tout le monde y aurait trouvé son compte... mais Babo n'a pas voulu jouer le jeu.
};

//**************************************************************************
//	Wieviel willst du für die Papiere haben?
//**************************************************************************
INSTANCE DIA_Igaranz_Price   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_Price_Condition;
	information = DIA_Igaraz_Price_Info;
	permanent   = FALSE;
	description = "Combien voulez-vous pour les papiers ?";
};
FUNC INT DIA_Igaraz_Price_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Price_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_Price_15_00"); //Combien voulez-vous pour ces documents ?
	AI_Output (self ,other,"DIA_Igaranz_Price_13_01"); //(éclate de rire) Ils n'ont pour ainsi dire pas de prix ! On voit rarement des choses ayant autant de valeur par ici.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_02"); //Mais je n'ai nullement le désir d'hypothéquer mon avenir pour quelques pièces d'or.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_03"); //Donnez-moi 300 pièces d'or et les papiers sont à vous.
};

//**************************************************************************
//	Ich will die Papiere kaufen.
//**************************************************************************
INSTANCE DIA_Igaranz_BuyIt   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BuyIt_Condition;
	information = DIA_Igaraz_BuyIt_Info;
	permanent   = FALSE;
	description = "Je veux acheter ces papiers.";
};
FUNC INT DIA_Igaraz_BuyIt_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_Price))
	&& (Npc_HasItems (other,ItMi_Gold)>=300)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_BuyIt_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_BuyIt_15_00"); //Je tiens à vous les acheter.
	AI_Output (self ,other,"DIA_Igaranz_BuyIt_13_01"); //Ecoutez, je ne peux pas m'en aller pour le moment. Je veux bien vous donner la clé de mon coffre. De toute façon, il n'y a rien à l'intérieur.
	
	B_GiveInvItems (other,self,ItMi_Gold,300);
	B_GiveInvItems (self,other,ItKe_IgarazChest_mis,1);
};

//****************************************************
//	Taschendiebstahl
//***************************************************

INSTANCE DIA_Igaraz_PICKPOCKET (C_INFO)
{
	npc			= Nov_601_Igaraz;
	nr			= 900;
	condition	= DIA_Igaraz_PICKPOCKET_Condition;
	information	= DIA_Igaraz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait facile de lui voler la clef)";
};                       

FUNC INT DIA_Igaraz_PICKPOCKET_Condition()
{
	if (MIS_BaBosDocs == LOG_RUNNING) 
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItKe_IgarazChest_mis) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Igaraz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Igaraz_PICKPOCKET);
	Info_AddChoice		(DIA_Igaraz_PICKPOCKET, DIALOG_BACK 		,DIA_Igaraz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Igaraz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Igaraz_PICKPOCKET_DoIt);
};

func void DIA_Igaraz_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ItKe_IgarazChest_mis, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Igaraz_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft führt zu NEWS!
	};
};
	
func void DIA_Igaraz_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_Igaraz_PICKPOCKET);
};
	
//################################################
//##
//##	Kapitel 4
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap4_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap4_EXIT_Condition;
	information = DIA_Igaraz_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap4_EXIT_Condition()
{
	if (kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//################################################
//##
//##	Kapitel 5
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap5_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap5_EXIT_Condition;
	information = DIA_Igaraz_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap5_EXIT_Condition()
{
	if (kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	Info Perm
//**************************************************************************
INSTANCE DIA_Igaranz_Perm   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Perm_Condition;
	information = DIA_Igaraz_Perm_Info;
	permanent   = FALSE;
	description	= "Avez-vous quelque chose qui puisse m'intéresser ?";
};
FUNC INT DIA_Igaraz_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	&& (MIS_BabosDocs != LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Perm_Info()
{
	AI_Output (other ,self,"DIA_Igaranz_Perm_15_00"); //Avez-vous quoi que ce soit d'autre d'intéressant pour moi ?
	AI_Output (self ,other,"DIA_Igaranz_Perm_13_01"); //Euh... non.
	
	AI_StopProcessInfos(self); 
		
};




