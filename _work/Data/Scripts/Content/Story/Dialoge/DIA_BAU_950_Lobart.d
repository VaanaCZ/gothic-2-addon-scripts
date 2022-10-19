// *************************************************
// 						EXIT 
// *************************************************
INSTANCE DIA_Lobart_EXIT   (C_INFO)
{
	npc         = BAU_950_Lobart;
	nr          = 999;
	condition   = DIA_Lobart_EXIT_Condition;
	information = DIA_Lobart_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lobart_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Lobart_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *************************************************
// 					STOLEN CLOTHS 
// *************************************************
instance DIA_Lobart_STOLENCLOTHS		(C_INFO)
{
	npc			 = BAU_950_Lobart;
	nr           = 1;
	condition	 = DIA_Lobart_STOLENCLOTHS_Condition;
	information	 = DIA_Lobart_STOLENCLOTHS_Info;
	permanent 	 = FALSE;
	important	 = TRUE;
};

func int DIA_Lobart_STOLENCLOTHS_Condition ()
{
	if (Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == FALSE)
	&& (Lobart_Kleidung_Verkauft == FALSE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lobart_STOLENCLOTHS_Info ()
{
	// ------ SC hat R�stung an ------
	
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	if (Hlp_IsItem (heroArmor, ItAr_BAU_L) == TRUE)
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_00"); //Je n'y crois pas ! Ce b�tard se balade dans le coin avec MES v�tements !
	}	
	else
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_01"); //Eh ! Vous !
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_02"); //Depuis la derni�re fois que vous �tes venu, des affaires m'appartenant ont �t� vol�es dans mon coffre !
	};
	
	// ------ SC hat nach Arbeit gefragt -------
	if (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW))
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_03"); //Rendez-vous utile et cessez de fouiner dans ma maison, feignasse.
	};
	
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_04"); //Rendez-moi mes v�tements imm�diatement !
	
	Info_ClearChoices	(DIA_Lobart_STOLENCLOTHS);
	Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Laissez tomber !", 				DIA_Lobart_STOLENCLOTHS_ForgetIt );
	if (Npc_HasItems (other, ItAr_BAU_L) > 0)
	{
		Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Tenez, r�cup�rez-les.", 	DIA_Lobart_STOLENCLOTHS_HereYouGo );
	}
	else
	{
		Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Je ne les ai plus.", 	DIA_Lobart_STOLENCLOTHS_DontHaveIt );
	};
};
	
func void DIA_Lobart_STOLENCLOTHS_HereYouGo ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00"); //Tenez, reprenez-les.
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01"); //Si vous les voulez, vous devez les payer.
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02"); //(sur un ton sec) Maintenant, allez vous rendre utile !
	
	B_GiveInvItems (other, self, ItAr_BAU_L, 1);
	
	Info_ClearChoices	(DIA_Lobart_STOLENCLOTHS);
};

func void DIA_Lobart_STOLENCLOTHS_DontHaveIt ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00"); //Je ne les ai plus.
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01"); //Vous les avez d�j� vendus, hein ? (fulminant) Je vais vous apprendre moi !
	
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos (self);	
	B_Attack (self, other, AR_Theft, 1); 
};
	
func void DIA_Lobart_STOLENCLOTHS_ForgetIt ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00"); //Laissez tomber !
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01"); //(fulminant) Je vais vous apprendre moi !
	
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos (self);	
	B_Attack (self, other, AR_Theft, 1); 
};


 
///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_Hallo		(C_INFO)
{
	npc		 	= BAU_950_Lobart;
	nr          = 2;
	condition	= DIA_Lobart_Hallo_Condition;
	information	= DIA_Lobart_Hallo_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Lobart_Hallo_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;	
	};
};

func void DIA_Lobart_Hallo_Info ()
{
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_Hallo_05_00"); //Qu'est-ce que vous faites � tra�ner sur mes terres ?
		AI_Output (self, other, "DIA_Lobart_Hallo_05_01"); //(�valuant la situation) Dans quel camp �tes-vous ? Dans celui des fermiers en r�bellion ou dans celui du roi ?
	
		Info_ClearChoices	(DIA_Lobart_Hallo);
		Info_AddChoice		(DIA_Lobart_Hallo, "Je ne comprends pas...", DIA_Lobart_Hallo_What );
		Info_AddChoice		(DIA_Lobart_Hallo, "Je suis avec le roi !", 		DIA_Lobart_Hallo_ForTheKing );
		Info_AddChoice		(DIA_Lobart_Hallo, "Je suis avec les paysans !",		DIA_Lobart_Hallo_ForThePeasants );
	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_Hallo_05_02"); //Que puis-je pour vous ?
	};
};

func void DIA_Lobart_Hallo_ForThePeasants()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_ForThePeasants_15_00"); //Je suis pour les paysans !
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_01"); //Ah ! Ce maudit Onar va finir par provoquer notre perte � tous !
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_02"); //A votre avis, pendant combien de temps les paladins vont-ils rester sans rien faire ?
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_03"); //Apr�s ce qu'Onar a fait, toute la ville est en �moi.

	Lobart_AgainstKing = TRUE;
	Info_ClearChoices	(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_ForTheKing()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_ForTheKing_15_00"); //Je suis pour le roi !
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_01"); //(m�prisant) 'Pour le roi !' C'est ce que disent les miliciens quand ils me prennent la moiti� de mes moutons.
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_02"); //Mais o� sont ces salauds quand nous sommes harcel�s par les bandits ? O� seront-ils quand les orques vont nous envahir ?
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_03"); //Je vais vous le dire : En ville, derri�re des remparts �pais.
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_04"); //Alors, laissez moi tranquille avec le roi.
	
	Lobart_AgainstKing = FALSE;
	Info_ClearChoices	(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_What()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_What_15_00"); //Je ne comprends pas.
	AI_Output (self, other, "DIA_Lobart_Hallo_What_05_01"); //Quoi ?! Ne jouez pas avec moi, mon gars ! Je veux savoir de quel bord vous �tes ! Alors ?!
};

///////////////////////////////////////////////////////////////////////
//	Kleidung
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_KLEIDUNG		(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 2;
	condition	= DIA_Lobart_KLEIDUNG_Condition;
	information	= DIA_Lobart_KLEIDUNG_Info;
	permanent 	= FALSE;
	description	= "J'ai besoin de v�tements pratiques !";
};

func int DIA_Lobart_KLEIDUNG_Condition ()
{
	if (! Npc_KnowsInfo(other, DIA_Lobart_STOLENCLOTHS) )
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lobart_KLEIDUNG_Info ()
{
	AI_Output (other, self, "DIA_Lobart_KLEIDUNG_15_00"); //J'ai besoin de v�tements pratiques !
	AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_01"); //Je peux vous donner une tenue de travail propre.
	AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_02"); //Pouvez-vous payer ?
	
			Log_CreateTopic (TOPIC_Kleidung,LOG_MISSION);  
			Log_SetTopicStatus  (TOPIC_Kleidung,LOG_RUNNING);  
			B_LogEntry (TOPIC_Kleidung,"Le fermier Lobart est dispos� � me vendre une tenue de travail.");
			  
		
	if (! Npc_KnowsInfo(other, 	DIA_Lobart_WorkNOW))
	{
		AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_03"); //Vous pourriez travailler pour en payer une partie... si vous voulez du travail.
		B_LogEntry (TOPIC_Kleidung,"Je peux en payer une partie en travaillant � la ferme. Plus je travaillerai, moins les v�tements me co�teront cher.");

	};
};

///////////////////////////////////////////////////////////////////////
//	KOSTEN
///////////////////////////////////////////////////////////////////////

instance DIA_Lobart_BuyClothes (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 2;
	condition	= DIA_Lobart_BuyClothes_Condition;
	information	= DIA_Lobart_BuyClothes_Info;
	permanent 	= TRUE;
	description	= "Combien pour la tenue de travail ?";
};

func int DIA_Lobart_BuyClothes_Condition ()
{
	if ( Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG) 		&& (Lobart_Kleidung_Verkauft == FALSE) )
	|| ( Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) 	&& (Lobart_Kleidung_gestohlen == FALSE) && (Lobart_Kleidung_Verkauft == FALSE) )
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lobart_BuyClothes_Info ()
{
	Wert_LobartsRuestung = 80; //initialisieren
	
	AI_Output (other, self, "DIA_Lobart_BuyClothes_15_00"); //Combien pour la tenue de travail ?
	AI_Output (self, other, "DIA_Lobart_BuyClothes_05_01"); //Eh bien, voyons voir...
	
	if (Lobart_AgainstKing == TRUE)
	{
		//stillschweigender Abzug
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Lobart_Rueben == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_02"); //Vous avez travaill� pour moi aux champs.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Hilda_PfanneKaufen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_03"); //Vous avez aid� ma femme.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Vino_Wein == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_04"); //Vino dit que vous lui avez �t� d'une grande aide. Et c'est pas rien, il est rare qu'il dise du bien des journaliers.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Maleth_Bandits == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_05"); //Maleth dit que vous avez chass� les bandits. Ces b�tards nous ont caus� beaucoup de probl�mes. Gr�ce � vous nous en sommes d�barrass�s !
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	// ------------------------------
	// ------ Wert der R�stung ------
	// ------------------------------
		B_Say_Gold (self, other, Wert_LobartsRuestung);
		
		if (Wert_LobartsRuestung == 30) 
		{
			AI_Output (self, other, "DIA_Lobart_GOLD_05_06"); //Le prix n'a pas chang�.
			B_LogEntry (TOPIC_Kleidung,"Mais il ne me les vendra pas pour moins de 30 pi�ces d'or.");
		};

	Info_ClearChoices	(DIA_Lobart_BuyClothes);
	Info_AddChoice		(DIA_Lobart_BuyClothes, "C'est encore trop cher.", DIA_Lobart_BuyClothes_NotYet );
	Info_AddChoice		(DIA_Lobart_BuyClothes, "Donnez-moi les v�tements de travail (Protection : armes 15, fl�ches 15).", DIA_Lobart_BuyClothes_BUY );
};

func void DIA_Lobart_BuyClothes_BUY()
{
	AI_Output (other, self, "DIA_Lobart_BuyClothes_BUY_15_00"); //Alors donnez-moi la tenue de travail.
	
	if (B_GiveInvItems (other, self, ItMi_gold, Wert_LobartsRuestung))
	{
		if (Npc_HasItems(self,ItAr_BAU_L) > 0)
		{
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_01"); //Eh bien, mon gars. L'honn�tet� est la meilleure des politiques.
			
			B_GiveInvItems (self, other, ItAr_BAU_L, 1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_02"); //Il y a un coffre dans ma maison o� vous trouverez des affaires propres.
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_03"); //Mais n'essayez m�me pas de prendre autre chose sans demander !
		};
		
		Lobart_Kleidung_Verkauft = TRUE;
		Wld_AssignRoomToGuild ("farm03", GIL_NONE);  	//Schlaf Raum
				
		B_CheckLog ();
	}
	else //nicht genug Gold
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_04"); //Vous n'avez pas assez d'or !
	};
	
	Info_ClearChoices	(DIA_Lobart_BuyClothes);
};

func void DIA_Lobart_BuyClothes_NotYet()
{
	AI_Output (other, self, "DIA_Lobart_BuyClothes_NotYet_15_00"); //C'est encore trop cher.
	AI_Output (self, other, "DIA_Lobart_BuyClothes_NotYet_05_01"); //C'est comme vous voulez...
	
	Info_ClearChoices	(DIA_Lobart_BuyClothes);
};

///////////////////////////////////////////////////////////////////////
//	Was ist hier los?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_AufstandInfo (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_AufstandInfo_Condition;
	information	= DIA_Lobart_AufstandInfo_Info;
	permanent 	= FALSE;
	description	= "Bon, mais qu'est-ce qui se passe ici ?";
};

func int DIA_Lobart_AufstandInfo_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_Hallo))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_AufstandInfo_Info ()
{
	AI_Output (other, self, "DIA_Lobart_AufstandInfo_15_00"); //Que se passe-t-il dans le coin ?
	AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_01"); //Vous ne savez pas ce qui se passe ? Mais d'o� sortez-vous ? Nous sommes au bord de la guerre civile !

	if 	(hero.guild == GIL_NONE)
	 {
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_02"); //Jusqu'� maintenant, tous les fermiers consid�raient que le tribut qu'ils versaient � la ville �tait justifi�.
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_03"); //Mais depuis que les paladins sont arriv�s � Khorinis, les gardes de la ville viennent de plus en plus souvent chez nous et, petit � petit, ils nous prennent tout.
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_04"); //Si �a continue comme �a, il ne nous restera bient�t plus rien.
	 };

	AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_05"); //Certains fermiers ont commenc� � se r�volter ! Onar a �t� le premier !
};

///////////////////////////////////////////////////////////////////////
//	Mehr �ber Onar
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_OnarStory (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_OnarStory_Condition;
	information	= DIA_Lobart_OnarStory_Info;
	permanent 	= FALSE;
	description	= "Dites-m'en plus au sujet d'Onar...";
};

func int DIA_Lobart_OnarStory_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_AufstandInfo))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_OnarStory_Info ()
{
	AI_Output (other, self, "DIA_Lobart_OnarStory_15_00"); //Dites-m'en plus au sujet d'Onar...

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_01"); //Vous �tes un mercenaire, n'est-ce pas ? Alors que voulez-vous que je vous dise d'autre sur votre patron ?
		}
		else
		{
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_02"); //Onar est le plus grand fermier de la r�gion. Il a rompu avec la ville.
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_03"); //On raconte qu'il a engag� des mercenaires pour se prot�ger de la milice de la ville.
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_04"); //On ne peut pas lui en vouloir.
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_05"); //Quoi qu'il en soit, d�sormais aucun garde royal n'ose mettre le pied sur sa propri�t�.
		};
};

///////////////////////////////////////////////////////////////////////
//	Mehr �ber S�ldner
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_SldInfo (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_SldInfo_Condition;
	information	= DIA_Lobart_SldInfo_Info;
	permanent 	= FALSE;
	description	= "Qui sont ces mercenaires qu'a engag�s Onar ?";
};

func int DIA_Lobart_SldInfo_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_OnarStory))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_SldInfo_Info ()
{
	AI_Output (other, self, "DIA_Lobart_SldInfo_15_00"); //Qui sont ces mercenaires qu'Onar a engag� ?
	AI_Output (self, other, "DIA_Lobart_SldInfo_05_01"); //Je ne sais pas grand-chose sur ces individus. Je crois que la plupart d'entre eux sont d'anciens prisonniers de la colonie mini�re.
	AI_Output (self, other, "DIA_Lobart_SldInfo_05_02"); //(m�prisant) Tout le monde sait � quoi s'attendre avec eux...
};

///////////////////////////////////////////////////////////////////////
//	F�r wen bist du?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_WhichSide (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_WhichSide_Condition;
	information	= DIA_Lobart_WhichSide_Info;
	permanent 	= FALSE;
	description	= "Dans quel camp �tes-vous ? Celui du roi ou celui des paysans ?";
};

func int DIA_Lobart_WhichSide_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_AufstandInfo))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_WhichSide_Info ()
{
	AI_Output (other, self, "DIA_Lobart_WhichSide_15_00"); //Et vous ? Dans quel camp �tes-vous ? Celui des paysans ou celui du roi ?
	AI_Output (self, other, "DIA_Lobart_WhichSide_05_01"); //Je suis trop proche de la ville pour avoir le choix.
	AI_Output (self, other, "DIA_Lobart_WhichSide_05_02"); //Mais c'est pas plus mal car je n'aurais pas su quelle d�cision prendre.
	
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WhichSide_05_03"); //Le roi nous saigne � blanc et Onar lance ses mercenaires sur tous ceux qui ne veulent pas se joindre � lui.
		AI_Output (self, other, "DIA_Lobart_WhichSide_05_04"); //C'est pour cette raison que les autres fermiers sont encore ind�cis. Mais t�t ou tard, ils devront choisir un camp.
	};
};


///////////////////////////////////////////////////////////////////////
//	*** MISSION: R�ben ziehen ***
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_WorkNOW (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_WorkNOW_Condition;
	information	= DIA_Lobart_WorkNOW_Info;
	permanent 	= FALSE;
	description	= "Je cherche du travail.";
};

func int DIA_Lobart_WorkNOW_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_AufstandInfo))
	|| (Npc_KnowsInfo(other, DIA_Lobart_STOLENCLOTHS))
	|| (Npc_KnowsInfo(other, DIA_Lobart_Kleidung))
	{
		if (Kapitel < 3)
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_WorkNOW_Info ()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_15_00"); //Je cherche du travail.
	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_01"); //Je n'ai pas besoin d'autres ouvriers agricoles. Mais j'ai un peu de travail pour un journalier.
	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_02"); //Vous pouvez donner un coup de main aux champs et il y a certainement quelques bricoles � faire dans le coin.

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_05_03"); //Je pourrais vous payer en or ou vous donner des affaires d�centes � porter.
		AI_Output (self, other, "DIA_Lobart_WorkNOW_05_04"); //Ces affaires ne sont pas donn�es. Je ne peux pas vous en faire cadeau mais je peux vous les vendre pour pas cher si vous travaillez pour moi.
			
		Log_CreateTopic (TOPIC_Kleidung,LOG_MISSION);  
		Log_SetTopicStatus  (TOPIC_Kleidung,LOG_RUNNING);  
		B_LogEntry (TOPIC_Kleidung,"Le fermier Lobart est dispos� � me vendre une tenue de travail. Je peux en payer une partie en travaillant � la ferme. Plus je travaillerai, moins les v�tements me co�teront cher. Mais il ne me les vendra pas pour moins de 30 pi�ces d'or.");
			
		if (Npc_HasEquippedArmor(other) == FALSE)
		|| (Lobart_Kleidung_Verkauft == TRUE)
		{
			AI_Output (self, other, "DIA_Lobart_WorkNOW_05_05"); //Vu votre allure, je vous conseillerai de prendre les v�tements.
		}
		else
		{
			AI_Output (self, other, "DIA_Lobart_WorkNOW_05_06"); //Mais vous avez d�j� des v�tements, vous voulez donc certainement de l'or.
		};
	};

	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_07"); //Quoi qu'il en soit, il faut r�colter les navets dans le champ pr�s de la grange.
	
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
	Info_AddChoice		(DIA_Lobart_WorkNOW, "Vous voulez que je r�colte des navets ? Vous plaisantez !", DIA_Lobart_WorkNOW_WannaFoolMe );
	Info_AddChoice		(DIA_Lobart_WorkNOW, "Tr�s bien...", DIA_Lobart_WorkNOW_Ok );
};

func void DIA_Lobart_WorkNOW_Ok()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_Ok_15_00"); //Tr�s bien...

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_Ok_05_01"); //Alors d�p�chez-vous avant que je ne change d'avis.
	};
	Log_CreateTopic (TOPIC_Rueben,LOG_MISSION);  
	Log_SetTopicStatus  (TOPIC_Rueben,LOG_RUNNING);  
	B_LogEntry (TOPIC_Rueben,"Le fermier Lobart veut que je r�colte les navets. En �change, il me donnera de l'or ou baissera le prix des v�tements.");
	
	MIS_Lobart_Rueben = LOG_RUNNING;
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
};

func void DIA_Lobart_WorkNOW_WannaFoolMe()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_WannaFoolMe_15_00"); //Vous voulez que je ramasse des navets ? Vous plaisantez !
	AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_01"); //Monsieur le 'gentilhomme' ne veut pas se salir les mains avec un vrai travail d'homme, hein ?

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_02"); //Allez au champ ou quittez ma ferme !
	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_03"); //Je n'ai rien d'autre � vous faire faire pour le moment.
	};
	
	Log_CreateTopic (TOPIC_Rueben,LOG_MISSION);  
	Log_SetTopicStatus  (TOPIC_Rueben,LOG_RUNNING);  
	B_LogEntry (TOPIC_Rueben,"Le fermier Lobart veut que je r�colte les navets. En �change, il me donnera de l'or ou baissera le prix des v�tements.");
	
	MIS_Lobart_Rueben = LOG_RUNNING;
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
	
};

///////////////////////////////////////////////////////////////////////
//	Mis RUEBEN Running
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_RuebenRunning		(C_INFO)
{
	npc			 = 	BAU_950_Lobart;
	nr           =  1;
	condition	 = 	DIA_Lobart_RuebenRunning_Condition;
	information	 = 	DIA_Lobart_RuebenRunning_Info;
	permanent	 =	TRUE;
	description	 = 	"Voil� vos navets !";
};

func int DIA_Lobart_RuebenRunning_Condition ()
{
	if (MIS_Lobart_Rueben == LOG_RUNNING)
	&& (Npc_HasItems (other,ItPl_Beet) >= 1)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_RuebenRunning_Info ()
{
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_15_00"); //Voici vos navets !

	if (Npc_HasItems (other,ItPl_Beet) >= 20)
	{
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_01"); //Eh ! Vous n'�tes pas aussi inutile apr�s tout.
			};

		if ((Npc_IsDead(Hilda))== FALSE)
		{
			AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_02"); //Apportez-les � ma femme pour qu'elle les fasse cuire.
	
			MIS_Lobart_RuebenToHilda = LOG_RUNNING;
			Log_CreateTopic (TOPIC_Ruebenbringen,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Ruebenbringen,LOG_RUNNING);
			B_LogEntry (TOPIC_Ruebenbringen,"Je dois apporter les navets � la femme de Lobart dans la maison. Elle les cuira.");
		};
		
		MIS_Lobart_Rueben = LOG_SUCCESS;
		B_GivePlayerXP (XP_LobartHolRueben);
		 
	//	Log_SetTopicStatus(TOPIC_BauerLobart, LOG_SUCCESS); ALT
	//	Log_AddEntry (TOPIC_BauerLobart,"Ich habe Lobart seine R�ben gebracht, er hat mich daf�r entlohnt."); 
		
		AI_Output (other, self, "DIA_Lobart_RuebenRunning_15_03"); //Et en ce qui concerne ma paie ?
		AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_04"); //Je peux vous donner 5 pi�ces d'or.
		
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_05"); //� ou vous vendre les v�tements moins cher, � vous de voir.
			};
	
		Info_ClearChoices 	(DIA_Lobart_RuebenRunning);

		if (hero.guild == GIL_NONE)
			{
				Info_AddChoice		(DIA_Lobart_RuebenRunning, "Proposez-moi un meilleur prix pour ces fringues !",	DIA_Lobart_RuebenRunning_Billiger );
			};

		Info_AddChoice		(DIA_Lobart_RuebenRunning, "Donnez-moi 5 pi�ces d'or !", 		DIA_Lobart_RuebenRunning_Gold );

	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_06"); //Mais il n'y en a m�me pas 20 !
		
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_07"); //Avez-vous mang� le reste ? J'esp�re que non mon gar�on sinon vous pouvez faire une croix sur votre paie !
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_08"); //Sortez d'ici et allez en ramasser d'autres ! Retournez au travail.
			};
		
		AI_StopProcessInfos (self);
	};
};

func void DIA_Lobart_RuebenRunning_Gold ()
{
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_Gold_15_00"); //Donnez-moi les 5 pi�ces d'or.
	AI_Output (self, other, "DIA_Lobart_RuebenRunning_Gold_05_01"); //Tenez.

	B_GiveInvItems (self, other, ItMi_Gold, 5);

		if (hero.guild == GIL_NONE)
			{
					AI_Output (self, other, "DIA_Lobart_RuebenRunning_Gold_05_02"); //Et ne d�pensez pas tout en boisson.
			};
			

	Info_ClearChoices 	(DIA_Lobart_RuebenRunning);
};

func void DIA_Lobart_RuebenRunning_Billiger ()
{
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_Billiger_15_00"); //Faites-moi un meilleur prix pour les fringues !
	AI_Output (self, other, "DIA_Lobart_RuebenRunning_Billiger_05_01"); //Bien ! Elles vous co�teront 10 pi�ces d'or de moins.
	
	Info_ClearChoices 	(DIA_Lobart_RuebenRunning);
};

///////////////////////////////////////////////////////////////////////
//	Was sonst noch zu tun?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_MoreWork (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_MoreWork_Condition;
	information	= DIA_Lobart_MoreWork_Info;
	permanent 	= TRUE;
	description	= "Avez-vous autre chose � me faire faire ?";
};

func int DIA_Lobart_MoreWork_Condition ()
{
	if ((MIS_Lobart_Rueben == LOG_RUNNING)
	|| (MIS_Lobart_Rueben == LOG_SUCCESS))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_MoreWork_Info ()
{
	AI_Output (other, self, "DIA_Lobart_MoreWork_15_00"); //Avez-vous autre chose � me faire faire ?
	
	if (MIS_Lobart_Rueben == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Lobart_MoreWork_05_01"); //R�coltez les navets dans le champ et apr�s nous verrons.
	}
	else //SUCCESS
	{
		AI_Output (self, other, "DIA_Lobart_MoreWork_05_02"); //Non, mais demandez � ma femme ou � ceux qui travaillent dans les champs. Ils ont peut-�tre besoin d'aide.
	};
};



//#####################################################################
//
//
//			ANDREs Aufnahmemission Miliz
//
//
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info AndreHelpLobart
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_ANDREHELPLOBART		(C_INFO)
{
	npc			 = 	BAU_950_Lobart;
	condition	 = 	DIA_Lobart_ANDREHELPLOBART_Condition;
	information	 = 	DIA_Lobart_ANDREHELPLOBART_Info;
	description	 = 	"Andr� m'envoie...";
};

func int DIA_Lobart_ANDREHELPLOBART_Condition ()
{
	if	(MIS_AndreHelpLobart == LOG_RUNNING)			
			{
				return TRUE;
			};
};

func void DIA_Lobart_ANDREHELPLOBART_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_ANDREHELPLOBART_15_00"); //Andr� m'envoie. Y a-t-il quelque chose que je puisse faire pour vous ?
	AI_Output			(self, other, "DIA_Lobart_ANDREHELPLOBART_05_01"); //Oui, bien s�r. Ces maudits fl�aux des champs me rendent malade.
	AI_Output			(self, other, "DIA_Lobart_ANDREHELPLOBART_05_02"); //Massacrez-les tous. Je me fiche de savoir comment.

	Log_AddEntry (TOPIC_BecomeMIL,"Les champs de Lobart sont infest�s de fl�aux des champs. Il veut que je les chasse."); 
	MIS_LobartKillBugs = LOG_RUNNING;
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BugDead
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_BUGDEAD		(C_INFO)
{
	npc			 = 	BAU_950_Lobart;
	condition	 = 	DIA_Lobart_BUGDEAD_Condition;
	information	 = 	DIA_Lobart_BUGDEAD_Info;
	permanent 	 = 	TRUE;
	description	 = 	"Je me suis occup� de ces choses !";
};

var int DIA_Lobart_BUGDEAD_noPerm;

func int DIA_Lobart_BUGDEAD_Condition ()
{
	if (MIS_LobartKillBugs == LOG_RUNNING)
	&& (DIA_Lobart_BUGDEAD_noPerm == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Lobart_BUGDEAD_Info ()
{
	if 	(
				(Npc_IsDead(Lobarts_Giant_Bug1))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug2))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug3))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug4))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug5))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug6))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug7))
		)

		{
			AI_Output			(other, self, "DIA_Lobart_BUGDEAD_15_00"); //Je me suis occup� de ces choses !
			AI_Output			(self, other, "DIA_Lobart_BUGDEAD_05_01"); //Bien jou�. Vous n'�tes pas un mauvais exterminateur. Je vous recommanderai dans la r�gion. Tenez, prenez ceci en paiement.
			
			B_StartOtherRoutine	(Vino,"Start");
			B_StartOtherRoutine	(LobartsBauer1,"Start");
			B_StartOtherRoutine	(LobartsBauer2,"Start");

			CreateInvItems (self, ItMi_Gold, 20);
			B_GiveInvItems (self, other, ItMi_Gold, 20);

			MIS_LobartKillBugs 	= LOG_SUCCESS;
			MIS_AndreHelpLobart = LOG_SUCCESS;
			Log_AddEntry (TOPIC_BecomeMIL,"J'ai d�barrass� Lobart des fl�aux des champs."); 
			DIA_Lobart_BUGDEAD_noPerm = TRUE;
		}
		else  
		{
			AI_Output			(other, self, "DIA_Lobart_BUGDEAD_15_02"); //Je pense m'�tre d�barrass� de ces choses !
			AI_Output			(self, other, "DIA_Lobart_BUGDEAD_05_03"); //N'essayez pas de me la faire. J'en vois encore. Soit vous tuez ces salet�s soit vous laissez tomber.
			AI_StopProcessInfos (self);
		};
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

INSTANCE DIA_Lobart_KAP3_EXIT(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 999;
	condition	= DIA_Lobart_KAP3_EXIT_Condition;
	information	= DIA_Lobart_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lobart_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lobart_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMT
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_DMT		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	30;
	condition	 = 	DIA_Lobart_DMT_Condition;
	information	 = 	DIA_Lobart_DMT_Info;

	description	 = 	"Comment �a va � la ferme ?";
};

func int DIA_Lobart_DMT_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Lobart_DMT_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_15_00"); //Comment �a va � la ferme ?
	AI_Output			(self, other, "DIA_Lobart_DMT_05_01"); //Je n'en peux plus.
	AI_Output			(self, other, "DIA_Lobart_DMT_05_02"); //Ces types avec des capuchons noirs sont soudain apparus sur la route et pr�s de ma ferme.


	Info_ClearChoices	(DIA_Lobart_DMT);

	Info_AddChoice	(DIA_Lobart_DMT, DIALOG_ENDE, DIA_Lobart_DMT_BACK );

	if (hero.guild == GIL_KDF)
	&& (Vino_isAlive_Kap3 == TRUE)
		{
		AI_Output			(self, other, "DIA_Lobart_DMT_05_03"); //Ils passent leur temps � parler avec Vino puis ils disparaissent avec lui.

			if (NpcObsessedByDMT_Vino == FALSE)
			{
			Info_AddChoice	(DIA_Lobart_DMT, "O� ont-ils conduit Vino ?", DIA_Lobart_DMT_VinoWohin );
			};
			Info_AddChoice	(DIA_Lobart_DMT, "Que voulaient-ils � Vino ?", DIA_Lobart_DMT_VinoWas );
		};

	if ((Npc_IsDead(Hilda))== FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	{
		AI_Output			(self, other, "DIA_Lobart_DMT_05_04"); //Peu de temps apr�s, ma femme est retomb�e malade. Elle passe son temps au lit et �a lui arrive de plus en plus souvent.
	};

	AI_Output			(self, other, "DIA_Lobart_DMT_05_05"); //Je vais craquer !

	if (MIS_HealHilda != LOG_SUCCESS)
	&& ((Npc_IsDead(Hilda)) == FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	{
		Info_AddChoice	(DIA_Lobart_DMT, "Pourquoi ne pas conduire votre femme chez le gu�risseur ?", DIA_Lobart_DMT_FrauHeilen );
	};

	Info_AddChoice	(DIA_Lobart_DMT, "Pourquoi ne faites-vous rien contre ces robes noires ?", DIA_Lobart_DMT_hof );
	Info_AddChoice	(DIA_Lobart_DMT, "Avez-vous parl� aux hommes en noir ?", DIA_Lobart_DMT_spokeToThem );
	
};
func void DIA_Lobart_DMT_FrauHeilen ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_FrauHeilen_15_00"); //Pourquoi ne pas conduire votre femme chez un gu�risseur ?
	AI_Output			(self, other, "DIA_Lobart_DMT_FrauHeilen_05_01"); //Nous devrions aller en ville pour voir Vatras mais je refuse de bouger d'ici tant que tout �a ne sera pas r�gl�.
	
	Log_CreateTopic (TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry (TOPIC_HealHilda,"Hilda, la femme de Lobart, est malade mais Vatras a quelque chose qui pourrait la soigner."); 

	MIS_HealHilda = LOG_RUNNING;	
};

func void DIA_Lobart_DMT_BACK ()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start"); 
};

func void DIA_Lobart_DMT_spokeToThem ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_spokeToThem_15_00"); //Avez-vous parl� aux hommes en noir ?
	AI_Output			(self, other, "DIA_Lobart_DMT_spokeToThem_05_01"); //Bien s�r. C'�tait difficile de faire autrement.
	AI_Output			(self, other, "DIA_Lobart_DMT_spokeToThem_05_02"); //Je crois qu'ils recherchent quelqu'un.
};

func void DIA_Lobart_DMT_hof ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_hof_15_00"); //Pourquoi ne faites-vous rien contre ces hommes en robe noire ?
	AI_Output			(self, other, "DIA_Lobart_DMT_hof_05_01"); //J'aimerais bien. Mais j'ai vu comment ils ont br�l� vif un citadin.
	AI_Output			(self, other, "DIA_Lobart_DMT_hof_05_02"); //Pourquoi risquerais-je ma vie ?
};

func void DIA_Lobart_DMT_VinoWas ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_VinoWas_15_00"); //Que voulaient-ils � Vino ?
	AI_Output			(self, other, "DIA_Lobart_DMT_VinoWas_05_01"); //Ils ne l'ont pas dit. Ils l'ont juste emmen� avec eux.
};

func void DIA_Lobart_DMT_VinoWohin ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_VinoWohin_15_00"); //O� ont-ils emmen� Vino ?
	AI_Output			(self, other, "DIA_Lobart_DMT_VinoWohin_05_01"); //Ils ont grimp� cette colline avec lui.
};

///////////////////////////////////////////////////////////////////////
//	Info VinoTot
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_VINOTOT		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	32;
	condition	 = 	DIA_Lobart_VINOTOT_Condition;
	information	 = 	DIA_Lobart_VINOTOT_Info;

	description	 = 	"Vino ne reviendra pas.";
};

func int DIA_Lobart_VINOTOT_Condition ()
{
	if ((Npc_IsDead(Vino))	|| (NpcObsessedByDMT_Vino == TRUE))
	&& (Npc_KnowsInfo(other, DIA_Lobart_DMT))
	&& (hero.guild == GIL_KDF)
		{
				return TRUE;
		};
};

func void DIA_Lobart_VINOTOT_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_00"); //Vino ne reviendra pas.

	if (Npc_IsDead(Vino))	
	{
		AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_01"); //Il est mort.
	}
	else
	{
		AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_02"); //Ils l'ont rendu fou.
	};
	
	AI_Output			(self, other, "DIA_Lobart_VINOTOT_05_03"); //Par Innos. Heureusement, ce cauchemar sera bient�t termin�.
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_PERM		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	80;
	condition	 = 	DIA_Lobart_PERM_Condition;
	information	 = 	DIA_Lobart_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Prenez soin de votre ferme !";
};

func int DIA_Lobart_PERM_Condition ()
{		
	if (Npc_KnowsInfo(other, DIA_Lobart_DMT))
	&& (Kapitel >= 3)
	&&	((Npc_IsDead(OrcWarrior_Lobart1))
	&&	(Npc_IsDead(OrcWarrior_Lobart2))
	&&	(Npc_IsDead(OrcWarrior_Lobart3))
	&&	(Npc_IsDead(OrcWarrior_Lobart4))
	&&	(Npc_IsDead(OrcWarrior_Lobart5))
	&&	(Npc_IsDead(OrcWarrior_Lobart6)))
		{
				return TRUE;
		};
};

func void DIA_Lobart_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_PERM_15_00"); //Veillez sur votre ferme !
	AI_Output			(self, other, "DIA_Lobart_PERM_05_01"); //J'essaierai.
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

INSTANCE DIA_Lobart_KAP4_EXIT(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 999;
	condition	= DIA_Lobart_KAP4_EXIT_Condition;
	information	= DIA_Lobart_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lobart_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lobart_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orkproblem
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_ORKPROBLEM		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	41;
	condition	 = 	DIA_Lobart_ORKPROBLEM_Condition;
	information	 = 	DIA_Lobart_ORKPROBLEM_Info;

	description	 = 	"Vous avez un probl�me avec les orques.";
};

func int DIA_Lobart_ORKPROBLEM_Condition ()
{
	if	((Npc_IsDead(OrcWarrior_Lobart1)== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart2)	== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart3)	== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart4)	== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart5)	== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart6)	== FALSE))
	&& 	(Kapitel >= 4)
	&& 	((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	&& (Npc_KnowsInfo(other, DIA_Lobart_DMT))
		{
				return TRUE;
		};
};

func void DIA_Lobart_ORKPROBLEM_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_ORKPROBLEM_15_00"); //Vous avez un probl�me avec les orques.
	AI_Output			(self, other, "DIA_Lobart_ORKPROBLEM_05_01"); //(fulminant) Mal�diction. Cela ne finira-t-il jamais ?
	AI_Output			(self, other, "DIA_Lobart_ORKPROBLEM_05_02"); //Si cela continue, ma ferme ne vaudra pas trois sous.
	
	Log_CreateTopic (TOPIC_LobartsOrKProblem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartsOrKProblem, LOG_RUNNING);
	B_LogEntry (TOPIC_LobartsOrKProblem,"Les orques se sont install�s � la ferme de Lobart. Il veut que je m'en d�barrasse."); 

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orksweg
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_ORKSWEG		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	42;
	condition	 = 	DIA_Lobart_ORKSWEG_Condition;
	information	 = 	DIA_Lobart_ORKSWEG_Info;

	description	 = 	"Je me suis d�barrass� des orques sur vos terres.";
};

func int DIA_Lobart_ORKSWEG_Condition ()
{
	if	(Npc_IsDead(OrcWarrior_Lobart1)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart2)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart3)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart4)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart5)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart6)	== TRUE)
	&& 	(Kapitel >= 4)
	&& 	((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void DIA_Lobart_ORKSWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_ORKSWEG_15_00"); //J'ai d�barrass� votre terre des orques.
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Lobart_ORKSWEG_05_01"); //Que personne ne dise plus que les paladins ne font rien pour nous autres fermiers.
	};
	AI_Output			(self, other, "DIA_Lobart_ORKSWEG_05_02"); //Lou� soit Innos. Je ne peux pas vous offrir grand-chose mais j'esp�re que vous appr�cierez mon geste de reconnaissance.
	
	B_StartOtherRoutine	(Vino,"Start");
	B_StartOtherRoutine	(LobartsBauer1,"Start");
	B_StartOtherRoutine	(LobartsBauer2,"Start");
	
	TOPIC_END_LobartsOrKProblem = TRUE;
	B_GivePlayerXP (XP_KilledLobartOrks);
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					
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

INSTANCE DIA_Lobart_KAP5_EXIT(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 999;
	condition	= DIA_Lobart_KAP5_EXIT_Condition;
	information	= DIA_Lobart_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lobart_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lobart_KAP5_EXIT_Info()
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


INSTANCE DIA_Lobart_KAP6_EXIT(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 999;
	condition	= DIA_Lobart_KAP6_EXIT_Condition;
	information	= DIA_Lobart_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lobart_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lobart_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lobart_PICKPOCKET (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 900;
	condition	= DIA_Lobart_PICKPOCKET_Condition;
	information	= DIA_Lobart_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Lobart_PICKPOCKET_Condition()
{
	C_Beklauen (65, 80);
};
 
FUNC VOID DIA_Lobart_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lobart_PICKPOCKET);
	Info_AddChoice		(DIA_Lobart_PICKPOCKET, DIALOG_BACK 		,DIA_Lobart_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lobart_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lobart_PICKPOCKET_DoIt);
};

func void DIA_Lobart_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lobart_PICKPOCKET);
};
	
func void DIA_Lobart_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lobart_PICKPOCKET);
};




















































































