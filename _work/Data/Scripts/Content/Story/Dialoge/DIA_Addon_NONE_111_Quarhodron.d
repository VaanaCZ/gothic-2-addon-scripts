///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Quarhodron_EXIT   (C_INFO)
{
	npc         = NONE_ADDON_111_Quarhodron;
	nr          = 999;
	condition   = DIA_Addon_Quarhodron_EXIT_Condition;
	information = DIA_Addon_Quarhodron_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Hello		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_Hello_Condition;
	information	 = 	DIA_Addon_Quarhodron_Hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int DIA_Addon_Quarhodron_Hello_NoPerm;
func int DIA_Addon_Quarhodron_Hello_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Addon_Quarhodron_Hello_NoPerm == FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Addon_Quarhodron_Hello_Info ()
{
	IF (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_00"); //Pourquoi me tirer de mon sommeil, veilleur ?
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_01"); //(en col�re) Dites-moi ce que vous d�sirez !
		 
		Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Qu'y a-t-il � l'int�rieur du temple d'Adanos ?", DIA_Addon_Quarhodron_Hello_schwert );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Quelqu'un est entr� de force dans le temple d'Adanos.", DIA_Addon_Quarhodron_Hello_raven );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Laissez-moi acc�der au temple d'Adanos.", DIA_Addon_Quarhodron_Hello_tempel );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Cette terre est ravag�e par des s�ismes.", DIA_Addon_Quarhodron_Hello_erdbeben );
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems 	(hero, ItWr_Addon_SUMMONANCIENTGHOST,1); //Joly: sonst gammelt das ding unn�tz herum.
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_02"); //Bengla anthani, Osiri ?
		B_Say (other, self, "$CANTUNDERSTANDTHIS");	
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_03"); //(fort) Bengla anthani ?
		AI_StopProcessInfos (self);
	};
};
var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;
func void B_Quarhodron_Hello_KommZumPunkt ()
{
	if (DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3)
	&& (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "La sagesse tant lou�e des anc�tres est r�ellement toute-puissante.", DIA_Addon_Quarhodron_Hello_frech );
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_erdbeben_15_00"); //Ces terres sont d�vast�es par des s�ismes. Nous devons faire quelque chose, sinon cette �le toute enti�re sombrera dans la mer !
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_01"); //Il n'y a plus rien que nous puissions faire.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_02"); //La furie d'Adanos s'est abattue sur Jharkendar afin de ch�tier les infid�les.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_raven ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_00"); //Quelqu'un s'est introduit dans le temple d'Adanos.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_raven_11_01"); //Impossible. J'ai moi-m�me scell� cette porte. Nul ne peut la franchir ?
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_02"); //Vraiment ?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_tempel ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_tempel_15_00"); //Permettez-moi d'acc�der au temple d'Adanos.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_tempel_11_01"); //Le temple demeurera clos pour l'�ternit�. Ainsi en a d�cid� le conseil.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_schwert ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_schwert_15_00"); //Qu'y a-t-il � l'int�rieur du temple d'Adanos ?
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_schwert_11_01"); //Toute ma tristesse, toute ma d�ception...
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_frech ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Hello_frech_15_00"); //La sagesse tant lou�e des anc�tres est r�ellement toute-puissante.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_01"); //Nul homme de votre rang n'a � me parler ainsi.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_02"); //On ne m'�tera pas de l'id�e que vous n'�tes pas celui que vous pr�tendez �tre.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_03"); //Si vous d�sirez mon aide, vous devrez d'abord vous en montrer digne.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_04"); //R�pondez � mes questions, afin que je sois certain de ne pas me d�voiler � un �tranger.
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron ne m'aidera que si je me montre valeureux � ses yeux. Il m'a pos� des questions difficiles, auxquelles je vais devoir r�pondre avant qu'il n'accepte de m'aider."); 

	Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Fragen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Fragen		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_Fragen_Condition;
	information	 = 	DIA_Addon_Quarhodron_Fragen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Demandez toujours...";
};

func int DIA_Addon_Quarhodron_Fragen_Condition ()
{
	if (QuarhodronIstZufrieden == FALSE)
		{
			return TRUE;
		};
};

var int Quarhodrons_NextQuestion;
var int QuarhodronIstZufrieden;
var int Quarhodrons_RichtigeAntworten;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed ()
{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_00"); //Vos r�ponses incorrectes d�notent la malveillance de vos intentions.
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_01"); //Je ne vous aiderai pas.
		AI_StopProcessInfos (self);	
};

func void B_Quarhodron_Fragen_Choices ()
{
	Log_AddEntry  (TOPIC_Addon_Quarhodron," --- QUESTIONS DE QUARHODRON ---"); 

	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{
		if (Quarhodrons_NextQuestion == 1)
		&& (Quarhodrons_RichtigeAntworten == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_00"); //Je ne vous crois pas.
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_01"); //Je crois que vous ne devriez revenir ici que lorsque vous aurez d�cid� de me dire la v�rit�.
			AI_StopProcessInfos (self);
		}
		else 
		{
			if (Quarhodrons_NextQuestion == 1)
			{
				if (B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_02"); //(r�fl�chit) Les pouvoirs d'un veilleur des morts vous auraient permis de me r�veiller, cela est vrai.
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_03"); //Si vous �tes vraiment celui que vous pr�tendez �tre, vous pourrez r�pondre sans peine � mes questions.
					AI_Output (self, other, "DIA_Addon_Quarhodron_Add_11_00"); //Except�e une seule...
					
					B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
				};
				Quarhodrons_NextQuestion = 2;
			};
			
			if (Quarhodrons_NextQuestion == 7)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_04"); //Qui a scell� le portail afin de prot�ger le monde du mal ?
				Log_AddEntry  (TOPIC_Addon_Quarhodron,"Qui a scell� le portail afin de prot�ger le monde du mal�?"); 
				Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
			}
			else if (Quarhodrons_NextQuestion == 6)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_05"); //Qui soulage la souffrance et soigne les malades ?
				Log_AddEntry  (TOPIC_Addon_Quarhodron,"Qui att�nue la souffrance et soigne les malades � Jharkendar�?"); 
				Quarhodrons_NextQuestion = 7;
			}
			else if (Quarhodrons_NextQuestion == 5)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_06"); //Qui a le dernier mot au sein du Conseil des cinq ?
				Log_AddEntry  (TOPIC_Addon_Quarhodron,"Qui a le dernier mot dans le Conseil des Cinq ?"); 
				Quarhodrons_NextQuestion = 6;
			}	
			else if (Quarhodrons_NextQuestion == 4)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_07"); //Qui a d�cha�n� le mal sur nous ?
				Log_AddEntry  (TOPIC_Addon_Quarhodron,"Qui est responsable du mal qui a frapp� le peuple de Jharkendar�?"); 
				Quarhodrons_NextQuestion = 5;
			}
			else if (Quarhodrons_NextQuestion == 3)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_08"); //Qui peut me donner un ordre direct ?
				Log_AddEntry  (TOPIC_Addon_Quarhodron,"Qui peut donner un ordre direct � Quarhodron ?"); 
				Quarhodrons_NextQuestion = 4;
			}	
			else if (Quarhodrons_NextQuestion == 2)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_09"); //Qui prot�geait autrefois le peuple de Jharkendar des attaques des ennemis ?
				Log_AddEntry  (TOPIC_Addon_Quarhodron,"Qui prot�geait jadis le peuple de Jharkendar des attaques ennemies ?"); 
				Quarhodrons_NextQuestion = 3;
			};
			
			Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
			
			if (Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Je ne pouvais vraiment pas savoir cela.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			}
			else
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Je ne sais pas.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			};
			
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "La caste des �rudits.", DIA_Addon_Quarhodron_Fragen_gele );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "La caste des veilleurs des morts.", DIA_Addon_Quarhodron_Fragen_totenw );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "La caste des pr�tres.", DIA_Addon_Quarhodron_Fragen_prie );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "La caste des guerriers.", DIA_Addon_Quarhodron_Fragen_warr );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "La caste des soigneurs.", DIA_Addon_Quarhodron_Fragen_heiler );
		};
	};
};
var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info ()
{
	Quarhodrons_NextQuestion 		= 0;
	Quarhodrons_RichtigeAntworten 	= 0;
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Fragen_15_00"); //Demandez toujours...
	
	if (DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_01"); //Je suis Quarhodron, ancien seigneur de guerre de Jharkendar.
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_02"); //Vous m'avez �veill�.
		
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_03"); //A quelle caste de Jharkendar appartenez-vous ?

	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_warr ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_warr_15_00"); //La caste des guerriers.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 3)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 5)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_prie ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_prie_15_00"); //La caste des pr�tres.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 4)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_gele ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_gele_15_00"); //La caste des �rudits.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 6)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_totenw ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_totenw_15_00"); //La caste des veilleurs des morts.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_heiler ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_heiler_15_00"); //La caste des soigneurs.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 7)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_NoPlan ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_NoPlan_15_00"); //Je ne sais pas.
	
	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	&& (Quarhodrons_RichtigeAntworten >= 6) 
	{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_01"); //Bien. Je vous accorde ma confiance et vous aiderai.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
	}
	else if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{	
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_02"); //Dans ce cas, ne me faites pas perdre mon temps.
		AI_StopProcessInfos (self);	
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GibMirKey
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_GibMirKey		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_GibMirKey_Condition;
	information	 = 	DIA_Addon_Quarhodron_GibMirKey_Info;

	description	 = 	"(demander la clef du temple)";
};
func int DIA_Addon_Quarhodron_GibMirKey_Condition ()
{
	if (QuarhodronIstZufrieden == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Quarhodron_GibMirKey_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_00"); //Ecoutez-moi bien. Une personne r�ellement malveillante s'est infiltr�e dans le temple d'Adanos.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_01"); //Si vous ne me laissez pas acc�der au temple d�s maintenant, il sera vraisemblablement trop tard pour intervenir, et ce monde sera condamn�.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_02"); //C'est impossible ! A Jharkendar, seuls le grand pr�tre Khardimon et moi-m�me savons comment ouvrir la porte du temple d'Adanos.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_03"); //Eh bien... Disons que votre cher ami Khardimon semble avoir �t� un peu trop loquace.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_04"); //Je vous dis que la porte �tait ouverte. Je l'ai vue de mes yeux.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_05"); //Bien... la v�rit� r�sonne dans votre voix. Je ne douterai plus de vos paroles.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_06"); //J'ose l'esp�rer.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_07"); //Dans ce cas, prenez le mot de passe. Il est inscrit sur cette tablette de pierre. Prononcez ces mots devant la porte close du temple, et elle s'ouvrira.
	CreateInvItems (self, ItMi_TempelTorKey, 1);									
	B_GiveInvItems (self, other, ItMi_TempelTorKey, 1);		
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_08"); //(d�j� mourant) Mon temps ici s'est �coul�. Je ne peux h�las plus vous aider.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_09"); //(d�j� mourant) Mais n'oubliez pas : prenez garde aux salles du d'Adanos. Ne l'oubliez pas, car votre mort serait certaine...
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_10"); //Attendez. Que sont ces salles ?
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_11"); //(d�j� mourant) Mes forces s'estompent... adieu. Nous nous reverrons dans le royaume des morts.
	AI_StopProcessInfos (self);
	
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron m'a remis une tablette de pierre permettant d'ouvrir l'entr�e du temple d'Adanos."); 
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,"Quarhodron a parl� des 'Chambres d'Adanos', en me conseillant de m'en m�fier. Je dois vraiment d�couvrir ce dont il parlait si je ne veux pas tomber dans un pi�ge dans le temple d'Adanos."); 

	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};


