//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_EXIT   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 999;
	condition   = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Cassia_PICKME (C_INFO)
{
	npc			= VLK_447_Cassia;
	nr			= 900;
	condition	= DIA_Cassia_PICKME_Condition;
	information	= DIA_Cassia_PICKME_Info;
	permanent	= TRUE;
	description = Pickpocket_100_Female;
};                       

FUNC INT DIA_Cassia_PICKME_Condition()
{
	C_Beklauen (100, 400);
};
 
FUNC VOID DIA_Cassia_PICKME_Info()
{	
	Info_ClearChoices	(DIA_Cassia_PICKME);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_BACK 		,DIA_Cassia_PICKME_BACK);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_PICKPOCKET	,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cassia_PICKME);
};
	
func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices (DIA_Cassia_PICKME);
};
//////////////////////////////////////////////////////////////////////
//	Info Gilde
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Gilde   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Cassia_Gilde_Condition()
{	
	if (Cassia_Gildencheck == TRUE)
	&& (Join_Thiefs == TRUE)
	&& ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Gilde_Info()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Je vois que vous représentez désormais la loi et l'ordre.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//Mais le fait que vous soyez entré au service d'Innos n'a pas la moindre importance. Pour moi, vous êtes toujours des nôtres. J'espère que c'est également votre avis.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//Ainsi, vous faites désormais partie de l'Eglise d'Innos. Très bien, mais j'espère que vous n'oublierez pas que vous êtes toujours des nôtres.
	};
	
	
	AI_StopProcessInfos (self);
	
};
//////////////////////////////////////////////////////////////////////
//	Info Frist abgelaufen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Abgelaufen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Cassia_Abgelaufen_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Cassia_Frist == TRUE)  
	&& (Cassia_Day < (B_GetDayPlus() -2))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Abgelaufen_Info()
{
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Vous avez laissé passer le délai que je vous avais accordé. Vous n'auriez pas dû revenir.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0); 
};
//////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_News   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Cassia_News_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_News_Info()
{
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_News_16_00");//Je vois que vous avez reçu notre présent. Je suis Cassia.
		AI_Output (other, self, "DIA_Cassia_News_15_01");//Très bien, Cassia. Si vous me disiez ce que je fais ici ?
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Vous avez attiré notre attention en gagnant la confiance d'amis à nous.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//Nous avons donc décidé de vous offrir la possibilité de vous joindre à nous.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//Eh bien, eh bien... voyez un peu qui a réussi à arriver jusqu'ici. On dirait qu'Attila vous a sous-estimé... mais ne vous attendez pas à ce que je commette la même erreur...
		AI_Output (other, self, "DIA_Cassia_News_15_05");//A quoi jouez-vous au juste ?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Vous deviez mourir pour avoir dénoncé notre ami. C'est pour cela que nous avons chargé Attila de vous tuer.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Mais votre présence parmi nous modifie sensiblement la donne...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//Qu'avez-vous à me proposer ?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//La possibilité de vous joindre à nous.
	};
	if  (Npc_GetTrueGuild (other) == GIL_NONE)
	||  (Npc_GetTrueGuild (other) == GIL_NOV)
	{	
		Cassia_Gildencheck = TRUE;
	};
	
	DG_gefunden = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Erzähle mir mehr 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_mehr   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent   = FALSE;
	description = "Dites-m'en plus au sujet de votre organisation.";
};

FUNC INT DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_mehr_Info()
{
	AI_Output (other, self, "DIA_Cassia_mehr_15_00");//Parlez-moi de votre organisation.
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//Nous rendons tout le monde nerveux en ville, mais nul ne sait où se trouve notre cachette.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Les rares gens qui sont au courant de l'existence des égouts pensent qu'ils sont fermés et totalement inaccessibles.
	AI_Output (self, other, "DIA_Cassia_mehr_16_03");//Et tant que personne ne nous trouve, nous pouvons travailler en paix.
};

//////////////////////////////////////////////////////////////////////
//	Vermisste Leute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_MissingPeople   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent   = FALSE;
	description = "Que savez-vous sur les disparus ?";
};

FUNC INT DIA_Cassia_MissingPeople_Condition()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cassia_MissingPeople_Info()
{
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_00"); //Que savez-vous sur les disparus ?
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //Pourquoi vous intéressez-vous à cela ?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Je veux comprendre ce qui leur est arrivé.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Quand vous sortirez des égouts, longez un moment la côte à la nage vers la droite.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_04"); //Vous trouverez sûrement vos réponses là...
};


//////////////////////////////////////////////////////////////////////
//	Info Was habe ich davon? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Vorteil   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent   = FALSE;
	description = "Qu'est-ce que je gagne si je me joins à vous ?";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//Qu'est-ce que je gagne si je me joins à vous ?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//Nous pourrons vous enseigner nos compétences spéciales, ça vous permettra de vivre dans le luxe et l'opulence.
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_02");//Mais je ne serais pas obligé de vivre caché ici, si ?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_03");//(éclate de rire) Non, bien sûr. Il vous suffira juste d'obéir à nos règles.
};
//////////////////////////////////////////////////////////////////////
//	Info Was kann ich bei euch lernen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Lernen  (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 4;
	condition   = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent   = FALSE;
	description = "Que pouvez-vous m'apprendre ?";
};

FUNC INT DIA_Cassia_Lernen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Lernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//Que pouvez-vous m'apprendre au juste ?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper est passé maître dans l'art de la discrétion. Il vous montrera comment vous déplacer sans bruit.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ramirez est un cambrioleur de haut vol. Aucune serrure ne lui résiste.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//Et moi, je peux vous enseigner l'art du vol à la tire.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Je vous apprendrai également à développer votre agilité, Une grande agilité est essentielle à la bonne utilisation de nos compétences.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia peut m'apprendre le vol à la tire et peut m'aider à améliorer ma dextérité.");
	B_LogEntry(Topic_CityTeacher,"Ramirez peut m'apprendre à crocheter les serrures.");
	B_LogEntry(Topic_CityTeacher,"Jesper peut m'apprendre la discrétion.");
};
//////////////////////////////////////////////////////////////////////
//	Info Regeln 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Regeln   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent   = FALSE;
	description = "Quelles sont vos règles ?";
};

FUNC INT DIA_Cassia_Regeln_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Regeln_Info()
{
	AI_Output (other, self, "DIA_Cassia_Regeln_15_00");//Quelles sont vos règles ?
	//AI_Output (self, other, "DIA_Cassia_Regeln_16_01");//Wir richten uns nach drei Regeln.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_02");//La première est simple : vous ne devez parler de nous à personne, jamais.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_03");//Deuxièmement, défense de se faire prendre.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Troisièmement, si vous sortez votre arme ici dans le but d'attaquer quelqu'un, nous vous tuerons.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//Et enfin, ceux qui veulent se joindre à nous doivent commencer par faire leurs preuves.
};
//////////////////////////////////////////////////////////////////////
//	Info Was passiert, wenn ich erwischt werde? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Erwischen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent   = FALSE;
	description = "Que se passe-t-il si je me fais prendre ?";
};

FUNC INT DIA_Cassia_Erwischen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Erwischen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//Que se passera-t-il si je me fais attraper ?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Faites en sorte que cela n'arrive pas, d'accord ?
};
//////////////////////////////////////////////////////////////////////
//	Info Wie muss ich mich beweisen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_beweisen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent   = TRUE;
	description = "Comment suis-je supposé faire mes preuves ?";
};
//--------------------------------------
var int DIA_Cassia_beweisen_permanent;
//-------------------------------------
FUNC INT DIA_Cassia_beweisen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	&& (DIA_Cassia_beweisen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_beweisen_Info()
{
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//Comment suis-je censé faire mes preuves ?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Vous voulez vous joindre à nous, oui ou non ?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Cet entêté de Constantino, l'alchimiste, possède un très bel anneau.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Mais il n'en a pas vraiment besoin. En fait, il serait bien plus joli à mon doigt.
		
		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;
		
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaRing,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaRing,"Cassia veut que je lui apporte l'anneau de Constantino.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Beitreten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Beitreten   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent   = FALSE;
	description = "Très bien, je marche.";
};

FUNC INT DIA_Cassia_Beitreten_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Beitreten_Info()
{
	AI_Output (other, self, "DIA_Cassia_Beitreten_15_00");//D'accord, je suis partant.
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//Excellent ! Nous allons vous donner la possibilité de faire vos preuves. Et si vous voulez profiter de notre enseignement, pas de problème.
	
	Join_Thiefs = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Und wenn ich euch nicht beitrete...? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Ablehnen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 9;
	condition   = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent   = FALSE;
	description = "Et si je ne veux pas me joindre à vous… ?";
};

FUNC INT DIA_Cassia_Ablehnen_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//Et si je ne veux pas me joindre à vous ?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Vous laissez passer la chance de votre vie, mais vous êtes libre de partir.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//(sérieuse) Par contre, ne songez même pas à nous trahir. Vous le regretteriez amèrement.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Très bien, je marche.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Je dois y réfléchir.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//Dans ce cas, je vous tue.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Très bien, je marche.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Eh bien, essayez donc de me tuer.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//D'accord, je suis partant.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//(sourit) Sage décision. Vous pourrez rejoindre nos rangs si vous parvenez à faire vos preuves.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Si vous voulez commencer par apprendre les compétences de voleur, pas de problème. Vous en aurez bien besoin.
	Join_Thiefs = TRUE; 
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};
FUNC VOID DIA_Cassia_Ablehnen_Kill()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Kill_15_00");//Essayez un peu de me tuer, pour voir...
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Kill_16_01");//Dommage, je vous aurais cru plus malin que cela...

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Cassia_Ablehnen_Frist()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Il faut que j'y réfléchisse.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Faites. Je vous donne deux jours pour prendre votre décision. Passé ce délai, vous ne serez plus le bienvenu ici.
	
	Cassia_Day = B_GetDayPlus ();
	Cassia_Frist = TRUE;
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};


//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_BevorLernen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 5;
	condition   = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent   = TRUE;
	description = "Pouvez-vous m'apprendre quelque chose ?";
};
FUNC INT DIA_Cassia_BevorLernen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& ((Cassia_TeachPickpocket == FALSE)
	|| (Cassia_TeachDEX == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//Pouvez-vous me faire profiter de votre enseignement ?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Bien sûr. Faites-moi savoir quand vous serez prêt.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Bien sûr. Les cours de vol à la tire vous coûteront 100 pièces d'or et ce sera le même tarif pour les exercices d'agilité.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Peut-être plus tard... (RETOUR)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Je veux apprendre à crocheter des serrures (payer 100 pièces d'or).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Je veux améliorer ma dextérité (payer 100 pièces d'or).",DIA_Cassia_BevorLernen_DEX);
		};
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices (DIA_Cassia_BevorLernen);
};
FUNC VOID DIA_Cassia_BevorLernen_DEX()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Je voudrais devenir plus agile. Voilà votre argent.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//Nous pouvons commencer dès que vous serez prêt.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");//Revenez quand vous aurez de quoi payer.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
FUNC VOID DIA_Cassia_BevorLernen_Pickpocket()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Je voudrais apprendre le vol à la tire. Voilà votre argent.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//Nous pouvons commencer dès que vous serez prêt.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02");//Revenez quand vous aurez de quoi payer.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_447_Cassia;
	nr			 = 	12;
	condition	 = 	DIA_Cassia_TEACH_Condition;
	information	 = 	DIA_Cassia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux devenir plus agile.";
};
func int DIA_Cassia_TEACH_Condition ()
{	
	if (Cassia_TeachDEX == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_Cassia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Cassia_TEACH_15_00"); //Je voudrais devenir plus agile.
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
};
func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Cassia_TEACH);
};
func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Pickpocket   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent   = TRUE;
	description = "Apprenez-moi à voler à la tire. (10 PA)";
};

FUNC INT DIA_Cassia_Pickpocket_Condition()
{	
	if (Cassia_TeachPickpocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Pickpocket_Info()
{
	AI_Output (other, self, "DIA_Cassia_Pickpocket_15_00");//Montrez-moi comment pratiquer le vol à la tire.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET)
	{
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Si vous voulez faire les poches de quelqu'un, commencez par distraire votre proie, par exemple en lui parlant.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Dans le même temps, évaluez votre victime du regard et cherchez ses poches rembourrées, ou encore ses éventuels bijoux. Et surtout, voyez si vous avez affaire ou non à quelqu'un d'attentif.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Il est bien plus facile de voler un ivrogne qu'un marchand vigilant, vous vous en doutez.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Evidemment, si vous êtes trop maladroit, votre victime se doutera de quelque chose. Alors, d'abord et avant toute chose, gardez votre calme.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Aufnahme
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Aufnahme   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent   = FALSE;
	description = "J'ai l'anneau de Constantino.";
};

FUNC INT DIA_Cassia_Aufnahme_Condition()
{	
	if (MIS_CassiaRing == LOG_RUNNING)
	&& (Npc_HasItems (other, ItRi_Prot_Point_01_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Aufnahme_Info()
{
	AI_Output (other, self, "DIA_Cassia_Aufnahme_15_00");//J'ai l'anneau de Constantino.
	B_GiveInvItems (other, self,ItRi_Prot_Point_01_MIS,1);
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//Félicitations ! Vous avez passé avec succès votre épreuve d'initiation. Vous voilà des nôtres désormais.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//Prenez cette clé. Elle ouvre la porte de l'hôtel. (sourit) De cette manière, vous n'aurez pas à nager à chaque fois.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//Sachez aussi que nous avons un signe de reconnaissance, un hochement de tête bien spécifique.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//Exactement. Si vous faites ce signe en parlant à quelqu'un qui nous connaît, votre interlocuteur saura que vous êtes des nôtres.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"J'ai été accepté au sein de la guilde des voleurs."); 
	B_LogEntry (Topic_Diebesgilde,"Je connais le signe de reconnaissance des voleurs. Si je l'adresse aux bonnes personnes, elles sauront que je suis l'un d'eux.");
	 
	
};
//////////////////////////////////////////////////////////////////////
//	Info Versteck
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Versteck   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent   = FALSE;
	description = "Alors où cachez-vous votre butin ?";
};

FUNC INT DIA_Cassia_Versteck_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Ramirez_Beute)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Versteck_Info()
{
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//Où cachez-vous votre butin ?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Allons... vous ne pensiez tout de même pas que j'allais vous répondre, si ?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_02");//Vous aurez amplement l'occasion de vous enrichir. Mais n'oubliez jamais que les plus cupides finissent toujours par tout perdre.
};
//////////////////////////////////////////////////////////////////////
//	Info Blutkelche
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Blutkelche   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent   = FALSE;
	description = "Avez-vous du travail pour moi ?";
};

FUNC INT DIA_Cassia_Blutkelche_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (MIS_CassiaKelche != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Blutkelche_Info()
{
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//Vous avez du travail pour moi ?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//Pas tant que vous serez recherché par les autorités.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//Réglez cette affaire rapidement. Payez l'amende ou éliminez les témoins, je ne veux pas le savoir, mais réglez-moi ça.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//Oui. Il existe un total de six calices identiques.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//Autrefois, le roi Rhobar les avait rapportés d'une longue campagne, coûteuse en vies humaines. C'est pour cette raison qu'on les nomme les calices de sang.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//Individuellement, ils ne valent pas grand-chose, mais les six réunis ont une bien plus grande valeur.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//Où sont ces calices ?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Ils sont ici, en ville, entre les mains des riches marchands du haut quartier.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//Ramenez-les moi. De mon côté, je ferai en sorte de leur trouver un acheteur.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//Et qu'est-ce que j'ai à y gagner ?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//Au choix : la moitié du prix de la vente ou un objet de mon butin.
 		
 		MIS_CassiaKelche = LOG_RUNNING;
 		Log_CreateTopic(Topic_Cassiakelche,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaKelche,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaKelche,"Cassia veut que je lui apporte six calices de sang. Apparemment, ils se trouvent tous en ville.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Kelche abgeben
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_abgeben   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent   = TRUE;
	description = "A propos des calices de sang...";
};

FUNC INT DIA_Cassia_abgeben_Condition()
{	
	if (MIS_CassiaKelche == LOG_RUNNING)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_abgeben_Info()
{
	AI_Output (other, self, "DIA_Cassia_abgeben_15_00");//Au sujet des calices de sang...
	
	if B_GiveInvItems (other, self, ItMi_BloodCup_MIS,6)
	{
		AI_Output (other, self, "DIA_Cassia_abgeben_15_01");//J'ai les six calices.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Beau travail. De mon côté, j'ai trouvé un acheteur.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//Vous pouvez prendre votre récompense. Merci d'avoir fait cela pour moi.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//Je n'ai rien d'autre à vous proposer. Mais je peux vous donner des leçons, si vous voulez. Et puis, il y a des tas de choses qui attendent juste qu'on aille les prendre sur cette île... (sourit)
		    
		
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP (XP_CassiaBlutkelche);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_abgeben_16_05");//Je ne peux vendre ces calices que tous ensemble. Ramenez-moi les six.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Belohung
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Belohnung   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent   = FALSE;
	description = "Je viens récupérer ma récompense.";
};

FUNC INT DIA_Cassia_Belohnung_Condition()
{	
	if (MIS_CassiaKelche == LOG_SUCCESS)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Belohnung_Info()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//Je viens chercher ma récompense.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//Que choisissez-vous ?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 pièces d'or.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice (DIA_Cassia_Belohnung,"4 élixirs de soin",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice (DIA_Cassia_Belohnung, NAME_ADDON_CASSIASBELOHNUNGSRING ,DIA_Cassia_Belohnung_Ring);
	
};
FUNC VOID DIA_Cassia_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_02");//Donnez-moi l'or.
	B_GiveInvItems (self, other, ItmI_Gold,400);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Trank()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_03");//Donnez-moi les potions.
	B_GiveInvItems (self, other, ItPo_Health_03,4);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Ring()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_04");//Donnez-moi l'anneau.
	B_GiveInvItems (self, other, ItRi_Hp_01,1);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
