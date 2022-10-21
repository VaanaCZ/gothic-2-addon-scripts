///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulf_EXIT   (C_INFO)
{
	npc         = NOV_602_Ulf;
	nr          = 999;
	condition   = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info YOU
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Hallo		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	2;
	condition	 = 	DIA_Ulf_Hallo_Condition;
	information	 = 	DIA_Ulf_Hallo_Info;
	permanent	 =  FALSE;
	description	 = 	"Que faites-vous ici ?";
};

func int DIA_Ulf_Hallo_Condition ()
{
	if (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	&& (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};	
};
func void DIA_Ulf_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Hallo_15_00"); //Que faites-vous ici ?
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_01"); //J'essaye de m'acquitter des t�ches que le monast�re m'a confi�es.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_02"); //Je suis un novice du monast�re. Les magiciens et les paladins m'emploient comme gar�on de courses.
		AI_Output (self, other, "DIA_Ulf_Hallo_03_03"); //J'ai livr� du vin en provenance du monast�re aux trois aubergistes de la ville.
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Wirte
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Wirte		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Wirte_Condition;
	information	 = 	DIA_Ulf_Wirte_Info;
	permanent	 = 	FALSE;
	description	 = 	"Qui sont les trois aubergistes ?";
};

func int DIA_Ulf_Wirte_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Wirte_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Wirte_15_00"); //Qui sont les trois aubergistes�?
	AI_Output (self, other, "DIA_Ulf_Wirte_03_01"); //L'un d'eux est le brave homme que vous voyez l�, derri�re le comptoir.
	AI_Output (self, other, "DIA_Ulf_Wirte_03_02"); //Il y a �galement Caragon, dont la taverne se trouve sur la place du march� et Kardif, le propri�taire du pub du quartier du port.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Kloster		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Kloster_Condition;
	information	 = 	DIA_Ulf_Kloster_Info;
	permanent	 = 	FALSE;
	description	 = 	"Que pouvez-vous me dire au sujet du monast�re ?";
};

func int DIA_Ulf_Kloster_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Kloster_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Kloster_15_00"); //Que pouvez-vous me dire au sujet du monast�re�?
	AI_Output (self, other, "DIA_Ulf_Kloster_03_01"); //Les novices tels que moi cherchent la r�v�lation en priant Innos et apprennent les principes de notre foi aupr�s des magiciens.
	AI_Output (self, other, "DIA_Ulf_Kloster_03_02"); //Nous les servons comme nous servons Innos, tout en nous pr�parant � l'union ultime avec le Feu.
};
///////////////////////////////////////////////////////////////////////
//	bring mich zum Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Bringen	(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	4;
	condition	 = 	DIA_Ulf_Bringen_Condition;
	information	 = 	DIA_Ulf_Bringen_Info;
	permanent	 =  FALSE;
	description	 = 	"Conduisez-moi au monast�re.";
};

func int DIA_Ulf_Bringen_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Bringen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Bringen_15_00"); //Amenez-moi au monast�re.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_01"); //N'y songez m�me pas. Savez-vous combien de cr�atures j'ai d� esquiver en chemin�?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_02"); //Quand je pense � tous ces loups, mouches sanguines et autres gobelins, je suis bien heureux de ne plus �tre oblig� de vivre ici.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_03"); //Et puis de toute fa�on, vous ne pourrez pas entrer � l'int�rieur du monast�re.
	AI_Output (other, self, "DIA_Ulf_Bringen_15_04"); //Et pourquoi ?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_05"); //Seuls les magiciens, les paladins et les novices peuvent y entrer.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Aufnahme		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Aufnahme_Condition;
	information	 = 	DIA_Ulf_Aufnahme_Info;
	permanent	 = 	FALSE;
	description	 = 	"Comment puis-je devenir novice ?";
};

func int DIA_Ulf_Aufnahme_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Bringen)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Aufnahme_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_00"); //Comment puis-je devenir novice�?
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_01"); //Quand un homme ressent le profond d�sir...
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_02"); //H�! Contentez-vous de me dire ce qu'il faut faire�!
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_03"); //Il faut faire l'offrande d'un mouton et...
	B_Say_Gold (self, other, Summe_Kloster);
	
	Log_CreateTopic (Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
	B_LogEntry (Topic_Kloster,"Pour devenir novice au monast�re d'Innos, j'ai besoin d'un mouton et de 1 000 pi�ces d'or.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Gold		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	8;
	condition	 = 	DIA_Ulf_Gold_Condition;
	information	 = 	DIA_Ulf_Gold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Et comment voulez-vous que j'obtienne autant d'or ?";
};

func int DIA_Ulf_Gold_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Gold_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Gold_15_00"); //Comment voulez-vous que je me procure une telle somme�?
	AI_Output (self, other, "DIA_Ulf_Gold_03_01"); //Comme vous ne connaissez manifestement personne pouvant payer � votre place, il va vous falloir travailler.
};
///////////////////////////////////////////////////////////////////////
//	Info Schaf
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Schaf		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Schaf_Condition;
	information	 = 	DIA_Ulf_Schaf_Info;
	permanent	 = 	FALSE;
	description	 = 	"O� puis-je trouver un mouton ?";
};

func int DIA_Ulf_Schaf_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Schaf_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Schaf_15_00"); //O� puis-je trouver un mouton�?
	AI_Output (self, other, "DIA_Ulf_Schaf_03_01"); //Aupr�s des fermiers, bien s�r. Mais ce ne sera pas gratuit.
	
	B_LogEntry (Topic_Kloster,"Je peux obtenir un mouton aupr�s des fermiers.");
};
///////////////////////////////////////////////////////////////////////
//	Info Suche
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Suche		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Suche_Condition;
	information	 = 	DIA_Ulf_Suche_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Ulf_Suche_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Suche_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Suche_03_00"); //H�! Vous savez ce qui s'est pass�?
	AI_Output (other, self, "DIA_Ulf_Suche_15_01"); //Vous avez �t� choisi.
	AI_Output (self, other, "DIA_Ulf_Suche_03_02"); //Tout � fait�! Alors que j'allais boire un peu de bi�re, Daron est venu m'annoncer que j'avais �t� choisi.
	AI_Output (self, other, "DIA_Ulf_Suche_03_03"); //Qui aurait pu le penser�? Les voies d'Innos sont vraiment imp�n�trables. Et qu'est-ce qui vous am�ne ici�?
	AI_Output (other, self, "DIA_Ulf_Suche_15_04"); //J'ai demand� � passer l'Epreuve du feu.
	AI_Output (self, other, "DIA_Ulf_Suche_03_05"); //Incroyable�! Bon sang, vous �tes vraiment courageux�! Est-ce que cela signifie que vous allez aussi chercher ce que 'le fid�le trouve derri�re le chemin'�?
	AI_Output (other, self, "DIA_Ulf_Suche_15_06"); //On le dirait bien.
};
///////////////////////////////////////////////////////////////////////
//	Info Rausgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Rausgefunden		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Rausgefunden_Condition;
	information	 = 	DIA_Ulf_Rausgefunden_Info;
	permanent	 = 	FALSE;
	description  = "Avez-vous d�j� trouv� quelque chose ?";
};
func int DIA_Ulf_Rausgefunden_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Rausgefunden_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Rausgefunden_15_00"); //Avez-vous d�couvert quoi que ce soit�?
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_01"); //Eh bien, je suivais Agon... mais j'ai fini par le perdre.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_02"); //Et maintenant... comment dit-on�? Il faut suivre les signes d'Innos. Mais je ne comprends pas cette histoire de chemin.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_03"); //Alors, je continue de chercher.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "FOLLOW");
	
};
///////////////////////////////////////////////////////////////////////
//	Info Folgen
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Folgen		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Folgen_Condition;
	information	 = 	DIA_Ulf_Folgen_Info;
	permanent	 = 	FALSE;
	description  = "H� ! Vous me suivez ?";
};
func int DIA_Ulf_Folgen_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Folgen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Folgen_15_00"); //H�! Vous me suivez�?
	AI_Output (self, other, "DIA_Ulf_Folgen_03_01"); //Absolument pas�! Nous allons tous deux dans la m�me direction, c'est tout.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Stop		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Stop_Condition;
	information	 = 	DIA_Ulf_Stop_Info;
	permanent	 = 	FALSE;
	description  = "Cessez de courir apr�s moi !";
};
func int DIA_Ulf_Stop_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Folgen)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Stop_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Stop_15_00"); //Arr�tez de me suivre�!
	AI_Output (self, other, "DIA_Ulf_Stop_03_01"); //Je ne vous suis pas, mais si c'est ce que vous pensez, je vais prendre un autre chemin.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SUCHE");
};
///////////////////////////////////////////////////////////////////////
//	Info Abrechnung
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Abrechnung		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Abrechnung_Condition;
	information	 = 	DIA_Ulf_Abrechnung_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};	
func int DIA_Ulf_Abrechnung_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_HasItems (other, ItmI_RuneBlank) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Abrechnung_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_00"); //Ainsi, nous nous retrouvons. J'ai beaucoup r�fl�chi, vous savez. Je crois avoir le d�sir de devenir magicien.
	AI_Output (other, self, "DIA_Ulf_Abrechnung_15_01"); //Oh, fl�te�! Ne faites pas �a, d'accord�?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_02"); //Je n'ai pas le choix. La vie de novice n'est pas pour moi.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_03"); //Il faut que je devienne magicien. A partir de l�, je sais que tout ira bien pour moi. Et maintenant, je vais prendre ce � quoi j'ai droit.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_04"); //Avez-vous une ultime d�claration � faire avant de mourir�?
	
	Info_ClearChoices (DIA_Ulf_Abrechnung);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Cela suffit, je ne veux pas vous tuer.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Bon, ne tournons pas autour du pot, je dois revenir au monast�re.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Avez-vous quelque chose � fumer ?",DIA_Ulf_Abrechnung_Rauch);
};
FUNC VOID DIA_Ulf_Abrechnung_Lass()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //Arr�tez �a, je n'ai pas envie de vous tuer�!
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //Voil� qui est cr�nement parl�, mais vous savez bien que vous n'avez pas la moindre chance contre moi. En garde�!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //Allons droit au but�: il me faut retourner au monast�re.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //Vous n'irez nulle part�!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //Vous avez quelque chose � fumer�?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //Vous avez de la chance, j'ai justement quelque chose qui pourrait vous convenir...
	
	B_GiveInvItems (self, other, ITmi_Joint,1);
	B_UseItem (other, itmI_Joint);
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //Finissons-en�!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Troll		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Troll_Condition;
	information	 = 	DIA_Ulf_Troll_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};
func int DIA_Ulf_Troll_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	&& ((Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_14") <= 1000)
	|| (Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_15") <= 1000))
	{
		return TRUE;
	};
};
func void DIA_Ulf_Troll_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Troll_03_00"); //H�, vous croyez vraiment que nous allons dans la bonne direction�? Il y a un troll qui habite quelque part par l�.
	AI_Output (self, other, "DIA_Ulf_Troll_03_01"); //Je pr�f�rerais aller dans une autre direction.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"WAIT");
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulf_PICKPOCKET (C_INFO)
{
	npc			= NOV_602_Ulf;
	nr			= 900;
	condition	= DIA_Ulf_PICKPOCKET_Condition;
	information	= DIA_Ulf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ulf_PICKPOCKET_Condition()
{
	C_Beklauen (34, 50);
};
 
FUNC VOID DIA_Ulf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulf_PICKPOCKET);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_BACK 		,DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};
	
func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};











