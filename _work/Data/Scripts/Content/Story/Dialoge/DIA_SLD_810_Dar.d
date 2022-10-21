// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Dar_EXIT (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 999;
	condition   = DIA_Dar_EXIT_Condition;
	information = DIA_Dar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Dar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Dar_Hallo (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 1;
	condition   = DIA_Dar_Hallo_Condition;
	information = DIA_Dar_Hallo_Info;
	permanent   = FALSE;
	description = "Que fumez-vous là ?";
};

FUNC INT DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Dar_Hallo_15_00"); //Qu'est-ce que vous fumez ?
	AI_Output (self, other, "DIA_Dar_Hallo_03_01"); //Vous voulez une taffe ?
	
	Info_ClearChoices (DIA_Dar_Hallo);
	Info_AddChoice (DIA_Dar_Hallo, "Non.", DIA_Dar_Hallo_Nein);
	Info_AddChoice (DIA_Dar_Hallo, "Bien sûr.", DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_00"); //Bien sûr.
	CreateInvItem (other, itmi_joint);
	B_UseItem (other, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_01"); //Pas mauvais, hein ?
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_02"); //Où vous êtes-vous procuré ça ?
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_03"); //(sourit) J'ai mes sources.
	Info_ClearChoices (DIA_Dar_Hallo);	
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Nein_15_00"); //Non.
	Info_ClearChoices (DIA_Dar_Hallo);	
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Dar_einmal; 

INSTANCE DIA_Dar_PERM (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 2;
	condition   = DIA_Dar_PERM_Condition;
	information = DIA_Dar_PERM_Info;
	permanent   = TRUE;
	description = "Faites-vous autre chose que fumer ?";
};

FUNC INT DIA_Dar_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_PERM_Info()
{
	AI_Output (other, self, "DIA_Dar_PERM_15_00"); //Vous faites autre chose que fumer ?
	
	if (Dar_LostAgainstCipher == TRUE)
	&& (Dar_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_01"); //(sarcastique) Des fois, je laisse quelques drogués vindicatifs me tabasser.
		Dar_einmal = TRUE;
	}
		else //DEFAULT
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_02"); //Pas ces temps-ci.
	};
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************

INSTANCE DIA_Dar_WannaJoin (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 3;
	condition   = DIA_Dar_WannaJoin_Condition;
	information = DIA_Dar_WannaJoin_Info;
	permanent   = FALSE;
	description = "Je veux me joindre aux mercenaires. Cela vous pose un problème ?";
};

FUNC INT DIA_Dar_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_Hallo))
	&& (other.guild == GIL_NONE)
	&& (Dar_LostAgainstCipher == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Dar_WannaJoin_15_00"); //Je voudrais rejoindre les mercenaires. Ça vous dérange ?
	AI_Output (self, other, "DIA_Dar_WannaJoin_03_01"); //Je m'en contrefiche.
};

// ************************************************************
// 			  				DuDieb
// ************************************************************

INSTANCE DIA_Dar_DuDieb (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 4;
	condition   = DIA_Dar_DuDieb_Condition;
	information = DIA_Dar_DuDieb_Info;
	permanent   = FALSE;
	description = "Cipher a dit que quelqu'un lui avait volé un paquet d'herbes des marais ...";
};

FUNC INT DIA_Dar_DuDieb_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat)) //von Diebstahl gehört
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_DuDieb_Info()
{
	AI_Output (other, self, "DIA_Dar_DuDieb_15_00"); //Oui m'a dit que quelqu'un lui avait volé un paquet d'herbe des marais.
	AI_Output (self, other, "DIA_Dar_DuDieb_03_01"); //(part d'un rire idiot)
	AI_Output (other, self, "DIA_Dar_DuDieb_15_02"); //Vous savez quelque chose à ce sujet ?
	AI_Output (self, other, "DIA_Dar_DuDieb_03_03"); //(cassant) Non.
	
	Dar_Verdacht = TRUE;
};

// ************************************************************
// 			  				WoPaket
// ************************************************************

INSTANCE DIA_Dar_WoPaket (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 4;
	condition   = DIA_Dar_WoPaket_Condition;
	information = DIA_Dar_WoPaket_Info;
	permanent   = TRUE;
	description = "Où est le paquet ?";
};

FUNC INT DIA_Dar_WoPaket_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_WoPaket_Info()
{
	AI_Output (other, self, "DIA_Dar_WoPaket_15_00"); //(menaçant) Où est le paquet ?
		
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{	
		AI_Output (self, other, "DIA_Dar_WoPaket_03_01"); //D'accord, d'accord. Je l'ai vendu à un type en ville.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_02"); //C'était sur le port, mais je me souviens pas de quoi il avait l'air.
		AI_Output (other, self, "DIA_Dar_WoPaket_15_03"); //Est-ce qu'une autre leçon vous rendrait la mémoire ?
		AI_Output (self, other, "DIA_Dar_WoPaket_03_04"); //C'est la vérité, mec ! J'étais complètement défoncé et je me souviens vraiment pas de la tronche de ce type.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_05"); //C'était sur le port, près du constructeur de bateaux. C'est tout ce dont je me souviens.
	
		Dar_Dieb = TRUE;
		B_LogEntry (Topic_CipherPaket,"Dar a avoué le vol du paquet d'herbes. Il l'a vendu dans le quartier du port de Khorinis près du fabricant de bateaux.");
	}
	else
	{
		AI_Output (self, other, "DIA_Dar_WoPaket_03_06"); //Que voulez-vous que j'en sache ?
	};
};

// ************************************************************
// 			  				AufsMaul
// ************************************************************

INSTANCE DIA_Dar_AufsMaul (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 5;
	condition   = DIA_Dar_AufsMaul_Condition;
	information = DIA_Dar_AufsMaul_Info;
	permanent   = FALSE;
	description = "Je vais vous le prendre de force !";
};

FUNC INT DIA_Dar_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_AufsMaul_Info()
{
	AI_Output (other, self, "DIA_Dar_AufsMaul_15_00"); //Si vous ne voulez pas parler de votre plein gré, vous le ferez de force !
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_01"); //Du calme, je suis bien trop défoncé pour me battre avec vous.
	B_GiveInvItems (self, other, itmi_joint, 1);
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_02"); //Tenez, prenez une bonne taffe !
};

// ************************************************************
// 			  			Kameradenschwein
// ************************************************************

INSTANCE DIA_Dar_Kameradenschwein (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 1;
	condition   = DIA_Dar_Kameradenschwein_Condition;
	information = DIA_Dar_Kameradenschwein_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Dar_Kameradenschwein_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] == FALSE; //geht NUR bei ECHTER Important-Info!
		return TRUE;
	};
};

FUNC VOID DIA_Dar_Kameradenschwein_Info()
{
	AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_00"); //Sale mouchard ! C'est vous qui avez dit à Cipher que je lui avait piqué son herbe !
	if (Npc_KnowsInfo (other, DIA_Dar_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_01");  //Moi, voter pour vous ? Vous pouvez toujours crever !
	};
};

// ************************************************************
// 			  				Pilztabak
// ************************************************************

INSTANCE DIA_Dar_Pilztabak (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 6;
	condition   = DIA_Dar_Pilztabak_Condition;
	information = DIA_Dar_Pilztabak_Info;
	permanent   = FALSE;
	description	= "Avez-vous déjà essayé du tabac aux champignons ?";
};

FUNC INT DIA_Dar_Pilztabak_Condition()
{
	if (Npc_HasItems (other, Itmi_Pilztabak) > 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_Pilztabak_Info()
{
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_00"); //Vous avez déjà essayé le tabac de champignon ?
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_01"); //Non, mais ça a l'air intéressant. Envoyez.
	B_GiveInvItems (other, self, Itmi_Pilztabak, 1);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_02"); //Allez, c'est parti !
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_03"); //Vous l'avez déjà goûté au moins ?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_04"); //Eh bien...
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_05"); //Alors ? C'est oui ou c'est non ?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_06"); //Je suis très occupé ces temps-ci, et...
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_07"); //Oh, merde...
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_08"); //Par saint Rhobar !
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_09"); //Ce truc est vraiment costaud ! Je vous le déconseille !
	B_GivePlayerXP (XP_Ambient);
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

INSTANCE DIA_Dar_KAP3_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP3_EXIT_Condition;
	information	= DIA_Dar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
}; 
                      
FUNC INT DIA_Dar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Dar_KAP4_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP4_EXIT_Condition;
	information	= DIA_Dar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orcring
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_ORCRING		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_ORCRING_Condition;
	information	 = 	DIA_Dar_ORCRING_Info;

	description	 = 	"Il semble que certains mercenaires aient disparu.";
};

func int DIA_Dar_ORCRING_Condition ()
{
	if (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Dar_ORCRING_Info ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_15_00"); //On dirait que certains mercenaires ne sont plus là.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_01"); //C'est exact. Sylvio a fichu le camp en emmenant la moitié du groupe avec lui.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_02"); //On s'en fout de toute façon. C'est avec la bande de Lee que j'ai le plus de chance de devenir quelqu'un. Il me faut juste le déclic.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_03"); //Si seulement je pouvais prouver aux autres que je suis un vrai dur, peut-être que je pourrais devenir un garde du corps de Lee.

	Info_ClearChoices	(DIA_Dar_ORCRING);
	Info_AddChoice	(DIA_Dar_ORCRING, "Cela ne me concerne pas.", DIA_Dar_ORCRING_no );
	Info_AddChoice	(DIA_Dar_ORCRING, "Un type costaud ? Vous ?", DIA_Dar_ORCRING_necken );
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice	(DIA_Dar_ORCRING, "Et à quoi cela devrait-il ressembler ?", DIA_Dar_ORCRING_wie );
	};
};

func void DIA_Dar_ORCRING_necken ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_15_00"); //Un vrai dur ? Vous ?
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_01"); //(en colère) Oh, la ferme ! Vous êtes qui, vous, d'abord ?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_02"); //Un débile de citadin, c'est ça ? Vous êtes tous des ratés et des moins que rien de toute façon.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_03"); //Vous venez à peine d'arriver et vous êtes déjà là à jouer les donneurs de leçons.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_04"); //A qui vous essayez de faire peur avec vos âneries sur la magie, hein ? En tout cas, ça prend pas avec moi !
		}; 
	

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_05"); //Tiens, maintenant que j'y pense... vous fendre le crâne est exactement le genre de truc qui me permettrait de gagner le respect des autres.

		Info_ClearChoices	(DIA_Dar_ORCRING);
		Info_AddChoice	(DIA_Dar_ORCRING, "Je n'ai pas de temps à consacrer à ces idioties.", DIA_Dar_ORCRING_necken_no );
		Info_AddChoice	(DIA_Dar_ORCRING, "Ok. Essayez.", DIA_Dar_ORCRING_necken_schlagen );
	}
	else
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_06"); //Vous verrez... je suis sûr que je vais finir par trouver le moyen d'attirer l'attention de Lee.
	};
};
var int Dar_FightAgainstPaladin;
func void DIA_Dar_ORCRING_necken_schlagen ()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_schlagen_15_00"); //Eh bien, essayez.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_schlagen_03_01"); //J'en meurs d'impatience !
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Dar_ORCRING_necken_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_no_15_00"); //Je n'ai pas de temps à perdre en inepties.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_no_03_01"); //Ah, le chevalier dans son armure scintillante ! C'est vrai, j'avais oublié. Et moi qui croyais que vous aviez un minimum de cran.
	AI_StopProcessInfos (self);
};

func void DIA_Dar_ORCRING_wie ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_wie_15_00"); //Qu'est-ce qu'il vous faudrait ?
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_01"); //Je ne sais pas vraiment. Un trophée orque serait pas mal...
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_02"); //Un genre d'insigne de chef orque, vous savez... une bannière, un brassard, un anneau, ou un truc du même genre.
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_03"); //Il me faut au moins ça pour impressionner les autres, ça me paraît clair.
	
	Log_CreateTopic (TOPIC_Dar_BringOrcEliteRing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing, LOG_RUNNING);
	B_LogEntry (TOPIC_Dar_BringOrcEliteRing,"Dar veut briller parmi les mercenaires. Il veut le trophée d'un orque. Une bannière, un brassard, un anneau ou quelque chose de ce genre."); 

	MIS_Dar_BringOrcEliteRing = LOG_RUNNING;
	Info_ClearChoices	(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_no_15_00"); //Ça ne me regarde pas.
	AI_Output			(self, other, "DIA_Dar_ORCRING_no_03_01"); //(en colère) Evidemment ! Le contraire m'aurait étonné !
	Info_ClearChoices	(DIA_Dar_ORCRING);
};

///////////////////////////////////////////////////////////////////////
//	Info FightagainstPalOver
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_FIGHTAGAINSTPALOVER		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	information	 = 	DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important	 = 	TRUE;
};

func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition ()
{
	if 	(Dar_FightAgainstPaladin == TRUE)
	&&	((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
				return TRUE;
		};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info ()
{
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_00"); //Très bien. Je sais que ça ne fera pas plaisir à Lee si je me brouille de nouveau avec vous.
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_01"); //Je ne tiens pas à me faire des ennemis ici, alors oublions ça, d'accord ?
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringOrcEliteRing
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_BRINGORCELITERING		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_BRINGORCELITERING_Condition;
	information	 = 	DIA_Dar_BRINGORCELITERING_Info;

	description	 = 	"J'ai le trophée orque que vous cherchiez.";
};

func int DIA_Dar_BRINGORCELITERING_Condition ()
{
	if (MIS_Dar_BringOrcEliteRing == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	&& (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
				return TRUE;
		};
};

func void DIA_Dar_BRINGORCELITERING_Info ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_00"); //J'ai le trophée orque que vous cherchiez.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_01"); //Qu'est-ce que vous m'avez ramené ?
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_02"); //L'anneau d'un chef de guerre orque.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_03"); //La vache ! Qu'est-ce que vous voulez en échange ?
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);

	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Qu'avez-vous à m'offrir ?", DIA_Dar_BRINGORCELITERING_was );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Donnez-moi de l'or.", DIA_Dar_BRINGORCELITERING_geld );
	};
		
};
func void DIA_Dar_BRINGORCELITERING_geld ()
{
	
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_00"); //Payez-moi.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_01"); //Hmm... 600 pièces d'or, ça vous irait ?
		AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_02"); //Pardon ? Ai-je bien entendu ?
	};

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_03"); //Bon d'accord, je vous en offre 1 200 pièces d'or.
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_04"); //Si ça ne vous suffit pas, gardez-le votre anneau.
	};
	
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Ce n'est pas assez.", DIA_Dar_BRINGORCELITERING_geld_no );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Marché conclu.", DIA_Dar_BRINGORCELITERING_geld_ok );

};
func void DIA_Dar_BRINGORCELITERING_geld_ok ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_ok_15_00"); //Marché conclu. Tenez, prenez-le.
	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_ok_03_01"); //Merci. Je suis impatient de voir la réaction des autres.

	CreateInvItems 		(self, ItMi_Gold, 1200);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 1200);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_no_15_00"); //Ce n'est pas suffisant.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_no_03_01"); //Et moi, je trouve que c'est déjà trop. Le prenez pas mal, mais tout ça me semble un peu louche.
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_15_00"); //Qu'avez-vous à me proposer ?
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_01"); //Prenez l'argent ou cette amulette, que j'ai... euh, disons, acquise... il y a quelque temps.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_02"); //Elle augmente l'agilité de son porteur. Je le sais, je l'ai moi-même essayée.

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Donnez-moi de l'or.", DIA_Dar_BRINGORCELITERING_geld );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Donnez-moi l'amulette.", DIA_Dar_BRINGORCELITERING_was_am );
};

func void DIA_Dar_BRINGORCELITERING_was_am ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_am_15_00"); //Donnez-moi l'amulette.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_01"); //D'accord. Amusez-vous bien avec. Et maintenant donnez-moi l'anneau.

	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	CreateInvItems 		(self, ItAm_Dex_01, 1);									
	B_GiveInvItems 		(self, other, ItAm_Dex_01, 1);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_02"); //C'est un plaisir de faire affaire avec vous.
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);

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

INSTANCE DIA_Dar_KAP5_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP5_EXIT_Condition;
	information	= DIA_Dar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Dar_KAP6_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP6_EXIT_Condition;
	information	= DIA_Dar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dar_PICKPOCKET (C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 900;
	condition	= DIA_Dar_PICKPOCKET_Condition;
	information	= DIA_Dar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Dar_PICKPOCKET_Condition()
{
	C_Beklauen (67, 35);
};
 
FUNC VOID DIA_Dar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dar_PICKPOCKET);
	Info_AddChoice		(DIA_Dar_PICKPOCKET, DIALOG_BACK 		,DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dar_PICKPOCKET);
};
	
func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dar_PICKPOCKET);
};












































