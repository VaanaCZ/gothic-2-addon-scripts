///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_DI_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro_DI;
	nr          = 999;
	condition   = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verräter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU		(C_INFO)
{
	npc			 = 	NOV_600_Pedro_DI;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_DI_YOU_Condition;
	information	 = 	DIA_Pedro_DI_YOU_Info;
	
	description	 = 	"Traître !";
	
};
func int DIA_Pedro_DI_YOU_Condition ()
{	
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Traître ! Je vous ai enfin trouvé !

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //N'allez pas croire que j'aurai pitié de vous parce que je suis paladin !
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Nous sommes nombreux, chez les mercenaires, à avoir vendu notre âme à Béliar, et pourtant, cela me gêne souvent de tuer les gens de sang froid. Mais pour vous, je suis prêt à faire une exception...
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //De tous les pourris que j'ai rencontrés, vous êtes de loin le pire ! Vous êtes une honte pour notre ordre !
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Je devrais vous tuer sans autre forme de procès.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Arrêtez, je vous en prie. J'ai reçu un sort. Jamais je n'aurais trahi le monastère de mon propre gré !
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Vous n'avez pas idée de ce que j'endure depuis quelques jours. Ils ont mis ces voix dans ma tête. Je ne peux pas me défendre...
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Le colonel orque m'a questionné plusieurs jours durant, sans cesser de me frapper. Epargnez-moi, je vous prie. Je suis innocent, croyez-moi !
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Alors dites-moi ce que vous savez.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Je n'en ai rien à faire. Je vais vous tuer maintenant.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Donnez-moi une seule raison de vous croire.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes m'a ordonné de vous tuer.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Donnez-moi une raison de vous croire.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(suppliant) Laissez-moi la vie sauve ! Je peux vous communiquer des renseignements qui vous permettront de ressortir d'ici. Vous devez m'écouter !

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //Je ne dois rien du tout. Je vais vous tuer sur-le-champ !
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //Par tous les dieux...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes m'a donné l'ordre de vous tuer et j'ai pour habitude de faire ce qu'on me dit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(suppliant) Je vous en prie, non ! Vous ne pouvez pas faire ça ! Je peux encore vous être utile, vous devez bien vous en rendre compte !

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Dans ce cas, dites-moi ce que vous savez.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(soulagé) Oui, bien sûr. Je vous dirai tout ce que vous voulez savoir. Mais à une condition : vous devez me faire quitter cette île maudite, vous comprenez ?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Je n'en ai rien à faire. Je vais vous tuer maintenant.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Très bien. Suivez-moi, je vous conduis sur mon navire.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //Très bien. Suivez-moi, je vous amène au bateau.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //Merci. Vous ne le regretterez pas.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_RUNNING;

};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedAtShip
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_ArrivedAtShip		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	4;
	condition	 = 	DIA_Pedro_DI_ArrivedAtShip_Condition;
	information	 = 	DIA_Pedro_DI_ArrivedAtShip_Info;

	description	= "Nous y voilà !";	
};

func int DIA_Pedro_DI_ArrivedAtShip_Condition ()
{
	if (Npc_GetDistToWP(self,"SHIP")<6000) 
	&& (MIS_Pedro_DI_FollowShip == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //Nous y voilà !
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //C'est un navire impressionnant que vous avez là. Vous êtes vraiment un grand général.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Arrêtez de jacasser et dites-moi ce que je veux savoir !
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Euh... oui, bien sûr. Par où faut-il que je commence ?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "J'en ai assez entendu.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Comment accéder à l'intérieur de l'île ?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Quels autres monstres hantent l'île ?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Et au sujet de ce colonel orque ?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Par ce colonel orque, par exemple...
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Il a étouffé mes derniers espoirs de revoir un jour ma terre natale.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Depuis que je suis ici, il me questionne sur le positionnement stratégique des paladins de Khorinis.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Mais je n'ai rien pu lui dire, bien sûr. Comment pourrais-je le savoir ? Je ne suis qu'un novice du feu !
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Le colonel orque est mort.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Quels sont les autres monstres qui hantent cette île ?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //En cours de journée, on voit souvent les hommes-lézards marchant en direction de la côte. Le plus souvent, ils transportent de gros œufs avec eux.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Je n'ai pas vu grand-chose depuis ma cellule, mais je crois qu'ils se préparent à quitter l'île.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Comment accéder à l'intérieur des terres?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //Il y a un passage secret dans la salle du trône du colonel orque.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Je l'ai vu de mes propres yeux, car ils m'ont traîné là-bas chaque fois qu'il voulait me questionner.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //L'un des shamans a actionné un mécanisme en tirant les torches pendues au mur.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Hmm... il me semble qu'il a commencé par la gauche, puis la droite, mais je ne me souviens pas bien...
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //Le passage secret qui s'est ouvert dans la partie arrière de la salle s'enfonçait au cœur de la montagne.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //J'ignore où il débouche.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Le colonel orque est mort.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Mort ? Innos soit loué ! Je n'oublierai jamais son immonde visage...

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //J'en ai assez entendu. Allez à mon bateau. Moi, il me reste un travail à faire.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Innos vous accompagne. Je prierai pour vous.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_PERM		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	5;
	condition	 = 	DIA_Pedro_DI_PERM_Condition;
	information	 = 	DIA_Pedro_DI_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Fatigué ?";
};
var int PedroDI_TalkNomore;
func int DIA_Pedro_DI_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	&& (PedroDI_TalkNomore == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Pedro_DI_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //Vous êtes fatigué ?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Voulez-vous que je vous amène un oreiller ?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Epargnez-moi ça, s'il vous plaît. Je vais m'asseoir ici et je ne ferai pas un bruit.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Hmm...
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Je suis complètement épuisé.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Allez vous coucher. Nous serons bientôt en mer.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Merci. J'ai bien cru que j'allais tomber de fatigue. Bonne nuit.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //Tout va bien, merci.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Je vous en prie, laissez-moi la vie sauve !
		AI_StopProcessInfos (self);
	};
};

