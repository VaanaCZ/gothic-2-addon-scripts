///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_EXIT   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 999;
	condition   = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ignaz_PICKPOCKET (C_INFO)
{
	npc			= VLK_498_Ignaz;
	nr			= 900;
	condition	= DIA_Ignaz_PICKPOCKET_Condition;
	information	= DIA_Ignaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ignaz_PICKPOCKET_Condition()
{
	C_Beklauen (38, 50);
};
 
FUNC VOID DIA_Ignaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_BACK 		,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
	
func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Hallo   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ignaz_Hallo_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Hallo_Info()
{
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_00");//Ah ! Vous arrivez juste à temps ! J'ai besoin d'un assistant pour me livrer à une expérience magique.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_01");//Je suis sûr que vous êtes impatient de m'aider... pour la science !
	AI_Output (other, self, "DIA_Ignaz_Hallo_15_02");//Du calme, l'ami. Si vous commenciez par me dire de quoi il s'agit ?
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_03");//J'ai mis au point un nouveau sort... un sort d'oubli.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_04");//J'ai déjà effectué quelques expériences pratiques qui se sont toutes conclues par un succès, mais je n'ai pas le temps de me livrer à un dernier test.
};
///////////////////////////////////////////////////////////////////////
//	Info Lerninhalte Traenke
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Traenke   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 3;
	condition   = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent   = FALSE;
	description = "Qu'est-ce que j'y gagne si je vous aide ?";
};

FUNC INT DIA_Ignaz_Traenke_Condition()
{	
	if (MIS_Ignaz_Charm != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Traenke_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Traenke_15_00");//Qu'est-ce que j'ai à y gagner si je vous aide ?
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_01");//Je pourrais vous apprendre à concocter des potions...
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_02");//Je connais la recette des essences médicinales et de mana, ainsi que de la potion de rapidité.
	//AI_Output (self, other, "DIA_Ignaz_Traenke_14_03");//Außerdem kann ich dir beibringen, wie du ein Elixier der Geschicklichkeit herstellst.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Experiment
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Experiment   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 4;
	condition   = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent   = FALSE;
	description = "Dites-m'en plus sur le sort et sur l'expérience.";
};

FUNC INT DIA_Ignaz_Experiment_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Ignaz_Experiment_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_00");//Parlez-moi encore de votre expérience et de votre sort.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_01");//Le sort a pour effet de faire oublier certains événements au sujet.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_02");//Jusque-là, il ne fonctionne que quand le sujet est en colère... par exemple, quand il vient d'être bousculé, ou encore volé.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_03");//Même s'il a juste été témoin d'un tel incident, le sort l'efface de sa mémoire.
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_04");//Donc, je suis censé bousculer quelqu'un et lui lancer le sort dessus ?
	//AI_Output (other, self, "DIA_Ignaz_Add_15_00"); //Das macht dann wohl nur Sinn, wenn derjenige nach der Schlägerei WIRKLICH verärgert ist.
	//AI_Output (other, self, "DIA_Ignaz_Add_15_01"); //(zu sich) Hier im Hafenviertel sind Schlägereien nichts Ungewöhnliches. Also müßte ich mir schon woanders ein Opfer suchen...
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_05");//Oui. Mais il suffit d'attaquer le sujet pour qu'il se mette en colère. Pas la peine de le terrasser.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_06");//Choisissez quelqu'un qui est seul. S'il y a du monde alentour, vous aurez des ennuis avec le seigneur André.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_07");//Et puis, il ne sert à rien de lancer le sort sur quelqu'un qui vous attaque. Attendez le moment opportun.
};	
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_teilnehmen   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 5;
	condition   = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent   = FALSE;
	description = "Très bien, j'essaierai ce sort.";
};

FUNC INT DIA_Ignaz_teilnehmen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Ignaz_Experiment)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_teilnehmen_Info()
{
	AI_Output (other, self, "DIA_Ignaz_teilnehmen_15_00");//D'accord, je veux bien essayer.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_01");//Alors, prenez ce parchemin et trouvez-vous un cobaye.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_02");//Ensuite, revenez me dire comment cela s'est passé.
	
	B_GiveInvItems (self, other, ITSC_Charm,1);
	MIS_Ignaz_Charm = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ignaz,LOG_RUNNING);
	B_LogEntry (TOPIC_Ignaz,"Je dois tester un nouveau sort pour Ignaz. C'est un sort d'Oubli. Dès que quelqu'un se mettra en colère à cause d'une bagarre ou pour toute autre raison, cette personne refusera de me parler. Ce sera le moment idéal pour tester le sort.");
	B_LogEntry (TOPIC_Ignaz,"C'est l'occasion idéale de tester le sort. Il oubliera ce qui s'est passé. Je ne pense pas que quelqu'un du port m'en voudra si je le fais tomber.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Running   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent   = FALSE;
	description = "A propos de l'expérience...";
};

FUNC INT DIA_Ignaz_Running_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_RUNNING)
	&& (Charm_Test == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Running_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Running_15_00");//A propos de l'expérience...
	AI_Output (self, other, "DIA_Ignaz_Running_14_01");//Alors ? S'est-elle conclue par un succès ou bien avez-vous gaspillé le parchemin que je vous avais remis ?
	AI_Output (self, other, "DIA_Ignaz_Running_14_02");//Si vous avez besoin de davantage de parchemins, je peux vous en vendre.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Danach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent   = FALSE;
	description = "J'ai utilisé le parchemin de sort.";
};
FUNC INT DIA_Ignaz_Danach_Condition()
{	
	if (Charm_Test == TRUE)
	&& (MIS_Ignaz_Charm == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Danach_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Danach_15_00");//J'ai utilisé le parchemin.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_01");//Très bien, très bien... et ?
	AI_Output (other, self, "DIA_Ignaz_Danach_15_02");//Ça a marché.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_03");//Excellent ! Un petit pas pour la science, mais un grand pour moi !
	AI_Output (self, other, "DIA_Ignaz_Danach_14_04");//Je peux désormais prendre le temps de vous enseigner l'alchimie.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_05");//Si vous voulez, je peux aussi vous donner des choses utiles.
	
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Ignaz peut me montrer des recettes de potions. Il vit dans le quartier du port.");
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP (XP_MIS_Ignaz_Charm);
	
	//PATCH fallls alle Scrolls aufgekauft oder geplündert wurden
	CreateInvItems (self,ITSC_Charm		, 3);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Trade   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent   = TRUE;
	trade 		= TRUE;
	description = "Montrez-moi vos marchandises.";
};
FUNC INT DIA_Ignaz_Trade_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_SUCCESS)
	|| (Npc_KnowsInfo (other,DIA_Ignaz_Running))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Ignaz_Trade_15_00");//Montrez-moi vos marchandises.
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Teach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent   = TRUE;
	description = "Apprenez-moi l'art de l'alchimie.";
};
//----------------------------------------
var int DIA_Ignaz_Teach_permanent;
//----------------------------------------

FUNC INT DIA_Ignaz_Teach_Condition()
{	
	if (DIA_Ignaz_Teach_permanent == FALSE)
	&& (Ignaz_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Ignaz_Teach_15_00");//Apprenez-moi l'art de l'alchimie.
	
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_ClearChoices (DIA_Ignaz_Teach);
		Info_AddChoice (DIA_Ignaz_Teach,DIALOG_BACK,DIA_Ignaz_Teach_BACK);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Potion de rapidité", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Essence de mana", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Essence médicinale", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)) ,DIA_Ignaz_Teach_Health);
		talente = (talente + 1);
	};
	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_01"); //Pour préparer une potion, il faut un atelier et une flasque de laboratoire.
			AI_Output (self, other,"DIA_Ignaz_Teach_14_02"); //Et vous allez avoir besoin de diverses plantes et d'autres ingrédients pour préparer chaque potion.
			//AI_Output (self, other,"DIA_Ignaz_Teach_14_03"); //Eins noch. Falls du vorhast, das Wissen um Elixiere der Geschicklichkeit zu lernen, solltest du wissen, dass die benötigten Pflanzen dafür sehr selten sind.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_04"); //Qu'est-ce que vous voulez savoir ?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Ignaz_Teach_14_05"); //Vous avez appris tout ce que je pouvais vous enseigner.
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};
	
FUNC VOID DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Speed);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices (DIA_Ignaz_Teach);
};

