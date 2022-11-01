///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rukhar_EXIT   (C_INFO)
{
	npc         = BAU_973_Rukhar;
	nr          = 999;
	condition   = DIA_Rukhar_EXIT_Condition;
	information = DIA_Rukhar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rukhar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rukhar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HALLO		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	4;
	condition	 = 	DIA_Rukhar_HALLO_Condition;
	information	 = 	DIA_Rukhar_HALLO_Info;

	description	 = 	"La bière est bonne ici ?";
};

func int DIA_Rukhar_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rukhar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HALLO_15_00"); //Y a-t-il de la bonne bière ici ?
	AI_Output			(self, other, "DIA_Rukhar_HALLO_12_01"); //Ce n'est pas la meilleure mais, en ces temps troublés, on ne peut pas être trop difficile.

};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	5;
	condition	 = 	DIA_Rukhar_WASMACHSTDU_Condition;
	information	 = 	DIA_Rukhar_WASMACHSTDU_Info;

	description	 = 	"Que faites-vous ici ?";
};

func int DIA_Rukhar_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_WASMACHSTDU_15_00"); //Que faites-vous ici ?
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_01"); //Il y a encore quelques semaines, je travaillais comme une bête de somme dans les champs du propriétaire terrien.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_02"); //Un jour, j'en ai eu assez et je suis venu directement ici.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_03"); //Maintenant, je suis mon propre patron. Tout ce que je possède est dans ce coffre et c'est tout ce dont j'ai besoin.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_04"); //Ça vous dit un petit concours ?
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"Il y a un concours à la taverne."); 

};


///////////////////////////////////////////////////////////////////////
//	Info Wettkampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WETTKAMPF		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_WETTKAMPF_Condition;
	information	 = 	DIA_Rukhar_WETTKAMPF_Info;

	description	 = 	"De quel genre de concours peut-il bien s'agir ?";
};

func int DIA_Rukhar_WETTKAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_WETTKAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_WETTKAMPF_15_00"); //Et quel genre de concours ?
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_01"); //J'appelle ça le CUL SEC.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_02"); //Les règles sont assez simples.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_03"); //Chacun notre tour, on commande une chope de la meilleure bière que puisse nous offrir le vieux schnock.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_04"); //Il faut vider d'un trait chaque chope pour que, même si on la retourne sur la table, elle ne laisse même pas une auréole.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_05"); //Le dernier à tenir debout a gagné. Le perdant paie l'addition et sa mise. Bon ? Qu'en dites-vous ?
	AI_Output			(other, self, "DIA_Rukhar_WETTKAMPF_15_06"); //Peut-être une autre fois, pour l'instant je suis pressé.

};

///////////////////////////////////////////////////////////////////////
//	Info HoleRandolph
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HOLERANDOLPH		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_HOLERANDOLPH_Condition;
	information	 = 	DIA_Rukhar_HOLERANDOLPH_Info;

	description	 = 	"Pourrais-je parier sur quelqu'un d'autre ?";
};

func int DIA_Rukhar_HOLERANDOLPH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WETTKAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_HOLERANDOLPH_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HOLERANDOLPH_15_00"); //Puis-je parier sur quelqu'un d'autre à la place ?
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_01"); //Certainement. Si vous arrivez à trouver quelqu'un qui ait le courage de m'affronter, alors je parierai avec vous.
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_02"); //Tout le monde met la même somme d'argent pour la mise. Le gagnant remporte tout. La mise dépend donc de votre bourse.
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_03"); //Amenez-moi quelqu'un qui ose m'affronter et on parie.
	B_LogEntry (TOPIC_Wettsaufen,"Rukhar appelle son petit jeu CUL-SEC. Non merci, je ne suis pas intéressé. Je trouverai quelqu'un d'autre qu'il puisse ridiculiser."); 

};

///////////////////////////////////////////////////////////////////////
//	Info RandolphWill
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_RANDOLPHWILL		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_RANDOLPHWILL_Condition;
	information	 = 	DIA_Rukhar_RANDOLPHWILL_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'ai quelqu'un qui veut concourir contre vous.";
};

var int DIA_Rukhar_RANDOLPHWILL_noPerm;

func int DIA_Rukhar_RANDOLPHWILL_Condition ()
{
	if  (
		(Npc_KnowsInfo(other, DIA_Randolph_GEGENWEN))
		&& (Npc_KnowsInfo(other, DIA_Rukhar_HOLERANDOLPH))
		&& (DIA_Rukhar_RANDOLPHWILL_noPerm == FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Rukhar_RANDOLPHWILL_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_15_00"); //J'ai trouvé quelqu'un qui aimerait bien vous défier.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_01"); //Et de qui s'agit-il ?
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_15_02"); //Randolph.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_03"); //Ho ! Ho ! Randolph le fanfaron ? Très bien. Pourquoi pas.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_04"); //Que cette mauviette se pointe et ça marche.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_05"); //Attendez deux jours avant pour qu'il m'affronte à nouveau. Qui sait ? Peut-être aurez-vous de la chance et que, d'ici là, il sera capable de tenir debout.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_06"); //Quelle est votre mise ?

	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "Rien", DIA_Rukhar_RANDOLPHWILL_nix );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "100", DIA_Rukhar_RANDOLPHWILL_100 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "10 pièces d'or", DIA_Rukhar_RANDOLPHWILL_10 );
};
func void DIA_Rukhar_RANDOLPHWILL_annehmen ()
{
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_annehmen_12_00"); //Je prends votre mise et je la garde jusqu'à la fin du concours, d'accord ?
	DIA_Rukhar_RANDOLPHWILL_noPerm = TRUE;
};

func void DIA_Rukhar_RANDOLPHWILL_mehr ()
{
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "Rien", DIA_Rukhar_RANDOLPHWILL_nix );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "100", DIA_Rukhar_RANDOLPHWILL_100 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "10 pièces d'or", DIA_Rukhar_RANDOLPHWILL_10 );
};


func void DIA_Rukhar_RANDOLPHWILL_nix ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_nix_15_00"); //Rien.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_nix_12_01"); //Alors oublions tout ça.

	AI_StopProcessInfos (self);
};

func void DIA_Rukhar_RANDOLPHWILL_10 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_10_15_00"); //10 pièces d'or.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_10_12_01"); //Allons, vous n'êtes pas sérieux. Quelques pièces en plus ne vous ruineront pas.

	Rukhar_Einsatz = 10;
	Rukhar_Gewinn = 20;

	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(choisir une autre mise)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(accepter la mise)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_20 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_20_15_00"); //20
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_20_12_01"); //Si vous voulez parier, offrez une mise décente.

	Rukhar_Einsatz = 20;
	Rukhar_Gewinn = 40;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(choisir une autre mise)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(accepter la mise)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_50 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_50_15_00"); //50
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_50_12_01"); //Ne soyez pas si timoré, soyez téméraire.

	Rukhar_Einsatz = 50;
	Rukhar_Gewinn = 100;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(choisir une autre mise)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(accepter la mise)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_100 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_100_15_00"); //100
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_100_12_01"); //Voilà ce que j'aime entendre.
	
	Rukhar_Einsatz = 100;
	Rukhar_Gewinn = 200;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(choisir une autre mise)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(accepter la mise)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

///////////////////////////////////////////////////////////////////////
//	Info IchSeheDich
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_ICHSEHEDICH		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_ICHSEHEDICH_Condition;
	information	 = 	DIA_Rukhar_ICHSEHEDICH_Info;
	permanent	 = 	TRUE;
	
	description	=	"Voici ma mise.";
};

var int DIA_Rukhar_ICHSEHEDICH_noPerm;

func int DIA_Rukhar_ICHSEHEDICH_Condition ()
{
	if 	(
		(DIA_Rukhar_ICHSEHEDICH_noPerm == FALSE)
		&& (DIA_Rukhar_RANDOLPHWILL_noPerm == TRUE)
		&& (Rukhar_Einsatz != 0)
		)
			{
					return TRUE;
			};
};

func void DIA_Rukhar_ICHSEHEDICH_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_ICHSEHEDICH_15_00"); //Voici ma mise.

	if (B_GiveInvItems (other, self, ItMi_Gold, Rukhar_Einsatz))
		{
			AI_Output			(self, other, "DIA_Rukhar_ICHSEHEDICH_12_01"); //Très bien. Ne mettez pas trop de temps à m'amener Randolph, d'accord ?
			DIA_Rukhar_ICHSEHEDICH_noPerm = TRUE;
			MIS_Rukhar_Wettkampf = LOG_RUNNING; 
			B_GivePlayerXP (XP_Ambient);
		}
	else
		{
			AI_Output			(self, other, "DIA_Rukhar_ICHSEHEDICH_12_02"); //Très drôle. Revenez quand vous aurez assez d'argent.
		};
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info geldzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_GELDZURUECK		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_GELDZURUECK_Condition;
	information	 = 	DIA_Rukhar_GELDZURUECK_Info;
	permanent	 = 	TRUE;
	
	description	 = 	"Je veux récupérer mon argent.";
};

func int DIA_Rukhar_GELDZURUECK_Condition ()
{
	if 	(
		(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
		&& (Rukhar_Won_Wettkampf == TRUE)
		)
	{
				return TRUE;
	};
};

func void DIA_Rukhar_GELDZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_GELDZURUECK_15_00"); //Je veux que vous me rendiez mon argent.
	AI_Output			(self, other, "DIA_Rukhar_GELDZURUECK_12_01"); //Les dettes de jeu sont des dettes d'honneur, mon pote. Vous auriez dû y réfléchir avant.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Haenseln
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HAENSELN		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_HAENSELN_Condition;
	information	 = 	DIA_Rukhar_HAENSELN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous semblez avoir eu les yeux plus grands que le ventre.";
};

func int DIA_Rukhar_HAENSELN_Condition ()
{
	if 	(
		(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
		&& (Rukhar_Won_Wettkampf == FALSE)
		)
	{
				return TRUE;
	};
};

var int DIA_Rukhar_HAENSELN_nureimalgeld;

func void DIA_Rukhar_HAENSELN_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HAENSELN_15_00"); //Vous semblez avoir eu les yeux plus gros que le ventre.

	if	(DIA_Rukhar_HAENSELN_nureimalgeld == FALSE)
		{
			AI_Output			(self, other, "DIA_Rukhar_HAENSELN_12_01"); //Voilà votre argent et je ne veux pas entendre un mot de plus.
			B_GivePlayerXP (XP_Rukhar_Lost);

			IntToFloat (Rukhar_Gewinn);
					
			CreateInvItems (self, ItMi_Gold, Rukhar_Gewinn);									
			B_GiveInvItems (self, other, ItMi_Gold, Rukhar_Gewinn);					

			DIA_Rukhar_HAENSELN_nureimalgeld = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Rukhar_HAENSELN_12_02"); //Je vous revaudrai ça, vous pouvez y compter.
		};

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_Perm		(C_INFO)
{
	npc			 = 	BAU_973_Rukhar;
	nr		 = 	7;
	condition	 = 	DIA_Rukhar_Perm_Condition;
	information	 = 	DIA_Rukhar_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"Il s'est passé autre chose d'intéressant ?";
};

func int DIA_Rukhar_Perm_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
		{
				return TRUE;
		};
};
func void DIA_Rukhar_Perm_Info ()
{
	AI_Output (other, self, "DIA_Rukhar_Perm_15_00"); //S'est-il passé autre chose d'intéressant ?
	AI_Output (self, other, "DIA_Rukhar_Perm_12_01"); //Pas que je sache. Personne ne me dit rien.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rukhar_PICKPOCKET (C_INFO)
{
	npc			= BAU_973_Rukhar;
	nr			= 900;
	condition	= DIA_Rukhar_PICKPOCKET_Condition;
	information	= DIA_Rukhar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Rukhar_PICKPOCKET_Condition()
{
	C_Beklauen (26, 30);
};
 
FUNC VOID DIA_Rukhar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rukhar_PICKPOCKET);
	Info_AddChoice		(DIA_Rukhar_PICKPOCKET, DIALOG_BACK 		,DIA_Rukhar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rukhar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rukhar_PICKPOCKET_DoIt);
};

func void DIA_Rukhar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rukhar_PICKPOCKET);
};
	
func void DIA_Rukhar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rukhar_PICKPOCKET);
};




 


























