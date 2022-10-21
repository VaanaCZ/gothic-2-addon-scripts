///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parcival_EXIT   (C_INFO)
{
	npc         = PAL_252_Parcival;
	nr          = 999;
	condition   = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Parcival_EXIT_Condition()
{
	if (Kapitel < 3)
	{
			return TRUE;
	};
};

FUNC VOID DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sch�rfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Schurfer		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  2;
	condition	 = 	DIA_Parcival_Schurfer_Condition;
	information	 = 	DIA_Parcival_Schurfer_Info;
	permanent 	 =  FALSE;
	description	 =	"Que pouvez-vous me dire au sujet des mineurs ?";
};
func int DIA_Parcival_Schurfer_Condition ()	
{	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Schurfer_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Schurfer_15_00"); //Que pouvez-vous me dire au sujet des mineurs�?
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_01"); //C'est moi qui ai constitu� les trois groupes.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_02"); //Les paladins qui les dirigent ont pour nom Marcos, Fajeth et Silvestro.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_03"); //Le groupe de Marcos est parti en direction d'une vieille mine dirig�e par un mineur exp�riment� du nom de Grimes.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_04"); //Les deux autres groupes sont partis ensemble.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_05"); //Jergan, l'un de nos �claireurs, nous a indiqu� qu'ils avaient dress� le camp pr�s d'une grande tour.
	
	B_LogEntry (TOPIC_ScoutMine,"Chaque escouade de mineurs est men�e par un paladin : Marcos, Fajeth et Silvestro.");
	B_LogEntry (TOPIC_ScoutMine,"Le groupe de Marcos s'est dirig� vers la vieille mine. Leur �claireur est le mineur Grimes."); 
	B_LogEntry (TOPIC_ScoutMine,"Les deux autres escouades se sont unies. Elles ont �tabli leur campement pr�s d�une grande tour."); 
	
};
///////////////////////////////////////////////////////////////////////
//	Info Sch�rfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Diego		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  9;
	condition	 = 	DIA_Parcival_Diego_Condition;
	information	 = 	DIA_Parcival_Diego_Info;
	permanent 	 =  FALSE;
	description	 =	"Avec quel groupe de mineurs Diego est-il parti ?";
};
func int DIA_Parcival_Diego_Condition ()	
{	
	if (SearchForDiego == LOG_RUNNING)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Diego_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Diego_15_00"); //De quel groupe de mineurs Diego faisait-il partie�?
	AI_Output (self, other, "DIA_Parcival_Diego_13_01"); //Diego, le prisonnier�? Il se trouve dans le groupe de Silvestro.
	
	B_LogEntry (TOPIC_ScoutMine,"Diego est avec les mineurs dirig�s par le paladin Silvestro."); 
};
///////////////////////////////////////////////////////////////////////
//	Info Weg
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Weg		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  8;
	condition	 = 	DIA_Parcival_Weg_Condition;
	information	 = 	DIA_Parcival_Weg_Info;
	permanent 	 =  FALSE;
	description	 =	"Savez-vous comment acc�der aux sites d'extraction ?";
};
func int DIA_Parcival_Weg_Condition ()	
{	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Weg_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Weg_15_00"); //Savez-vous comment rejoindre les sites miniers�?
	AI_Output (self, other, "DIA_Parcival_Weg_13_01"); //Il n'existe aucun chemin s�r pour se rendre dans cette vall�e, mais il me para�t �vident qu'il vaut mieux �viter la voie la plus directe.
	AI_Output (self, other, "DIA_Parcival_Weg_13_02"); //Restez au large des orques et des bois, et qu'Innos vous prot�ge.
	
	B_LogEntry (TOPIC_ScoutMine,"Il semblerait plus sage de ne pas prendre la route menant directement aux mineurs. Je devrais particuli�rement �viter les bois et les orques."); 
};

///////////////////////////////////////////////////////////////////////
//	Info DRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGON		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  2;
	condition	 = 	DIA_Parcival_DRAGON_Condition;
	information	 = 	DIA_Parcival_DRAGON_Info;
	description	 =	"Comment �a se passe ?";
};
func int DIA_Parcival_DRAGON_Condition ()	
{
	return TRUE;
};
func void DIA_Parcival_DRAGON_Info ()
{
	AI_Output (other, self, "DIA_Parcival_DRAGON_15_00"); //Comme �a va ?
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_01"); //Le camp est encercl� d'orques occupant une position retranch�e.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_02"); //Mais les attaques de dragons sont encore bien plus inqui�tantes. Ils ont d�vast� notre cercle ext�rieur.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_03"); //S'ils reviennent, nous subirons de terribles pertes.
};
///////////////////////////////////////////////////////////////////////
//	Info DRAGONS
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGONS		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr		 	 = 	2;
	condition	 = 	DIA_Parcival_DRAGONS_Condition;
	information	 = 	DIA_Parcival_DRAGONS_Info;
	description	 = 	"Combien y a-t-il de dragons ?";
};

func int DIA_Parcival_DRAGONS_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Parcival_DRAGON)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Parcival_DRAGONS_Info ()
{
	AI_Output (other, self, "DIA_Parcival_DRAGONS_15_00"); //Combien de dragons y a-t-il�?
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_01"); //Nous l'ignorons, mais nous savons qu'il y en a plus d'un.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_02"); //Et ce n'est pas tout... La Vall�e des mines grouille de cr�atures mal�fiques alli�es aux dragons.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_03"); //Ne nous voilons pas la face... sans renforts, nos chances de nous en sortir en vie sont extr�mement minces.
	 
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info BRAVE
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_BRAVE		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	8;
	condition	 = 	DIA_Parcival_BRAVE_Condition;
	information	 = 	DIA_Parcival_BRAVE_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Parcival_BRAVE_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& Npc_KnowsInfo (hero,DIA_Parcival_DRAGONS)
	&& (Kapitel < 3)
	&& (Parcival_BRAVE_LaberCount <= 6)
	{
		return TRUE;
	};
};

var int Parcival_BRAVE_LaberCount;
func void DIA_Parcival_BRAVE_Info ()
{
	if (Parcival_BRAVE_LaberCount < 6)
	{
		var int randy;
		randy = Hlp_Random (3);
		
		if randy == 0
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_00"); //Tout est calme, mais cela peut changer d'un instant � l'autre.
		};
		if randy == 1
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_01"); //Nous r�sisterons tant que nous le pourrons.
		};
		if randy == 2
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_02"); //Innos nous aidera. Sa lumi�re illumine nos c�urs�!
		};
	
	}
	else 
	{
	AI_Output			(self, other, "DIA_Parcival_BRAVE_13_03"); //H�! Vous n'avez rien de mieux � faire que de m'imposer vos incessants bavardages�? Allez-vous en�!
	B_GivePlayerXP (XP_Ambient);
	};
	
	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Parcival_KAP3_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP3_EXIT_Condition;
	information	= DIA_Parcival_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info AllesKlar
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_ALLESKLAR		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	nr		 = 	31;
	condition	 = 	DIA_Parcival_ALLESKLAR_Condition;
	information	 = 	DIA_Parcival_ALLESKLAR_Info;
	permanent	 = 	TRUE;

	description	 = 	"Tout va bien ?";
};

func int DIA_Parcival_ALLESKLAR_Condition ()
{
	if (Kapitel == 3)
		&& 	(DIA_Parcival_ALLESKLAR_NervCounter < 3)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
		{
				return TRUE;
		};
};
var int DIA_Parcival_ALLESKLAR_NervCounter;
func void DIA_Parcival_ALLESKLAR_Info ()
{
	AI_Output			(other, self, "DIA_Parcival_ALLESKLAR_15_00"); //Tout va bien ?

	if (DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_01"); //Jusque-l�, oui...
	}	
	else if (DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_02"); //Oui, bon sang�!
	}	
	else if (Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_03"); //(�clate de rire) Ha�! Je comprends maintenant ce que avez en t�te. Non, mon ami, pas cette fois...
	}
	else
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_04"); //Cessez de m'importuner.
	};

	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter + 1;
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

INSTANCE DIA_Parcival_KAP4_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP4_EXIT_Condition;
	information	= DIA_Parcival_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Ist irgendwas wichtiges passiert?
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_AnyNews		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_AnyNews_Condition;
	information	 = 	DIA_Parcival_AnyNews_Info;

	description  =	"Il s'est pass� quelque chose d'important ?";		
};

func int DIA_Parcival_AnyNews_Condition ()
{	
	if (Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_AnyNews_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_AnyNews_15_00"); //Il s'est pass� quoi que ce soit d'important�?
	if (hero.guild == GIL_DJG)
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_01"); //Vous faites partie de cette racaille qui se donne le nom pompeux de chasseurs de dragons�?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_02"); //Je vous croyais suffisamment honorable pour ne pas vous acoquiner avec ces individus.
	
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_03"); //Je suis inquiet... tr�s inquiet.
		AI_Output 	(other,self ,"DIA_Parcival_AnyNews_15_04"); //Pour quelle raison�?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_05"); //Des inconnus sont arriv�s il y a peu. Ils se donnent le nom de chasseurs de dragons.
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_06"); //Mais pour moi, ce ne sont que des oisifs et des criminels.
	};
	AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_07"); //S'il ne tenait qu'� moi, je les chasserai tous du ch�teau et je laisserai les orques se charger d'eux.

	Info_ClearChoices (DIA_Parcival_AnyNews);
	Info_AddChoice	(DIA_Parcival_AnyNews,"Contrairement au seigneur Hagen, ils sont l�.",DIA_Parcival_AnyNews_LordHagen); 
	Info_AddChoice	(DIA_Parcival_AnyNews,"Vous devriez leur donner une chance.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice	(DIA_Parcival_AnyNews,"Ne croyez-vous pas que vous exag�rez ?",DIA_Parcival_AnyNews_Overact);
	
};

FUNC VOID DIA_Parcival_AnyNews_LordHagen ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_LordHagen_15_00"); //Contrairement au seigneur Hagen, ils sont l�, eux.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_01"); //(part d'un rire sans joie) Eh oui, h�las. Nous n'avons qu'eux...
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_02"); //Innos nous impose vraiment une terrible �preuve...
	
	Info_ClearChoices (DIA_Parcival_AnyNews);
};

FUNC VOID DIA_Parcival_AnyNews_Chance ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Chance_15_00"); //Vous devriez leur laisser leur chance.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_01"); //C'est exactement ce qui est en train de se passer... malheureusement.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_02"); //Garond est convaincu qu'ils peuvent nous �tre utiles.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_03"); //Mais je garde l'�il sur eux. Les orques nous causent d�j� suffisamment d'ennuis, nous n'avons vraiment pas besoin d'en avoir d'autres.
	
	Info_ClearChoices (DIA_Parcival_AnyNews);  
};

FUNC VOID DIA_Parcival_AnyNews_Overact ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Overact_15_00"); //Vous ne trouvez pas que vous exag�rez�?
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_01"); //Absolument pas�! Dans notre situation, nous avons besoin d'hommes capables de servir d'exemple...
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_02"); //De guerriers anim�s par le feu sacr� d'Innos.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_03"); //Au lieu de cela, cette racaille nuit au moral de mes troupes.
};
 
///////////////////////////////////////////////////////////////////////
//	Ich muss mit dir �ber Jan reden
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_Jan		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_Jan_Condition;
	information	 = 	DIA_Parcival_Jan_Info;
	permanent	 = 	FALSE;
	description  =	"Je dois vous parler de Jan.";		
};

func int DIA_Parcival_Jan_Condition ()
{	
	if (MIS_JanBecomesSmith == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_Jan_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_00"); //Il faut que je vous parle de Jan.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_01"); //Jan�? Qui est-ce donc�?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_02"); //Un chasseur de dragons, il est �galement forgeron.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_03"); //Ah, oui, je me souviens de lui. Que vouliez-vous me dire � son sujet�?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_04"); //Il souhaiterait travailler � la forge.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_05"); //Hors de question�! Il n'est pas des n�tres et je ne lui fais nullement confiance.
}; 
 
///////////////////////////////////////////////////////////////////////
//	Kannst du das mit Jan noch mal �berdenken?
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_ThinkAgain		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_ThinkAgain_Condition;
	information	 = 	DIA_Parcival_ThinkAgain_Info;
	permanent	 = 	TRUE;
	description  =	"Ne pouvez-vous pas reconsid�rer votre d�cision pour Jan ?";		
};

func int DIA_Parcival_ThinkAgain_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Parcival_Jan)) 
	&& (MIS_JanBecomesSmith == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Parcival_ThinkAgain_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_ThinkAgain_15_00"); //Vous ne voulez pas r�fl�chir � la question pour ce qui est de Jan�?
	AI_Output 	(self ,other,"DIA_Parcival_ThinkAgain_13_01"); //Non, ma d�cision est prise.
}; 
 
///////////////////////////////////////////////////////////////////////
//	Garond will, dass Jan die Schmiede �bernimmt.
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_TalkedGarond		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_TalkedGarond_Condition;
	information	 = 	DIA_Parcival_TalkedGarond_Info;

	description  =	"Garond veut que Jan prenne la place du forgeron.";		
};

func int DIA_Parcival_TalkedGarond_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Parcival_Jan))
	&& (MIS_JanBecomesSmith == LOG_SUCCESS)	 
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_TalkedGarond_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_TalkedGarond_15_00"); //Garond souhaite que Jan reprenne la forge.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_01"); //Hmm... Dans ce cas, qu'il la prenne.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_02"); //Mais vous ne m'�terez pas de l'id�e que c'est une erreur de lui faire confiance.
};  

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_PERMKAP4		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	nr		 = 	43;
	condition	 = 	DIA_Parcival_PERMKAP4_Condition;
	information	 = 	DIA_Parcival_PERMKAP4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Et � part �a ?";
};

func int DIA_Parcival_PERMKAP4_Condition ()
{
	if (Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Parcival_AnyNews))
		{
				return TRUE;
		};
};

func void DIA_Parcival_PERMKAP4_Info ()
{
	AI_Output			(other, self, "DIA_Parcival_PERMKAP4_15_00"); //Et � part �a ?
	AI_Output			(self, other, "DIA_Parcival_PERMKAP4_13_01"); //Aaah, laissez-moi tranquille�!

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

INSTANCE DIA_Parcival_KAP5_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP5_EXIT_Condition;
	information	= DIA_Parcival_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verraeter
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_VERRAETER		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	condition	 = 	DIA_Parcival_VERRAETER_Condition;
	information	 = 	DIA_Parcival_VERRAETER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Parcival_VERRAETER_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
		&& (MIS_OCGateOpen == TRUE)
		{
			return TRUE;		
		};
};

func void DIA_Parcival_VERRAETER_Info ()
{
	
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_00"); //Tra�tre�! Je sais que c'est vous qui avez ouvert la porte�!
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_01"); //Vous allez me le payer�!
	
	Npc_SetRefuseTalk (self,30);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
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


INSTANCE DIA_Parcival_KAP6_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP6_EXIT_Condition;
	information	= DIA_Parcival_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Parcival_PICKPOCKET (C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 900;
	condition	= DIA_Parcival_PICKPOCKET_Condition;
	information	= DIA_Parcival_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Parcival_PICKPOCKET_Condition()
{
	C_Beklauen (84, 460);
};
 
FUNC VOID DIA_Parcival_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Parcival_PICKPOCKET);
	Info_AddChoice		(DIA_Parcival_PICKPOCKET, DIALOG_BACK 		,DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Parcival_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Parcival_PICKPOCKET);
};
	
func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Parcival_PICKPOCKET);
};


















































		
																				
	
	
	
	
	
	
	
	
	
	
	
	














