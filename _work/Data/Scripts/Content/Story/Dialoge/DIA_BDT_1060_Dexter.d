// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Dexter_EXIT   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 999;
	condition   = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_Dexter_Hallo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 1;
	condition   = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Dexter_Hallo_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Hallo_Info()
{
	AI_Output (self, other, "DIA_Dexter_Hallo_09_00");//Regardez qui est là. Le grand libérateur. Enfin, le héros ! Que venez-vous faire ici ?
	AI_Output (other, self, "DIA_Dexter_Hallo_15_01");//Je cherche des réponses.
	
	if (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		//ADDON>
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_00");//Je n'aurais jamais pensé que vous viendriez ici de votre plein gré.
		AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_01");//Que voulez-vous dire ?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_02");//Je veux dire que je suis à votre recherche. Vous n'avez pas vu mes affiches ?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_03");//Il a votre bobine sur chacune d'elles. Oh oui… vous êtes activement recherché. Vous ne le saviez pas ?
		//ADDON<
	}
	else // (Bdt13_Dexter_verraten == TRUE) //Gothic2
	{
		AI_Output (other, self, "DIA_Dexter_Hallo_15_02");//QUELQU'UN diffuse des avis de recherche avec mon visage dessus. QUELQU'UN m'a dit que c'était vous.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_03");//Ce quelqu'un parle trop.
		
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_04");//Mais vous avez raison. J'ai placardé ces affiches. Et voilà que je tombe sur vous..
		
		/*//ADDON>
		AI_Output (self, other, "DIA_Dexter_Hallo_09_04");//Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_05");//Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_06");//Ich dachte schon, das wäre mein Ende, aber dann tauchte plötzlich aus der Dunkelheit diese ... Gestalt auf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_07");//Er trug eine schwarze Robe mit Kapuze und eine Maske überm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_08");//Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldstücke für deinen Kopf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_09");//Hey, was sollte ich machen? Wenn ich abgelehnt hätte, dann hätte er mich getötet!
		*///ADDON<
		//ADDON B_LogEntry (Topic_Bandits,"Dexter hat die Steckbriefe verteilt. Typen mit schwarzen Kapuzen haben ihn damit beauftragt.");
		
		
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
	};
	AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_05");//Que voulez-vous de moi ?
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_06");//Moi ? Rien du tout. Mais mon patron meurt d'envie de vous voir mort.
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_07");//Alors il m'a dit de vous retrouver et de lui ramener votre tête.
};

// ************************************************************
// 			Glaube 
// ************************************************************
INSTANCE DIA_Dexter_Glaube   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent   = FALSE;
	description = "Je ne crois pas un mot de ce que vous dites.";
};
FUNC INT DIA_Dexter_Glaube_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Glaube_Info()
{
	AI_Output (other, self, "DIA_Dexter_Glaube_15_00");//Je ne crois pas un mot de ce que vous dites.
	AI_Output (self, other, "DIA_Dexter_Glaube_09_01");//C'est la vérité ! Je le jure sur la tombe de ma mère !
};

///////////////////////////////////////////////////////////////////////
//	Info Patrick
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Patrick		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_Patrick_Condition;
	information	 = 	DIA_Addon_Dexter_Patrick_Info;

	description	 = 	"On a vu un mercenaire du nom de Patrick par ici.";
};

func int DIA_Addon_Dexter_Patrick_Condition ()
{
	if (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Patrick_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Patrick_15_00"); //On a vu un mercenaire du nom de Patrick par ici.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_01"); //Patrick, hein ? Je vois pas de qui vous parlez.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_02"); //Je me souviens d'un mercenaire à grande gueule qui traînait parfois par ici avec les gars.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_03"); //(mentant ouvertement) Mais ça fait bien longtemps que je ne l'ai pas vu.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_04"); //(feignant l'innocence) Il a peut-être fini par être pendu. Je ne sais pas.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Dexter prétend ne pas connaître Patrick, le mercenaire."); 

	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP (XP_Addon_Dexter_KnowsPatrick);
};
///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Greg		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Dexter_Greg_Condition;
	information	 = 	DIA_Addon_Dexter_Greg_Info;

	description	 = 	"Il y a un type avec un bandeau sur l'œil qui vous recherche en personne !";
};

func int DIA_Addon_Dexter_Greg_Condition ()
{
	if (SC_KnowsGregsSearchsDexter == TRUE)
	&& (Knows_Dexter == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Dexter_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Greg_15_00"); //Il y a ce type avec un bandeau sur l'œil. C'est après vous qu'il en a !
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_01"); //Tout le monde en a après moi. Je m'en contrefiche.
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_02"); //Si ce type veut parler affaires, qu'il vienne ici.
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info missingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_missingPeople		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_missingPeople_Condition;
	information	 = 	DIA_Addon_Dexter_missingPeople_Info;

	description	 = 	"On dit que vous enlevez des gens de Khorinis.";
};

func int DIA_Addon_Dexter_missingPeople_Condition ()
{
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Dexter_missingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_missingPeople_15_00"); //On dit que vous enlevez des gens de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_01"); //Vous avez aussi découvert ça. Bon travail, mon gars.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_02"); //Et moi qui pensais avoir couvert mes traces.
	
	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Qui donne les ordres ?", DIA_Addon_Dexter_missingPeople_wer );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Où sont passées ces personnes ?", DIA_Addon_Dexter_missingPeople_Wo );
};
func void DIA_Addon_Dexter_missingPeople_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Wo_15_00"); //Où sont passés ces gens ? Peut-être au fond des mines, quelque part par ici ?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_01"); //(rit) Ils sont loin au nord-est maintenant. Là où vous ne les retrouverez pas.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_02"); //Je pourrais vous dire exactement où ils sont mais je ne vois vraiment pas pourquoi je le ferais.
};
func void DIA_Addon_Dexter_missingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_wer_15_00"); //Qui donne les ordres ?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_01"); //Mon patron. C'est un homme dangereux. Vous le connaissez : c'est Raven, un des anciens barons du minerai du vieux camp dans la Vallée des mines.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_02"); //Il a besoin de ces gens pour accomplir ses plans. Vous n'avez pas à en savoir plus.

	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Raven, dangereux ? Eh bien...", DIA_Addon_Dexter_missingPeople_Raven );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Un baron du minerai, ici, à Khorinis ?", DIA_Addon_Dexter_missingPeople_RavenTot );
		 
};
func void DIA_Addon_Dexter_missingPeople_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Raven_15_00"); //Raven, dangereux ? Ah bon
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_01"); //(irrité) Qu'est-ce que vous en savez ? Vous ne le connaissez pas aussi bien que moi.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_02"); //(hésitant) Avant c'était déjà une misérable crapule mais aujourd'hui
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_03"); //Il a changé depuis la chute de la Barrière. Une ombre voile sa face.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_04"); //(intimidé) Son regard vous perce comme les griffes d'un rapace si vous le soutenez trop longtemps.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_05"); //Mon seul conseil : quittez Khorinis au plus vite avant qu'il ne soit trop tard.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_06"); //(sombre) Il n'y a rien pour vous ici. Hormis une mort certaine.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Dexter a un client répondant au nom de Raven. Raven est un baron du minerai déchu. Il semblerait qu'il soit à l'origine de cette série d'enlèvements. Désormais, il ne me reste plus qu'à le prouver."); 

	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
};
func void DIA_Addon_Dexter_missingPeople_RavenTot ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_RavenTot_15_00"); //Un baron du minerai, ici, à Khorinis ?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_RavenTot_09_01"); //Il n'est plus baron. Il a de nouveaux plans et Khorinis ne va pas tarder à s'en apercevoir.
};

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Boss		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	3;
	condition	 = 	DIA_Addon_Dexter_Boss_Condition;
	information	 = 	DIA_Addon_Dexter_Boss_Info;

	description	 = 	"Votre patron ? Qui est-ce ?";
};

func int DIA_Addon_Dexter_Boss_Condition ()
{
	if (Knows_Dexter == TRUE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Boss_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Boss_15_00"); //Votre patron ? Qui est-ce ?
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_01"); //(rit) Vous voudriez bien le savoir, hein ? Ça, je m'en doute bien.
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_02"); //(sérieux) Je ne vois pas de raison de vous le dire.
};

// ************************************************************
// 			Vor 
// ************************************************************
INSTANCE DIA_Dexter_Vor   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent   = FALSE;
	description = "Et qu'allez-vous faire maintenant ?";
};
FUNC INT DIA_Dexter_Vor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Dexter_missingPeople))
		{
			return TRUE;
		};
};
FUNC VOID DIA_Dexter_Vor_Info()
{
	AI_Output (other, self, "DIA_Dexter_Vor_15_00");//Et que comptez-vous faire maintenant ? Me tuer ?
	AI_Output (self, other, "DIA_Dexter_Vor_09_01");//Ben, disons que vous nous avez tous libérés alors je vais vous donner une autre chance. Partez d'ici, disparaissez, devenez invisible. Allez-vous-en et ne vous mettez plus jamais sur mon chemin.
	AI_Output (other, self, "DIA_Addon_Dexter_Vor_15_00");//Il faut que je sache où vous avez emmené tous ces gens.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_01");//(rire) Et bien… vous pourriez essayer de me frapper pour que je parle
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_02");//(menaçant) Vous feriez mieux de filer tout de suite.
	AI_Output (self, other, "DIA_Dexter_Vor_09_02");//Si je vous revois dans le coin, je n'hésiterai pas à vous tuer.
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Kill
// ************************************************************
INSTANCE DIA_Dexter_Kill   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 2;
	condition   = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dexter_Kill_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Dexter_NoMoreSmallTalk == TRUE)
	|| (Knows_Dexter == FALSE)) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kill_Info()
{
	if (Knows_Dexter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Dexter_Add_09_02"); //(attaquant) Vous l'avez cherch
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Kill_09_01");//Vous auriez mieux fait de ne pas revenir ici. Vous êtes la mauvaise personne au mauvais endroit.
	};
	
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter ();
	Info_ClearChoices	(DIA_Dexter_Kill);
	Info_AddChoice	(DIA_Dexter_Kill, DIALOG_ENDE, DIA_Dexter_Kill_ENDE );
};
func void DIA_Dexter_Kill_ENDE ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(Greg_NW);

	if (Hlp_IsItem(itm, ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor	(Greg_NW, ITAR_PIR_H_Addon);	
	};
};


// ************************************************************
// 			Mein Kopf? 
// ************************************************************
INSTANCE DIA_Dexter_Kopf (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent   = FALSE;
	description = "Vous voulez ma tête ? Venez la chercher !";
};
FUNC INT DIA_Dexter_Kopf_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kopf_Info()
{
	AI_Output (other, self, "DIA_Addon_Dexter_Add_15_00"); //Vous voulez ma tête ? Venez la chercher !
	AI_Output (self, other, "DIA_Addon_Dexter_Add_09_01"); //(attaquant) Si c'est ce que vous voulez

	DIA_Dexter_Kill_ENDE();
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dexter_PICKPOCKET (C_INFO)
{
	npc			= BDT_1060_Dexter;
	nr			= 900;
	condition	= DIA_Dexter_PICKPOCKET_Condition;
	information	= DIA_Dexter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Dexter_PICKPOCKET_Condition()
{
	C_Beklauen (96, 370);
};
 
FUNC VOID DIA_Dexter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dexter_PICKPOCKET);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_BACK 		,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};
	
func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};





/*
// ************************************************************
// 			Wo
// ************************************************************
INSTANCE DIA_Dexter_Wo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 3;
	condition   = DIA_Dexter_Wo_Condition;
	information = DIA_Dexter_Wo_Info;
	permanent   = FALSE;
	description = "Wo finde ich diesen Mann?";
};
FUNC INT DIA_Dexter_Wo_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Dexter_Glaube) == FALSE)
	&& (Knows_Dexter == TRUE)
	&& (Bdt13_Dexter_verraten == TRUE) 
	&& (Ranger_SCKnowsDexter == FALSE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Wo_Info()
{
	AI_Output (other, self, "DIA_Dexter_Wo_15_00");//Wo finde ich diesen Mann?
	
	if (Kapitel < 3)
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_01");//Ich glaube, der sitzt irgendwo im Minental.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_02");//Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle überall unterwegs! Und die suchen dich.
	};
};
*/
