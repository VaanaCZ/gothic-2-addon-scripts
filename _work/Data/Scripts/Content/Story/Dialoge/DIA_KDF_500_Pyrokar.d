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
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //Ainsi vous �tes le nouveau novice. Je pr�sume que p�re Parlan vous a d�j� confi� une t�che ?
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(l�g�rement r�probateur) Vous savez que chaque membre de la communaut� du feu doit accomplir ses t�ches selon la volont� d'Innos
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
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //J'ai un message important � leur remettre.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //Et de quel message s'agit-il ?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //Une arm�e mal�fique se rassemble dans la Vall�e des mines. Elle est men�e par des dragons ! Nous devons l'arr�ter tant que nous le pouvons encore.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Hum. Nous allons r�fl�chir � vos propos, novice. Quand le temps sera venu, nous vous ferons conna�tre notre d�cision.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Pendant ce temps, vous feriez mieux de vous acquitter de vos t�ches de novice.
	
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
	description	 =  "Je recherche l'�il d'Innos.";
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
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //Je cherche l'�il d'Innos.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Quiconque pense qu'il peut non seulement trouver l'amulette sacr�e, mais aussi la porter n'est qu'un fou.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //L'amulette choisit son porteur. Nul autre que celui � qui elle est destin�e ne peut la porter.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Je veux bien essayer.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Un novice doit montrer de l'humilit�, non du d�sir.
	
 	B_LogEntry (TOPIC_INNOSEYE, "Je ne pensais pas que ce serait aussi difficile mais Pyrokar refuse de donner l'�il volontairement et sans l'aide des paladins.");
	
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

	description	 = 	"Des citoyens de Khorinis ont myst�rieusement disparu.";
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
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Des citoyens de Khorinis ont myst�rieusement disparu.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //Cela je le sais bien et je trouve cela regrettable mais nous nous sommes mis d'accord avec les Mages de l'eau pour qu'ils s'occupent de cette affaire.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //Il en est de m�me des myst�rieux s�ismes dans le nord-est de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Pour l'instant, je n'ai pas re�u de notification indiquant que notre intervention �tait requise. Nous n'allons donc pas intervenir dans cette affaire.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Oui, mais
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //Il n'y a pas de mais ! Nous allons proc�der comme nous l'entendons et j'esp�re que vous vous y tiendrez �galement.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Les Magiciens du feu d�plorent la disparition des citoyens. Toutefois, ils disent que cette mission incombe aux Mages de l'eau. Je ne trouverai aucune aide dans ce monast�re."); 

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
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(irrit�) L'ob�issance est une vertu qu'il vous faut encore apprendre. D'une mani�re ou d'une autre.
	
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
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Oui, je me r�f�re � la Loi du feu qui dit...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(il l'interrompt brusquement) Nous connaissons la Loi du feu. Nous avons �galement vu de nombreux novices mourir au cours de l'�preuve. Vous devez r�fl�chir � votre d�cision.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //J'ai r�fl�chi. Je veux passer l'�preuve et je vais la passer.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(avertissement) Si votre d�cision est prise, alors le Haut Conseil vous soumettra � l'Epreuve.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //J'insiste pour �tre soumis � l'Epreuve du feu.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //Dans ce cas, qu'il en soit ainsi. Quand vous serez pr�t, chaque magicien du Haut Conseil vous confiera une mission que vous devrez accomplir.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Qu'Innos ait piti� de votre �me.
	
	B_LogEntry (TOPIC_FireContest,"J'ai r�clam� � Pyrokar l'Epreuve du feu. Je dois r�ussir les trois tests du Haut Conseil.");
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
	description	 = 	"Ma�tre, je suis pr�t � passer votre test.";
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
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Je suis pr�t � surmonter votre �preuve, ma�tre.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //Et seul Innos sait si vous la r�ussirez. Vous devrez subir le m�me test que tout les autres novices qui ont �t� �lus.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //Le Test de magie. (distant) Vous savez probablement qu'un SEUL novice peut r�ussir le test.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //Je vois. Qui sont mes rivaux ?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //Dans sa grande sagesse, Innos a choisi trois novices qui devront eux aussi passer les �preuves. Agon, Igaraz et Ulf. Ils ont d�j� commenc� leurs recherches.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(brusque) Mais assez ! Ecoutez ce que l'on attend de vous : 'Suivez les signes d'Innos et amenez-nous ce que le croyant trouve au bout du chemin.'
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Vous aurez besoin de cette clef.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //C'est tout ce que nous avons � vous dire.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar pr�pare le Test de la magie � mon intention. C'est le m�me que celui des novices Ulf, Igaraz et Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Je dois suivre les signes d'Innos et 'ramener ce que le croyant d�couvre sur son chemin.' Il m'a �galement donn� une clef.");
	
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
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Tant que vous n'aurez pas termin� l'�preuve, nous ne vous dirons plus rien.
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
	description	 = 	"J'ai trouv� la pierre runique.";
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
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //J'ai trouv� le pierre runique.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(incr�dule) Vous... avez r�ussi ?! Vous avez suivi les signes et vous avez d�couvert le portail cach�...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //� et vaincu ces monstres qui voulaient faire de moi leur d�jeuner.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //Et les autres novices alors ? Qu'en est-il d'Agon ? N'ont-ils pas r�ussi avant vous ?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Ils ont �chou�. Je suppose qu'ils n'�taient pas destin�s � r�ussir le test.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Bien, nous d�clarons donc que vous avez pass� ce test. La pierre runique est d�sormais � vous.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Pr�fung erfolgreich und die anderen noch nicht. 
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
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Vous avez r�ussi mon �preuve.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Mais...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //� il vous faut encore triompher du test d'Ulthar.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //� il vous faut encore surmonter l'�preuve de Serpentes.
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
	description	 = 	"Serai-je d�sormais accept� au sein de la guilde des magiciens ?";
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
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //Serai-je d�sormais accept� au sein de la guilde des magiciens maintenant ?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Vous avez r�ussi. Vous avez triomph� de l'Epreuve du feu. Nous �tions certains que vous r�ussiriez.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(insistant) Comme nous sommes �galement certains que vous ferez de votre mieux pour devenir un fid�le serviteur d'Innos.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Aussi, si vous �tes pr�t � prononcer le Serment du feu, vous serez accept� parmi nous en tant que magicien.
	
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
	description	 = 	"Je suis pr�t � entrer dans le Cercle du feu.";
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
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Je suis pr�t � m'engager dans le Cercle du feu.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Tr�s bien. Alors prononcez le Serment sacr� du feu.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(solennel) Jurez-vous, devant le Seigneur Innos le Tout-puissant, ses serviteurs et la Flamme Sanctifi�e...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //.. Qu'� partir de ce jour et � jamais, votre vie ne fera plus qu'un avec le feu...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //� jusqu'� ce que votre corps et votre �me trouvent le repos dans ses halls sacr�s et que la flamme de votre vie s'�teigne ?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Je le jure.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //En pronon�ant ce serment, vous avez sign� un pacte avec le feu.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Portez cette robe en gage de ce lien �ternel.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//f�rs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Maintenant que vous avez �t� accept� parmi nous, vous pouvez parler au seigneur Hagen, le commandant supr�me des paladins.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Nous serions �galement tr�s int�ress�s de conna�tre son sentiment sur la situation. Vous �tes d�sormais libre de vous rendre � Khorinis.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Nous attendons de vous que vous nous communiquiez sa r�ponse dans les plus brefs d�lais.
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
	description	 = 	"Que puis-je apprendre d�sormais ?";
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
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Tout d'abord, vous �tes d�sormais autoris� � apprendre les Cercles de magie. Cela vous donnera le pouvoir d'utiliser les runes.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //En progressant dans les Cercles de magie, vous apprendrez � utiliser des sorts de plus en plus puissants.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Vous pouvez apprendre les formules aupr�s des fr�res du monast�re. Chacun d'eux est sp�cialis� dans un certain domaine qu'il vous enseignera.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Karras, par exemple, est le ma�tre des invocations et des convocations et Hyglas peut vous apprendre la magie du feu.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Personne ne conna�t plus de choses que Marduk dans le domaine de la magie des glaces et du tonnerre. Parlan peut vous apprendre diverses incantations et il vous initiera au 1er Cercle.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Mais chacun d'eux ne vous apprendra que les formules. Les runes, vous devrez les cr�er vous-m�me.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"P�re Parlan me nommera membre du 1er Cercle de magie.");
	
	B_LogEntry (Topic_KlosterTeacher,"Fr�re Karras enseigne des formules de convocation et d'appel.");
	B_LogEntry (Topic_KlosterTeacher,"Fr�re Hyglas peut m'enseigner les secrets du feu.");
	B_LogEntry (Topic_KlosterTeacher,"Fr�re Marduk peut m'enseigner les pouvoirs de la glace et du tonnerre.");
	B_LogEntry (Topic_KlosterTeacher,"P�re Parlan peut m'enseigner diverses formules.");
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
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Apr�s son admission, un magicien peut choisir son premier acte.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Alors, quelle sera votre premi�re d�cision en tant que magicien ?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Aucun.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Que Babo devienne le nouveau jardinier du monast�re.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Qu'Opolos puisse avoir acc�s � la biblioth�que.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Que Dyrian puisse rester au monast�re.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Aucune.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(�bahi) Qu'il en soit ainsi. Le nouveau magicien renonce � sa d�cision.
	
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
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //Que le novice Dyrian reste au monast�re.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Qu'il en soit ainsi.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Le novice pourra rester au monast�re et il sera affect� au poste de jardinier qui est d�sormais vacant.
	
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
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //Que le novice Babo soit responsable des jardins du monast�re.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Qu'il en soit ainsi.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //A partir de maintenant, le novice Babo sera charg� de l'entretien des jardins du monast�re.
	
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
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //Que le novice Opolos puisse avoir acc�s � la biblioth�que.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Qu'il en soit ainsi.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //D�sormais, le novice Opolos pourra �tudier les textes d'Innos.
	
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
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //J'apporte des nouvelles du seigneur Hagen. Il veut la preuve de la pr�sence des dragons et de l'arm�e du mal.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //J'irai donc dans la Vall�e des mines et je lui obtiendrai cette preuve.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Bien. Vous ob�irez donc � cet ordre. Le paladin Sergio vous escortera jusqu'au col.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Qu'Innos vous prot�ge.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Alors je me suis directement rendu dans la Vall�e des mines.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Bien. Puisque vous savez d�j� comment vous rendre dans la vall�e, vous n'aurez pas besoin d'escorte.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Occupez-vous de cette affaire pour le seigneur Hagen. Qu'Innos vous prot�ge.
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
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Enorm�ment de temps s'est �coul� depuis que vous vous �tes li� au feu. Il s'est pass� beaucoup de choses et nous n'avons pas connu le repos.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Vous �tes l'Elu d'Innos. Il vous faudra donc pouvoir compter sur toutes vos forces pour surmonter les �preuves qui vous attendent.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Je vais maintenant vous consacrer Elu d'Innos. Vous entrez dans le 6�me Cercle. Puissiez-vous apporter la lumi�re et disperser les t�n�bres.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Vous pouvez d�sormais apprendre les formules magiques du dernier cercle si vous le souhaitez.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Oh ! Encore une chose. Il m'a fallu du temps pour vous reconna�tre.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Vous aviez cette lettre quand ils vous ont jet� � travers la Barri�re.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Oui, vous m'avez ainsi permis d'�chapper aux �lucubrations du juge.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //Et vous �tes l'Elu d'Innos.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //Recevez ma b�n�diction, Elu !
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innos, lumi�re du soleil et feu du monde, b�nis cet homme que tu as choisi.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Donne-lui la force, le courage et la sagesse de suivre la voie que tu lui as trac�e.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Le temps pour ceci n'est pas encore venu. Une fois que vous aurez suivi encore un peu la voie qu'Innos vous a indiqu�e, je vous l'enseignerai.
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
	description	 = 	"Instruisez-moi (cr�ation des runes)";
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
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Je suis envoy� par Parlan. Je veux augmenter mon pouvoir magique.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Vous avez beaucoup appris et vous �tes devenu puissant. A partir de maintenant, je serai votre instructeur.
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
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Je sens que la magie circule en vous. M�me moi, je ne peux vous montrer comment augmenter votre pouvoir.
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
	description	 = 	"(B�n�diction)";
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
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //B�nissez-moi, ma�tre.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //Et une petite b�n�diction ? J'en aurai certainement besoin.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Puissiez-vous triompher au cours de l'affrontement final contre notre ennemi h�r�ditaire. Qu'Innos soit avec vous.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Qu'Innos vous prot�ge du mal sur les chemins t�n�breux que vous devrez emprunter.
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

	description	 = 	"Je reviens de la vieille Vall�e des mines.";
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
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //Je reviens de la vieille Vall�e des mines.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //Qu'avez-vous � nous dire ?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //L'ennemi rassemble l�-bas une arm�e d'orques et de dragons.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //Milten nous l'a d�j� dit. Mais qu'en est-il du chargement de minerai du roi ?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //Les mines qu'ils exploitent pour Garond dans la vall�e ne peuvent r�pondre � la demande du roi.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Les jours s'assombrissent et la lumi�re du soleil s'affaiblit.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //J'ai �t� attaqu� par des hommes en robe noire.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Je sais. Ce sont les Traqueurs. Des serviteurs du royaume de B�liar. M�fiez-vous d'eux, ils essaieront de vous poss�der.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Une fois poss�d�, vous ne serez plus vous-m�me. Ce n'est qu'au monast�re que l'on pourra alors vous aider. Alors prudence.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar m'a parl� des Traqueurs, des hommes en robe noire qui sont les serviteurs de B�liar. Il m'a averti qu'ils pouvaient poss�der les gens. Si cela m'arrive, je dois revenir directement au monast�re."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //J'ai demand� � Karras de se renseigner sur ce sujet. Il devrait rapidement d�couvrir de nouveaux �l�ments qui nous permettront d'y voir plus clair.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar a donn� l'ordre � Karras de s'occuper de la menace repr�sent�e par les Traqueurs."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Tenez, cette rune vous ram�nera directement au monast�re si vous avez besoin de notre aide.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Rappelez-vous bien qu'il nous faut r�sister ou nous serons tous condamn�s.

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

	description	 = 	"Je viens prendre l'�il d'Innos.";
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
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //Je suis ici pour prendre l'�il d'Innos.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Je vois que vous avez l'autorisation du seigneur Hagen de porter l'�il d'Innos.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Je crains de devoir vous d�cevoir. Nous avons �t� les victimes d'une tra�trise ourdie par l'ennemi.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //L'�il d'Innos a �t� arrach� de ces halls sacr�s.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Qui pourrait se montrer aussi insolent, ma�tre ?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Qui a fait �a ?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //Qui peut avoir �t� aussi impudent, ma�tre ?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //Qui a fait �a ?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Le Mal est rus� et agit en secret. Il est rare que ses machinations soient d�voil�es au grand jour.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Mais ces derniers temps, c'est une autre histoire. L'ennemi se montre en pleine rue, dans chaque maison et dans chaque jardin public.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //Cela signifie qu'il ne craint plus aucun adversaire et que rien ne peut le faire reculer.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //L'un de nos fid�les, un candidat � la robe de Magicien du feu, nous a trahis de mani�re inattendue et particuli�rement vile. Pedro.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //L'ennemi a pris possession de lui et nous a ainsi inflig� une terrible d�faite.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro s'est fray� un passage dans nos halls les plus sacr�s et a vol� l'�il.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Je crains qu'il n'ait pass� trop de temps seul, hors des murs protecteurs du monast�re et qu'il ait �t� expos� aux dangers qui le guettaient.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschu� freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist f�r den SC nun als Traitor bekannt. Mu� hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "Fantastique. J'aurais d� le savoir. J'arrive trop tard, ces imb�ciles du monast�re ont laiss� un novice leur voler l'�il. Il ne me reste plus qu'� courir apr�s ce tra�tre de Pedro en esp�rant qu'il ne l'a pas vendu � quelqu'un.");
 	B_LogEntry (TOPIC_TraitorPedro, "Le tra�tre Pedro a vol� l'�il d'Innos au monast�re. Je crois que les Magiciens du feu seraient contents de mettre la main sur lui.");
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

	description	 = 	"O� a fui le voleur ?";
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
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //O� le voleur a-t-il fui ?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro a neutralis� les autres novices qui tentaient de l'arr�ter et il a disparu dans la brume matinale.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //De nombreux novices se sont lanc�s � sa poursuite pour ramener l'�il.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Si vous voulez les rattraper, vous devez vous d�p�cher avant que Pedro ne soit hors d'atteinte.

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

	description	 = 	"J'ai retrouv� l'�il d'Innos.";
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
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //J'ai retrouv� l'�il d'Innos. Il est bris�.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Mais... cela ne se peut. Que s'est-il pass� ?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Il a �t� entre les mains de gens vraiment peu recommandables. Quoi qu'il en soit je suis arriv� trop tard.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Ils psalmodiaient une �trange incantation sur un site rituel en forme de croissant, dans la for�t.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Qu'Innos nous prot�ge. Ils ont profan� le Cercle du soleil.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //M�me dans mes pires cauchemars, je n'aurais jamais imagin� qu'ils disposent d'une telle puissance.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Que faisons-nous maintenant ?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Que pouvons-nous faire maintenant ?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //L'ennemi est devenu tr�s fort. Mais cet ancien artefact est encore une menace pour lui.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Nous devons restaurer l'�il et lui rendre son ancienne puissance. Mais le temps joue contre nous.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Je n'ose imaginer ce qu'il va advenir de nous. Sans la protection de l'�il nous sommes � la merci de l'ennemi.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Allez en ville, voir Vatras le mage des eaux. Lui seul saura ce qu'il convient de faire. Apportez-lui l'�il et d�p�chez-vous.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Pourquoi Vatras ?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Qu'est-ce que le Cercle du soleil ?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar veut que j�aille en ville demander � Vatras, le Magicien des eaux, un conseil pour savoir quoi faire de l'�il endommag�.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Pourquoi Vatras ?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Le fait que vous portiez la robe ne vous autorise pas � remettre mes ordres en question, fr�re.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras est un serviteur d'Adanos. Le savoir des magiciens des eaux nous apportera la lumi�re en ces heures sombres.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //C'est tout ce que vous avez besoin de savoir.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Qu'est-ce que le Cercle du soleil ?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Chaque ann�e, tous les magiciens et les novices du monast�re se rendent � cet endroit � l'�poque du solstice pour symboliser le d�but d'un nouveau cycle.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //Cet endroit regorge du pouvoir sans limite du soleil.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //Je n'aurais jamais imagin� que ce pouvoir puisse �tre corrompu. Et c'est pourtant ce qui s'est pass�.
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

	description	 = 	"J'ai parl� � Vatras.";
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
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //J'ai parl� � Vatras.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Ah ! Bien ! O� est-il ?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Il pr�pare un rituel au Cercle du soleil pour restaurer l'�il.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Si cela est vrai, il reste peut-�tre encore de l'espoir.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras voudrait que Xardas et vous-m�me l'aidiez.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //QUOI ? Xardas sera l� aussi ? Vous n'�tes pas s�rieux.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Eh ! Je n'y suis pour rien. Vatras a insist�.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Toujours et encore ce Xardas. Je suis las. Les choses ne sauraient �tre pires.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Comment puis-je savoir que Xardas n'est pas de m�che avec l'ennemi ?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Je ne peux me fier � Xardas, m�me si on a terriblement besoin de lui.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Je regrette mais je ne peux accorder mon aide � Vatras dans ces circonstances.
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

	description	 = 	"Cela ne peut �tre fait sans vous...";
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
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Cela ne peut �tre fait sans vous. Vatras ne pourra accomplir le rituel.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Vous allez devoir faire confiance � Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Je n'ai rien � devoir faire, vous m'entendez ? Je n'ai pas la moindre preuve que Xardas ne travaille pas contre nous. Je ne peux faire �a.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //Et si je vous apporte une preuve ?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Je crains que cela soit impossible. Il faudrait vraiment que �a m'impressionne.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //Et en ce qui concerne Xardas, je doute qu'il puisse encore m'impressionner.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar tremble � la moindre �vocation de Xardas. Je vais devoir discuter avec Xardas pour savoir comment le faire venir au rituel du Cercle du soleil.");
	
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

	description	 = 	"J'ai apport� ce livre de Xardas.";
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
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(�bahi) Mais c'est incroyable. Avez-vous la moindre id�e de ce que vous venez de me donner ?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Hum. Non.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(irrit�) C'est un ancien grimoire, disparu depuis longtemps.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Nous pensions tous qu'il �tait perdu � tout jamais et voil� que j'apprends que Xardas savait ce qu'il �tait advenu de lui.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Alors, participerez-vous au rituel ?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Oui, je vais me rendre au Cercle du soleil mais certainement pas parce que je suis convaincu des bonnes intentions de Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //En fait, je vais demander � ce chacal de m'expliquer o� il a pu cacher ce livre pendant tant d'ann�es. Cette fois-ci, il est vraiment all� trop loin.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Je vous verrai au Cercle du soleil.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar a finalement accept� de venir au Cercle du soleil.");
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

	description	 = 	"Pensez-vous pouvoir r�parer l'�il une nouvelle fois ?";
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
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //Pensez-vous pouvoir encore restaurer l'�il ?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //Difficile � dire. Nous n'avons plus qu'� attendre et � voir.
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

	description	 = 	"Vous avez r�ussi. L'�il d'Innos est gu�ri.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Vous avez r�ussi. L'�il d'Innos est restaur�.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Jamais je n'aurais cru que ce soit possible.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Oui, ma�tre.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Vous avez prouv� � maintes reprises que vous �tes digne du Haut Conseil des Magiciens du feu.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //Vous �tes aujourd'hui membre de ce conseil et vous repr�senterez notre ordre dans le monde. D�sormais vous �tes un des hauts Magiciens du feu.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Portez la robe correspondant � votre rang avec dignit� et faites honneur � l'ordre, mon fr�re.
		
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

	description	 = 	"Que reste-t-il � faire ici ?";
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
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Que me reste-t-il � faire ici ?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Ne gaspillez pas votre temps avec des choses triviales. Allez et triomphez des dragons. Tenez, prenez l'�il.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Souvenez-vous bien que vous devez d'abord parler � un dragon avant de pouvoir l'attaquer.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es f�gt ihnen auch unertr�gliche Schmerzen zu, wenn du es bei dir tr�gst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Le pouvoir de l'�il forcera le dragon � vous parler et � vous dire la v�rit�.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //De plus, quand vous le portez, il vous conf�re une protection contre leurs attaques.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Cependant, son pouvoir ne dure pas. Il vous faudra lui redonner de l'�nergie magique.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Pour cela, vous avez besoin de l'essence d'un c�ur de dragon que vous devrez m�ler � l'�il dans un laboratoire d'alchimie.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Alors seulement vous pourrez affronter un autre dragon.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Merci. Je m'en souviendrai.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Vous avez d�sormais tout ce dont vous avez besoin. Alors, allez-y. Vous n'avez plus beaucoup de temps.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Je suis d�sormais pr�t � me mesurer aux dragons. L'�il d'Innos m'aidera � les an�antir. Je ne dois pas oublier de le porter lorsque je combattrai ces monstres... Je dois parler aux dragons avant d'avoir la moindre chance de les vaincre. H�las, la puissance de l'�il s'estompe � chaque fois que je parle � l'un d'eux. Avant de pouvoir me confronter � un autre dragon, il me faut trouver le coeur d'un dragon et une fiole de laboratoire vide, puis unir la pierre affaiblie de l'amulette et l'extrait d'un c�ur de dragon dans un laboratoire d'alchimie."); 

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

	description	 = 	"J'ai d�couvert un �trange almanach.";
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
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //J'ai trouv� un �trange almanach.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //Vraiment ? De quel genre d'almanach s'agit-il ?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Je n'en suis pas s�r. Je pensais que vous sauriez quoi en faire.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //En v�rit�, c'est vraiment tr�s troublant. Je suis heureux que vous me l'ayez apport�. Vous avez fait preuve de sagesse.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Je pr�sume qu'il y en a d'autres. Allez et trouvez tous ces livres maudits.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Je pense qu'il s'agit d'un instrument servant le pouvoir des Traqueurs.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Ils l'utilisent pour contr�ler les �mes perdues de leurs victimes.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Ils y inscrivent les noms de ceux qu'ils comptent poss�der.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Ecoutez. Je vous confie cette lettre magique. Elle vous permettra de lire les noms qui sont inscrits dans ces livres.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Trouvez ces victimes et apportez-moi leur livre. Je pourrai alors m'en occuper.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Mais d'abord, vous devriez en montrer un � Karras. Peut-�tre que cela l'aidera dans ses recherches.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //Ne faites pas l'erreur d'essayer de les d�truire vous-m�me. Vous n'�tes pas encore pr�t � r�sister � leur pouvoir.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar veut neutraliser l�Almanach des Poss�d�s. Il m'a donn� la liste de tous ceux que veulent poss�der les Traqueurs. La liste peut s'allonger."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Ne vous approchez pas trop des Traqueurs ou ils prendront possession de vous.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Si vous ne pouvez r�sister � leur appel, revenez me voir aussi vite que possible.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //Ce n'est que dans le monast�re que votre �me pourra �tre sauv�e.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //N'y a-t-il aucune protection contre leurs assauts psychiques ?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //C'est possible. Il se peut que Karras sache quelque chose � ce sujet.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"Karras est cens� m'aider � trouver une protection contre les attaques mentales des Traqueurs."); 
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

	description	 = 	"(Gu�rison de la possession)";
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
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Gu�rissez-moi, ma�tre, car je suis poss�d�.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //Qu'il en soit ainsi ! Prenez cette potion. Elle vous d�livrera de vos cauchemars.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Que la gr�ce d'Innos vous apporte le salut..
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Agissez en son nom et m�fiez-vous de l'�il mal�fique de l'ennemi.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Mais soyez pr�venu. Si vous vous exposez trop souvent � leur pouvoir, il n'y aura nulle r�demption pour vous. Souvenez-vous-en.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Je crois que je suis poss�d�. Pouvez-vous me soigner ?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //Pas sans un gage de votre respect pour ce monast�re, mon fils. 300 pi�ces d'or.
				
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
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Tenez, buvez ceci. Que la gr�ce d'Innos vous apporte le salut.
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

	description	 = 	"Je peux vous en dire plus sur ces poss�d�s.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Je peux vous en dire plus au sujet des poss�d�s.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Parlez mon fr�re.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold f�r einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //J'ai trouv� un autre almanach.
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
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //C'est bien. Cependant, je crains qu'il en reste d'autres � trouver. Continuez vos recherches.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Vous en avez d�j� trouv� beaucoup. Mais je ne crois pas que nous les ayons tous.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Vous m'avez d�j� amen� beaucoup de livres de l'ennemi.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Je serais surpris s'ils en avaient encore beaucoup en circulation.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Prenez ceci. C'est un don du monast�re qui vous aidera � affronter le mal.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //Et rappelez-vous de consulter ma lettre magique de temps en temps.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Il est possible qu'ils tentent de s'en prendre � d'autres personnes dont les noms n'apparaissent pas dans les almanachs.
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
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //C'est une bonne nouvelle. Mais cela ne change en rien notre situation qui semble d�sesp�r�e.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Les Traqueurs ne sont pas encore partis. Bien au contraire. On me communique de plus en plus de rapports selon lesquels ils se seraient renforc�s ces derniers jours.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Tuer les dragons est un terrible coup ass�n� � l'ennemi mais cela ne suffit pas. Nous devons d�truire les racines du mal.

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

	description	 = 	"J'ai parl� aux dragons.";
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
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //J'ai parl� aux dragons.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //Qu'ont-ils dit ?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //Ils ne cessent de parler du pouvoir de leur ma�tre et de son installation dans les Halls d'Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Qu'Innos soit avec nous. Le temple noir a regagn� sa puissance et il nous envoie ses serviteurs.

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
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //Le temple d'invocation de l'est du dieu B�liar. Il y en a quatre sur la terre de Myrtana. Mais celui-ci est probablement le plus redoutable.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Il y a environ 40 ans, les temples du nord et de l'ouest de cette horrible divinit� furent d�truits.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Les braves chevaliers de ce temps firent tout pour raser ces puissants �difices.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //A cette �poque, les hordes noires de l'ennemi �taient impuissantes contre les courageux chevaliers et paladins, sup�rieurs en nombre.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Il aurait �t� ais� de d�truire les deux autres temples et de d�barrasser le monde de ce mal...
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //� mais, apr�s la chute du second temple, les autres disparurent.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(moqueur) Disparus. Des temples entiers. Mouais.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Ne vous moquez pas de moi. La situation est s�rieuse. Si les Halls d'Irdorath ont retrouv� leur puissance, il ne sera pas ais� de vaincre l'ennemi.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Pour �a, il vous faudra d'abord le trouver. Je crois que cela doit �tre votre prochaine t�che et certainement la plus difficile.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Nous verrons.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Selon Pyrokar, les Halls d'Irdorath sont un temple d'invocation perdu du dieu B�liar. Je dois trouver ce temple."); 

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

	description	 = 	"Le livre de Xardas que l'on croyait perdu... O� est-il ?";
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
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //Le livre de Xardas que l'on croyait perdu... o� est-il ?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Je m'attendais � ce que vous me posiez la question. Mais je crains que cela ne vous soit d'aucune utilit�.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Il a �t� magiquement scell�. Je l'ai plac� dans une de nos salles fortes. Nous avons tent� en vain de l'ouvrir.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Ce maudit Xardas nous a jou� un sale tour.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //Puis-je voir le livre ?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Si vous le souhaitez. Je ne peux concevoir que vous r�ussissiez l� o� les plus grands ma�tres du monast�re ont �chou�.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Mais allez-y et essayez. Talamon ne s'y opposera pas.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Le livre de Xardas, LES HALLS D'IRDORATH, se trouve dans les niveaux inf�rieurs du monast�re. Il est gard� par Talamon. Les magiciens ne peuvent pas l'ouvrir. Il a �t� magiquement scell� et Xardas en serait le responsable."); 
	
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

	description	 = 	"J'ai r�ussi � ouvrir le livre de Xardas.";
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
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //J'ai r�ussi � ouvrir le livre de Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Quoi ? Comment avez-vous fait ? Il m'a presque conduit au d�sespoir.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas m'a dit comment faire.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Juste un coup de chance � mon avis.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Juste un coup de chance, je suppose.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Ne dites pas d'idioties. De la chance !
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Alors que je n'ai pas r�ussi � ouvrir le livre, vous y parvenez sans peine...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //� voil� qui me donne mati�re � r�flexion.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Qu'importe. Puisqu'� l'�vidence, vous �tes le seul � avoir pu ouvrir le livre, alors je vous accorde l'autorisation de le prendre. Tout au moins jusqu'� la fin de cette crise.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas m'a dit comment faire.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Ah ! C'est cela. Que c'est int�ressant. J'esp�re simplement pour vous que la mauvaise influence de Xardas ne va pas d�teindre sur vous.
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

	description	 = 	"Le livre parle d'une biblioth�que secr�te.";
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
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //Le livre parle d'une biblioth�que secr�te.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //De quoi parlez-vous ?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //Une biblioth�que sous ces murs. Est-ce que cela vous dit quelque chose ?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //Non. O� est cens�e se trouver cette biblioth�que d�j� ?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Je vois. Vous n'en avez pas la moindre id�e. Hum.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar ne sait rien au sujet d�une biblioth�que secr�te. Il semble que seul Xardas y ait eu acc�s."); 

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

	description	 = 	"Je sais o� trouver les Halls d'Irdorath.";
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
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //Je sais o� trouver les Halls d'Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Le temple est sur une �le. J'ai trouv� une carte marine qui indique comment s'y rendre.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //Fantastique. Il va donc vous falloir un navire et un �quipage pour que vous puissiez affronter l'ennemi.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Mais rappelez-vous que vous devez �tre bien pr�par� si vous voulez vaincre le Ma�tre d'Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //O� puis-je trouver un �quipage ?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Votre �quipage doit �tre constitu� de gens en qui vous avez confiance.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Parlez � vos amis et r�fl�chissez � qui pourrait s'av�rer utile une fois que vous serez sur l'�le.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Il vous faudra �galement un magicien. Mais h�las, je ne peux me passer d'une seule personne au monast�re.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Vous devrez demander � un magicien qui ne travaille pas au monast�re.

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

	description	 = 	"Jorgen est un marin exp�riment�.";
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
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen est un marin exp�riment�. Il pourrait m'aider � atteindre l'�le d'Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Je crains que cela ne soit pas ais�.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Il a sign� pour travailler pour la confr�rie. Il n'a toujours pas pay� son tribut et ne nous a pas amen� de mouton.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen doit d'abord terminer son travail et ensuite vous pourrez l'emmener avec vous.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Combien de temps cela prendra-t-il ?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Il a utilis� en un jour toutes les provisions qu'un novice aurait mis trois semaines � consommer.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Alors je ne peux pas le laisser partir avant qu'il n'ait travaill� dur dans nos jardins pendant encore trois mois.

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

	description	 = 	"Que puis-je faire pour que Jorgen vienne imm�diatement avec moi ?";
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
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Hum. Il y a en effet une chose que vous pouvez faire pour moi. Vos bons rapports avec Xardas pourront �tre utiles.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //J'ai appris que, au cours de ces derniers jours, d'�tranges choses s'�taient pass�es dans sa tour.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Beaucoup de gens entendent des cris la nuit et voient d'�tranges lueurs danser autour de la tour.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Comme si on n'avait pas d'autres chats � fouetter. Allez voir ce qui se passe l�-bas et faites en sorte que cela s'arr�te.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Alors vous pourrez avoir Jorgen.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"Il se passe d'�tranges choses dans la tour de Xardas. Si je m'en occupe, je peux amener Jorgen avec moi.");
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

	description	 = 	"L'affaire de la tour de Xardas s'est r�solue d'elle-m�me.";
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
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //Ce qui se passe dans la tour de Xardas s'est r�solu tout seul.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Alors que se passait-il .. Non, attendez, je ne veux m�me pas le savoir.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Si vous voulez encore de Jorgen, allez-y et prenez-le pour votre voyage.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Qu'Innos vous prot�ge.
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
	description	 = 	"La proph�tie mentionne l'Aura sacr�e d'Innos.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //La proph�tie mentionne l'Aura sacr�e d'Innos.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //L'Aura d'Innos est une amulette que seuls les plus grands magiciens sont destin�s � porter.
	
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
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Oui, bien s�r.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Je n'aimerais pas avoir � la racheter � un marchand plus tard.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Utilisez-la avec sagesse et qu'Innos veille sur vous.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //De quelle sorte d'amulette s'agit-il ?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //On dit qu'Innos lui-m�me l'a forg�e et qu'il l'a offerte � l'humanit�.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Elle prot�ge celui qui la porte de toutes formes de d�g�ts.
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
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Les Larmes d'Innos ne sont rien d'autre qu'un vieux conte pour enfant. Il raconte comment a commenc� l'affrontement entre Innos et B�liar, au d�but des temps.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Je vois.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"J'ai trouv� cette potion.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Je vois.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //J'ignore si vous �tes bien conscient de votre situation mais j'ai du mal � croire que notre ennemi puisse �tre vaincu par un conte pour enfant.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //J'ai trouv� cette potion.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //Cela ne se peut. Je n'arrive pas � y croire.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //Quel est le probl�me ?
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
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Quand Innos s'est rendu compte qu'il devait affronter B�liar, son propre fr�re, pour sauver la cr�ation, il en �prouva un grand chagrin.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Il se mit � pleurer et ses larmes tomb�rent sur le monde. Il y en eut beaucoup car il pleura pendant quinze ans.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Venez-en au fait.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Les gens qui trouv�rent ses larmes et qui les go�t�rent se sentirent habit�s d'une force surnaturelle et d'un savoir divin. Ils comprirent la sagesse de la cr�ation d'Innos et se mirent � son service.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Ils furent les premiers membres de la communaut� du feu. Les Larmes leur donn�rent la force, le courage et la sagesse. Mais c'�tait il y a bien longtemps et cela fait 250 ans que personne n'en a vu une.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Qu'entendez-vous par 'arme' ?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //La l�gende dit, qu'avec cette substance, les guerriers d'Innos pouvaient accomplir des exploits surhumains.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Ils �taient insensibles � la fatigue et avaient la force de deux ours.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Les grands exploits des temps anciens ne furent accomplis que gr�ce aux Larmes d'Innos.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Je comprends.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Mais les Larmes peuvent �galement provoquer la souffrance et la mort. Seuls les membres de notre ordre peuvent les boire.
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















































































































































