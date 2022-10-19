///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ehnim_EXIT   (C_INFO)
{
	npc         = BAU_944_Ehnim;
	nr          = 999;
	condition   = DIA_Ehnim_EXIT_Condition;
	information = DIA_Ehnim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ehnim_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_HALLO		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	3;
	condition	 = 	DIA_Ehnim_HALLO_Condition;
	information	 = 	DIA_Ehnim_HALLO_Info;

	description	 = 	"Qui êtes-vous ?";
};

func int DIA_Ehnim_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_HALLO_15_00"); //Qui êtes-vous ?
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_01"); //Je me nomme Ehnim. Je suis un ouvrier agricole.

	if	(
		(Hlp_IsValidNpc (Egill))
		&& (!C_NpcIsDown (Egill))
		)
			{
				AI_Output			(self, other, "DIA_Ehnim_HALLO_12_02"); //Et la demi-portion là-bas, c'est mon frère Egill.
			};
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_03"); //On travaille à la ferme d'Akil depuis plusieurs années.

};


///////////////////////////////////////////////////////////////////////
//	Info Feldarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDARBEIT		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	4;
	condition	 = 	DIA_Ehnim_FELDARBEIT_Condition;
	information	 = 	DIA_Ehnim_FELDARBEIT_Info;

	description	 = 	"Comment se passe le travail aux champs ?";
};

func int DIA_Ehnim_FELDARBEIT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Ehnim_FELDARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_FELDARBEIT_15_00"); //Comment se passe le travail aux champs ?
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_01"); //Vous voulez nous aider ? Il y a une autre houe ici. Prenez-la et allez aux champs.
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_02"); //Il faut surtout faire attention à ce que les fléaux des champs ne vous surprennent pas. Ils vous arracheraient le bras d'un coup de gueule.

};

///////////////////////////////////////////////////////////////////////
//	Info feldraeuber
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDRAEUBER		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	5;
	condition	 = 	DIA_Ehnim_FELDRAEUBER_Condition;
	information	 = 	DIA_Ehnim_FELDRAEUBER_Info;

	description	 = 	"Pourquoi ne faites-vous rien contre les fléaux des champs ?";
};

func int DIA_Ehnim_FELDRAEUBER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_FELDARBEIT))
		{
				return TRUE;
		};
};

func void DIA_Ehnim_FELDRAEUBER_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_FELDRAEUBER_15_00"); //Pourquoi ne faites-vous rien pour vous débarrasser des fléaux des champs ?
	AI_Output			(self, other, "DIA_Ehnim_FELDRAEUBER_12_01"); //J'en ai tué plus que je ne peux en compter. Le seul problème, c'est qu'ils ne cessent de revenir.

};

///////////////////////////////////////////////////////////////////////
//	Info Streit1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT1		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	6;
	condition	 = 	DIA_Ehnim_STREIT1_Condition;
	information	 = 	DIA_Ehnim_STREIT1_Info;

	description	 = 	"Votre frère m'a dit la même chose.";
};

func int DIA_Ehnim_STREIT1_Condition ()
{
	if 	(
			(
			(Npc_KnowsInfo(other, DIA_Egill_FELDRAEUBER))
			&& (Npc_KnowsInfo(other, DIA_Ehnim_FELDRAEUBER))
			&& ((Npc_KnowsInfo(other, DIA_Egill_STREIT2))== FALSE)
			)
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		)
				{
					return TRUE;
				};
			
};

func void DIA_Ehnim_STREIT1_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT1_15_00"); //Votre frère m'a dit la même chose.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_01"); //Quoi ? Ce tire-au-flanc ? Dès que les bêtes arrivent, il disparaît.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_02"); //Il ne devrait pas dire de telles absurdités.
};

///////////////////////////////////////////////////////////////////////
//	Info Streit3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT3		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	7;
	condition	 = 	DIA_Ehnim_STREIT3_Condition;
	information	 = 	DIA_Ehnim_STREIT3_Info;

	description	 = 	"Votre frère pense que vous êtes un vantard.";
};

func int DIA_Ehnim_STREIT3_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Egill_STREIT2))
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		)	
			{
					return TRUE;
			};
};

func void DIA_Ehnim_STREIT3_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT3_15_00"); //Votre frère pense que vous êtes un vantard.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_01"); //Quoi ? Il a le culot de dire ça ?
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_02"); //Il ferait bien de faire attention s'il ne veut pas que je lui donne une leçon.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_03"); //Allez le lui dire.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Streit5
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT5		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	8;
	condition	 = 	DIA_Ehnim_STREIT5_Condition;
	information	 = 	DIA_Ehnim_STREIT5_Info;
	permanent	 =  TRUE;

	description	 = 	"Je pense que vous devriez tous les deux vous calmer.";
};

var int DIA_Ehnim_STREIT5_noPerm;

func int DIA_Ehnim_STREIT5_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Egill_STREIT4))
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		&& (DIA_Ehnim_STREIT5_noPerm == FALSE)
		)	
				{
						return TRUE;
				};
};

func void DIA_Ehnim_STREIT5_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_15_00"); //Je pense que vous devriez tous les deux vous calmer.
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_01"); //Ce bâtard ne veut pas la fermer, hein ?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_02"); //Je vais lui arracher les tripes. Dites-lui ça.

	Info_ClearChoices	(DIA_Ehnim_STREIT5);

	Info_AddChoice	(DIA_Ehnim_STREIT5, "Faites ce que vous voulez, je m'en vais.", DIA_Ehnim_STREIT5_gehen );
	Info_AddChoice	(DIA_Ehnim_STREIT5, "Pourquoi ne pas le lui dire vous-même ?", DIA_Ehnim_STREIT5_Attack );


};
func void DIA_Ehnim_STREIT5_Attack ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_Attack_15_00"); //Pourquoi vous n'allez-vous pas le lui dire vous-même ?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_Attack_12_01"); //Je vais le faire.

	AI_StopProcessInfos (self);

	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Egill, AR_NONE, 0);
	
	B_GivePlayerXP (XP_EgillEhnimStreit);
	
};

func void DIA_Ehnim_STREIT5_gehen ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_gehen_15_00"); //Faites ce que vous voulez. Je m'en vais.
	AI_Output			(self ,other, "DIA_Ehnim_STREIT5_gehen_12_01"); //C'est ça, déguerpissez.
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_PERMKAP1_Condition;
	information	 = 	DIA_Ehnim_PERMKAP1_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Ehnim_PERMKAP1_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Npc_IsInState (self,ZS_Talk))
		&& ((Kapitel < 3) || (hero.guild == GIL_KDF))
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_PERMKAP1_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP1_12_00"); //Vous voulez rajouter de l'huile sur le feu ? Je crois qu'il serait préférable que vous partiez maintenant.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MoleRatFett
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_MoleRatFett		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_MoleRatFett_Condition;
	information	 = 	DIA_Ehnim_MoleRatFett_Info;
	important	 = 	TRUE;
};

func int DIA_Ehnim_MoleRatFett_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Kapitel >= 3)
		&& (hero.guild != GIL_KDF)
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_MoleRatFett_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_00"); //Vous êtes ENCORE là.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_01"); //Il semblerait. Toujours fâché ?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_02"); //Laissez tomber. Etes-vous allé récemment à la ferme de Lobart ?
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_03"); //C'est possible, pourquoi ?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_04"); //Oh, rien d'important. Je voulais juste parler à Vino de sa distillerie.
	
	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Je n'ai pas le temps pour l'instant.", DIA_Ehnim_MoleRatFett_nein );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Une distillerie ? Quelle distillerie ?", DIA_Ehnim_MoleRatFett_was );

	if (Npc_IsDead(Vino))
	{
		Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Vino est mort.", DIA_Ehnim_MoleRatFett_tot );
	};

};
func void DIA_Ehnim_MoleRatFett_tot ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_tot_15_00"); //Vino est mort.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_tot_12_01"); //Oh, seigneur. Eh bien, voilà.

};

func void DIA_Ehnim_MoleRatFett_was ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_15_00"); //Sa distillerie ? Quelle distillerie ?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_01"); //Oh ! Je n'aurais peut-être pas dû dire ça. Vino a toujours été très discret au sujet de son petit secret.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_02"); //Qu'importe, maintenant j'en ai trop dit. Vino a installé une distillerie secrète dans les bois.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_03"); //Il y a quelque temps, il m'a demandé quelque chose pour graisser la herse.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_04"); //Il a beaucoup plus ces derniers temps et elle a complètement rouillé. Le treuil s'est bloqué et on ne peut plus entrer. Quel foutoir.

	Log_CreateTopic (TOPIC_FoundVinosKellerei, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei, LOG_RUNNING);
	B_LogEntry (TOPIC_FoundVinosKellerei,"Ehnim m'a dit que Vino avait une distillerie secrète dans les bois, près de la ferme d'Akil. Mais le mécanisme d'ouverture de la porte est coincé et ne peut être déverrouillé qu'avec de la graisse de rat-taupe."); 
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Et ? Avez-vous cette graisse ?", DIA_Ehnim_MoleRatFett_was_Fett );
};
func void DIA_Ehnim_MoleRatFett_was_Fett ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_15_00"); //Et ? Avez-vous la graisse ?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_12_01"); //Oui, bien sûr. La meilleure qu'on puisse trouver. Un truc terrible, je peux vous l'affirmer. On l'utilise même pour les canons des navires.
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Vendez-moi la graisse.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill );

};
var int Ehnim_MoleRatFettOffer;
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00"); //Vendez-moi cette graisse.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01"); //Ce ne sera pas donné. C'est assez rare dans cette région.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02"); //Combien ?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03"); //Hum. 100 pièces d'or ?
	Ehnim_MoleRatFettOffer = 100;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "C'est trop cher.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Marché conclu.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00"); //Marché conclu.

	if (B_GiveInvItems (other, self, ItMi_Gold,Ehnim_MoleRatFettOffer))
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01"); //Très bien. Tenez.
			
			if (Npc_HasItems (self,ItMi_Moleratlubric_MIS))
			{
				B_GiveInvItems (self, other, ItMi_Moleratlubric_MIS, 1);
				
				if (Npc_IsDead(Vino) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02"); //(à lui-même) Oh, seigneur ! Vino va me tuer.
					};					
			}
			else
			{
				AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03"); //Merde, où est-elle passée ? Qu'est-ce que ça veut dire ? Bon, je crois que je ne l'ai plus. Je vous rends votre argent.
				B_GiveInvItems (self, other, ItMi_Gold,Ehnim_MoleRatFettOffer);
				
				if (Npc_IsDead(Egill) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04"); //Je suis sûr que c'est encore un coup de mon frère. Quel salaud.
						AI_StopProcessInfos (self);
						other.aivar[AIV_INVINCIBLE] = FALSE;
						B_Attack (self, Egill, AR_NONE, 0);
					};
			};
		}
	else
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05"); //Vous êtes gonflé. Vous m'en faites tout un cirque et vous n'avez même pas assez d'argent. Fichez le camp.
		};
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00"); //C'est beaucoup trop.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01"); //D'accord, d'accord. Alors 70 pièces d'or. Mais c'est ma dernière offre.
	Ehnim_MoleRatFettOffer = 70;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "C'est encore trop cher.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Marché conclu.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_immernoch_15_00"); //C'est encore trop.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_immernoch_12_01"); //(en colère) Alors, laissez tomber. Bonne journée.
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_nein ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_nein_15_00"); //Je n'ai pas le temps.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_nein_12_01"); //Je ne vous retiens pas.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP3		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_PERMKAP3_Condition;
	information	 = 	DIA_Ehnim_PERMKAP3_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Ehnim_PERMKAP3_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Ehnim_MoleRatFett))
		&& (Npc_IsInState (self,ZS_Talk))
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_PERMKAP3_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP3_12_00"); //Je n'ai pas le temps pour l'instant.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ehnim_PICKPOCKET (C_INFO)
{
	npc			= BAU_944_Ehnim;
	nr			= 900;
	condition	= DIA_Ehnim_PICKPOCKET_Condition;
	information	= DIA_Ehnim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Ehnim_PICKPOCKET_Condition()
{
	C_Beklauen (76, 35);
};
 
FUNC VOID DIA_Ehnim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ehnim_PICKPOCKET);
	Info_AddChoice		(DIA_Ehnim_PICKPOCKET, DIALOG_BACK 		,DIA_Ehnim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ehnim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ehnim_PICKPOCKET_DoIt);
};

func void DIA_Ehnim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ehnim_PICKPOCKET);
};
	
func void DIA_Ehnim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ehnim_PICKPOCKET);
};
























