// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_NW_EXIT(C_INFO)
{
	npc			= PIR_1300_Addon_Greg_NW;
	nr			= 999;
	condition	= DIA_Addon_Greg_NW_EXIT_Condition;
	information	= DIA_Addon_Greg_NW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_NW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
	PlayerTalkedToGregNW	= TRUE;
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//1. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info HalloW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Greg_NW_Hallo_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_Hallo_Condition ()
{
	if (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Hallo_Info ()
{

	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_00"); //Pst. H�, vous ! Venez ici !
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Hallo_15_01"); //Qu'y a-t-il ?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_02"); //Vous vous rendez en ville ? Vous m'avez l'air bien occup�.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_03"); //(mielleux) Ecoutez, vous m'avez l'air d'�tre quelqu'un de rus�... je suis s�r que vous vous d�brouillerez bien dans la vie.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_04"); //Vous n'�tes s�rement pas du genre � qui l'on fait avaler des couleuvres... �a se voit au premier coup d'�il.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_05"); //Dites, j'imagine que vous n'avez rien contre le fait de gagner une poign�e de pi�ces d'or ?

	PlayerTalkedToGregNW	= TRUE;
	SC_MeetsGregTime = 1; //Joly: erste Mal getroffen.

	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Je dois y aller.", DIA_Addon_Greg_NW_Hallo_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Arr�tez vos sornettes. Dites-moi ce que vous voulez.", DIA_Addon_Greg_NW_Hallo_schleim );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Vous ne m'avez pas l'air d'�tre du genre � avoir de l'or...", DIA_Addon_Greg_NW_Hallo_vorsicht );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Vous cherchez � vous cacher de quelqu'un ?", DIA_Addon_Greg_NW_Hallo_hide );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Pourquoi pas ? ", DIA_Addon_Greg_NW_Hallo_ja );

};

func void DIA_Addon_Greg_NW_Hallo_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_weg_15_00"); //Je dois y aller, maintenant.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_weg_01_01"); //(irrit�) Alors, vous refusez de m'aider. Je m'en souviendrai, mon gars. Nous nous reverrons.

	AI_StopProcessInfos (self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_ja_15_00"); //Pourquoi pas ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_01"); //Pardonnez-moi - je ne suis qu'un vieux marin ignorant. Je ne suis pas originaire de ces contr�es, et je n'en connais pas toutes les r�gles.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_02"); //Du coup, j'ai appris assez durement que les �trangers itin�rants ne sont pas les bienvenus dans la ville portuaire.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_03"); //(s'apitoyant exag�r�ment) Maintenant, je me retrouve bloqu� ici sans savoir comment me rendre dans la ville...
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_04"); //J'ai des affaires extr�mement importantes � conclure en ville, et mon client n'acceptera aucun d�lai, vous comprenez ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_05"); //Vous pourriez bien m'aider � franchir le poste de garde de la ville, non ?
	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	
	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"L'�trange type avec un bandeau sur l'�il cherche � entrer dans la ville portuaire. Il m'a demand� de l'aider � passer le poste de garde."); 
	
	MIS_Addon_Greg_BringMeToTheCity = LOG_RUNNING;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_vorsicht_15_00"); //Vous ne m'avez pas l'air d'�tre du genre � avoir de l'or...
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_01"); //(exag�r�ment modeste) Eh bien, je n'�volue certainement pas dans un milieu aussi �lev� qu'un gentilhomme tel que vous.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_02"); //Mais vous ne refuseriez pas ma modeste contribution � votre fortune sans nul doute immense, hein ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_03"); //Eh bien, qu'en dites-vous ? Puis-je compter sur vous ?

};

func void DIA_Addon_Greg_NW_Hallo_schleim ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_schleim_15_00"); //Arr�tez vos sornettes. Dites-moi ce que vous voulez.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_01"); //Vous voyez ? C'est exactement ce que je veux dire.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_02"); //Personne ne peut vous endormir avec de belles paroles.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_03"); //Je le savais. Vous �tes un sacr� dur en affaires.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_04"); //Vous �tes dur en affaires, et vous seriez certainement int�ress� par une modeste contribution � votre fortune personnelle, non ?
};

func void DIA_Addon_Greg_NW_Hallo_hide ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_hide_15_00"); //Vous cherchez � vous cacher de quelqu'un ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_01"); //Bien s�r que non ! Quelle blague ! Je pr�f�re simplement rester parmi les arbres... Ici, au moins, je ne suis pas aveugl� par le vent !
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_02"); //Mais parlons de vous... Etes-vous int�ress� par ce travail ?
};

///////////////////////////////////////////////////////////////////////
//	Info Stadtwachen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Stadtwachen		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information	 = 	DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent	 = 	TRUE;

	description	 = 	"A propos des gardes de la ville...";
};

func int DIA_Addon_Greg_NW_Stadtwachen_Condition ()
{
	if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Stadtwachen_15_00"); //A propos du poste de garde...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Stadtwachen_01_01"); //Oui ? Vous avez une id�e ?
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Je dois d'abord y r�fl�chir.", DIA_Addon_Greg_NW_Stadtwachen_nochnicht );

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Avez-vous essay� de soudoyer les gardes ?", DIA_Addon_Greg_NW_Stadtwachen_geld );
	};

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE)
	&& (Npc_HasItems (other,ItWr_Passierschein))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Je poss�de un laissez-passer pour la ville.", DIA_Addon_Greg_NW_Stadtwachen_Schein );
	};
	
	if (MIS_Addon_Lester_PickForConstantino != 0)
	&& (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Vous pourriez entrer dans la ville en vous faisant passer pour un cueilleur.", DIA_Addon_Greg_NW_Stadtwachen_constantino );
	};

	IF	((Npc_HasItems (other,ItAr_BAU_L)) || (Npc_HasItems (other,ItAr_BAU_M)))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Les gardes vous laisseront s�rement passer si vous portez ces v�tements de fermier.", DIA_Addon_Greg_NW_Stadtwachen_klamotten );
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00"); //Les gardes vous laisseront s�rement passer si vous portez ces v�tements de fermier.

	if (Npc_HasItems (other,ItAr_BAU_L))
	{
		B_GiveInvItems 		(other, self, ItAr_BAU_L,1);
	}
	else //ITAR_BAU_M
	{
		B_GiveInvItems 		(other, self, ITAR_BAU_M,1);
	};

	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01"); //C'est exactement ce dont j'avais besoin. Bon sang, je savais que je pouvais compter sur vous.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02"); //(malicieusement) Personne ne me cherchera des crosses, si je me d�guise en roturier des environs.

	if (Npc_HasItems (self,ItAr_BAU_L))
	{
		AI_EquipArmor 		(self,ItAr_BAU_L);
	}
	else //ITAR_BAU_M
	{
		AI_EquipArmor 		(self,ITAR_BAU_M);
	};
	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03"); //Excellent. Vous avez fait du bon travail. Voici la r�compense promise.
	
	CreateInvItems (self, ItMi_Gold, 50);									
	B_GiveInvItems (self, other, ItMi_Gold, 50);	
	B_GivePlayerXP (XP_Greg_NW_GiveBauArmor);				
	
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04"); //(irrit�) Quoi ? 50 malheureuses pi�ces d'or ? Vous n'�tes pas s�rieux !
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05"); //(moralisateur) L'or n'est pas tout, mon ami. Prenez-les, pour l'instant.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06"); //J'ai l'impression que nous nous reverrons prochainement...
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07"); //Et qui sait ? Peut-�tre vous redevrai-je ce service ? Prenez soin de vous.
	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Markt");

	B_LogEntry (TOPIC_Addon_Greg_NW,"Je lui ai donn� des v�tements de fermier. Ils lui permettront de passer inaper�u aux yeux des gardes."); 

	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};
func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00"); //Je vais d'abord y r�fl�chir.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01"); //(s�rieusement) Soit. Mais ne tardez pas trop - je n'ai pas de temps � perdre.
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Greg_NW_Stadtwachen_Schein ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00"); //Je poss�de un laissez-passer pour la ville.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01"); //(cynique) Oh, je vois. Je suis cens� faire semblant d'�tre un citoyen de la ville, j'imagine ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02"); //(irrit�) Regardez-moi un peu, mon gar�on. Personne ne me croira.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_constantino ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00"); //Vous pourriez entrer dans la ville en vous faisant passer pour un cueilleur.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01"); //(irrit�) Quoi ? Vous trouvez que j'ai une t�te � aller ramasser des fleurs dans les bois ?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_geld ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_geld_15_00"); //Avez-vous essay� de soudoyer les gardes ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_geld_01_01"); //(avec malice) Ha ! Vous ne croyez quand m�me pas que je n'ai pas d�j� essay� ?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PERM		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_PERM_Condition;
	information	 = 	DIA_Addon_Greg_NW_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Encore une chose...";
};
func int DIA_Addon_Greg_NW_PERM_Condition ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)||(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};
func void DIA_Addon_Greg_NW_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PERM_15_00"); //Encore une chose...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_01"); //(arrogant) Ecoutez-moi, mon gar�on. J'ai des choses importantes � faire, pour l'instant.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_02"); //(mena�ant) Nous en reparlerons plus tard. Compris ?
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//2. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info MeetGregSecondTime
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_MeetGregSecondTime		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_00"); //Regardez un peu qui voil�...

	if (MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_01"); //Le petit gars de la ferme.
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_02"); //Le type qui m'a envoy� pa�tre de mani�re si hautaine. Comme on se retrouve, hein...?
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_03"); //(en col�re) Je croyais que vous vouliez m'aider. Au lieu de cela, vous vous �tes simplement �clips�.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_04"); //Vous pensiez que j'allais me rester bloqu� l� � tout jamais, hein ?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_05"); //Comme quoi... 'Aide-toi, le ciel t'aidera.' Mais je ne vous oublierai pas de sit�t.
	};

	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_06"); //Vous tombez � point nomm�.
	SC_SawGregInTaverne = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_wer		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_wer_Condition;
	information	 = 	DIA_Addon_Greg_NW_wer_Info;

	description	 = 	"Qui �tes-vous, au juste ?";
};

func int DIA_Addon_Greg_NW_wer_Condition ()
{
	if (GregLocation >= Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_wer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_wer_15_00"); //Qui �tes-vous, au juste ?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_01"); //�a ne vous regarde pas.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_02"); //Si je voulais vous dire qui je suis, je l'aurais d�j� fait, compris ?

	
};

///////////////////////////////////////////////////////////////////////
//	Info was
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_was		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_was_Condition;
	information	 = 	DIA_Addon_Greg_NW_was_Info;

	description	 = 	"Que voulez-vous de moi ?";
};

func int DIA_Addon_Greg_NW_was_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func VOID B_Greg_Search_Dexter ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_00"); //Je recherche un type. Personne ne l'a vu en ville, et ces cr�tins ici n'ont pas la moindre id�e de l'endroit o� il se trouve, eux non plus.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_01"); //C'est un homme mince, � la chevelure noire, qui porte g�n�ralement une armure rouge.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_02"); //A ce que je sache, il �tait autrefois incarc�r� dans la colonie. Il me semble que son nom commence par la lettre 'D'.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"L'homme au bandeau recherche une personne dont le nom commence par 'D'."); 

	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_00"); //Que voulez-vous de moi ?

	if (MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_01"); //Vous avez toujours des soucis avec les gardes de la ville ?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_was_01_02"); //(mena�ant) C'est vous qui allez avoir des soucis, jeune cr�tin !
	};	

	B_Greg_Search_Dexter ();

	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Vous parlez de Diego.", DIA_Addon_Greg_NW_was_Diego );

	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_was, "Son nom est peut-�tre Dexter ?", DIA_Addon_Greg_NW_was_Dexter );
	};
	
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Je ne connais personne qui r�ponde � cette description.", DIA_Addon_Greg_NW_was_no );
};

func void DIA_Addon_Greg_NW_was_GregUnsicher ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_00"); //C'est peut-�tre son nom. Je n'en suis pas certain.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_01"); //Je ne le saurai sans doute que lorsque je le rencontrerai.
};

func void DIA_Addon_Greg_NW_was_UnNun ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_UnNun_15_00"); //Autre chose ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_01"); //(en col�re) Oh oui, esp�ce de vantard. Il y a autre chose.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_02"); //J'ai besoin d'armes. J'ai besoin de provisions. Et de l'or, ce serait pas mal, aussi.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Je ne peux rien pour vous.", DIA_Addon_Greg_NW_was_NoHelp );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Des provisions ? Vous �tes dans une taverne !", DIA_Addon_Greg_NW_was_Orlan );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Des armes ? Les mercenaires ont des armes.", DIA_Addon_Greg_NW_was_SLD );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Voici 10 pi�ces d'or.", DIA_Addon_Greg_NW_was_HierGold );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Vous n'avez pas trouv� un marchand d'armes, dans la ville ?", DIA_Addon_Greg_NW_was_Waffenhaendler );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "De l'or ? Tout le monde veut de l'or.", DIA_Addon_Greg_NW_was_Gold );
};

func void DIA_Addon_Greg_NW_was_NoHelp ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_NoHelp_15_00"); //Je ne peux rien pour vous.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_01"); //(en col�re) Oh. Vous ne VOULEZ rien faire pour moi.
	
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_02"); //C'est la deuxi�me fois que vous me laissez dans le vague.
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_03"); //Laissez-moi vous donner un bon conseil. D�brouillez-vous pour que nos chemins ne se recroisent pas.
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_04"); //Je m'en souviendrai. Vous pouvez compter l�-dessus.
	};	
	
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Start");
};

func void DIA_Addon_Greg_NW_was_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_00"); //De l'or ? Tout le monde veut de l'or.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_01"); //C'est bien possible. Et qu'est-ce que vous en feriez, de toute mani�re ? Vous iriez le boire � la taverne ou le d�penser � la Lanterne Rouge ?
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_02"); //Et vous avez une meilleure id�e, je suppose ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_03"); //(en col�re) Vous iriez ramper sous un rocher si vous saviez tout ce que j'ai fait dans ma vie.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_04"); //Alors ne me parlez pas comme �a, ou je vous ferai taire une fois pour toutes.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Waffenhaendler_15_00"); //Vous n'avez pas trouv� un marchand d'armes, dans la ville ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Waffenhaendler_01_01"); //Vous n'�tes pas s�rieux ! Ils ne vendent que de la ferraille sans aucune valeur !
};

func void DIA_Addon_Greg_NW_was_HierGold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_HierGold_15_00"); //Voici 10 pi�ces d'or.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_01"); //(rires) Pauvre imb�cile, gardez votre argent. J'ai une meilleure id�e.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_02"); //Il y a une grotte non loin d'ici. Je suis d�j� pass� dans le coin, et j'ai enterr� mes affaires � diff�rents endroits.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_03"); //Cette grotte est trop dangereuse pour moi seul. Je veux que vous m'aidiez � y aller.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"J'ai propos� de l'or � l'homme au bandeau, mais il n'en veut pas. Je suis cens� le suivre jusqu'� sa grotte."); 

	MIS_Addon_Greg_RakeCave = LOG_RUNNING;
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_SLD_15_00"); //Des armes ? Les mercenaires ont des armes.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_01"); //Int�ressant. J'ai entendu que ces gars avaient �t� recrut�s par le gros fermier Onar.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_02"); //(rires) Pas mal, pour un bouseux comme lui !
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_03"); //Ce n'est pas une mauvaise id�e. Peut-�tre devrais-je leur rendre visite...
};
func void DIA_Addon_Greg_NW_was_Orlan ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Orlan_15_00"); //Des provisions ? Vous �tes dans une taverne !
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Orlan_01_01"); //Ce cr�tin de tavernier ne vous donnera rien si vous ne lui offrez pas de l'argent en �change !
};

func void DIA_Addon_Greg_NW_was_no ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_no_15_00"); //Je ne connais personne qui r�ponde � cette description.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_no_01_01"); //Je m'en serais dout�.
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Diego ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Diego_15_00"); //Vous parlez de Diego.
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Dexter ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Dexter_15_00"); //Son nom est peut-�tre Dexter ?
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveLos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCaveLos		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Info;

	description	 = 	"Allons voir la grotte...";
};

func int DIA_Addon_Greg_NW_RakeCaveLos_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveLos_15_00"); //Allons voir la grotte...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveLos_01_01"); //Venez avec moi.
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"RakeCave");
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveThere
///////////////////////////////////////////////////////////////////////
	func void B_Greg_GoNow()
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_03"); //(ordonne) Qu'est-ce que vous attendez ? Entrez dans la grotte et ramenez-moi mes affaires !
	};
// --------------------------------------------------------------------

instance DIA_Addon_Greg_NW_RakeCaveThere		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_RakeCaveThere_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_00"); //Bien, mon ami. Voici la grotte.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_01"); //Et voici une pioche pour vous.
	B_GiveInvItems (self, other, itmw_2h_Axe_L_01, 1); //Spitzhacke	
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_02"); //J'ai enterr� mes affaires quelque part � l'int�rieur. L'endroit est rep�r� par une croix.
	B_Greg_GoNow();
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveThere_15_04"); //Et vous, alors ?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_05"); //L'un de nous doit surveiller nos arri�res. Maintenant, allez-y.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Ce type me demande de rechercher ses affaires dans la grotte. Il les a enterr�es, et a marqu� l'emplacement d'une croix. Il m'a remis une pioche pour m'aider dans ma qu�te."); 

	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay(); 
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCavePlundered
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCavePlundered		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition ()
{
	if ((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay()-2)) || (RAKEPLACE[Greg_FirstSecret] == TRUE))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_01_00"); //Vous en avez mis, du temps ! Vous avez trouv� quelque chose ?
	
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "Oui. J'ai trouv� un petit sac d'or.", DIA_Addon_Greg_NW_RakeCavePlundered_gold );
	};
	Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "Non.", DIA_Addon_Greg_NW_RakeCavePlundered_No );
};
func void DIA_Addon_Greg_NW_RakeCavePlundered_No ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00"); //Non.
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01"); //Vous essayez de me faire marcher, hein ?
		AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02"); //(fait l'innocent) Il n'y avait rien � l'endroit que vous m'avez indiqu�.
	};	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03"); //Bon sang, je le savais ! Ces maudits vautours ont encore �t� plus rapides que moi.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04"); //Ah... tant pis, mon gar�on. Il faut que j'y aille. Je vous reverrai tout � l'heure.
	AI_StopProcessInfos (self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Start");
};
var int B_Greg_RakePlaceBriefing_OneTime;
func void B_Greg_RakePlaceBriefing ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_00"); //Voyons... Au centre du lac dans lequel se jettent deux chutes d'eau se trouve une petite �le, sur laquelle j'ai enterr� certaines de mes affaires.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_01"); //D'autre part, j'ai enterr� quelque chose � deux autres endroits, sur les hautes plaines.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_02"); //L'une de mes caches se trouve derri�re la ferme l�-haut, et l'autre se trouve non loin du col proche des chutes d'eau.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_03"); //Des marches m�nent des champs du fermier dans les hautes plaines aux champs du propri�taire terrien.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_04"); //Une autre cache se trouve dans le vallon, � l'endroit o� se terminent les escaliers.

	if (B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_Addon_Greg_NW,"Il a enterr� ses affaires � plusieurs endroits. 1) Sur la petite �le sur le lac o� se jettent deux chutes d'eau. 2) Sur les hautes plaines derri�re la ferme. 3) Pr�s de l'entr�e du col, non loin des chutes d'eau. 4) Dans le vallon sous les marches menant des champs du fermier sur les hautes plaines vers les champs du propri�taire terrain. Il me demande de lui ramener tout ce qu'il a enterr�. Il m'attendra au carrefour entre les champs.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};                                                                                             
                                                                                               
func void DIA_Addon_Greg_NW_RakeCavePlundered_gold ()                                          
{                                                                                              
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00"); //Oui. J'ai retrouv� un petit sac d'or.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01"); //(avidement) Donnez-le moi.

	if ((Npc_HasItems (other,ItSe_GoldPocket25))||(Npc_HasItems (other,ItMi_Gold)>= 25))
		{	
			if (B_GiveInvItems (other, self, ItSe_GoldPocket25,1))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02"); //Tenez.
				}
			else if (B_GiveInvItems (other, self, ItMi_Gold,25))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03"); //Il contenait 25 pi�ces d'or. Tenez, prenez-les.
				};
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04"); //Parfait. Ainsi, elles sont encore toutes l�.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05"); //Vous n'�tes pas si inutile que cela, tous comptes faits.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06"); //Bien, �coutez-moi. J'ai enterr� d'autres sacs d'or dans la r�gion, et je veux que vous les r�cup�riez pour moi.
			B_Greg_RakePlaceBriefing ();
			Greg_SuchWeiter = TRUE;
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07"); //Je vous attendrai au carrefour pr�s des champs du propri�taire terrien. Ne me d�cevez pas. Vous le regretteriez, je vous le promets.
			AI_StopProcessInfos (self);
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_GivePlayerXP (XP_Addon_RakeCavePlundered);
		}
	else
		{
			AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08"); //Je ne l'ai plus.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09"); //Fadaises. Faut-il que je vous passe � tabac pour que vous me le donniez ?
			AI_StopProcessInfos (self);
			MIS_Addon_Greg_RakeCave = LOG_FAILED;//Joly:SC hat Greg angeschissen.
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_Attack (self, other, AR_NONE, 1);
		};
};

///////////////////////////////////////////////////////////////////////
//	PERM vor LakeCave
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_LakeCave	(C_INFO)
{
	npc		 	= PIR_1300_Addon_Greg_NW;
	nr		 	= 100; //alle anderen importants wichtiger
	condition	= DIA_Addon_Greg_NW_LakeCave_Condition;
	information	= DIA_Addon_Greg_NW_LakeCave_Info;
	permanent	= TRUE;
	important 	= TRUE;
};

func int DIA_Addon_Greg_NW_LakeCave_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 	
	&& (Greg_SuchWeiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_LakeCave_Info ()
{
	B_Greg_GoNow();
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WhereTreasures
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhereTreasures		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent	 = 	TRUE;

	description	 = 	"Redites-moi o� vous avez enterr� vos affaires ?";
};

func int DIA_Addon_Greg_NW_WhereTreasures_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhereTreasures_15_00"); //O� avez-vous enterr� vos affaires, au juste ?
	B_Greg_RakePlaceBriefing ();
};

///////////////////////////////////////////////////////////////////////
//	Info PermTaverne
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PermTaverne		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Greg_NW_PermTaverne_Condition;
	information	 = 	DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent	 = 	TRUE;

	description	 = 	"Encore une chose...";
};

func int DIA_Addon_Greg_NW_PermTaverne_Condition ()
{
	if 	(
		(GregLocation == Greg_Bigcross)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross) == FALSE)
		&& (((Npc_GetDistToWP(self,"BIGCROSS")<1000) == FALSE)||(MIS_Addon_Greg_RakeCave == LOG_SUCCESS))
		)
	|| 	(
		(GregLocation == Greg_Dexter)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_WasWillstDu))
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_PermTaverne_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PermTaverne_15_00"); //Encore une chose...

	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_01"); //D'abord, allez me chercher ce que j'ai enterr�. Ensuite, nous pourrons discuter.
	}
	else if (MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_02"); //Je vous suis reconnaissant de m'avoir aid�. Mais cela ne fait de nous des amis, si vous me suivez.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_03"); //Nous avons d�j� perdu trop de temps en querelles.
	};
};


///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//3. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info Bigcross
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Bigcross		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Bigcross_Condition;
	information	 = 	DIA_Addon_Greg_NW_Bigcross_Info;

	description	 = 	"Tout va bien ?";
};

func int DIA_Addon_Greg_NW_Bigcross_Condition ()
{
	if (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Bigcross_Info ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)||(MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_00"); //Tiens donc, si ce n'est pas Monsieur Indigne-de-confiance...
	};

	AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_01"); //Comment vont les choses, ici ?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_02"); //Pas fameux... Ces mercenaires n'arrangent rien, en v�rit�.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_03"); //Cela dit, j'aurais vraiment cru qu'ils auraient �t� un peu moins couards.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_04"); //Mais � mon avis, ils ne sont qu'un ramassis de braillards et de vantards.
	
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_05"); //Alors, parlons de ces choses que j'ai enterr�es. Les avez-vous retrouv�es ?
		if (RAKEPLACE[1]==FALSE)
		|| (RAKEPLACE[2]==FALSE)
		|| (RAKEPLACE[3]==FALSE)
		|| (RAKEPLACE[4]==FALSE)
		|| (RAKEPLACE[5]==FALSE)
		{
			AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_06"); //Non, pas toutes.
			AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_07"); //Alors d�p�chez-vous un peu, voulez-vous ? Ce n'est quand m�me pas si difficile que �a...
		};
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info WhatWantFromSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhatWantFromSLD		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Info;

	description	 = 	"Qu'aviez-vous � faire avec les mercenaires ?";
};

func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhatWantFromSLD_15_00"); //Qu'aviez-vous � faire avec les mercenaires ?
	
	if (SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter ();
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_01"); //Je vous l'ai d�j� dit. Je recherche ce type en armure rouge.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_02"); //Mais ces cr�tins n'ont aucune id�e de celui dont je parle.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info DexterFound
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_DexterFound		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_DexterFound_Condition;
	information	 = 	DIA_Addon_Greg_NW_DexterFound_Info;

	description	 = 	"J'imagine que vous recherchez quelqu'un appel� Dexter.";
};

func int DIA_Addon_Greg_NW_DexterFound_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_DexterFound_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_DexterFound_15_00"); //J'imagine que vous recherchez quelqu'un appel� Dexter.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_DexterFound_01_01"); //Bon sang - comment voulez-vous que je connaisse le nom de ce type ?
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "C'�tait juste une r�flexion...", DIA_Addon_Greg_NW_DexterFound_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Peut-�tre devrions-nous aller le voir ensemble ?", DIA_Addon_Greg_NW_DexterFound_together );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Je sais o� vous pourrez le trouver.", DIA_Addon_Greg_NW_DexterFound_wo );
};
func void DIA_Addon_Greg_NW_DexterFound_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_weg_15_00"); //C'�tait juste une r�flexion...
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_00"); //Je sais o� vous pourrez le trouver.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_01"); //(surpris) Vraiment ? DITES-LE MOI !
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_02"); //Non loin d'ici.
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_03"); //Il semble �tre le chef d'une meute de bandits malveillants.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_04"); //(ricane) HA ! Ouais, c'est tout lui.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_05"); //Je savais que ce bouseux s'�tait terr� quelque part dans les parages.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_06"); //Maintenant, il ne me reste plus qu'� fouiller tous les trous � rats et toutes les caches des environs.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_07"); //Je retrouverai ce fumier - je n'ai pas besoin de votre aide pour �a.
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_together_15_00"); //Peut-�tre devrions-nous aller le voir ensemble ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_together_01_01"); //J'ai toujours un compte � r�gler avec lui. Je m'en sortirai tout seul.
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//4. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_00"); //(fort) O� est cette ordure ?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter_15_01"); //Qui ? Le capitaine ? Il est ici.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_02"); //(fort) Alors �cartez-vous de mon chemin.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"DexterHouseRun");
};

///////////////////////////////////////////////////////////////////////
//	Info WodennNu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WodennNu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WodennNu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WodennNu_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_WodennNu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
	&& (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10")<500) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WodennNu_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_00"); //(fort) O� est-il all� ?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WodennNu_15_01"); //Il �tait ici...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_02"); //(ordonne) Alors allez me le chercher !
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter2		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter2_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_00"); //Ah. Dexter a fait le grand saut, c'est �a ?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter2_15_01"); //On dirait bien qu'il est mort.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_02"); //Pas trop t�t, d'ailleurs. Allez fouiller son corps.
	Npc_ExchangeRoutine	(self,"DexterHouseWalk");
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info RavensLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RavensLetter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RavensLetter_Condition;
	information	 = 	DIA_Addon_Greg_NW_RavensLetter_Info;

	description	 = 	"Dexter n'avait rien d'autre que cette lettre.";
};

func int DIA_Addon_Greg_NW_RavensLetter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_CaughtDexter2))
	&& (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_00"); //Dexter n'avait rien d'autre que cette lettre.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_01"); //Montrez-moi cela.
	B_UseFakeScroll ();
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_02"); //Ah, bon sang. �a ne m'avance en rien.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_03"); //On n'aurait pas d� le laisser crever aussi rapidement...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_04"); //Vous ne sauriez pas comment franchir les montagnes au nord-est de Khorinis, par hasard ?
	
	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_05"); //Peut-�tre existe-t-il un tunnel souterrain. Les Mages de l'eau �tudient en ce moment un portail menant dans les montagnes dans le nord-est de l'�le.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_06"); //(en col�re) Que veulent dire ces sornettes ?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_07"); //(railleur) Bah, des Mages de l'eau... vous n'aviez pas d'histoire plus cr�dible � me raconter.
	};
	
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_08"); //Non.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_09"); //(soupir r�sign�) Alors, je suis bloqu� ici.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_10"); //Dexter �tait mon dernier espoir.
};

///////////////////////////////////////////////////////////////////////
//	Info WasWillstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WasWillstDu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WasWillstDu_Info;

	description	 = 	"Que vouliez-vous de Dexter ?";
};

func int DIA_Addon_Greg_NW_WasWillstDu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_RavensLetter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WasWillstDu_15_00"); //Que vouliez-vous de Dexter ?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_01"); //Je viens d'une r�gion situ�e par-del� les montagnes au nord de cette �le. Et je veux rentrer chez moi.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_02"); //J'esp�rais que cette crapule saurait comment s'y rendre sans bateau.

	Npc_ExchangeRoutine	(self,"DexterThrone");	

	Info_ClearChoices	(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "Qu'y a-t-il au-del� de ces montagnes ?", DIA_Addon_Greg_NW_WasWillstDu_da );
	
	if (Skip_NW.aivar[AIV_TalkedToPlayer]==TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "J'ai vu un pirate d�nomm� Skip pr�s du port.", DIA_Addon_Greg_NW_WasWillstDu_Skip );
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_da_15_00"); //Qu'y a-t-il au-del� de ces montagnes ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_01"); //Je vous d�conseille de tenter de vous y rendre.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_02"); //Ces terres sont sauvages. Une demi-portion comme vous ne ferait pas long feu.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00"); //J'ai rencontr� un pirate nomm� Skip pr�s du port.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01"); //Ce cr�tin... je l'ai attendu pendant trois jours ! Alors, pour quelle raison est-il en retard ?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02"); //Lorsque j'aurais repris mes forces, je vais lui montrer de quel bois je me chauffe !
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundTreasure
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_FoundTreasure		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information	 = 	DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'ai retrouv� vos biens enterr�s.";
};

func int DIA_Addon_Greg_NW_FoundTreasure_Condition ()
{
	if (RAKEPLACE[1]==TRUE)
	&& (RAKEPLACE[2]==TRUE)
	&& (RAKEPLACE[3]==TRUE)
	&& (RAKEPLACE[4]==TRUE)
	&& (RAKEPLACE[5]==TRUE)
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_FoundTreasure_15_00"); //J'ai retrouv� vos biens enterr�s.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_FoundTreasure_01_01"); //Dans ce cas, vous devriez avoir sur vous une centaine de pi�ces d'or, un calice dor�, une �cuelle d'argent et une amulette - tout cela m'appartient. Donnez-les moi.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
	Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "En fait, je ne l'ai pas sur moi.", DIA_Addon_Greg_NW_FoundTreasure_not );

	if ((Npc_HasItems (other,ItSe_GoldPocket100)) || (Npc_HasItems (other,itmi_gold)>= 100))
	&& (Npc_HasItems (other,ItMi_GoldCup))
	&& (Npc_HasItems (other,ItMi_SilverChalice))
	&& (Npc_HasItems (other,ItAm_Prot_Point_01))
		{
			Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "Voici vos affaires.", DIA_Addon_Greg_NW_FoundTreasure_ja );
		};
};
func void DIA_Addon_Greg_NW_FoundTreasure_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_00"); //Voici vos affaires.

	if (B_GiveInvItems (other, self, ItSe_GoldPocket100,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_01"); //Un sac contenant 100 pi�ces d'or.
	}	
	else if (B_GiveInvItems (other, self, ItMi_gold,100))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_02"); //100 pi�ces d'or.
	};

	if (B_GiveInvItems (other, self, ItMi_GoldCup,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_03"); //Un calice dor�.
	};
	if (B_GiveInvItems (other, self, ItMi_SilverChalice,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_04"); //Une �cuelle d'argent.
	};
	if (B_GiveInvItems (other, self, ItAm_Prot_Point_01,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_05"); //Et une amulette.
	};
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_06"); //Tr�s bien. Vous avez de la chance d'�tre assez intelligent pour ne pas garder mes affaires et tenter de vous enfuir.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_07"); //Voici votre part du butin.

	B_GiveInvItems (self, other, ItMi_gold,30);
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
		
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_not_15_00"); //Il se trouve que je ne les ai pas sur moi.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_not_01_01"); //Alors retrouvez-moi ces objets avant que je ne m'�nerve.
	AI_StopProcessInfos (self);
};

