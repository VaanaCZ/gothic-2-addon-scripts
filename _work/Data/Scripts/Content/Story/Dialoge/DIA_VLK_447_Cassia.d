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
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Je vois que vous repr�sentez d�sormais la loi et l'ordre.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//Mais le fait que vous soyez entr� au service d'Innos n'a pas la moindre importance. Pour moi, vous �tes toujours des n�tres. J'esp�re que c'est �galement votre avis.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//Ainsi, vous faites d�sormais partie de l'Eglise d'Innos. Tr�s bien, mais j'esp�re que vous n'oublierez pas que vous �tes toujours des n�tres.
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
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Vous avez laiss� passer le d�lai que je vous avais accord�. Vous n'auriez pas d� revenir.
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
		AI_Output (self, other, "DIA_Cassia_News_16_00");//Je vois que vous avez re�u notre pr�sent. Je suis Cassia.
		AI_Output (other, self, "DIA_Cassia_News_15_01");//Tr�s bien, Cassia. Si vous me disiez ce que je fais ici�?
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Vous avez attir� notre attention en gagnant la confiance d'amis � nous.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//Nous avons donc d�cid� de vous offrir la possibilit� de vous joindre � nous.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//Eh bien, eh bien... voyez un peu qui a r�ussi � arriver jusqu'ici. On dirait qu'Attila vous a sous-estim�... mais ne vous attendez pas � ce que je commette la m�me erreur...
		AI_Output (other, self, "DIA_Cassia_News_15_05");//A quoi jouez-vous au juste�?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Vous deviez mourir pour avoir d�nonc� notre ami. C'est pour cela que nous avons charg� Attila de vous tuer.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Mais votre pr�sence parmi nous modifie sensiblement la donne...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//Qu'avez-vous � me proposer�?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//La possibilit� de vous joindre � nous.
	};
	if  (Npc_GetTrueGuild (other) == GIL_NONE)
	||  (Npc_GetTrueGuild (other) == GIL_NOV)
	{	
		Cassia_Gildencheck = TRUE;
	};
	
	DG_gefunden = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Erz�hle mir mehr 
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
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//Nous rendons tout le monde nerveux en ville, mais nul ne sait o� se trouve notre cachette.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Les rares gens qui sont au courant de l'existence des �gouts pensent qu'ils sont ferm�s et totalement inaccessibles.
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
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //Pourquoi vous int�ressez-vous � cela ?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Je veux comprendre ce qui leur est arriv�.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Quand vous sortirez des �gouts, longez un moment la c�te � la nage vers la droite.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_04"); //Vous trouverez s�rement vos r�ponses l�...
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
	description = "Qu'est-ce que je gagne si je me joins � vous ?";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//Qu'est-ce que je gagne si je me joins � vous�?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//Nous pourrons vous enseigner nos comp�tences sp�ciales, �a vous permettra de vivre dans le luxe et l'opulence.
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_02");//Mais je ne serais pas oblig� de vivre cach� ici, si�?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_03");//(�clate de rire) Non, bien s�r. Il vous suffira juste d'ob�ir � nos r�gles.
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
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//Que pouvez-vous m'apprendre au juste�?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper est pass� ma�tre dans l'art de la discr�tion. Il vous montrera comment vous d�placer sans bruit.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ramirez est un cambrioleur de haut vol. Aucune serrure ne lui r�siste.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//Et moi, je peux vous enseigner l'art du vol � la tire.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Je vous apprendrai �galement � d�velopper votre agilit�, Une grande agilit� est essentielle � la bonne utilisation de nos comp�tences.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia peut m'apprendre le vol � la tire et peut m'aider � am�liorer ma dext�rit�.");
	B_LogEntry(Topic_CityTeacher,"Ramirez peut m'apprendre � crocheter les serrures.");
	B_LogEntry(Topic_CityTeacher,"Jesper peut m'apprendre la discr�tion.");
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
	description = "Quelles sont vos r�gles ?";
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
	AI_Output (other, self, "DIA_Cassia_Regeln_15_00");//Quelles sont vos r�gles�?
	//AI_Output (self, other, "DIA_Cassia_Regeln_16_01");//Wir richten uns nach drei Regeln.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_02");//La premi�re est simple�: vous ne devez parler de nous � personne, jamais.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_03");//Deuxi�mement, d�fense de se faire prendre.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Troisi�mement, si vous sortez votre arme ici dans le but d'attaquer quelqu'un, nous vous tuerons.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//Et enfin, ceux qui veulent se joindre � nous doivent commencer par faire leurs preuves.
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
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//Que se passera-t-il si je me fais attraper�?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Faites en sorte que cela n'arrive pas, d'accord�?
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
	description = "Comment suis-je suppos� faire mes preuves ?";
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
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//Comment suis-je cens� faire mes preuves�?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Vous voulez vous joindre � nous, oui ou non�?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Cet ent�t� de Constantino, l'alchimiste, poss�de un tr�s bel anneau.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Mais il n'en a pas vraiment besoin. En fait, il serait bien plus joli � mon doigt.
		
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
	description = "Tr�s bien, je marche.";
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
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//Excellent�! Nous allons vous donner la possibilit� de faire vos preuves. Et si vous voulez profiter de notre enseignement, pas de probl�me.
	
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
	description = "Et si je ne veux pas me joindre � vous� ?";
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
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//Et si je ne veux pas me joindre � vous�?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Vous laissez passer la chance de votre vie, mais vous �tes libre de partir.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//(s�rieuse) Par contre, ne songez m�me pas � nous trahir. Vous le regretteriez am�rement.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Tr�s bien, je marche.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Je dois y r�fl�chir.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//Dans ce cas, je vous tue.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Tr�s bien, je marche.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Eh bien, essayez donc de me tuer.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//D'accord, je suis partant.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//(sourit) Sage d�cision. Vous pourrez rejoindre nos rangs si vous parvenez � faire vos preuves.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Si vous voulez commencer par apprendre les comp�tences de voleur, pas de probl�me. Vous en aurez bien besoin.
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
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Il faut que j'y r�fl�chisse.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Faites. Je vous donne deux jours pour prendre votre d�cision. Pass� ce d�lai, vous ne serez plus le bienvenu ici.
	
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
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//Pouvez-vous me faire profiter de votre enseignement�?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Bien s�r. Faites-moi savoir quand vous serez pr�t.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Bien s�r. Les cours de vol � la tire vous co�teront 100 pi�ces d'or et ce sera le m�me tarif pour les exercices d'agilit�.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Peut-�tre plus tard... (RETOUR)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Je veux apprendre � crocheter des serrures (payer 100 pi�ces d'or).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Je veux am�liorer ma dext�rit� (payer 100 pi�ces d'or).",DIA_Cassia_BevorLernen_DEX);
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
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Je voudrais devenir plus agile. Voil� votre argent.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//Nous pouvons commencer d�s que vous serez pr�t.
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
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Je voudrais apprendre le vol � la tire. Voil� votre argent.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//Nous pouvons commencer d�s que vous serez pr�t.
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
	description = "Apprenez-moi � voler � la tire. (10 PA)";
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
	AI_Output (other, self, "DIA_Cassia_Pickpocket_15_00");//Montrez-moi comment pratiquer le vol � la tire.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET)
	{
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Si vous voulez faire les poches de quelqu'un, commencez par distraire votre proie, par exemple en lui parlant.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Dans le m�me temps, �valuez votre victime du regard et cherchez ses poches rembourr�es, ou encore ses �ventuels bijoux. Et surtout, voyez si vous avez affaire ou non � quelqu'un d'attentif.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Il est bien plus facile de voler un ivrogne qu'un marchand vigilant, vous vous en doutez.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Evidemment, si vous �tes trop maladroit, votre victime se doutera de quelque chose. Alors, d'abord et avant toute chose, gardez votre calme.
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
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//F�licitations�! Vous avez pass� avec succ�s votre �preuve d'initiation. Vous voil� des n�tres d�sormais.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//Prenez cette cl�. Elle ouvre la porte de l'h�tel. (sourit) De cette mani�re, vous n'aurez pas � nager � chaque fois.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//Sachez aussi que nous avons un signe de reconnaissance, un hochement de t�te bien sp�cifique.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//Exactement. Si vous faites ce signe en parlant � quelqu'un qui nous conna�t, votre interlocuteur saura que vous �tes des n�tres.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"J'ai �t� accept� au sein de la guilde des voleurs."); 
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
	description = "Alors o� cachez-vous votre butin ?";
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
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//O� cachez-vous votre butin�?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Allons... vous ne pensiez tout de m�me pas que j'allais vous r�pondre, si�?
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
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//Vous avez du travail pour moi�?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//Pas tant que vous serez recherch� par les autorit�s.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//R�glez cette affaire rapidement. Payez l'amende ou �liminez les t�moins, je ne veux pas le savoir, mais r�glez-moi �a.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//Oui. Il existe un total de six calices identiques.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//Autrefois, le roi Rhobar les avait rapport�s d'une longue campagne, co�teuse en vies humaines. C'est pour cette raison qu'on les nomme les calices de sang.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//Individuellement, ils ne valent pas grand-chose, mais les six r�unis ont une bien plus grande valeur.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//O� sont ces calices�?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Ils sont ici, en ville, entre les mains des riches marchands du haut quartier.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//Ramenez-les moi. De mon c�t�, je ferai en sorte de leur trouver un acheteur.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//Et qu'est-ce que j'ai � y gagner ?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//Au choix�: la moiti� du prix de la vente ou un objet de mon butin.
 		
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
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Beau travail. De mon c�t�, j'ai trouv� un acheteur.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//Vous pouvez prendre votre r�compense. Merci d'avoir fait cela pour moi.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//Je n'ai rien d'autre � vous proposer. Mais je peux vous donner des le�ons, si vous voulez. Et puis, il y a des tas de choses qui attendent juste qu'on aille les prendre sur cette �le... (sourit)
		    
		
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
	description = "Je viens r�cup�rer ma r�compense.";
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
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//Je viens chercher ma r�compense.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//Que choisissez-vous�?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 pi�ces d'or.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice (DIA_Cassia_Belohnung,"4 �lixirs de soin",DIA_Cassia_Belohnung_Trank);
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
