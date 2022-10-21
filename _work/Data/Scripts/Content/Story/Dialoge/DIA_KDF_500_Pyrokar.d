///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pyrokar_EXIT   (C_INFO)
{
	npc         = KDF_500_Pyrokar;
	nr          = 999;
	condition   = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  2;
	condition	 = 	DIA_Pyrokar_WELCOME_Condition;
	information	 = 	DIA_Pyrokar_WELCOME_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_WELCOME_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //Ainsi vous êtes le nouveau novice. Je présume que père Parlan vous a déjà confié une tâche ?
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(légèrement réprobateur) Vous savez que chaque membre de la communauté du feu doit accomplir ses tâches selon la volonté d'Innos
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Hagen_Condition;
	information	 = 	DIA_Pyrokar_Hagen_Info;
	permanent	 =  FALSE;
	description	 =  "Je dois parler aux paladins. C'est urgent.";
};
func int DIA_Pyrokar_Hagen_Condition ()
{	
	if (other.guild  == GIL_NOV) //muss kommen
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //Je dois parler aux paladins. C'est urgent.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //Et allez-vous nous dire pourquoi vous voulez leur parler ?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //J'ai un message important à leur remettre.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //Et de quel message s'agit-il ?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //Une armée maléfique se rassemble dans la Vallée des mines. Elle est menée par des dragons ! Nous devons l'arrêter tant que nous le pouvons encore.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Hum. Nous allons réfléchir à vos propos, novice. Quand le temps sera venu, nous vous ferons connaître notre décision.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Pendant ce temps, vous feriez mieux de vous acquitter de vos tâches de novice.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //Eh bien, nous ne voudrions pas vous distraire plus longtemps de votre travail. Vous pouvez partir.
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Auge_Condition;
	information	 = 	DIA_Pyrokar_Auge_Info;
	permanent	 =  FALSE;
	description	 =  "Je recherche l'Œil d'Innos.";
};
func int DIA_Pyrokar_Auge_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Auge_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //Je cherche l'Œil d'Innos.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Quiconque pense qu'il peut non seulement trouver l'amulette sacrée, mais aussi la porter n'est qu'un fou.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //L'amulette choisit son porteur. Nul autre que celui à qui elle est destinée ne peut la porter.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Je veux bien essayer.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Un novice doit montrer de l'humilité, non du désir.
	
 	B_LogEntry (TOPIC_INNOSEYE, "Je ne pensais pas que ce serait aussi difficile mais Pyrokar refuse de donner l'Œil volontairement et sans l'aide des paladins.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //Eh bien, nous ne voulons pas vous distraire plus longtemps de votre travail. Vous pouvez disposer.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Pyrokar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Pyrokar_MissingPeople_Info;

	description	 = 	"Des citoyens de Khorinis ont mystérieusement disparu.";
};
func int DIA_Addon_Pyrokar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Pyrokar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Des citoyens de Khorinis ont mystérieusement disparu.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //Cela je le sais bien et je trouve cela regrettable mais nous nous sommes mis d'accord avec les Mages de l'eau pour qu'ils s'occupent de cette affaire.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //Il en est de même des mystérieux séismes dans le nord-est de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Pour l'instant, je n'ai pas reçu de notification indiquant que notre intervention était requise. Nous n'allons donc pas intervenir dans cette affaire.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Oui, mais
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //Il n'y a pas de mais ! Nous allons procéder comme nous l'entendons et j'espère que vous vous y tiendrez également.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Les Magiciens du feu déplorent la disparition des citoyens. Toutefois, ils disent que cette mission incombe aux Mages de l'eau. Je ne trouverai aucune aide dans ce monastère."); 

	if (other.guild  == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		AI_StopProcessInfos (self); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_GOAWAY_Condition;
	information	 = 	DIA_Pyrokar_GOAWAY_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_GOAWAY_Condition ()
{
	//ADDON>
	if (Npc_KnowsInfo (hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return FALSE;
		};
	//ADDON<

	if (Npc_IsInState (self, ZS_Talk)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Hagen)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(irrité) L'obéissance est une vertu qu'il vous faut encore apprendre. D'une manière ou d'une autre.
	
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 =  1;
	condition	 = 	DIA_Pyrokar_FIRE_Condition;
	information	 = 	DIA_Pyrokar_FIRE_Info;
	permanent	 =  FALSE;
	description	 = 	"Je veux passer l'Epreuve du feu.";
};
func int DIA_Pyrokar_FIRE_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild  == GIL_NOV)
	&&  Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_FIRE_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Je veux passer l'Epreuve du feu.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(surpris) Ainsi vous savez... Vous voulez passer l'Epreuve du feu ?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Oui, je me réfère à la Loi du feu qui dit...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(il l'interrompt brusquement) Nous connaissons la Loi du feu. Nous avons également vu de nombreux novices mourir au cours de l'épreuve. Vous devez réfléchir à votre décision.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //J'ai réfléchi. Je veux passer l'épreuve et je vais la passer.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(avertissement) Si votre décision est prise, alors le Haut Conseil vous soumettra à l'Epreuve.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //J'insiste pour être soumis à l'Epreuve du feu.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //Dans ce cas, qu'il en soit ainsi. Quand vous serez prêt, chaque magicien du Haut Conseil vous confiera une mission que vous devrez accomplir.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Qu'Innos ait pitié de votre âme.
	
	B_LogEntry (TOPIC_FireContest,"J'ai réclamé à Pyrokar l'Epreuve du feu. Je dois réussir les trois tests du Haut Conseil.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_TEST_Condition;
	information	 = 	DIA_Pyrokar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Maître, je suis prêt à passer votre test.";
};
func int DIA_Pyrokar_TEST_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Je suis prêt à surmonter votre épreuve, maître.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //Et seul Innos sait si vous la réussirez. Vous devrez subir le même test que tout les autres novices qui ont été élus.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //Le Test de magie. (distant) Vous savez probablement qu'un SEUL novice peut réussir le test.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //Je vois. Qui sont mes rivaux ?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //Dans sa grande sagesse, Innos a choisi trois novices qui devront eux aussi passer les épreuves. Agon, Igaraz et Ulf. Ils ont déjà commencé leurs recherches.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(brusque) Mais assez ! Ecoutez ce que l'on attend de vous : 'Suivez les signes d'Innos et amenez-nous ce que le croyant trouve au bout du chemin.'
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Vous aurez besoin de cette clef.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //C'est tout ce que nous avons à vous dire.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar prépare le Test de la magie à mon intention. C'est le même que celui des novices Ulf, Igaraz et Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Je dois suivre les signes d'Innos et 'ramener ce que le croyant découvre sur son chemin.' Il m'a également donné une clef.");
	
	CreateInvItems (self,ItKe_MagicChest,1);
	B_GiveInvItems (self,other,ItKe_MagicChest,1);
	
	//------------Igaraz klar machen------------------- 
	B_StartOtherRoutine (Igaraz,"CONTEST");
	AI_Teleport (Igaraz,"NW_TAVERNE_BIGFARM_05");	
	CreateInvItems (Igaraz, ItKe_MagicChest,1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;
	
	//---------Smalltalk Partner herbeirufen 
	B_StartOtherRoutine (NOV607,"EXCHANGE");
	
	//------------Agon klar machen-------------------
	B_StartOtherRoutine (Agon,"GOLEMDEAD");
	AI_Teleport (Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems (Agon, ItKe_MagicChest,1);		
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	//------------Ulf klar machen-------------------
	B_StartOtherRoutine (Ulf,"SUCHE");
	AI_Teleport (Ulf,"NW_TROLLAREA_PATH_42");	
	CreateInvItems (Ulf, ItKe_MagicChest,1);	
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	//-------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	20;
	condition	 = 	DIA_Pyrokar_RUNNING_Condition;
	information	 = 	DIA_Pyrokar_RUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Pyrokar_RUNNING_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&&  Npc_IsInState (self, ZS_Talk) 
	&& (other.guild  == GIL_NOV)
	&& (Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_RUNNING_Info ()
{
	var int randomizer;
	randomizer = Hlp_Random (3); 
	
	if  (randomizer == 0)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Tant que vous n'aurez pas terminé l'épreuve, nous ne vous dirons plus rien.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //Qu'attendez-vous ? Allez et passez ce test !
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Il est temps de passer des paroles aux actes. Ne pensez-vous pas, novice ?
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SUCCESS_Condition;
	information	 = 	DIA_Pyrokar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"J'ai trouvé la pierre runique.";
};
func int DIA_Pyrokar_SUCCESS_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild  == GIL_NOV)
	&& (!Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	&& (( Npc_HasItems (other,itmi_runeblank) >= 1)
	|| ( Npc_HasItems (other,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SUCCESS_Info ()
{
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //J'ai trouvé le pierre runique.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(incrédule) Vous... avez réussi ?! Vous avez suivi les signes et vous avez découvert le portail caché...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //… et vaincu ces monstres qui voulaient faire de moi leur déjeuner.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //Et les autres novices alors ? Qu'en est-il d'Agon ? N'ont-ils pas réussi avant vous ?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Ils ont échoué. Je suppose qu'ils n'étaient pas destinés à réussir le test.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Bien, nous déclarons donc que vous avez passé ce test. La pierre runique est désormais à vous.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Prüfung erfolgreich und die anderen noch nicht. 
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Todo_Condition;
	information	 = 	DIA_Pyrokar_Todo_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Pyrokar_Todo_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (other.guild  == GIL_NOV)
	&& ((MIS_RUNE  != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)) 

	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Todo_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Vous avez réussi mon épreuve.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Mais...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //… il vous faut encore triompher du test d'Ulthar.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //… il vous faut encore surmonter l'épreuve de Serpentes.
	};
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	3;
	condition	 = 	DIA_Pyrokar_MAGICAN_Condition;
	information	 = 	DIA_Pyrokar_MAGICAN_Info;
	permanent	 =  FALSE;
	description	 = 	"Serai-je désormais accepté au sein de la guilde des magiciens ?";
};

func int DIA_Pyrokar_MAGICAN_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE  		  == LOG_SUCCESS)
	&& (MIS_GOLEM 		  == LOG_SUCCESS)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_MAGICAN_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //Serai-je désormais accepté au sein de la guilde des magiciens maintenant ?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Vous avez réussi. Vous avez triomphé de l'Epreuve du feu. Nous étions certains que vous réussiriez.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(insistant) Comme nous sommes également certains que vous ferez de votre mieux pour devenir un fidèle serviteur d'Innos.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Aussi, si vous êtes prêt à prononcer le Serment du feu, vous serez accepté parmi nous en tant que magicien.
	
};
///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	1;
	condition	 = 	DIA_Pyrokar_OATH_Condition;
	information	 = 	DIA_Pyrokar_OATH_Info;
	permanent 	 =  FALSE;
	description	 = 	"Je suis prêt à entrer dans le Cercle du feu.";
};
func int DIA_Pyrokar_OATH_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_OATH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Je suis prêt à m'engager dans le Cercle du feu.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Très bien. Alors prononcez le Serment sacré du feu.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(solennel) Jurez-vous, devant le Seigneur Innos le Tout-puissant, ses serviteurs et la Flamme Sanctifiée...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //.. Qu'à partir de ce jour et à jamais, votre vie ne fera plus qu'un avec le feu...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //… jusqu'à ce que votre corps et votre âme trouvent le repos dans ses halls sacrés et que la flamme de votre vie s'éteigne ?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Je le jure.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //En prononçant ce serment, vous avez signé un pacte avec le feu.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Portez cette robe en gage de ce lien éternel.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//fürs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Maintenant que vous avez été accepté parmi nous, vous pouvez parler au seigneur Hagen, le commandant suprême des paladins.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Nous serions également très intéressés de connaître son sentiment sur la situation. Vous êtes désormais libre de vous rendre à Khorinis.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Nous attendons de vous que vous nous communiquiez sa réponse dans les plus brefs délais.
};
///////////////////////////////////////////////////////////////////////
//	Info  Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Lernen_Condition;
	information	 = 	DIA_Pyrokar_Lernen_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Que puis-je apprendre désormais ?";
};
func int DIA_Pyrokar_Lernen_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Lernen_Info ()
{
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Que puis-je apprendre maintenant ?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Tout d'abord, vous êtes désormais autorisé à apprendre les Cercles de magie. Cela vous donnera le pouvoir d'utiliser les runes.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //En progressant dans les Cercles de magie, vous apprendrez à utiliser des sorts de plus en plus puissants.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Vous pouvez apprendre les formules auprès des frères du monastère. Chacun d'eux est spécialisé dans un certain domaine qu'il vous enseignera.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Karras, par exemple, est le maître des invocations et des convocations et Hyglas peut vous apprendre la magie du feu.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Personne ne connaît plus de choses que Marduk dans le domaine de la magie des glaces et du tonnerre. Parlan peut vous apprendre diverses incantations et il vous initiera au 1er Cercle.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Mais chacun d'eux ne vous apprendra que les formules. Les runes, vous devrez les créer vous-même.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"Père Parlan me nommera membre du 1er Cercle de magie.");
	
	B_LogEntry (Topic_KlosterTeacher,"Frère Karras enseigne des formules de convocation et d'appel.");
	B_LogEntry (Topic_KlosterTeacher,"Frère Hyglas peut m'enseigner les secrets du feu.");
	B_LogEntry (Topic_KlosterTeacher,"Frère Marduk peut m'enseigner les pouvoirs de la glace et du tonnerre.");
	B_LogEntry (Topic_KlosterTeacher,"Père Parlan peut m'enseigner diverses formules.");
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Wunsch_Condition;
	information	 = 	DIA_Pyrokar_Wunsch_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"J'aimerais exprimer un souhait...";
};
func int DIA_Pyrokar_Wunsch_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Wunsch_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //J'aimerais exprimer un souhait...
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Après son admission, un magicien peut choisir son premier acte.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Alors, quelle sera votre première décision en tant que magicien ?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Aucun.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Que Babo devienne le nouveau jardinier du monastère.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Qu'Opolos puisse avoir accès à la bibliothèque.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Que Dyrian puisse rester au monastère.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Aucune.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(ébahi) Qu'il en soit ainsi. Le nouveau magicien renonce à sa décision.
	
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	
	
};

FUNC VOID DIA_Pyrokar_Wunsch_Dyrian ()
{
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //Que le novice Dyrian reste au monastère.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Qu'il en soit ainsi.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Le novice pourra rester au monastère et il sera affecté au poste de jardinier qui est désormais vacant.
	
	B_GivePlayerXP (XP_HelpDyrian);
	
	B_StartOtherRoutine (Dyrian,"FAVOUR");
	
	MIS_HelpDyrian = LOG_SUCCESS;
	
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Babo ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //Que le novice Babo soit responsable des jardins du monastère.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Qu'il en soit ainsi.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //A partir de maintenant, le novice Babo sera chargé de l'entretien des jardins du monastère.
	
	B_GivePlayerXP (XP_HelpBabo);
	
	B_StartOtherRoutine (Babo,"FAVOUR");
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	MIS_HelpBabo = LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Opolos ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //Que le novice Opolos puisse avoir accès à la bibliothèque.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Qu'il en soit ainsi.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //Désormais, le novice Opolos pourra étudier les textes d'Innos.
	
	B_GivePlayerXP (XP_HelpOpolos);
	
	B_StartOtherRoutine (Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	
	MIS_HelpOpolos 	= LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};
///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Nachricht_Condition;
	information	 = 	DIA_Pyrokar_Nachricht_Info;
	permanent	 =  FALSE;
	description	 = 	"J'ai des nouvelles du seigneur Hagen...";
};
func int DIA_Pyrokar_Nachricht_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Nachricht_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //J'apporte des nouvelles du seigneur Hagen. Il veut la preuve de la présence des dragons et de l'armée du mal.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //J'irai donc dans la Vallée des mines et je lui obtiendrai cette preuve.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Bien. Vous obéirez donc à cet ordre. Le paladin Sergio vous escortera jusqu'au col.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Qu'Innos vous protège.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Alors je me suis directement rendu dans la Vallée des mines.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Bien. Puisque vous savez déjà comment vous rendre dans la vallée, vous n'aurez pas besoin d'escorte.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Occupez-vous de cette affaire pour le seigneur Hagen. Qu'Innos vous protège.
	};

};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	4;
	condition	 = 	DIA_Pyrokar_TEACH_Condition;
	information	 = 	DIA_Pyrokar_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Enseignez-moi le dernier Cercle de magie.";
};
func int DIA_Pyrokar_TEACH_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5) 
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Apprenez-moi le dernier Cercle de magie.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Enormément de temps s'est écoulé depuis que vous vous êtes lié au feu. Il s'est passé beaucoup de choses et nous n'avons pas connu le repos.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Vous êtes l'Elu d'Innos. Il vous faudra donc pouvoir compter sur toutes vos forces pour surmonter les épreuves qui vous attendent.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Je vais maintenant vous consacrer Elu d'Innos. Vous entrez dans le 6ème Cercle. Puissiez-vous apporter la lumière et disperser les ténèbres.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Vous pouvez désormais apprendre les formules magiques du dernier cercle si vous le souhaitez.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Oh ! Encore une chose. Il m'a fallu du temps pour vous reconnaître.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Vous aviez cette lettre quand ils vous ont jeté à travers la Barrière.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Oui, vous m'avez ainsi permis d'échapper aux élucubrations du juge.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //Et vous êtes l'Elu d'Innos.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //Recevez ma bénédiction, Elu !
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innos, lumière du soleil et feu du monde, bénis cet homme que tu as choisi.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Donne-lui la force, le courage et la sagesse de suivre la voie que tu lui as tracée.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Le temps pour ceci n'est pas encore venu. Une fois que vous aurez suivi encore un peu la voie qu'Innos vous a indiquée, je vous l'enseignerai.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SPELLS_Condition;
	information	 = 	DIA_Pyrokar_SPELLS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Instruisez-moi (création des runes)";
};
func int DIA_Pyrokar_SPELLS_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SPELLS_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Apprenez-moi.
	
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
	Info_AddChoice		(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //Je ne peux rien vous apprendre d'autre.
	};
};
FUNC VOID DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
};
FUNC VOID DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};
///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_Parlan_Condition;
	information	 = 	DIA_Pyrokar_Parlan_Info;
	permanent	 = 	FALSE;
	description	 = 	"Parlan m'envoie...";
};
func int DIA_Pyrokar_Parlan_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Parlan_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Je suis envoyé par Parlan. Je veux augmenter mon pouvoir magique.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Vous avez beaucoup appris et vous êtes devenu puissant. A partir de maintenant, je serai votre instructeur.
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_TEACH_MANA_Condition;
	information	 = 	DIA_Pyrokar_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux augmenter mon pouvoir magique.";
};
func int DIA_Pyrokar_TEACH_MANA_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo (hero,DIA_Pyrokar_Parlan)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Je veux augmenter mon pouvoir magique.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Je sens que la magie circule en vous. Même moi, je ne peux vous montrer comment augmenter votre pouvoir.
	};
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	900;
	condition	 = 	DIA_Pyrokar_PERM_Condition;
	information	 = 	DIA_Pyrokar_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"(Bénédiction)";
};
func int DIA_Pyrokar_PERM_Condition ()
{	
	if (Kapitel >= 2)	
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Bénissez-moi, maître.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //Et une petite bénédiction ? J'en aurai certainement besoin.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Puissiez-vous triompher au cours de l'affrontement final contre notre ennemi héréditaire. Qu'Innos soit avec vous.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Qu'Innos vous protège du mal sur les chemins ténébreux que vous devrez emprunter.
			};
};

//##############################################################
//##
//##
//##							KAPITEL 3
//##
//##
//##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP3_EXIT_Condition;
	information	= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BACKFROMOW_Condition;
	information	 = 	DIA_Pyrokar_BACKFROMOW_Info;

	description	 = 	"Je reviens de la vieille Vallée des mines.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //Je reviens de la vieille Vallée des mines.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //Qu'avez-vous à nous dire ?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //L'ennemi rassemble là-bas une armée d'orques et de dragons.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //Milten nous l'a déjà dit. Mais qu'en est-il du chargement de minerai du roi ?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //Les mines qu'ils exploitent pour Garond dans la vallée ne peuvent répondre à la demande du roi.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Les jours s'assombrissent et la lumière du soleil s'affaiblit.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //J'ai été attaqué par des hommes en robe noire.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Je sais. Ce sont les Traqueurs. Des serviteurs du royaume de Béliar. Méfiez-vous d'eux, ils essaieront de vous posséder.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Une fois possédé, vous ne serez plus vous-même. Ce n'est qu'au monastère que l'on pourra alors vous aider. Alors prudence.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar m'a parlé des Traqueurs, des hommes en robe noire qui sont les serviteurs de Béliar. Il m'a averti qu'ils pouvaient posséder les gens. Si cela m'arrive, je dois revenir directement au monastère."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //J'ai demandé à Karras de se renseigner sur ce sujet. Il devrait rapidement découvrir de nouveaux éléments qui nous permettront d'y voir plus clair.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar a donné l'ordre à Karras de s'occuper de la menace représentée par les Traqueurs."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Tenez, cette rune vous ramènera directement au monastère si vous avez besoin de notre aide.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Rappelez-vous bien qu'il nous faut résister ou nous serons tous condamnés.

};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	31;
	condition	 = 	DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_GIVEINNOSEYE_Info;

	description	 = 	"Je viens prendre l'Œil d'Innos.";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //Je suis ici pour prendre l'Œil d'Innos.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Je vois que vous avez l'autorisation du seigneur Hagen de porter l'Œil d'Innos.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Je crains de devoir vous décevoir. Nous avons été les victimes d'une traîtrise ourdie par l'ennemi.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //L'Œil d'Innos a été arraché de ces halls sacrés.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Qui pourrait se montrer aussi insolent, maître ?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Qui a fait ça ?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //Qui peut avoir été aussi impudent, maître ?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //Qui a fait ça ?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Le Mal est rusé et agit en secret. Il est rare que ses machinations soient dévoilées au grand jour.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Mais ces derniers temps, c'est une autre histoire. L'ennemi se montre en pleine rue, dans chaque maison et dans chaque jardin public.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //Cela signifie qu'il ne craint plus aucun adversaire et que rien ne peut le faire reculer.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //L'un de nos fidèles, un candidat à la robe de Magicien du feu, nous a trahis de manière inattendue et particulièrement vile. Pedro.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //L'ennemi a pris possession de lui et nous a ainsi infligé une terrible défaite.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro s'est frayé un passage dans nos halls les plus sacrés et a volé l'Œil.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Je crains qu'il n'ait passé trop de temps seul, hors des murs protecteurs du monastère et qu'il ait été exposé aux dangers qui le guettaient.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschuß freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist für den SC nun als Traitor bekannt. Muß hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "Fantastique. J'aurais dû le savoir. J'arrive trop tard, ces imbéciles du monastère ont laissé un novice leur voler l'Œil. Il ne me reste plus qu'à courir après ce traître de Pedro en espérant qu'il ne l'a pas vendu à quelqu'un.");
 	B_LogEntry (TOPIC_TraitorPedro, "Le traître Pedro a volé l'Œil d'Innos au monastère. Je crois que les Magiciens du feu seraient contents de mettre la main sur lui.");
};



///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	34;
	
	condition	 = 	DIA_Pyrokar_NOVIZENCHASE_Condition;
	information	 = 	DIA_Pyrokar_NOVIZENCHASE_Info;

	description	 = 	"Où a fui le voleur ?";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition ()
{
	if (Kapitel == 3)
	   && (Pedro_Traitor == TRUE)	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //Où le voleur a-t-il fui ?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro a neutralisé les autres novices qui tentaient de l'arrêter et il a disparu dans la brume matinale.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //De nombreux novices se sont lancés à sa poursuite pour ramener l'Œil.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Si vous voulez les rattraper, vous devez vous dépêcher avant que Pedro ne soit hors d'atteinte.

	MIS_NovizenChase = LOG_RUNNING;	
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	35;
	condition	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Info;

	description	 = 	"J'ai retrouvé l'Œil d'Innos.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition ()
{
	if (Kapitel == 3)
		&& 	(MIS_NovizenChase == LOG_RUNNING)
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //J'ai retrouvé l'Œil d'Innos. Il est brisé.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Mais... cela ne se peut. Que s'est-il passé ?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Il a été entre les mains de gens vraiment peu recommandables. Quoi qu'il en soit je suis arrivé trop tard.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Ils psalmodiaient une étrange incantation sur un site rituel en forme de croissant, dans la forêt.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Qu'Innos nous protège. Ils ont profané le Cercle du soleil.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Même dans mes pires cauchemars, je n'aurais jamais imaginé qu'ils disposent d'une telle puissance.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Que faisons-nous maintenant ?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Que pouvons-nous faire maintenant ?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //L'ennemi est devenu très fort. Mais cet ancien artefact est encore une menace pour lui.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Nous devons restaurer l'Œil et lui rendre son ancienne puissance. Mais le temps joue contre nous.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Je n'ose imaginer ce qu'il va advenir de nous. Sans la protection de l'Œil nous sommes à la merci de l'ennemi.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Allez en ville, voir Vatras le mage des eaux. Lui seul saura ce qu'il convient de faire. Apportez-lui l'Œil et dépêchez-vous.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Pourquoi Vatras ?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Qu'est-ce que le Cercle du soleil ?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar veut que j’aille en ville demander à Vatras, le Magicien des eaux, un conseil pour savoir quoi faire de l'Œil endommagé.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Pourquoi Vatras ?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Le fait que vous portiez la robe ne vous autorise pas à remettre mes ordres en question, frère.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras est un serviteur d'Adanos. Le savoir des magiciens des eaux nous apportera la lumière en ces heures sombres.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //C'est tout ce que vous avez besoin de savoir.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Qu'est-ce que le Cercle du soleil ?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Chaque année, tous les magiciens et les novices du monastère se rendent à cet endroit à l'époque du solstice pour symboliser le début d'un nouveau cycle.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //Cet endroit regorge du pouvoir sans limite du soleil.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //Je n'aurais jamais imaginé que ce pouvoir puisse être corrompu. Et c'est pourtant ce qui s'est passé.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter ()
{
		Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
};


///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information	 = 	DIA_Pyrokar_SPOKETOVATRAS_Info;

	description	 = 	"J'ai parlé à Vatras.";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //J'ai parlé à Vatras.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Ah ! Bien ! Où est-il ?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Il prépare un rituel au Cercle du soleil pour restaurer l'Œil.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Si cela est vrai, il reste peut-être encore de l'espoir.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras voudrait que Xardas et vous-même l'aidiez.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //QUOI ? Xardas sera là aussi ? Vous n'êtes pas sérieux.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Eh ! Je n'y suis pour rien. Vatras a insisté.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Toujours et encore ce Xardas. Je suis las. Les choses ne sauraient être pires.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Comment puis-je savoir que Xardas n'est pas de mèche avec l'ennemi ?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Je ne peux me fier à Xardas, même si on a terriblement besoin de lui.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Je regrette mais je ne peux accorder mon aide à Vatras dans ces circonstances.
	B_GivePlayerXP (XP_Ambient);


};


///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Info;

	description	 = 	"Cela ne peut être fait sans vous...";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Cela ne peut être fait sans vous. Vatras ne pourra accomplir le rituel.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Vous allez devoir faire confiance à Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Je n'ai rien à devoir faire, vous m'entendez ? Je n'ai pas la moindre preuve que Xardas ne travaille pas contre nous. Je ne peux faire ça.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //Et si je vous apporte une preuve ?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Je crains que cela soit impossible. Il faudrait vraiment que ça m'impressionne.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //Et en ce qui concerne Xardas, je doute qu'il puisse encore m'impressionner.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar tremble à la moindre évocation de Xardas. Je vais devoir discuter avec Xardas pour savoir comment le faire venir au rituel du Cercle du soleil.");
	
	Pyrokar_DeniesInnosEyeRitual = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BUCHZURUECK_Condition;
	information	 = 	DIA_Pyrokar_BUCHZURUECK_Info;

	description	 = 	"J'ai apporté ce livre de Xardas.";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition ()
{
	if (Npc_HasItems (other,ItWr_XardasBookForPyrokar_Mis))
		 && (Kapitel == 3)
		 {
				return TRUE;
		 };
};

func void DIA_Pyrokar_BUCHZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //Je vous apporte ce livre de Xardas.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //C'est un gage de sa confiance.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Montrez-le moi.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(ébahi) Mais c'est incroyable. Avez-vous la moindre idée de ce que vous venez de me donner ?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Hum. Non.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(irrité) C'est un ancien grimoire, disparu depuis longtemps.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Nous pensions tous qu'il était perdu à tout jamais et voilà que j'apprends que Xardas savait ce qu'il était advenu de lui.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Alors, participerez-vous au rituel ?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Oui, je vais me rendre au Cercle du soleil mais certainement pas parce que je suis convaincu des bonnes intentions de Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //En fait, je vais demander à ce chacal de m'expliquer où il a pu cacher ce livre pendant tant d'années. Cette fois-ci, il est vraiment allé trop loin.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Je vous verrai au Cercle du soleil.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar a finalement accepté de venir au Cercle du soleil.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_PRERITUAL_Condition;
	information	 = 	DIA_Pyrokar_PRERITUAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pensez-vous pouvoir réparer l'Œil une nouvelle fois ?";
};

func int DIA_Pyrokar_PRERITUAL_Condition ()
{
		if (Pyrokar_GoesToRitualInnosEye == TRUE)
			&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
			&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_PRERITUAL_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //Pensez-vous pouvoir encore restaurer l'Œil ?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //Difficile à dire. Nous n'avons plus qu'à attendre et à voir.
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_AUGEGEHEILT_Condition;
	information	 = 	DIA_Pyrokar_AUGEGEHEILT_Info;

	description	 = 	"Vous avez réussi. L'Œil d'Innos est guéri.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Pyrokar_AUGEGEHEILT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Vous avez réussi. L'Œil d'Innos est restauré.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Jamais je n'aurais cru que ce soit possible.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Oui, maître.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Vous avez prouvé à maintes reprises que vous êtes digne du Haut Conseil des Magiciens du feu.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //Vous êtes aujourd'hui membre de ce conseil et vous représenterez notre ordre dans le monde. Désormais vous êtes un des hauts Magiciens du feu.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Portez la robe correspondant à votre rang avec dignité et faites honneur à l'ordre, mon frère.
		
			CreateInvItem	(hero, ITAR_KDF_H);
			AI_EquipArmor	(hero, ITAR_KDF_H);	
			
			heroGIL_KDF2 = TRUE;
		};	
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_KAP3_READY_Condition;
	information	 = 	DIA_Pyrokar_KAP3_READY_Info;

	description	 = 	"Que reste-t-il à faire ici ?";
};

func int DIA_Pyrokar_KAP3_READY_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_KAP3_READY_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Que me reste-t-il à faire ici ?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Ne gaspillez pas votre temps avec des choses triviales. Allez et triomphez des dragons. Tenez, prenez l'Œil.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Souvenez-vous bien que vous devez d'abord parler à un dragon avant de pouvoir l'attaquer.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fügt ihnen auch unerträgliche Schmerzen zu, wenn du es bei dir trägst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Le pouvoir de l'Œil forcera le dragon à vous parler et à vous dire la vérité.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //De plus, quand vous le portez, il vous confère une protection contre leurs attaques.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Cependant, son pouvoir ne dure pas. Il vous faudra lui redonner de l'énergie magique.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Pour cela, vous avez besoin de l'essence d'un cœur de dragon que vous devrez mêler à l'Œil dans un laboratoire d'alchimie.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Alors seulement vous pourrez affronter un autre dragon.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Merci. Je m'en souviendrai.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Vous avez désormais tout ce dont vous avez besoin. Alors, allez-y. Vous n'avez plus beaucoup de temps.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Je suis désormais prêt à me mesurer aux dragons. L'Œil d'Innos m'aidera à les anéantir. Je ne dois pas oublier de le porter lorsque je combattrai ces monstres... Je dois parler aux dragons avant d'avoir la moindre chance de les vaincre. Hélas, la puissance de l'Œil s'estompe à chaque fois que je parle à l'un d'eux. Avant de pouvoir me confronter à un autre dragon, il me faut trouver le coeur d'un dragon et une fiole de laboratoire vide, puis unir la pierre affaiblie de l'amulette et l'extrait d'un cœur de dragon dans un laboratoire d'alchimie."); 

	MIS_ReadyforChapter4 = TRUE; //Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck (NEWWORLD_ZEN);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	39;
	condition	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Info;

	description	 = 	"J'ai découvert un étrange almanach.";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))		
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //J'ai trouvé un étrange almanach.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //Vraiment ? De quel genre d'almanach s'agit-il ?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Je n'en suis pas sûr. Je pensais que vous sauriez quoi en faire.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //En vérité, c'est vraiment très troublant. Je suis heureux que vous me l'ayez apporté. Vous avez fait preuve de sagesse.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Je présume qu'il y en a d'autres. Allez et trouvez tous ces livres maudits.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Je pense qu'il s'agit d'un instrument servant le pouvoir des Traqueurs.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Ils l'utilisent pour contrôler les âmes perdues de leurs victimes.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Ils y inscrivent les noms de ceux qu'ils comptent posséder.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Ecoutez. Je vous confie cette lettre magique. Elle vous permettra de lire les noms qui sont inscrits dans ces livres.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Trouvez ces victimes et apportez-moi leur livre. Je pourrai alors m'en occuper.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Mais d'abord, vous devriez en montrer un à Karras. Peut-être que cela l'aidera dans ses recherches.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //Ne faites pas l'erreur d'essayer de les détruire vous-même. Vous n'êtes pas encore prêt à résister à leur pouvoir.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar veut neutraliser l’Almanach des Possédés. Il m'a donné la liste de tous ceux que veulent posséder les Traqueurs. La liste peut s'allonger."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Ne vous approchez pas trop des Traqueurs ou ils prendront possession de vous.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Si vous ne pouvez résister à leur appel, revenez me voir aussi vite que possible.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //Ce n'est que dans le monastère que votre âme pourra être sauvée.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //N'y a-t-il aucune protection contre leurs assauts psychiques ?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //C'est possible. Il se peut que Karras sache quelque chose à ce sujet.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"Karras est censé m'aider à trouver une protection contre les attaques mentales des Traqueurs."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	70;
	condition	 = 	DIA_Pyrokar_SCOBSESSED_Condition;
	information	 = 	DIA_Pyrokar_SCOBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Guérison de la possession)";
};

func int DIA_Pyrokar_SCOBSESSED_Condition ()
{
	if (SC_IsObsessed == TRUE)
		{
				return TRUE;
		};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info ()
{
	if ((Got_HealObsession_Day<=(Wld_GetDay()-2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems (other,ItPo_HealObsession_MIS) == FALSE)  
		{
			if (hero.guild == GIL_KDF)
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Guérissez-moi, maître, car je suis possédé.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //Qu'il en soit ainsi ! Prenez cette potion. Elle vous délivrera de vos cauchemars.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Que la grâce d'Innos vous apporte le salut..
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Agissez en son nom et méfiez-vous de l'œil maléfique de l'ennemi.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Mais soyez prévenu. Si vous vous exposez trop souvent à leur pouvoir, il n'y aura nulle rédemption pour vous. Souvenez-vous-en.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Je crois que je suis possédé. Pouvez-vous me soigner ?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //Pas sans un gage de votre respect pour ce monastère, mon fils. 300 pièces d'or.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "C'est trop cher.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Fantastique. Voici votre argent.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Mais vous venez juste d'avoir votre potion de soins. Inutile de revenir me voir tant que vous n'avez pas besoin de mon aide.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Fantastique. Voici l'argent.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Tenez, buvez ceci. Que la grâce d'Innos vous apporte le salut.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //Apportez-moi l'argent et je vous aiderai.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //C'est beaucoup trop.
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Pyrokar_AlmanachBringen_Condition;
	information	 = 	DIA_Pyrokar_AlmanachBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Je peux vous en dire plus sur ces possédés.";
};

func int DIA_Pyrokar_AlmanachBringen_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN))
		{
				return TRUE;
		};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Je peux vous en dire plus au sujet des possédés.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Parlez mon frère.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold für einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //J'ai trouvé un autre almanach.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //J'ai d'autres livres des Traqueurs pour vous.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //C'est bien. Cependant, je crains qu'il en reste d'autres à trouver. Continuez vos recherches.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Vous en avez déjà trouvé beaucoup. Mais je ne crois pas que nous les ayons tous.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Vous m'avez déjà amené beaucoup de livres de l'ennemi.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Je serais surpris s'ils en avaient encore beaucoup en circulation.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Prenez ceci. C'est un don du monastère qui vous aidera à affronter le mal.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //Et rappelez-vous de consulter ma lettre magique de temps en temps.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Il est possible qu'ils tentent de s'en prendre à d'autres personnes dont les noms n'apparaissent pas dans les almanachs.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE; 
	};
	AlmanachGeld	= (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems (self, ItMi_Gold, AlmanachGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, AlmanachGeld);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP4_EXIT_Condition;
	information	= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP5_EXIT_Condition;
	information	= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DRACHENTOT_Condition;
	information	 = 	DIA_Pyrokar_DRACHENTOT_Info;

	description	 = 	"Tous les dragons sont morts.";
};

func int DIA_Pyrokar_DRACHENTOT_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //Tous les dragons sont morts.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //C'est une bonne nouvelle. Mais cela ne change en rien notre situation qui semble désespérée.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Les Traqueurs ne sont pas encore partis. Bien au contraire. On me communique de plus en plus de rapports selon lesquels ils se seraient renforcés ces derniers jours.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Tuer les dragons est un terrible coup asséné à l'ennemi mais cela ne suffit pas. Nous devons détruire les racines du mal.

};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DERMEISTER_Condition;
	information	 = 	DIA_Pyrokar_DERMEISTER_Info;

	description	 = 	"J'ai parlé aux dragons.";
};

func int DIA_Pyrokar_DERMEISTER_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //J'ai parlé aux dragons.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //Qu'ont-ils dit ?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //Ils ne cessent de parler du pouvoir de leur maître et de son installation dans les Halls d'Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Qu'Innos soit avec nous. Le temple noir a regagné sa puissance et il nous envoie ses serviteurs.

};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_WASISTIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_WASISTIRDORATH_Info;

	description	 = 	"Qu'est-ce que c'est que ces Halls d'Irdorath ?";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //Que sont ces Halls d'Irdorath ?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //Le temple d'invocation de l'est du dieu Béliar. Il y en a quatre sur la terre de Myrtana. Mais celui-ci est probablement le plus redoutable.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Il y a environ 40 ans, les temples du nord et de l'ouest de cette horrible divinité furent détruits.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Les braves chevaliers de ce temps firent tout pour raser ces puissants édifices.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //A cette époque, les hordes noires de l'ennemi étaient impuissantes contre les courageux chevaliers et paladins, supérieurs en nombre.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Il aurait été aisé de détruire les deux autres temples et de débarrasser le monde de ce mal...
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //… mais, après la chute du second temple, les autres disparurent.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(moqueur) Disparus. Des temples entiers. Mouais.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Ne vous moquez pas de moi. La situation est sérieuse. Si les Halls d'Irdorath ont retrouvé leur puissance, il ne sera pas aisé de vaincre l'ennemi.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Pour ça, il vous faudra d'abord le trouver. Je crois que cela doit être votre prochaine tâche et certainement la plus difficile.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Nous verrons.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Selon Pyrokar, les Halls d'Irdorath sont un temple d'invocation perdu du dieu Béliar. Je dois trouver ce temple."); 

};


///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	54;
	condition	 = 	DIA_Pyrokar_BUCHIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_BUCHIRDORATH_Info;

	description	 = 	"Le livre de Xardas que l'on croyait perdu... Où est-il ?";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (ItWr_HallsofIrdorathIsOpen  == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //Le livre de Xardas que l'on croyait perdu... où est-il ?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Je m'attendais à ce que vous me posiez la question. Mais je crains que cela ne vous soit d'aucune utilité.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Il a été magiquement scellé. Je l'ai placé dans une de nos salles fortes. Nous avons tenté en vain de l'ouvrir.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Ce maudit Xardas nous a joué un sale tour.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //Puis-je voir le livre ?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Si vous le souhaitez. Je ne peux concevoir que vous réussissiez là où les plus grands maîtres du monastère ont échoué.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Mais allez-y et essayez. Talamon ne s'y opposera pas.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Le livre de Xardas, LES HALLS D'IRDORATH, se trouve dans les niveaux inférieurs du monastère. Il est gardé par Talamon. Les magiciens ne peuvent pas l'ouvrir. Il a été magiquement scellé et Xardas en serait le responsable."); 
	
	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Info;

	description	 = 	"J'ai réussi à ouvrir le livre de Xardas.";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition ()
{
	if (ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //J'ai réussi à ouvrir le livre de Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Quoi ? Comment avez-vous fait ? Il m'a presque conduit au désespoir.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas m'a dit comment faire.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Juste un coup de chance à mon avis.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Juste un coup de chance, je suppose.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Ne dites pas d'idioties. De la chance !
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Alors que je n'ai pas réussi à ouvrir le livre, vous y parvenez sans peine...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //… voilà qui me donne matière à réflexion.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Qu'importe. Puisqu'à l'évidence, vous êtes le seul à avoir pu ouvrir le livre, alors je vous accorde l'autorisation de le prendre. Tout au moins jusqu'à la fin de cette crise.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas m'a dit comment faire.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Ah ! C'est cela. Que c'est intéressant. J'espère simplement pour vous que la mauvaise influence de Xardas ne va pas déteindre sur vous.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Je vous avertis. Ne vous laissez pas berner par les tours de ce vieux diable. Vous pourriez le regretter.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;

	description	 = 	"Le livre parle d'une bibliothèque secrète.";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition ()
{
	if 	(ItWr_SCReadsHallsofIrdorath == TRUE)
		&& (Kapitel == 5)	
		&& (MIS_SCKnowsWayToIrdorath == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
			{
					return TRUE;
			};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //Le livre parle d'une bibliothèque secrète.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //De quoi parlez-vous ?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //Une bibliothèque sous ces murs. Est-ce que cela vous dit quelque chose ?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //Non. Où est censée se trouver cette bibliothèque déjà ?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Je vois. Vous n'en avez pas la moindre idée. Hum.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar ne sait rien au sujet d’une bibliothèque secrète. Il semble que seul Xardas y ait eu accès."); 

};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;

	description	 = 	"Je sais où trouver les Halls d'Irdorath.";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //Je sais où trouver les Halls d'Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Le temple est sur une île. J'ai trouvé une carte marine qui indique comment s'y rendre.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //Fantastique. Il va donc vous falloir un navire et un équipage pour que vous puissiez affronter l'ennemi.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Mais rappelez-vous que vous devez être bien préparé si vous voulez vaincre le Maître d'Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //Où puis-je trouver un équipage ?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Votre équipage doit être constitué de gens en qui vous avez confiance.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Parlez à vos amis et réfléchissez à qui pourrait s'avérer utile une fois que vous serez sur l'île.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Il vous faudra également un magicien. Mais hélas, je ne peux me passer d'une seule personne au monastère.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Vous devrez demander à un magicien qui ne travaille pas au monastère.

};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_SCWILLJORGEN_Condition;
	information	 = 	DIA_Pyrokar_SCWILLJORGEN_Info;

	description	 = 	"Jorgen est un marin expérimenté.";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&(Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen est un marin expérimenté. Il pourrait m'aider à atteindre l'île d'Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Je crains que cela ne soit pas aisé.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Il a signé pour travailler pour la confrérie. Il n'a toujours pas payé son tribut et ne nous a pas amené de mouton.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen doit d'abord terminer son travail et ensuite vous pourrez l'emmener avec vous.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Combien de temps cela prendra-t-il ?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Il a utilisé en un jour toutes les provisions qu'un novice aurait mis trois semaines à consommer.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Alors je ne peux pas le laisser partir avant qu'il n'ait travaillé dur dans nos jardins pendant encore trois mois.

};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_MACHDTFREI_Condition;
	information	 = 	DIA_Pyrokar_MACHDTFREI_Info;

	description	 = 	"Que puis-je faire pour que Jorgen vienne immédiatement avec moi ?";
};

func int DIA_Pyrokar_MACHDTFREI_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_MACHDTFREI_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //Que dois-je faire pour pouvoir emmener Jorgen avec moi MAINTENANT ?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Hum. Il y a en effet une chose que vous pouvez faire pour moi. Vos bons rapports avec Xardas pourront être utiles.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //J'ai appris que, au cours de ces derniers jours, d'étranges choses s'étaient passées dans sa tour.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Beaucoup de gens entendent des cris la nuit et voient d'étranges lueurs danser autour de la tour.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Comme si on n'avait pas d'autres chats à fouetter. Allez voir ce qui se passe là-bas et faites en sorte que cela s'arrête.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Alors vous pourrez avoir Jorgen.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"Il se passe d'étranges choses dans la tour de Xardas. Si je m'en occupe, je peux amener Jorgen avec moi.");
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_DTCLEARED_Condition;
	information	 = 	DIA_Pyrokar_DTCLEARED_Info;

	description	 = 	"L'affaire de la tour de Xardas s'est résolue d'elle-même.";
};

func int DIA_Pyrokar_DTCLEARED_Condition ()
{
	if (Npc_IsDead(Xardas_DT_Demon1)) 
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_DTCLEARED_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //Ce qui se passe dans la tour de Xardas s'est résolu tout seul.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Alors que se passait-il .. Non, attendez, je ne veux même pas le savoir.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Si vous voulez encore de Jorgen, allez-y et prenez-le pour votre voyage.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Qu'Innos vous protège.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

//---------------------------------
var int Pyro_Gives_Aura;
//---------------------------------
instance DIA_Pyrokar_AmulettofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_AmulettofDeath_Condition;
	information	 = 	DIA_Pyrokar_AmulettofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"La prophétie mentionne l'Aura sacrée d'Innos.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition ()
{
	if (PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //La prophétie mentionne l'Aura sacrée d'Innos.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //L'Aura d'Innos est une amulette que seuls les plus grands magiciens sont destinés à porter.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Puis-je l'avoir ?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Quelle sorte d'amulette est-ce ?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //Puis-je l'avoir ?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //Quoi ? Que voulez-vous en faire ?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Affronter les dragons.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Oui, naturellement. Je vais vous la donner mais prenez-en soin.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Oui, bien sûr.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Je n'aimerais pas avoir à la racheter à un marchand plus tard.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Utilisez-la avec sagesse et qu'Innos veille sur vous.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //De quelle sorte d'amulette s'agit-il ?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //On dit qu'Innos lui-même l'a forgée et qu'il l'a offerte à l'humanité.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Elle protège celui qui la porte de toutes formes de dégâts.
};


///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_PotionofDeath_Condition;
	information	 = 	DIA_Pyrokar_PotionofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Que sont les Larmes d'Innos ?";
};

func int DIA_Pyrokar_PotionofDeath_Condition ()
{
	if (Npc_HasItems (other,ItPo_PotionOfDeath_01_MIS))
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info ()
{
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //Que sont les Larmes d'Innos ?
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Les Larmes d'Innos ne sont rien d'autre qu'un vieux conte pour enfant. Il raconte comment a commencé l'affrontement entre Innos et Béliar, au début des temps.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Je vois.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"J'ai trouvé cette potion.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Je vois.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //J'ignore si vous êtes bien conscient de votre situation mais j'ai du mal à croire que notre ennemi puisse être vaincu par un conte pour enfant.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //J'ai trouvé cette potion.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //Cela ne se peut. Je n'arrive pas à y croire.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //Quel est le problème ?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Si ce sont vraiment les Larmes d'Innos, alors...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(il l'interrompt) Difficilement.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //Ne m'interrompez pas. Si ce sont vraiment les Larmes d'Innos, alors nous avons une puissante arme contre l'ennemi.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Alors, que sont les Larmes d'Innos ?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Que voulez-vous dire par 'arme' ?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //Alors que sont les Larmes d'Innos ?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Quand Innos s'est rendu compte qu'il devait affronter Béliar, son propre frère, pour sauver la création, il en éprouva un grand chagrin.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Il se mit à pleurer et ses larmes tombèrent sur le monde. Il y en eut beaucoup car il pleura pendant quinze ans.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Venez-en au fait.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Les gens qui trouvèrent ses larmes et qui les goûtèrent se sentirent habités d'une force surnaturelle et d'un savoir divin. Ils comprirent la sagesse de la création d'Innos et se mirent à son service.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Ils furent les premiers membres de la communauté du feu. Les Larmes leur donnèrent la force, le courage et la sagesse. Mais c'était il y a bien longtemps et cela fait 250 ans que personne n'en a vu une.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Qu'entendez-vous par 'arme' ?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //La légende dit, qu'avec cette substance, les guerriers d'Innos pouvaient accomplir des exploits surhumains.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Ils étaient insensibles à la fatigue et avaient la force de deux ours.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Les grands exploits des temps anciens ne furent accomplis que grâce aux Larmes d'Innos.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Je comprends.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Mais les Larmes peuvent également provoquer la souffrance et la mort. Seuls les membres de notre ordre peuvent les boire.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Tous les autres, y compris les paladins de notre Seigneur, en mourraient.

	Npc_RemoveInvItems 	(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems 		(hero,ItPo_PotionOfDeath_02_Mis,1);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc		= KDF_500_Pyrokar;
	nr		= 999;
	condition	= DIA_Pyrokar_KAP6_EXIT_Condition;
	information	= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pyrokar_PICKPOCKET (C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 900;
	condition	= DIA_Pyrokar_PICKPOCKET_Condition;
	information	= DIA_Pyrokar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen (108, 550);
};
 
FUNC VOID DIA_Pyrokar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK 		,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
	
func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};















































































































































