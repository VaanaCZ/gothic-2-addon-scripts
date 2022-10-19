// ************************************************************
// 			  				FIRST EXIT 
// ************************************************************

INSTANCE DIA_Xardas_FirstEXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_FirstEXIT_Condition;
	information	= DIA_Xardas_FirstEXIT_Info;
	permanent	= FALSE;
	description = "J'y vais aussi vite que possible ! (FIN)";
};
                       
FUNC INT DIA_Xardas_FirstEXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Xardas_FirstEXIT_Info()
{	
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //Je me mets en route aussi vite que possible.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //Bien. Ah, une derni�re chose�: ne dites � personne que vous m'avez parl� et surtout, pas aux magiciens.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Depuis que je vis en exil, le Cercle du feu me croit mort... Et cela me convient parfaitement.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: mu� auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
	Npc_ExchangeRoutine (self,"START");
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Xardas_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_EXIT_Condition;
	information	= DIA_Xardas_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_EXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
var int Addon_zuerst;
// ------------------------------------------------------------
instance DIA_Xardas_Hello (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 1;
	condition	= DIA_Xardas_Hello_Condition;
	information	= DIA_Xardas_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Xardas_Hello_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Xardas_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //Vous revoil� ! (souriant) Je pensais pas qu'on se reverrait un jour.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //J'ai l'impression d'avoir pass� trois semaines sous un tas de pierres.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //C'est ce qui s'est pass�. Seule la magie de votre armure vous a maintenu en vie. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //J'ai craint ne pas pouvoir vous r�cup�rer sous les d�bris du temple.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Mais assez avec �a. Vous �tes l�, maintenant.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Il y une nouvelle menace dont nous devons nous occuper.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "Nous avons tout notre temps, d�sormais. Le dormeur a �t� vaincu.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "De quelle nouvelle menace parlez-vous maintenant ?!", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //Vous devez vous allier � eux ! C'est le seul moyen d'arr�ter B�liar.
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Au moins, nous avons le temps, maintenant. J'ai r�ussi. Le Dormeur...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //... a �t� banni. Vous l'avez vaincu, c'est vrai, mais nous n'avons pas le pouvoir d'emp�cher la guerre qui nous attend d�sormais.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //L'ultime cri de rage du Dormeur a mis en branle les arm�es des t�n�bres.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //Ce cri �tait un ordre lanc� � toutes les cr�atures du Mal, un mot de pouvoir auquel ils �taient oblig�s d'ob�ir.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Il avait pour signification�: VENEZ�! Et tous sont venus, m�me les dragons.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //(stup�fait) Des dragons�?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Ce sont des cr�atures aussi puissantes qu'anciennes. Je sens leur pouvoir, m�me ici...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Et ils ont r�uni une v�ritable arm�e de serviteurs autour d'eux.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //O� se trouve cette arm�e, d�sormais�?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //Elle campe non loin d'ici, dans la Vall�e des mines, proche de Khorinis, et elle se pr�pare � attaquer.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //(pensif) Il ne nous reste gu�re de temps.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Mais �a n'est pas tout. Il a encore une autre menace dont j'ai r�cemment entendu parler.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "De quelle autre menace parlez-vous maintenant ?!", DIA_Addon_Xardas_Hello_Man );
	};
};
	
///////////////////////////////////////////////////////////////////////
//	Info AWAY
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_AWAY (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_AWAY_Condition;
	information	 = 	DIA_Xardas_AWAY_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Alors sortons vite d'ici !";
};

func int DIA_Xardas_AWAY_Condition ()
{	
	if (!Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (!Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info ()
{
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //Dans ce cas, il faut partir sans perdre un instant�!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //M�me si nous fuyons maintenant, il nous faudra affronter les dragons plus tard.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //Avec l'aide des soldats et des magiciens de la r�gion, nous pouvons les vaincre avant que leur arm�e ne soit totalement constitu�e.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //Nous n'aurons jamais de meilleure chance.
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_TODO (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	1;
	condition	 = 	DIA_Xardas_TODO_Condition;
	information	 = 	DIA_Xardas_TODO_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Que faisons-nous maintenant ?";
};

func int DIA_Xardas_TODO_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info ()
{
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //Que pouvons-nous faire�?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Cette fois-ci, nous ne pouvons pas nous en charger nous-m�mes. Seul le pouvoir d'Innos pourra nous aider contre ces dragons.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //Un groupe de paladins est post� non loin d'ici, dans la ville de Khorinis.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //Ils d�tiennent un puissant artefact qui pourrait nous aider � vaincre les dragons.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //On l'appelle l'�il d'Innos. Il faut nous le ramener.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Expliquez aux paladins la menace � laquelle nous devons faire face. Vous devez absolument convaincre leur chef de nous aider.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //Une fois que vous lui aurez parl�, vous devrez trouver l'artefact de B�liar.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //C'est la contrepartie de l'�il d'Innos. Il ne doit pas tomber entre les mains du Mal.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"Un groupe de paladins campe hors de la ville de Khorinis. Ils d�tiennent un puissant artefact : l'�il d'Innos. Ses pouvoirs devraient nous aider � contrer la menace des dragons. Je dois convaincre les paladins de se rallier � notre cause."); 
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlate
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Xardas_StonePlate		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Xardas_StonePlate_Condition;
	information	 = 	DIA_Addon_Xardas_StonePlate_Info;

	description	 = 	"Vous savez quelque chose sur cette tablette de pierre ?";
};
func int DIA_Addon_Xardas_StonePlate_Condition ()
{
	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Xardas_StonePlate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //Vous savez quelque chose sur cette tablette de pierre ?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der H�hlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //J'ai d'abord pens� qu'il s'agissait d'un objet magique mais je suis arriv� � la conclusion qu'elle n'avait pas grand sens.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //Je n'ai pas r�ussi � d�chiffrer enti�rement le sens de cette tablette, mais elle semble �tre en rapport avec une culture tr�s ancienne.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //Si vous la voulez, prenez-la. Elle ne me sert � rien.

	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// ***														***
// 						Addon Report
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Portal entdeckt
// ------------------------------------------------------------
instance DIA_Addon_Xardas_Portal (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_Portal_Condition;
	information	= DIA_Addon_Xardas_Portal_Info;

	description	= "Les Mages de l'eau ont d�couvert un portail menant � une partie inconnue de l'�le.";
};

func int DIA_Addon_Xardas_Portal_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_WhatsOrnament))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //Les Mages de l'eau ont d�couvert un portail menant � une partie inconnue de l'�le.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //Int�ressant
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //D�s que vous aurez trouv� quelque chose de vraiment utile, faites-le moi savoir !
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //L'artefact de B�liar pourrait bien �tre cach� quelque part l�-bas. Trouvez-le !
};

// ------------------------------------------------------------
// 						Nochmal wegen Portal
// ------------------------------------------------------------
instance DIA_Addon_Xardas_PortalAgain (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_PortalAgain_Condition;
	information	= DIA_Addon_Xardas_PortalAgain_Info;
	permanent 	= TRUE;
	description	= "� propos de cette partie inconnue de l'�le�";
};

func int DIA_Addon_Xardas_PortalAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Xardas_Portal))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //� propos de cette partie inconnue de l'�le
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //Ne m'ennuyez pas avec les d�tails. Ne revenez que si vous avez trouv� quelque chose de vraiment int�ressant.
};

// ------------------------------------------------------------
// 						Addon Success
// ------------------------------------------------------------
instance DIA_Addon_Xardas_AddonSuccess (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_AddonSuccess_Condition;
	information	= DIA_Addon_Xardas_AddonSuccess_Info;

	description	= "J'ai explor� la partie inconnue de l'�le�";
};

func int DIA_Addon_Xardas_AddonSuccess_Condition ()
{
	if (C_SCHasBeliarsWeapon())
	|| (Saturas_KlaueInsMeer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //J'ai explor� la partie inconnue de l'�le
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //Et qu'avez-vous trouv� ?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //Il �tait question d'un artefact puissant. La Griffe de B�liar.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //La Griffe de B�liar ?! O� est-elle ? Vous l'avez sur vous ?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Oui. La voil�.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //(avide) Comme c'est int�ressant.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Cette arme peut nous �tre tr�s utile. Mais elle est aussi extr�mement dangereuse.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //Faites bien attention � vous ! Et surtout : ne la perdez pas !
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //Je ne l'ai plus
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //Je l'ai donn�e aux Mages de l'eau pour qu'ils la jettent � la mer
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //(d�cha�n�) �tes-vous malade ? Avez-vous la moindre id�e de ce que vous avez donn� ?
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //Cette arme aurait pu nous �tre tr�s utile !
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //Je pense que c'est mieux ainsi.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //(soupire) Les voies des dieux sont imp�n�trables
	};
};

// --------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_WEAPON (C_INFO)		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_WEAPON_Condition;
	information	 = 	DIA_Xardas_WEAPON_Info;
	Permanent 	 =  FALSE;
	description	 = 	"J'ai besoin d'armes.";
};

func int DIA_Xardas_WEAPON_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //J'ai besoin d'armes.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //Je ne peux vous donner que ce que je poss�de.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Regardez ce que vous trouvez dans ma tour et prenez tout ce qui pourra vous �tre utile.
};


///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ARTEFAKT (C_INFO)	//E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_ARTEFAKT_Condition;
	information	 = 	DIA_Xardas_ARTEFAKT_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Qu'est-ce exactement l'�il d'Innos ?";
};

func int DIA_Xardas_ARTEFAKT_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //Qu'est-ce que l'�il d'Innos, au juste�?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //C'est une amulette. Selon la l�gende, Innos lui aurait transmis une partie de son pouvoir.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Elle vous rendra votre force perdue et nous aidera � vaincre les dragons.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //Elle poss�de �galement des pouvoirs secrets, dont je vous parlerai une fois que vous vous la serez procur�e.
};

///////////////////////////////////////////////////////////////////////
//	Info PALADIN
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PALADIN	(C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	3;
	condition	 = 	DIA_Xardas_PALADIN_Condition;
	information	 = 	DIA_Xardas_PALADIN_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Pourquoi les paladins me donneraient-ils l'�il d'Innos ?";
};
func int DIA_Xardas_PALADIN_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_PALADIN_Info ()
{
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //Pourquoi les paladins accepteraient-ils de me remettre l'�il d'Innos�?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Parce que vous �tes destin� � la porter.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //Comment pouvez-vous en �tre s�r�?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //Plusieurs raisons me poussent le croire, la principale �tant que vous avez triomph� du Dormeur. Si les dieux n'�taient pas de votre c�t�, vous ne seriez pas l� � me parler.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //Imaginons que vous ayez raison et que je sois destin� � porter l'�il d'Innos. Comment les paladins peuvent-ils savoir que c'est le cas�?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //C'est l'�il lui-m�me qui choisit qui a le droit de le porter. Une fois que vous vous en serez empar� et que vous l'aurez pass� autour de votre cou, les paladins ne pourront plus douter de la v�racit� de vos dires.
};
///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Khorinis (C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	4;
	condition	 = 	DIA_Xardas_Khorinis_Condition;
	information	 = 	DIA_Xardas_Khorinis_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Comment puis-je aller en ville ?";
};
func int DIA_Xardas_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Lothar.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //Comment puis-je me rendre en ville�?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //Suivez la route qui traverse les montagnes. La ville est grande, vous ne pouvez pas la rater.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //Mais attention, car la route qui y m�ne n'est pas sans danger et vous n'�tes plus aussi fort qu'autrefois...
};
// ************************************************************
// 			  		Zum zweiten Mal bei Xardas
// ************************************************************

instance DIA_Xardas_WhereEx (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	6;
	condition	 = 	DIA_Xardas_WhereEx_Condition;
	information	 = 	DIA_Xardas_WhereEx_Info;
	permanent	 = 	FALSE;
	description	 = 	"O� sommes-nous exactement ?";
};

func int DIA_Xardas_WhereEx_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //O� sommes-nous au juste�?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //A proximit� de la ville de Khorinis, comme je vous l'ai d�j� dit.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //C'est ici que j'ai reconstruit ma tour.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Mais nous nous sommes vus il y a quelques jours � peine dans la Vall�e des mines...
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //Les serviteurs que j'ai convoqu�s pour b�tir ma tour ont fait de l'excellent travail.
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //�a, c'est s�r�!
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"O� puis-je trouver un meilleur �quipement ?";
};

func int DIA_Xardas_EQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_WEAPON))
	&& (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //O� puis-je me procurer un meilleur �quipement�?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //L'endroit le plus proche o� trouver armes et armures de meilleure qualit� est la ville de Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Sinon, dans la vall�e, vous pouvez cueillir des plantes curatives qui vous aideront si vous �tes bless� au combat.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Vous voyez le lac qui s'�tend au pied de ma tour�? Un passage secret le relie � la vall�e.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTLESTER
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ABOUTLESTER		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_ABOUTLESTER_Condition;
	information	 = 	DIA_Xardas_ABOUTLESTER_Info;
	permanent	 = 	FALSE;
	description	 = 	"Avez-vous d�j� parl� � Lester ?";
};
func int DIA_Xardas_ABOUTLESTER_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	&& (Npc_GetDistToWP  (Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)) 
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_ABOUTLESTER_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //Avez-vous parl� � Lester�?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Oui, je l'ai bombard� de questions. Il m'a beaucoup appris, mais il est �puis�.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //C'est un miracle qu'il ait surv�cu � sa fuite. Je l'ai envoy� se reposer.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //Que vous a-t-il dit�?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Rien de bon, j'en ai bien peur. Il a vu non seulement un dragon, mais aussi des hommes encapuchonn�s et rev�tus d'un long manteau noir.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //Et ?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Si ces hommes existent vraiment, il est possible qu'ils constituent une menace.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //Et cela ne me pla�t pas. Tenez, prenez mon anneau. Il vous prot�gera de la magie.
	
	B_GiveInvItems (self, other, ItRi_Prot_Mage_01,1);
	B_GivePlayerXP		(XP_Ambient);

};

// *************************************************************
// -------------------------------------------------------------
//						NACH erstem Exit !!!
// -------------------------------------------------------------
// ************************************************************				//x

///////////////////////////////////////////////////////////////////////
//	Bei Paladinen gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_FirstPal		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	10;
	condition	 = 	DIA_Xardas_FirstPal_Condition;
	information	 = 	DIA_Xardas_FirstPal_Info;
	permanent	 = 	FALSE;
	description	 = 	"Je suis all� en ville...";
};
func int DIA_Xardas_FirstPal_Condition ()
{	
	if (Lothar.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Xardas_FirstPal_Info ()
{
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //Je suis all� en ville.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //Et�? Avez-vous eu la possibilit� de parler au chef des paladins�?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //Je n'ai pas eu le droit de le voir.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //C'est ridicule�! Il doit bien exister le moyen d'arriver jusqu'� lui.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Si rien d'autre ne marche, entrez au monast�re et devenez magicien.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Il s'agit certes l� d'une d�cision douteuse sur le plan moral mais, au moins, elle vous permettra d'atteindre le but recherch�.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Si vous �tiez magicien, il n'aurait d'autre choix que d'accepter de vous recevoir.
};

///////////////////////////////////////////////////////////////////////
//	Info Weiter (Perm)
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Weiter		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	99;
	condition	 = 	DIA_Xardas_Weiter_Condition;
	information	 = 	DIA_Xardas_Weiter_Info;
	permanent	 = 	TRUE;
	description	 = 	"Alors, que devrions nous faire maintenant ?";
};
func int DIA_Xardas_Weiter_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_Weiter_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //Alors, que faire maintenant�?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Nous allons continuer comme pr�vu. Il n'y a rien d'autre � faire.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Procurez-vous l'�il d'Innos pendant que je continue de chercher des r�ponses.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "Pourquoi est-ce que le Cercle du feu ne doit pas �tre au courant pour vous ?";
};                       

FUNC INT DIA_Xardas_KdfSecret_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Xardas_KdfSecret_Info()
{	
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//Pourquoi le Cercle du feu ne doit-il rien savoir � votre sujet ?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//J'�tais autrefois un membre �minent du Cercle. Et d�j�, � l'�poque, je pensais que la magie des d�mons �tait la clef de la barri�re magique.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Mais je n'ai pas r�ussi � convaincre les autres membres du Cercle de me suivre sur cette voie.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Je les ai donc quitt�s afin d'�tudier la magie noire.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //C'est l� un crime que les... (m�prisant) bons et vertueux Magiciens du feu... les fid�les d'Innos, comme ils s'appellent, jugent inexcusable.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Ils savent que je suis encore en vie mais ignorent o� me chercher... et c'est tant mieux.
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

INSTANCE DIA_Xardas_KAP3_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP3_EXIT_Condition;
	information	= DIA_Xardas_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BACKFROMOW		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	31;
	condition	 = 	DIA_Xardas_BACKFROMOW_Condition;
	information	 = 	DIA_Xardas_BACKFROMOW_Info;

	description	 = 	"Je reviens de la Vall�e des mines.";
};

func int DIA_Xardas_BACKFROMOW_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //Je reviens de la Vall�e des mines.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //Pas trop t�t�! Qu'avez-vous vu�?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //Vous aviez raison. La r�gion a �t� envahie par l'arm�e ennemie.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Les orques assi�gent le ch�teau et les dragons ont tout d�vast�.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Si je ne m'abuse, il ne faudra pas longtemps avant que Khorinis se retrouve attaqu�.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DmtSindDa
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_DMTSINDDA		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	32;
	condition	 = 	DIA_Xardas_DMTSINDDA_Condition;
	information	 = 	DIA_Xardas_DMTSINDDA_Info;

	description	 = 	"Que diable s'est-il pass� ici pendant mon absence ?";
};

func int DIA_Xardas_DMTSINDDA_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_KnowsInfo(other, DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info ()
{

 	if (Npc_KnowsInfo(other, DIA_Lester_BACKINTOWN))
	{
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //Lester m'a dit que vous vouliez me voir au plus vite.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //Qu'est-il arriv� ici depuis�?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //L'ennemi a appris qui vous �tes et sait que vous cherchez � mettre la main sur l'�il d'Innos.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //La menace que vous repr�sentez l'a forc� � se d�couvrir et � nous attaquer ouvertement.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Le temps des faux-semblants est r�volu. Hier, nous ignorions quelle forme l'attaque adverse allait prendre, mais aujourd'hui, ce n'est que trop �vident.

	B_LogEntry (TOPIC_INNOSEYE, "L'ennemi a d�couvert que je cherchais l'�il d'Innos. Il est temps que je mette la main dessus avant qu'il ne soit trop tard.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "J'ai �t� attaqu� par des magiciens en robe noire.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "J'ai enfin mis la main sur la preuve que voulait le seigneur Hagen.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //J'ai �t� attaqu� par des magiciens en robe noire.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //L'ennemi a de multiples visages. Les Traqueurs sont l'une de ses facettes. En r�alit�, ils sont l� pour pr�parer le terrain � notre v�ritable adversaire.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Ils se sont post�s en divers endroits strat�giques et n'attendent plus que l'occasion de refermer les m�choires de leur pi�ge.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Restez loin d'eux, car ce sont de puissantes cr�atures magiques qui feront tout pour entraver votre progression.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas conna�t les hommes en noir. Il semble que les Traqueurs tirent les ficelles des troupes ennemies. Ils sont tr�s dangereux."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //J'ai enfin la preuve exig�e par le seigneur Hagen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //De quelle preuve s'agit-il�?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //J'ai re�u une lettre de Garond, le commandant des paladins de la Vall�e des mines. Il y demande des renforts.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //Bien jou�! Cela devrait suffire � convaincre ce vieux cheval de guerre.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Quelle va �tre la prochaine �tape ?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //Que faut-il faire maintenant�?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Apporter la lettre de Garond au seigneur Hagen afin qu'il vous permette d'acc�der � l'�il d'Innos.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Cela fait, rendez-vous au monast�re et parlez � Pyrokar. Il faut absolument qu'il vous remette l'�il.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Vous devez mettre l'artefact � l'abri. Rien n'a davantage d'importance.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //Allez, avant qu'il ne soit trop tard. Car l'ennemi aussi va chercher � s'en emparer.
	B_LogEntry (TOPIC_INNOSEYE, "L'�il est au monast�re des Magiciens du feu. Heureusement, le seigneur Hagen me permettra d'y avoir acc�s quand je lui aurai remis le message du seigneur Garond. Pyrokar, le Grand Magicien du feu, ne me laissera pas approcher de l'amulette sans l'accord de Hagen.");
};

///////////////////////////////////////////////////////////////////////
//	Info InnosEyeBroken
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_INNOSEYEBROKEN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	33;
	condition	 = 	DIA_Xardas_INNOSEYEBROKEN_Condition;
	information	 = 	DIA_Xardas_INNOSEYEBROKEN_Info;

	description	 = 	"L'�il d'Innos a �t� d�truit.";
};

func int DIA_Xardas_INNOSEYEBROKEN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Xardas_DMTSINDDA))
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //L'�il d'Innos a �t� d�truit.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //Que dites-vous�? D�truit�?
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //Je l'ai retrouv� dans la for�t du nord. Malheureusement, je n'ai pu qu'en r�cup�rer les fragments.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //C'�tait notre seule chance de tenir t�te aux dragons et il n'est plus. Nous avons �chou�.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "Et maintenant ?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //Et maintenant�?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //C'est un coup terrible, mais il nous faut redresser la t�te. Je vais me retirer afin de r�fl�chir � la question.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //De votre c�t�, allez en ville et parlez � Vatras, le Mage de l'eau. Peut-�tre sait-il ce qu'il convient de faire...

	B_LogEntry (TOPIC_INNOSEYE, "Xardas n'�tait pas tr�s heureux d'apprendre la destruction de l'�il d�Innos. Le Magicien des eaux, Vatras, de la cit� de Khorinis, semble �tre notre seul espoir.");

	MIS_Xardas_GoToVatrasInnoseye = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info RitualRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RITUALREQUEST		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_RITUALREQUEST_Condition;
	information	 = 	DIA_Xardas_RITUALREQUEST_Info;

	description	 = 	"Vatras m'envoie.";
};

func int DIA_Xardas_RITUALREQUEST_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Xardas_INNOSEYEBROKEN))
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RITUALREQUEST_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //Vatras m'envoie vous voir.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //Excellent�! Et qu'a-t-il dit�?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Il a parl� d'un rituel d'inversion au Cercle du soleil.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //(�clate de rire) Le vieux diable�! Je crois savoir ce qu'il mijote. Il vous a envoy� � moi afin que j'aille le trouver.
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //On le dirait bien. Quand comptez-vous y aller�?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //Je me mets en route imm�diatement car il ne faut pas le faire attendre. Pour votre part, menez � bien les t�ches que je vous ai confi�es et venez me rejoindre.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas a accept� de venir au rituel du Cercle du soleil.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Je ne prendrai part au rituel que quand j'aurai la certitude que vous �tes pr�t � affronter les dragons.
	};	
	B_GivePlayerXP (XP_Ambient);

};


///////////////////////////////////////////////////////////////////////
//	Info warumnichtjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WARUMNICHTJETZT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_WARUMNICHTJETZT_Condition;
	information	 = 	DIA_Xardas_WARUMNICHTJETZT_Info;

	description	 = 	"Pourquoi ne pas aller voir Vatras TOUT DE SUITE ?";
};

func int DIA_Xardas_WARUMNICHTJETZT_Condition ()
{
	if  (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&&	(Xardas_GoesToRitualInnosEye == FALSE)
	&& 	((hero.guild == GIL_MIL)
	|| 	 (hero.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //Pourquoi n'allez-vous pas le voir tout de suite�?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //Parfois, je ne vous comprends pas...
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //(irrit�) Ne me parlez pas sur ce ton�! Si je n'avais pas �t� l�, votre d�pouille serait en train de se d�composer dans le temple.

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Oubliez �a. Contentez-vous de me dire ce que j'ai besoin de savoir.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Alors, expliquez-moi au moins pourquoi vous h�sitez.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Expliquez-moi au moins pourquoi vous h�sitez.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Depuis que j'ai quitt� les Magiciens du feu, je me suis efforc� de me tenir � l'�cart d'eux.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //Et je n'ai pas l'intention que cela change, sauf si je n'ai pas le choix.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Toutefois, avant de m'exposer � leurs reproches, je tiens � m'assurer que vous aurez une chance, fut-elle infime, contre les dragons.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //Mais vous n'irez pas loin avec votre �quipement miteux. Revenez me voir quand vous serez assez fort.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Laissez tomber. Dites-moi juste ce que je dois faire.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Vous �tes encore trop faible pour affronter les dragons. Vous n'avez pas la moindre chance avec un �quipement aussi path�tique.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //Ne revenez pas tant que vous ne serez pas mieux pr�par�. Alors, seulement, j'irai voir Vatras.
 	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bereit
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BEREIT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	condition	 = 	DIA_Xardas_BEREIT_Condition;
	information	 = 	DIA_Xardas_BEREIT_Info;

	description	 = 	"Je suis pr�t � affronter les dragons.";
};

func int DIA_Xardas_BEREIT_Condition ()
{
	if  (Xardas_GoesToRitualInnosEye == FALSE)
	&& 	(Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))	
	&&	((hero.guild == GIL_DJG)
	||   (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Je suis pr�t � affronter les dragons.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //Dans ce cas, il n'y a plus une seconde � perdre. Je pars rejoindre le Cercle du soleil sans attendre. Quant � vous, menez � bien les t�ches qui vous incombent et retrouvez-moi l�-bas.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas a accept� de venir au rituel du Cercle du soleil.");
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair"); 
	Xardas_GoesToRitualInnosEye = TRUE; 
};

///////////////////////////////////////////////////////////////////////
//	Info bingespannt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BINGESPANNT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	35;
	condition	 = 	DIA_Xardas_BINGESPANNT_Condition;
	information	 = 	DIA_Xardas_BINGESPANNT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Est-ce que le rituel de r�version va marcher ?";
};

func int DIA_Xardas_BINGESPANNT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		&& 	(Xardas_GoesToRitualInnosEye == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_BINGESPANNT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //Le rituel d'inversion fonctionnera-t-il�?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //Impossible d'en avoir la certitude. Tout d�pend de ce que Vatras a l'intention de faire.
};

///////////////////////////////////////////////////////////////////////
//	Info PyroWillNicht
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PYROWILLNICHT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	37;
	condition	 = 	DIA_Xardas_PYROWILLNICHT_Condition;
	information	 = 	DIA_Xardas_PYROWILLNICHT_Info;

	description	 = 	"Pyrokar refuse de venir au rituel.";
};

func int DIA_Xardas_PYROWILLNICHT_Condition ()
{
	if (Pyrokar_DeniesInnosEyeRitual == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Xardas_PYROWILLNICHT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //Pyrokar refuse de venir prendre part au rituel.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //Il veut d'abord la preuve qu'il peut vous faire confiance.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //Vraiment�? Pyrokar�? Voil� qui ne manque pas d'int�r�t...
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Ce vieux fou va tout faire pour nous causer des ennuis. Mais je crois avoir quelque chose qui devrait vous �tre utile...
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Quand j'ai quitt� l'ordre des Magiciens du feu, j'ai pris quelques objets du monast�re avec moi.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich st�ndig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen k�nnte - Satz ist eh �berfl�ssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //Mais je ne voulais pas qu'un groupe de paladins et de Magiciens du feu retournent ma tour de fond en comble et les retrouvent.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Alors, je les ai cach�s en divers endroits o� je sais que nul n'ira jamais les chercher.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //O� �a�?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //Certains de ces objets sont enferm�s dans un coffre qui se trouve dans la ferme de S�kob.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //Vous faites confiance � ce S�kob�?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //Non, mais il est possible de l'acheter et il ne pose pas de question. Et puis, le coffre est ferm� � clef. Tenez, en voici justement la clef.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Il y a un tr�s vieux livre � l'int�rieur. Quand Pyrokar le verra, il saura qu'il vient de moi.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //Cet ouvrage ne m'est plus d'aucune utilit�. Comme cela, il me servira une ultime fois...
	B_LogEntry (TOPIC_INNOSEYE, "Xardas m'a donn� la clef d'un coffre de la ferme de S�kob. Je dois rapporter le livre qui s'y trouve � Pyrokar.");
};


///////////////////////////////////////////////////////////////////////
//	Info RitualInnosEyeRepairImportant
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RitualInnosEyeRepairImportant		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important	 = 	TRUE;

};

func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info ()
{
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //Maintenant que l'�il d'Innos a �t� reconstitu�, il faut affronter les dragons.
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //Tous servent B�liar, le dieu des t�n�bres.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Mais ils sont forc�ment contr�l�s par une puissance terrestre, j'en ai acquis la conviction.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //D�couvrez quelle est la source de leur pouvoir.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //Revenez me voir d�s que vous le saurez.
	
	Info_ClearChoices	(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice	(DIA_Xardas_RitualInnosEyeRepairImportant, DIALOG_ENDE, DIA_Xardas_RitualInnosEyeRepairImportant_weiter );

};		

 func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
 {
	AI_StopProcessInfos (self);
	B_StartOtherRoutine (Xardas,"Start");
  	B_StartOtherRoutine	(Vatras,"Start");

 };

///////////////////////////////////////////////////////////////////////
//	Info wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WASNUN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_WASNUN_Condition;
	information	 = 	DIA_Xardas_WASNUN_Info;
	permanent	 = 	TRUE;

	description	 = 	"L'�il d'Innos est gu�ri. Et maintenant ?";
};

func int DIA_Xardas_WASNUN_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //L'�il d'Innos a �t� reconstitu�. Et maintenant�?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //N'oubliez pas de le porter quand vous affronterez enfin les dragons.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //Ne perdez pas de temps. Allez � la Vall�e des mines et tuez les dragons.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //Allez voir Pyrokar et demandez-lui de vous expliquer comment utiliser l'�il.
	};
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

INSTANCE DIA_Xardas_KAP4_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP4_EXIT_Condition;
	information	= DIA_Xardas_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PERM4		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	40;
	condition	 = 	DIA_Xardas_PERM4_Condition;
	information	 = 	DIA_Xardas_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Quoi de neuf ?";
};

func int DIA_Xardas_PERM4_Condition ()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PERM4_15_00"); //Quoi de neuf ?
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //Les Traqueurs ne sont pas encore partis. Ils ne conna�tront pas le repos tant qu'ils ne vous auront pas rattrap�.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Tuez les dragons de la Vall�e des mines et d�couvrez qui est derri�re ces attaques, sans quoi notre ennemi reconstituera son arm�e.

};


//#####################################################################
//##
//##
//##							KAPITEL 5 //Xardas ist weg!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP5_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP5_EXIT_Condition;
	information	= DIA_Xardas_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6 //Xardas ist auf der Dracheninsel ->neue Instanz!!!
//##
//##
//#####################################################################



INSTANCE DIA_Xardas_KAP6_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP6_EXIT_Condition;
	information	= DIA_Xardas_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



























































