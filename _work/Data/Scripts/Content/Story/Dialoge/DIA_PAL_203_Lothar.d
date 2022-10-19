// ***************************************************************
//								EXIT
// ***************************************************************

// ---------------------
	var int Lothar_ImOV;
// ---------------------

INSTANCE DIA_Lothar_EXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lothar_EXIT_Condition()
{	
	if (Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_EXIT_Info() 
{
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							First EXIT
// ***************************************************************

INSTANCE DIA_Lothar_FirstEXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent   = TRUE;
	description = "Je dois y aller ! (FIN)";
};
FUNC INT DIA_Lothar_FirstEXIT_Condition()
{	
	if (Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_FirstEXIT_Info() 
{
	AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_00"); //Il faut que j'y aille�!
	if (Lothar_Regeln == FALSE)
	{
		AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_01"); //Attendez�! Vous ne connaissez pas encore les lois de la ville�!
		AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_02"); //�a attendra.
	}
	else
	{
		if (Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_03"); //Si j'entends dire encore une fois que vous racontez partout qu'il y a des dragons � proximit�, vous aurez de gros ennuis, c'est clair�?
		}
		else
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_04"); //Tant que vous serez � Khorinis, vous ne risquerez rien.

			if (hero.guild != GIL_PAL)
			{
				AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_05"); //Les paladins du roi montent la garde en ville depuis quelque temps.
			};
		};

		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine (self, "START");
	};

	// ------- Canthars TA auswechseln -------
	if (Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine (Canthar, "START");
		Canthar_InStadt = TRUE;
	};

	AI_StopProcessInfos (self);
};


// ***************************************************************
//							Hallo
// ***************************************************************

instance DIA_Lothar_Hallo (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Hallo_Condition;
	information	 = 	DIA_Lothar_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lothar_Hallo_Condition ()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lothar_Hallo_01_00"); //Halte, �tranger�!

	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Hallo_01_01"); //Je ne vous ai pas vu entrer par cette porte.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_02"); //Et ?
		AI_Output (self, other, "DIA_Lothar_Hallo_01_03"); //Et les gardes de l'autre porte ont ordre de ne laisser entrer le moindre inconnu.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_04"); //Eh bien...
		AI_Output (self, other, "DIA_Lothar_Hallo_01_05"); //Je vais leur dire deux mots � ceux-l�!
		AI_Output (self, other, "DIA_Lothar_Hallo_01_06"); //Mais avant cela, � nous...
	};

	AI_Output (self, other, "DIA_Lothar_Hallo_01_07"); //Je suis Lothar, paladin du roi et humble serviteur de notre seigneur Innos.
	AI_Output (self, other, "DIA_Lothar_Hallo_01_08"); //Notre commandant, le seigneur Hagen, m'a confi� la t�che de m'entretenir avec tous les nouveaux venus afin de leur expliquer les nouvelles lois qui s'appliquent � tous les habitants de notre ville.

	//ADDON>
	AI_Output (self, other, "DIA_Addon_Lothar_Hallo_01_00"); //Depuis que des gens ont commenc� � dispara�tre dans toute la ville, chacun doit faire attention � ne pas subir le m�me sort.
	//ADDON<

	if Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	{
		B_StartOtherRoutine (Lester, "XARDAS");
	};
};

// ***************************************************************
//						Wichtige Nachricht			E1
// ***************************************************************
instance DIA_Lothar_MESSAGE		(C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_MESSAGE_Condition;
	information	 = 	DIA_Lothar_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"J'ai un message important pour le chef des paladins !";
};
func int DIA_Lothar_MESSAGE_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_MESSAGE_Info ()
{
 	AI_Output (other, self, "DIA_Lothar_MESSAGE_15_00"); //J'ai un message important � d�livrer au chef des paladins.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_01"); //L'honorable seigneur Hagen ne re�oit personne.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_02"); //Le seigneur Andr�, commandant de la garde, est responsable de tout ce qui a trait au peuple.
};	

// ***************************************************************
//							Auge Innos 				E2
// ***************************************************************
instance DIA_Lothar_EyeInnos (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_EyeInnos_Condition;
	information	 = 	DIA_Lothar_EyeInnos_Info;
	permanent    =  FALSE;
	description	 = 	"Je suis venu prendre l'�il d'Innos !";
};
func int DIA_Lothar_EyeInnos_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_EyeInnos_Info ()
{
	AI_Output (other, self, "DIA_Lothar_EyeInnos_15_00"); //Je viens chercher l'�il d'Innos !

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_01"); //L'�il concerne le seigneur Hagen. C'est avec lui qu'il faut en parler.
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_02"); //L'�il sacr� d'Innos ! Comment en avez-vous entendu parler ? Vous ne faites pas partie de notre ordre !
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_03"); //Un magicien m'en a parl�.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_04"); //J'ignore pour quelle raison il vous a r�v�l� l'un des secrets de notre ordre...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_05"); //... mais il me para�t clair qu'il ne voulait pas dire que vous deviez mettre la main dessus.
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_06"); //Mais...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_07"); //Je ne veux plus rien entendre � ce sujet�!
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output (self, other, "DIA_Lothar_EyeInnos_01_08"); //D'abord, ces contes de f�es au sujet de vos dragons, et maintenant, ceci... C'est incroyable�!
		};
	};
};	

// ***************************************************************
//							Drachen 				E2
// ***************************************************************
instance DIA_Lothar_Dragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Dragons_Condition;
	information	 = 	DIA_Lothar_Dragons_Info;
	permanent    =  FALSE;
	description	 = 	"Ecoutez, la cit� est menac�e par des dragons !";
};
func int DIA_Lothar_Dragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Dragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Dragons_15_00"); //Ecoutez, la ville est menac�e par les dragons�!
	if ((hero.guild != GIL_PAL)&&(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_01"); //Cela ne se peut�!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_02"); //Encore un fou�!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_03"); //L'agitation qui r�gne en ville est d�j� bien assez grande sans qu'un simple d'esprit fasse peur � tout le monde en racontant des histoires abracadabrantes de dragons�!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_04"); //Le dernier qui a parl� de dragons, je l'ai aussit�t jet� au cachot avant de l'envoyer � la Vall�e des mines sous bonne garde. Alors tenez votre langue.
		AI_Output (self, other, "DIA_Lothar_Dragons_01_05"); //Nous ne pouvons tol�rer les gens qui essayent de semer la panique en ville.
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_06"); //J'ai souvent entendu cela, mais c'est bien difficile � croire.
		AI_Output (self, other, "DIA_Lothar_Dragons_01_07"); //Je pr�f�rerais que vous ne l'�bruitiez pas. Nous devons �viter la panique � tout prix.
	};
	Player_TalkedAboutDragons = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_Ornament		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lothar_Ornament_Condition;
	information	 = 	DIA_Addon_Lothar_Ornament_Info;

	description	 = 	"Est-ce que vous savez quelque chose sur une cr�ature de pierre venant du cercle de pierre de la ferme de Lobart ?";
};

func int DIA_Addon_Lothar_Ornament_Condition ()
{
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //Est-ce que vous savez quelque chose sur une cr�ature de pierre venant du cercle de pierre de la ferme de Lobart ?
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //Bien s�r. Nous l'avons d�truite. C'�tait une menace pour les fermes alentours.
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //Pourquoi demandez-vous?
	
	Info_ClearChoices	(DIA_Addon_Lothar_Ornament);
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Je cherche un fragment m�tallique d'un anneau magique.", DIA_Addon_Lothar_Ornament_suche );
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Trouvez-vous cela normal?", DIA_Addon_Lothar_Ornament_normal );
};
func void DIA_Addon_Lothar_Ornament_normal ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //Trouvez-vous cela normal?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //Vous vous dire ce monstre de pierre ?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //Autant que je sache, les Mages de l'eau s'en occupent.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //Je n'y ai pas r�fl�chi. Nous avons nos travaux ici dans la ville et dans la Vall�e des mines.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //Je vois.
};

func void DIA_Addon_Lothar_Ornament_suche ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //Je cherche un fragment m�tallique d'un anneau magique.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //Il a d� se trouver quelque part pr�s du cercle de pierre de Lobart.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //Oui, il y avait quelque chose de ce genre. La cr�ature de pierre le portait. Je croyais que c'�tait une rune de magie.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //Je l'ai donn� au seigneur Hagen. Je ne sais pas s'il l'a toujours.
};

// ***************************************************************
//							WerVonDrachen 				E3
// ***************************************************************
instance DIA_Lothar_WhoDragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_WhoDragons_Condition;
	information	 = 	DIA_Lothar_WhoDragons_Info;
	permanent    =  FALSE;
	description	 = 	"Quelqu'un a d�j� signal� la pr�sence des dragons ?";
};
func int DIA_Lothar_WhoDragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Dragons))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WhoDragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WhoDragons_15_00"); //Quelqu'un vous a d�j� parl� des dragons�?
	AI_Output (self, other, "DIA_Lothar_WhoDragons_01_01"); //Oui. Un certain Diego... Enfin, il me semble.

	if ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_WhoDragons_01_02"); //(mena�ant) Je l'avais pr�venu, tout comme vous, mais ce fou a tellement insist� qu'il a fini par m'�nerver�!
	};
};	

// ***************************************************************
//							Regeln 				E1
// ***************************************************************
instance DIA_Lothar_Regeln (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_Regeln_Condition;
	information	 = 	DIA_Lothar_Regeln_Info;
	permanent    =  FALSE;
	description	 = 	"Tr�s bien, expliquez-moi les r�gles de la ville !";
};
func int DIA_Lothar_Regeln_Condition ()
{	
	return TRUE;
};
func void DIA_Lothar_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Regeln_15_00"); //(soupire) Tr�s bien, expliquez-moi les r�gles de la ville.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_01"); //Pour commencer, l'honorable seigneur Hagen et ses troupes r�sident dans le haut quartier.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_02"); //C'est pour cette raison que seuls les citoyens honorables ont le droit d'y acc�der.
	AI_Output (self ,other, "DIA_Lothar_Add_01_04"); //Deuxi�mement, l'h�tel de ville est devenu le quartier g�n�ral des paladins. Il se trouve dans le haut quartier et seuls les paladins et les membres de la milice y ont acc�s.
	AI_Output (self ,other, "DIA_Lothar_Add_01_05"); //Enfin, quiconque se retrouve accus� d'un crime doit se disculper aupr�s du commandant de la milice.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_05"); //Des questions�?
	
	Lothar_Regeln = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_MissingPeople		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lothar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Lothar_MissingPeople_Info;

	description	 = 	"Des citoyens de cette ville disparaissent purement et simplement ?";
};

func int DIA_Addon_Lothar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lothar_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //Les gens de la ville disparaissent comme �a ?
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //Oui. Il semble que chaque jour il y en a de plus en plus.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //C'est plus qu'ennuyeux que la milice n'ait pas encore r�ussi � d�couvrir ce qui se cache derri�re ces faits �tranges.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //Gu�re �tonnant que les habitants de la ville se montrent tr�s prudents avec les �trangers maintenant.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_04"); //Ne les provoquez pas quand vous �tes en ville, compris ?
	
		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};
	
	SC_HearedAboutMissingPeople = TRUE;
};

// ***************************************************************
//							HowCitizen 				E2
// ***************************************************************
instance DIA_Lothar_HowCitizen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	4;
	condition	 = 	DIA_Lothar_HowCitizen_Condition;
	information	 = 	DIA_Lothar_HowCitizen_Info;
	permanent    =  FALSE;
	description	 = 	"Et comment DEVENIR citoyen de la ville ?";
};
func int DIA_Lothar_HowCitizen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_HowCitizen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_06"); //Comment faire pour devenir citoyen�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_07"); //Il faut avoir un emploi r�gulier pour �tre consid�r� comme un citoyen.
	AI_Output (self ,other, "DIA_Lothar_Add_01_09"); //Mais je ne pense pas qu'il vous suffise de devenir citoyen pour �tre admis en pr�sence du seigneur Hagen.
	AI_Output (self ,other, "DIA_Lothar_Add_01_10"); //En tant que citoyen, vous aurez acc�s au haut quartier, mais c'est tout.
	AI_Output (self ,other, "DIA_Lothar_Add_01_11"); //Il faut �tre membre de la milice pour pouvoir entrer � l'h�tel de ville.
};

// ***************************************************************
//							WoArbeit				E3
// ***************************************************************
instance DIA_Lothar_WoArbeit (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	5;
	condition	 = 	DIA_Lothar_WoArbeit_Condition;
	information	 = 	DIA_Lothar_WoArbeit_Info;
	permanent    =  FALSE;
	description	 = 	"O� puis-je trouver du travail ?";
};
func int DIA_Lothar_WoArbeit_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_HowCitizen))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoArbeit_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_14"); //O� puis-je trouver du travail�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_15"); //Il va vous falloir devenir l'apprenti de l'un des ma�tres de la partie basse de la ville.
	AI_Output (self ,other, "DIA_Lothar_Add_01_16"); //D�s que l'un d'eux vous aura accept�, vous deviendrez citoyen.
	AI_Output (self ,other, "DIA_Lothar_Add_01_17"); //Mais les autres ma�tres doivent �galement signifier leur accord, car telle est la coutume de Khorinis.
	AI_Output (self ,other, "DIA_Lothar_Add_01_18"); //Et si vous pensiez trouver du travail dans le quartier du port, inutile de r�ver�!
	AI_Output (self ,other, "DIA_Lothar_Add_01_19"); //C'est la lie de la ville qui y r�side. N'y allez pas ou vous le regretterez.
};

// ***************************************************************
//							ToOV 				E2
// ***************************************************************
instance DIA_Lothar_ToOV (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	6;
	condition	 = 	DIA_Lothar_ToOV_Condition;
	information	 = 	DIA_Lothar_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"Comment acc�der au haut quartier ?";
};
func int DIA_Lothar_ToOV_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToOV_Info ()
{
	AI_Output (other, self, "DIA_Lothar_ToOV_15_00"); //Pouvez-vous m'indiquer comment aller au haut quartier�?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_01"); //Il vous arrive d'�couter quand on vous parle�?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_02"); //Vous n'�tes pas citoyen de la ville. Inutile de vous rendre l�-bas, les gardes ne vous laisseront pas entrer de toute fa�on.
	AI_Output (self, other, "DIA_Lothar_ToOV_01_03"); //Tout le quartier situ� derri�re la porte int�rieure vous est interdit.
};	

// ***************************************************************
//							ToMiliz 				E2
// ***************************************************************
instance DIA_Lothar_ToMiliz (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToMiliz_Condition;
	information	 = 	DIA_Lothar_ToMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"Comment puis-je �tre accept� dans la milice ?";
};
func int DIA_Lothar_ToMiliz_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToMiliz_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_26"); //Comment faire pour int�grer la milice�?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_27"); //Sur ordre expr�s du seigneur Hagen, seuls les citoyens peuvent faire partie de la milice.
		AI_Output (other, self, "DIA_Lothar_Add_15_28"); //Je vois.
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_29"); //Si vous souhaitez en savoir davantage, allez trouver le seigneur Andr� � la caserne.
};	

// ***************************************************************
//							ToPaladins 				E2
// ***************************************************************
instance DIA_Lothar_ToPaladins (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToPaladins_Condition;
	information	 = 	DIA_Lothar_ToPaladins_Info;
	permanent    =  FALSE;
	description	 = 	"Comment avoir des armures comme les v�tres ?";
};
func int DIA_Lothar_ToPaladins_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_ToMiliz))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToPaladins_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_30"); //Que dois-je faire pour avoir une armure comme la v�tre�?
	if (other.guild != GIL_MIL)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_31"); //(fulmine) Comment�? Mais vous ne faites pas partie de la milice�!
	};
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_32"); //Pire, vous n'�tes pas m�me citoyen�!
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_33"); //Dans ces conditions, comment voudriez-vous avoir le droit de porter l'armure d'un paladin�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_34"); //Seuls quelques miliciens ayant accompli des actes d'une rare bravoure se sont vus accorder cet honneur � ce jour.
	AI_Output (self ,other, "DIA_Lothar_Add_01_35"); //(strict) Si vous voulez devenir paladin, sachez que le chemin qui vous attend sera long, jeune homme�!
};	

// ***************************************************************
//							WoAndre 				E2
// ***************************************************************
instance DIA_Lothar_WoAndre (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	8;
	condition	 = 	DIA_Lothar_WoAndre_Condition;
	information	 = 	DIA_Lothar_WoAndre_Info;
	permanent    =  FALSE;
	description	 = 	"O� puis-je trouver le commandant des gardes de la ville ?";
};
func int DIA_Lothar_WoAndre_Condition ()
{	
	if ( Npc_KnowsInfo(other, DIA_Lothar_Regeln) || Npc_KnowsInfo(other, DIA_Lothar_MESSAGE) )
	&& (Andre.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoAndre_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WoAndre_15_00"); //O� puis-je trouver le commandant de la garde de la ville�?
	AI_Output (self, other, "DIA_Lothar_WoAndre_01_01"); //Le seigneur Andr� r�side � la caserne � l'autre bout de la ville.
};	

// ***************************************************************
//							Schlafen 				E2
// ***************************************************************
instance DIA_Lothar_Schlafen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	9;
	condition	 = 	DIA_Lothar_Schlafen_Condition;
	information	 = 	DIA_Lothar_Schlafen_Info;
	permanent    =  FALSE;
	description	 = 	"O� puis-je passer la nuit ?";
};
func int DIA_Lothar_Schlafen_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_22"); //O� puis-je passer la nuit, ici�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_23"); //Si vous cherchez un endroit o� dormir, allez � l'h�tel situ� en face de la caserne.
	AI_Output (self ,other, "DIA_Lothar_Add_01_24"); //Les paladins payent le g�te de tous les voyageurs qui s'arr�tent en ville.
	AI_Output (self ,other, "DIA_Lothar_Add_01_25"); //C'est �galement l� que logent les marchands itin�rants qui vendent leurs produits sur la place du march�.
};	

// ***************************************************************
//							PERM - VOR OV				
// ***************************************************************
instance DIA_Lothar_PermB4OV (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 3;
	condition	= DIA_Lothar_PermB4OV_Condition;
	information	= DIA_Lothar_PermB4OV_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
func int DIA_Lothar_PermB4OV_Condition ()
{	
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Lothar_Regeln == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PermB4OV_Info ()
{
	AI_Output (self, other, "DIA_Lothar_PermB4OV_01_00"); //Pour tout le reste, voyez le seigneur Andr�.
	AI_StopProcessInfos(self);
};	
	

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() //�berfl�sige Outputs
{
	AI_Output (other, self, "DIA_Lothar_Add_15_00"); //Mais il faut absolument que je voie le seigneur Hagen�!

	AI_Output (self ,other, "DIA_Lothar_Add_01_45"); //Je vois qu'il vous a accept� au sein de la milice.
	AI_Output (self ,other, "DIA_Lothar_Add_01_46"); //Hmm... Il doit savoir ce qu'il fait.
	
	AI_Output (other, self, "DIA_Lothar_Add_15_20"); //Combien de ma�tres y a-t-il�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_21"); //Il me semble qu'il y en a cinq au total.
		
	AI_Output (self ,other, "DIA_Lothar_Add_01_62"); //Dites, je n'ai pas �t� assez clair�? Cessez de raconter vos histoires de dragons�!
	AI_Output (other, self, "DIA_Lothar_Add_15_63"); //Mais comment avez-vous appris que...
	AI_Output (self ,other, "DIA_Lothar_Add_01_64"); //Cela ne vous regarde pas�!
	AI_Output (self ,other, "DIA_Lothar_Add_01_65"); //C'est la derni�re fois que je le tol�re, compris�?
	
	AI_Output (other, self, "DIA_Lothar_Add_15_66"); //O� puis-je trouver le commandant de la milice�?
	AI_Output (other, self, "DIA_Lothar_Add_15_08"); //Je suis d�sormais l'apprenti de l'un des ma�tres.
	
	// ------ NEWS_Modul f�r Unterstadt ------
	AI_Output (self ,other, "DIA_Lothar_Add_01_47"); //Encore vous�?

	AI_Output (self ,other, "DIA_Lothar_Add_01_43"); //Je me suis laiss� dire que vous aviez vu le seigneur Andr�...
	AI_Output (self ,other, "DIA_Lothar_Add_01_44"); //Je vous ai d�j� dit que vous ne pourriez int�grer la milice que si vous �tiez citoyen de la ville.

	AI_Output (self ,other, "DIA_Lothar_Add_01_48"); //J'ai indiqu� au seigneur Hagen que vous souhaitiez le voir.
	AI_Output (other, self, "DIA_Lothar_Add_15_49"); //Et ? Qu'a-t-il dit ?
	AI_Output (self ,other, "DIA_Lothar_Add_01_50"); //Il n'a jamais entendu parler de vous.
	AI_Output (other, self, "DIA_Lothar_Add_15_51"); //Bien s�r que non�! Vous lui avez dit pour les dragons�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_52"); //Combien de fois vous ai-je dit de ne plus en parler�?

	AI_Output (self ,other, "DIA_Lothar_Add_01_12"); //Je me suis laiss� dire que vous aviez re�u l'approbation de certains ma�tres.
	AI_Output (self ,other, "DIA_Lothar_Add_01_13"); //Vous �tes vraiment s�rieux � ce sujet, n'est-ce pas ?

	AI_Output (self ,other, "DIA_Lothar_Add_01_01"); //Vous devez ob�ir aux r�gles, comme tout le monde�!
	AI_Output (self ,other, "DIA_Lothar_Add_01_02"); //Le seigneur Hagen n'est pas disponible.
	AI_Output (self ,other, "DIA_Lothar_Add_01_03"); //Si vous avez quelque chose d'important � dire, allez trouver le seigneur Andr�. Il vous aidera.
};


// #########################################
// #########################################
		
// 				Im Oberen Viertel
		
// #########################################
// #########################################


// ***************************************************************
//								OV Regeln
// ***************************************************************
instance DIA_Lothar_HelloAgain (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_HelloAgain_Condition;
	information	 = 	DIA_Lothar_HelloAgain_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lothar_HelloAgain_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	{
		return TRUE;
	};
};
func void DIA_Lothar_HelloAgain_Info ()
{
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_00"); //Ah, encore vous...
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_01"); //Ainsi, vous avez r�ussi � entrer dans le haut quartier...
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_36"); //O� avez-vous trouv� cette robe�?
		AI_Output (other, self, "DIA_Lothar_Add_15_37"); //J'ai pass� l'Epreuve du feu.
		AI_Output (self ,other, "DIA_Lothar_Add_01_38"); //Incroyable�! Alors, ce qui s'est produit doit �tre la volont� d'Innos...
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_39"); //Vous n'avez pas rejoint les mercenaires d'Onar, si�?
		AI_Output (self ,other, "DIA_Lothar_Add_01_40"); //Comment avez-vous r�ussi � entrer ici�?
		AI_Output (other, self, "DIA_Lothar_Add_15_41"); //J'apporte une proposition de paix de la part de Lee.
		AI_Output (self ,other, "DIA_Lothar_Add_01_42"); //Bah�! Le seigneur Hagen ne voudra m�me pas en entendre parler.
	};
		
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_02"); //Il y a des r�gles que vous devez respecter ici, sans quoi vous vous retrouverez dehors plus vite que vous �tes entr�.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_03"); //Vous n'avez le droit d'entrer que dans les boutiques, pas dans les maisons particuli�res. Vous reconna�trez les �choppes � l'enseigne visible au-dessus des portes. De cette fa�on, vous ne pourrez pas vous tromper.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_04"); //Les maisons particuli�res appartiennent aux citoyens respectables et vous n'avez rien � y faire.
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV) 
	{
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_05"); //M�me si vous �tes membre de l'ordre d'Innos.
	};
	if (other.guild == GIL_MIL)
	{	
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_06"); //En tant que membre de la milice, vous avez �galement acc�s aux quartiers des paladins.
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_07"); //Mais vous continuerez de loger � la caserne.
	};
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_08"); //Les citoyens �minents de la ville r�sident dans ce quartier. Traitez-les avec respect.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_09"); //Nous nous comprenons bien�?
	AI_Output (other, self, "DIA_Lothar_HelloAgain_15_10"); //Bien s�r.
};	

// ***************************************************************
//								Hagen
// ***************************************************************
instance DIA_Lothar_Hagen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_Hagen_Condition;
	information	 = 	DIA_Lothar_Hagen_Info;
	permanent    =  TRUE;
	description  = 	"O� puis-je trouver le seigneur Hagen ?";
};
func int DIA_Lothar_Hagen_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Hagen_15_00"); //O� puis-je trouver le seigneur Hagen�?
	AI_Output (self, other, "DIA_Lothar_Hagen_01_01"); //Il se trouve � l'h�tel de ville, � l'extr�mit� du haut quartier.
	AI_Output (self, other, "DIA_Lothar_Hagen_01_02"); //Mais vous n'y serez jamais admis sans une excellente raison.
};

// ***************************************************************
//							Oldworld Running
// ***************************************************************
instance DIA_Lothar_OWRunning (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunning_Condition;
	information	 = 	DIA_Lothar_OWRunning_Info;
	permanent    =  FALSE;
	description  = 	"Je viens voir le seigneur Hagen.";
};
func int DIA_Lothar_OWRunning_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) == 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunning_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_53"); //Je suis all� voir le seigneur Hagen...
	AI_Output (self ,other, "DIA_Lothar_Add_01_54"); //Et�? Vous ne l'avez quand m�me pas importun� avec vos histoires de dragons, si�?
	AI_Output (other, self, "DIA_Lothar_Add_15_55"); //Si, justement...
	AI_Output (self ,other, "DIA_Lothar_Add_01_56"); //Dites-moi que ce n'est pas vrai...
	AI_Output (other, self, "DIA_Lothar_Add_15_57"); //Il m'a charg� de lui ramener une preuve de ce que j'avance.
	AI_Output (self ,other, "DIA_Lothar_Add_01_58"); //Dans ce cas, bonne chance�! (� lui-m�me) Quel fou�!
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							Oldworld Running UND Brief
// ***************************************************************
instance DIA_Lothar_OWRunningBrief (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunningBrief_Condition;
	information	 = 	DIA_Lothar_OWRunningBrief_Info;
	permanent    =  FALSE;
	description  = 	"J'ai la preuve ! Voici la lettre du commandant Garond !";
};
func int DIA_Lothar_OWRunningBrief_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunningBrief_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_59"); //J'ai la preuve de ce que j'avance�! Voici une lettre �crite par le commandant Garond�!
	AI_Output (self ,other, "DIA_Lothar_Add_01_60"); //Ainsi, les dragons existent bel et bien�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_61"); //Je me suis montr� injuste envers vous. Je vais prier Innos, en esp�rant qu'Il me pardonnera mon comportement � votre �gard.
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//								PERM
// ***************************************************************
instance DIA_Lothar_PERM (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_PERM_Condition;
	information	 = 	DIA_Lothar_PERM_Info;
	permanent    =  TRUE;
	description  = 	"Il s'est pass� quelque chose d'int�ressant r�cemment ?";
};
func int DIA_Lothar_PERM_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PERM_Info ()
{
	AI_Output (other, self, "DIA_Lothar_PERM_15_00"); //Il s'est pass� quelque chose de notable r�cemment�?
	if (other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_01"); //Oui. Cela faisait une �ternit� que quelqu'un comme vous n'avait pas eu le droit d'entrer ici.
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_02"); //Vous devriez le savoir mieux que quiconque. En tant que garde de la ville, vous avez pour mission de faire respecter la loi et l'ordre.
	}
	else //KdF oder NOV
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_03"); //Non.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lothar_PICKPOCKET (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 900;
	condition	= DIA_Lothar_PICKPOCKET_Condition;
	information	= DIA_Lothar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lothar_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Lothar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lothar_PICKPOCKET);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_BACK 		,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};
	
func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};





