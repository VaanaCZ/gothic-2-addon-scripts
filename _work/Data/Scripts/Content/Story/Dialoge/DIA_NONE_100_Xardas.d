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
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //Bien. Ah, une dernière chose : ne dites à personne que vous m'avez parlé et surtout, pas aux magiciens.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Depuis que je vis en exil, le Cercle du feu me croit mort... Et cela me convient parfaitement.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: muß auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
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
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //Vous revoilà ! (souriant) Je pensais pas qu'on se reverrait un jour.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //J'ai l'impression d'avoir passé trois semaines sous un tas de pierres.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //C'est ce qui s'est passé. Seule la magie de votre armure vous a maintenu en vie. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //J'ai craint ne pas pouvoir vous récupérer sous les débris du temple.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Mais assez avec ça. Vous êtes là, maintenant.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Il y une nouvelle menace dont nous devons nous occuper.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "Nous avons tout notre temps, désormais. Le dormeur a été vaincu.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "De quelle nouvelle menace parlez-vous maintenant ?!", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //Vous devez vous allier à eux ! C'est le seul moyen d'arrêter Béliar.
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Au moins, nous avons le temps, maintenant. J'ai réussi. Le Dormeur...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //... a été banni. Vous l'avez vaincu, c'est vrai, mais nous n'avons pas le pouvoir d'empêcher la guerre qui nous attend désormais.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //L'ultime cri de rage du Dormeur a mis en branle les armées des ténèbres.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //Ce cri était un ordre lancé à toutes les créatures du Mal, un mot de pouvoir auquel ils étaient obligés d'obéir.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Il avait pour signification : VENEZ ! Et tous sont venus, même les dragons.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //(stupéfait) Des dragons ?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Ce sont des créatures aussi puissantes qu'anciennes. Je sens leur pouvoir, même ici...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Et ils ont réuni une véritable armée de serviteurs autour d'eux.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //Où se trouve cette armée, désormais ?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //Elle campe non loin d'ici, dans la Vallée des mines, proche de Khorinis, et elle se prépare à attaquer.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //(pensif) Il ne nous reste guère de temps.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Mais ça n'est pas tout. Il a encore une autre menace dont j'ai récemment entendu parler.
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
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //Dans ce cas, il faut partir sans perdre un instant !
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //Même si nous fuyons maintenant, il nous faudra affronter les dragons plus tard.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //Avec l'aide des soldats et des magiciens de la région, nous pouvons les vaincre avant que leur armée ne soit totalement constituée.
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
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //Que pouvons-nous faire ?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Cette fois-ci, nous ne pouvons pas nous en charger nous-mêmes. Seul le pouvoir d'Innos pourra nous aider contre ces dragons.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //Un groupe de paladins est posté non loin d'ici, dans la ville de Khorinis.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //Ils détiennent un puissant artefact qui pourrait nous aider à vaincre les dragons.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //On l'appelle l'Œil d'Innos. Il faut nous le ramener.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Expliquez aux paladins la menace à laquelle nous devons faire face. Vous devez absolument convaincre leur chef de nous aider.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //Une fois que vous lui aurez parlé, vous devrez trouver l'artefact de Béliar.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //C'est la contrepartie de l'Œil d'Innos. Il ne doit pas tomber entre les mains du Mal.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"Un groupe de paladins campe hors de la ville de Khorinis. Ils détiennent un puissant artefact : l'Œil d'Innos. Ses pouvoirs devraient nous aider à contrer la menace des dragons. Je dois convaincre les paladins de se rallier à notre cause."); 
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
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der Höhlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //J'ai d'abord pensé qu'il s'agissait d'un objet magique mais je suis arrivé à la conclusion qu'elle n'avait pas grand sens.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //Je n'ai pas réussi à déchiffrer entièrement le sens de cette tablette, mais elle semble être en rapport avec une culture très ancienne.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //Si vous la voulez, prenez-la. Elle ne me sert à rien.

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

	description	= "Les Mages de l'eau ont découvert un portail menant à une partie inconnue de l'île.";
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
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //Les Mages de l'eau ont découvert un portail menant à une partie inconnue de l'île.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //Intéressant
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //Dès que vous aurez trouvé quelque chose de vraiment utile, faites-le moi savoir !
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //L'artefact de Béliar pourrait bien être caché quelque part là-bas. Trouvez-le !
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
	description	= "À propos de cette partie inconnue de l'île…";
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
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //À propos de cette partie inconnue de l'île
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //Ne m'ennuyez pas avec les détails. Ne revenez que si vous avez trouvé quelque chose de vraiment intéressant.
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

	description	= "J'ai exploré la partie inconnue de l'île…";
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
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //J'ai exploré la partie inconnue de l'île
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //Et qu'avez-vous trouvé ?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //Il était question d'un artefact puissant. La Griffe de Béliar.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //La Griffe de Béliar ?! Où est-elle ? Vous l'avez sur vous ?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Oui. La voilà.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //(avide) Comme c'est intéressant.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Cette arme peut nous être très utile. Mais elle est aussi extrêmement dangereuse.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //Faites bien attention à vous ! Et surtout : ne la perdez pas !
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //Je ne l'ai plus
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //Je l'ai donnée aux Mages de l'eau pour qu'ils la jettent à la mer
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //(déchaîné) Êtes-vous malade ? Avez-vous la moindre idée de ce que vous avez donné ?
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //Cette arme aurait pu nous être très utile !
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //Je pense que c'est mieux ainsi.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //(soupire) Les voies des dieux sont impénétrables
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
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //Je ne peux vous donner que ce que je possède.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Regardez ce que vous trouvez dans ma tour et prenez tout ce qui pourra vous être utile.
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
	description	 = 	"Qu'est-ce exactement l'Œil d'Innos ?";
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
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //Qu'est-ce que l'Œil d'Innos, au juste ?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //C'est une amulette. Selon la légende, Innos lui aurait transmis une partie de son pouvoir.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Elle vous rendra votre force perdue et nous aidera à vaincre les dragons.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //Elle possède également des pouvoirs secrets, dont je vous parlerai une fois que vous vous la serez procurée.
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
	description	 = 	"Pourquoi les paladins me donneraient-ils l'Œil d'Innos ?";
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
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //Pourquoi les paladins accepteraient-ils de me remettre l'Œil d'Innos ?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Parce que vous êtes destiné à la porter.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //Comment pouvez-vous en être sûr ?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //Plusieurs raisons me poussent le croire, la principale étant que vous avez triomphé du Dormeur. Si les dieux n'étaient pas de votre côté, vous ne seriez pas là à me parler.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //Imaginons que vous ayez raison et que je sois destiné à porter l'Œil d'Innos. Comment les paladins peuvent-ils savoir que c'est le cas ?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //C'est l'Œil lui-même qui choisit qui a le droit de le porter. Une fois que vous vous en serez emparé et que vous l'aurez passé autour de votre cou, les paladins ne pourront plus douter de la véracité de vos dires.
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
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //Comment puis-je me rendre en ville ?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //Suivez la route qui traverse les montagnes. La ville est grande, vous ne pouvez pas la rater.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //Mais attention, car la route qui y mène n'est pas sans danger et vous n'êtes plus aussi fort qu'autrefois...
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
	description	 = 	"Où sommes-nous exactement ?";
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
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //Où sommes-nous au juste ?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //A proximité de la ville de Khorinis, comme je vous l'ai déjà dit.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //C'est ici que j'ai reconstruit ma tour.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Mais nous nous sommes vus il y a quelques jours à peine dans la Vallée des mines...
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //Les serviteurs que j'ai convoqués pour bâtir ma tour ont fait de l'excellent travail.
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //Ça, c'est sûr !
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Où puis-je trouver un meilleur équipement ?";
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
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //Où puis-je me procurer un meilleur équipement ?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //L'endroit le plus proche où trouver armes et armures de meilleure qualité est la ville de Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Sinon, dans la vallée, vous pouvez cueillir des plantes curatives qui vous aideront si vous êtes blessé au combat.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Vous voyez le lac qui s'étend au pied de ma tour ? Un passage secret le relie à la vallée.
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
	description	 = 	"Avez-vous déjà parlé à Lester ?";
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
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //Avez-vous parlé à Lester ?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Oui, je l'ai bombardé de questions. Il m'a beaucoup appris, mais il est épuisé.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //C'est un miracle qu'il ait survécu à sa fuite. Je l'ai envoyé se reposer.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //Que vous a-t-il dit ?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Rien de bon, j'en ai bien peur. Il a vu non seulement un dragon, mais aussi des hommes encapuchonnés et revêtus d'un long manteau noir.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //Et ?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Si ces hommes existent vraiment, il est possible qu'ils constituent une menace.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //Et cela ne me plaît pas. Tenez, prenez mon anneau. Il vous protègera de la magie.
	
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
	description	 = 	"Je suis allé en ville...";
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
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //Je suis allé en ville.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //Et ? Avez-vous eu la possibilité de parler au chef des paladins ?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //Je n'ai pas eu le droit de le voir.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //C'est ridicule ! Il doit bien exister le moyen d'arriver jusqu'à lui.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Si rien d'autre ne marche, entrez au monastère et devenez magicien.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Il s'agit certes là d'une décision douteuse sur le plan moral mais, au moins, elle vous permettra d'atteindre le but recherché.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Si vous étiez magicien, il n'aurait d'autre choix que d'accepter de vous recevoir.
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
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //Alors, que faire maintenant ?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Nous allons continuer comme prévu. Il n'y a rien d'autre à faire.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Procurez-vous l'Œil d'Innos pendant que je continue de chercher des réponses.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "Pourquoi est-ce que le Cercle du feu ne doit pas être au courant pour vous ?";
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
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//Pourquoi le Cercle du feu ne doit-il rien savoir à votre sujet ?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//J'étais autrefois un membre éminent du Cercle. Et déjà, à l'époque, je pensais que la magie des démons était la clef de la barrière magique.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Mais je n'ai pas réussi à convaincre les autres membres du Cercle de me suivre sur cette voie.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Je les ai donc quittés afin d'étudier la magie noire.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //C'est là un crime que les... (méprisant) bons et vertueux Magiciens du feu... les fidèles d'Innos, comme ils s'appellent, jugent inexcusable.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Ils savent que je suis encore en vie mais ignorent où me chercher... et c'est tant mieux.
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

	description	 = 	"Je reviens de la Vallée des mines.";
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
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //Je reviens de la Vallée des mines.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //Pas trop tôt ! Qu'avez-vous vu ?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //Vous aviez raison. La région a été envahie par l'armée ennemie.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Les orques assiègent le château et les dragons ont tout dévasté.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Si je ne m'abuse, il ne faudra pas longtemps avant que Khorinis se retrouve attaqué.
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

	description	 = 	"Que diable s'est-il passé ici pendant mon absence ?";
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
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //Qu'est-il arrivé ici depuis ?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //L'ennemi a appris qui vous êtes et sait que vous cherchez à mettre la main sur l'Œil d'Innos.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //La menace que vous représentez l'a forcé à se découvrir et à nous attaquer ouvertement.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Le temps des faux-semblants est révolu. Hier, nous ignorions quelle forme l'attaque adverse allait prendre, mais aujourd'hui, ce n'est que trop évident.

	B_LogEntry (TOPIC_INNOSEYE, "L'ennemi a découvert que je cherchais l'Œil d'Innos. Il est temps que je mette la main dessus avant qu'il ne soit trop tard.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "J'ai été attaqué par des magiciens en robe noire.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "J'ai enfin mis la main sur la preuve que voulait le seigneur Hagen.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //J'ai été attaqué par des magiciens en robe noire.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //L'ennemi a de multiples visages. Les Traqueurs sont l'une de ses facettes. En réalité, ils sont là pour préparer le terrain à notre véritable adversaire.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Ils se sont postés en divers endroits stratégiques et n'attendent plus que l'occasion de refermer les mâchoires de leur piège.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Restez loin d'eux, car ce sont de puissantes créatures magiques qui feront tout pour entraver votre progression.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas connaît les hommes en noir. Il semble que les Traqueurs tirent les ficelles des troupes ennemies. Ils sont très dangereux."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //J'ai enfin la preuve exigée par le seigneur Hagen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //De quelle preuve s'agit-il ?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //J'ai reçu une lettre de Garond, le commandant des paladins de la Vallée des mines. Il y demande des renforts.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //Bien joué ! Cela devrait suffire à convaincre ce vieux cheval de guerre.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Quelle va être la prochaine étape ?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //Que faut-il faire maintenant ?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Apporter la lettre de Garond au seigneur Hagen afin qu'il vous permette d'accéder à l'Œil d'Innos.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Cela fait, rendez-vous au monastère et parlez à Pyrokar. Il faut absolument qu'il vous remette l'Œil.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Vous devez mettre l'artefact à l'abri. Rien n'a davantage d'importance.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //Allez, avant qu'il ne soit trop tard. Car l'ennemi aussi va chercher à s'en emparer.
	B_LogEntry (TOPIC_INNOSEYE, "L'Œil est au monastère des Magiciens du feu. Heureusement, le seigneur Hagen me permettra d'y avoir accès quand je lui aurai remis le message du seigneur Garond. Pyrokar, le Grand Magicien du feu, ne me laissera pas approcher de l'amulette sans l'accord de Hagen.");
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

	description	 = 	"L'Œil d'Innos a été détruit.";
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
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //L'Œil d'Innos a été détruit.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //Que dites-vous ? Détruit ?
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //Je l'ai retrouvé dans la forêt du nord. Malheureusement, je n'ai pu qu'en récupérer les fragments.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //C'était notre seule chance de tenir tête aux dragons et il n'est plus. Nous avons échoué.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "Et maintenant ?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //Et maintenant ?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //C'est un coup terrible, mais il nous faut redresser la tête. Je vais me retirer afin de réfléchir à la question.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //De votre côté, allez en ville et parlez à Vatras, le Mage de l'eau. Peut-être sait-il ce qu'il convient de faire...

	B_LogEntry (TOPIC_INNOSEYE, "Xardas n'était pas très heureux d'apprendre la destruction de l'Œil d’Innos. Le Magicien des eaux, Vatras, de la cité de Khorinis, semble être notre seul espoir.");

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
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //Excellent ! Et qu'a-t-il dit ?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Il a parlé d'un rituel d'inversion au Cercle du soleil.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //(éclate de rire) Le vieux diable ! Je crois savoir ce qu'il mijote. Il vous a envoyé à moi afin que j'aille le trouver.
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //On le dirait bien. Quand comptez-vous y aller ?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //Je me mets en route immédiatement car il ne faut pas le faire attendre. Pour votre part, menez à bien les tâches que je vous ai confiées et venez me rejoindre.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas a accepté de venir au rituel du Cercle du soleil.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Je ne prendrai part au rituel que quand j'aurai la certitude que vous êtes prêt à affronter les dragons.
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
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //Pourquoi n'allez-vous pas le voir tout de suite ?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //Parfois, je ne vous comprends pas...
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //(irrité) Ne me parlez pas sur ce ton ! Si je n'avais pas été là, votre dépouille serait en train de se décomposer dans le temple.

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Oubliez ça. Contentez-vous de me dire ce que j'ai besoin de savoir.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Alors, expliquez-moi au moins pourquoi vous hésitez.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Expliquez-moi au moins pourquoi vous hésitez.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Depuis que j'ai quitté les Magiciens du feu, je me suis efforcé de me tenir à l'écart d'eux.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //Et je n'ai pas l'intention que cela change, sauf si je n'ai pas le choix.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Toutefois, avant de m'exposer à leurs reproches, je tiens à m'assurer que vous aurez une chance, fut-elle infime, contre les dragons.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //Mais vous n'irez pas loin avec votre équipement miteux. Revenez me voir quand vous serez assez fort.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Laissez tomber. Dites-moi juste ce que je dois faire.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Vous êtes encore trop faible pour affronter les dragons. Vous n'avez pas la moindre chance avec un équipement aussi pathétique.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //Ne revenez pas tant que vous ne serez pas mieux préparé. Alors, seulement, j'irai voir Vatras.
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

	description	 = 	"Je suis prêt à affronter les dragons.";
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
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Je suis prêt à affronter les dragons.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //Dans ce cas, il n'y a plus une seconde à perdre. Je pars rejoindre le Cercle du soleil sans attendre. Quant à vous, menez à bien les tâches qui vous incombent et retrouvez-moi là-bas.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas a accepté de venir au rituel du Cercle du soleil.");
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

	description	 = 	"Est-ce que le rituel de réversion va marcher ?";
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
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //Le rituel d'inversion fonctionnera-t-il ?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //Impossible d'en avoir la certitude. Tout dépend de ce que Vatras a l'intention de faire.
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
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //Vraiment ? Pyrokar ? Voilà qui ne manque pas d'intérêt...
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Ce vieux fou va tout faire pour nous causer des ennuis. Mais je crois avoir quelque chose qui devrait vous être utile...
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Quand j'ai quitté l'ordre des Magiciens du feu, j'ai pris quelques objets du monastère avec moi.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich ständig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen könnte - Satz ist eh überflüssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //Mais je ne voulais pas qu'un groupe de paladins et de Magiciens du feu retournent ma tour de fond en comble et les retrouvent.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Alors, je les ai cachés en divers endroits où je sais que nul n'ira jamais les chercher.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //Où ça ?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //Certains de ces objets sont enfermés dans un coffre qui se trouve dans la ferme de Sékob.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //Vous faites confiance à ce Sékob ?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //Non, mais il est possible de l'acheter et il ne pose pas de question. Et puis, le coffre est fermé à clef. Tenez, en voici justement la clef.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Il y a un très vieux livre à l'intérieur. Quand Pyrokar le verra, il saura qu'il vient de moi.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //Cet ouvrage ne m'est plus d'aucune utilité. Comme cela, il me servira une ultime fois...
	B_LogEntry (TOPIC_INNOSEYE, "Xardas m'a donné la clef d'un coffre de la ferme de Sékob. Je dois rapporter le livre qui s'y trouve à Pyrokar.");
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
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //Maintenant que l'Œil d'Innos a été reconstitué, il faut affronter les dragons.
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //Tous servent Béliar, le dieu des ténèbres.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Mais ils sont forcément contrôlés par une puissance terrestre, j'en ai acquis la conviction.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //Découvrez quelle est la source de leur pouvoir.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //Revenez me voir dès que vous le saurez.
	
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

	description	 = 	"L'Œil d'Innos est guéri. Et maintenant ?";
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
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //L'Œil d'Innos a été reconstitué. Et maintenant ?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //N'oubliez pas de le porter quand vous affronterez enfin les dragons.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //Ne perdez pas de temps. Allez à la Vallée des mines et tuez les dragons.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //Allez voir Pyrokar et demandez-lui de vous expliquer comment utiliser l'Œil.
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
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //Les Traqueurs ne sont pas encore partis. Ils ne connaîtront pas le repos tant qu'ils ne vous auront pas rattrapé.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Tuez les dragons de la Vallée des mines et découvrez qui est derrière ces attaques, sans quoi notre ennemi reconstituera son armée.

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



























































