func void B_KommMit ()
{
	AI_Output (other, self,"DIA_AkilsSchaf_KommMit_15_00");	//Suivez-moi !
};
func void B_BIFF_VERARSCHEN ()
{
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_lebenlassen_07_01"); //Inutile de vous payer ma tête.
};

func void B_BiffsAnteil_Berechnung() //Joly: Wieviel Kohle muß der SC Biff nun geben:
{	
	var int momentanKohle;
	var int UeberschussKohle;
	momentanKohle = Npc_HasItems(hero,ItMi_Gold);
	UeberschussKohle = (momentanKohle - DJG_Biff_SCGold);
	BiffsAnteil = ((UeberschussKohle)/2);
};

func void B_BiffsAnteil_PrintScreen ()
{
	var string BiffsAnteilText_Teil;
	var string BiffsAnteilText;
	var string Anteil;
	Anteil = IntToString (BiffsAnteil);
	BiffsAnteilText_Teil = ConcatStrings(PRINT_BiffsAnteil, Anteil);		
	BiffsAnteilText	= ConcatStrings(BiffsAnteilText_Teil, PRINT_BiffGold);	
	AI_PrintScreen	(BiffsAnteilText, -1, 45, FONT_ScreenSmall, 4);
};
func void B_Biff_SetRefuseTalk ()	//Joly: Biffs Geld eintreiberei kommt beim HalbeHalbe Deal nicht so häufig.
{
	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		Npc_SetRefuseTalk (Biff,1000);//Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	}
	else
	{
		Npc_SetRefuseTalk (Biff,600);//Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	};
};
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Biff_EXIT   (C_INFO)
{
	npc         = DJG_713_Biff;
	nr          = 999;
	condition   = DIA_Biff_EXIT_Condition;
	information = DIA_Biff_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Biff_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Biff_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HALLO		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	5;
	condition	 = 	DIA_Biff_HALLO_Condition;
	information	 = 	DIA_Biff_HALLO_Info;

	description	 = 	"Que faites-vous ici ?";
};

func int DIA_Biff_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Biff_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_15_00"); //Que faites-vous ici ?
	AI_Output			(self, other, "DIA_Biff_HALLO_07_01"); //C'est la question la plus stupide que j'ai entendue depuis longtemps. A votre avis ?

	Info_AddChoice	(DIA_Biff_HALLO, "Si vous saviez la tête d'abruti que vous faites ! ", DIA_Biff_HALLO_spott );
	Info_AddChoice	(DIA_Biff_HALLO, "Ça ne m'intéresse pas.", DIA_Biff_HALLO_keineAhnung );
	Info_AddChoice	(DIA_Biff_HALLO, "Laissez tomber !", DIA_Biff_HALLO_doof );
};

func void DIA_Biff_HALLO_doof ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_doof_15_00"); //Laissez tomber.
	Info_ClearChoices	(DIA_Biff_HALLO);
};

func void DIA_Biff_HALLO_spott ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_spott_15_00"); //Si vous saviez la tête d'abruti que vous faites ! Vous comprendriez pourquoi je dois le demander.
	AI_Output			(self, other, "DIA_Biff_HALLO_spott_07_01"); //Vous avez une trop grande gueule à mon goût. Il est temps que quelqu'un vous apprenne à la fermer.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};

func void DIA_Biff_HALLO_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_15_00"); //Je n'en ai pas la moindre idée.
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_07_01"); //J'attends qu'il se passe quelque chose ici.

	Info_AddChoice	(DIA_Biff_HALLO, "A quoi vous attendez-vous ?", DIA_Biff_HALLO_keineAhnung_was );
};
func void DIA_Biff_HALLO_keineAhnung_was ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_15_00"); //Qu'attendez-vous qu'il se passe ?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_07_01"); //Vous n'êtes vraiment pas le type le plus futé que j'ai rencontré. Si je le savais, je n'aurais pas besoin d'attendre.

	Info_AddChoice	(DIA_Biff_HALLO, "Alors, que pourrait-il arriver ?", DIA_Biff_HALLO_keineAhnung_was_was2 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_15_00"); //Qu'est-ce qui pourrait se passer alors ?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_07_01"); //Vous commencez à me taper sur les nerfs. Je me fiche de ce qui pourrait se passer tant qu'il se passe quelque chose.

	Info_AddChoice	(DIA_Biff_HALLO, "Alors pourquoi ne faites-vous rien ?", DIA_Biff_HALLO_keineAhnung_was_was2_was3 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00"); //Alors pourquoi ne faites-vous pas quelque chose ?
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01"); //Si vous n'arrêtez pas tout de suite de poser des questions idiotes, je vais devoir vous fermer le clapet.


	Info_AddChoice	(DIA_Biff_HALLO, "Si vous vous contentez de rester planté là, il ne se passera jamais rien !", DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 );

};
func void DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4 ()
{
	AI_Output			(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00"); //Si vous restez là à attendre, il ne se passera jamais rien !
	AI_Output			(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01"); //Exactement !

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};


///////////////////////////////////////////////////////////////////////
//	Info washierimTal
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_WASHIERIMTAL		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	7;
	condition	 = 	DIA_Biff_WASHIERIMTAL_Condition;
	information	 = 	DIA_Biff_WASHIERIMTAL_Info;

	description	 = 	"Qu'espérez-vous trouver dans la Vallée des mines ?";
};

func int DIA_Biff_WASHIERIMTAL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Biff_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Biff_WASHIERIMTAL_Info ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_15_00"); //Qu'espérez-vous trouver dans la Vallée des mines ?
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_01"); //De l'or et la gloire. Quoi d'autre ? Quand j'en aurai fini avec le dragon, je prendrai des bains d'or.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_07_02"); //Assez pour passer ma vie à fréquenter toutes les tavernes et tous les bordels du pays.

	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "Alors je vous souhaite bonne chance !", DIA_Biff_WASHIERIMTAL_vielglueck );
	Info_AddChoice	(DIA_Biff_WASHIERIMTAL, "C'est ça ou la mort !", DIA_Biff_WASHIERIMTAL_ihrtot );

};
func void DIA_Biff_WASHIERIMTAL_ihrtot ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_ihrtot_15_00"); //C'est ça ou la mort.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_ihrtot_07_01"); //Et alors ? Ça fait partie des risques. Si vous voulez être riche, il faut prendre quelques risques.

	Info_ClearChoices	(DIA_Biff_WASHIERIMTAL);
};

func void DIA_Biff_WASHIERIMTAL_vielglueck ()
{
	AI_Output			(other, self, "DIA_Biff_WASHIERIMTAL_vielglueck_15_00"); //Alors je vous souhaite bonne chance.
	AI_Output			(self, other, "DIA_Biff_WASHIERIMTAL_vielglueck_07_01"); //Je n'ai pas besoin de chance, juste de ma hache.

	Info_ClearChoices	(DIA_Biff_WASHIERIMTAL);
};

///////////////////////////////////////////////////////////////////////
//	Info arbeiten
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ARBEITEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	8;
	condition	 = 	DIA_Biff_ARBEITEN_Condition;
	information	 = 	DIA_Biff_ARBEITEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Cela vous intéresserait de travailler pour moi ?";
};

func int DIA_Biff_ARBEITEN_Condition ()
{
	if 	(DJG_BiffParty == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Biff_HALLO))
		&& (DJG_Biff_Stay == FALSE)	
			{
					return TRUE;
			};
};
func void DIA_Biff_ARBEITEN_Info ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_15_00"); //Aimeriez-vous travailler pour moi à partir de maintenant ?
	
	B_LogEntry (TOPIC_Dragonhunter,"Biff, le chasseur de dragon, est un mercenaire classique. Si je le paie, il combattra pour moi."); 

	if (DJG_BiffParty_nomore >= 6) //Joly: Biff hat bei 3 die Schnauze voll vom SC
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_01"); //On a déjà essayé. Ça n'a pas très bien marché. Merci, mais ça ne m'intéresse pas.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_07_02"); //Hum. Pourquoi pas ? Combien m'offrez-vous ?
	};
	Info_ClearChoices	(DIA_Biff_ARBEITEN);
	
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Estimez-vous heureux que je vous laisse vivre.", DIA_Biff_ARBEITEN_lebenlassen );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Vous aurez la moitié du butin.", DIA_Biff_ARBEITEN_HalbeHalbe );
	Info_AddChoice	(DIA_Biff_ARBEITEN, "Pour l'instant, je vous paie 100 pièces d'or.", DIA_Biff_ARBEITEN_100 );
};

func void DIA_Biff_ARBEITEN_100 ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_100_15_00"); //Pour l'instant, je vous offre 100 pièces d'or.

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{	
			AI_Output			(self, other, "DIA_Biff_ARBEITEN_100_07_01"); //Très bien. C'est un début. Allez-y, je vous suis.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"Follow");
			B_Biff_SetRefuseTalk ();
			self.aivar[AIV_PARTYMEMBER] = TRUE;
			DJG_BiffParty = TRUE;	
		}
		else
		{
			B_BIFF_VERARSCHEN ();
			AI_StopProcessInfos (self);
			DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
		};

};

func void DIA_Biff_ARBEITEN_HalbeHalbe ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_HalbeHalbe_15_00"); //Vous aurez la moitié du butin.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_01"); //Ça me paraît honnête. Mais je vous avertis, n'essayez pas de m'arnaquer ou vous le regretterez.
	AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_02"); //Autre chose. Je ne veux aucune arme ni aucun de ces trucs que vous pourriez trouver. Seul l'or m'intéresse.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BiffParty = TRUE;
	DJG_Biff_HalbeHalbe  = TRUE;
	B_Biff_SetRefuseTalk ();

	if (DJG_Biff_HalbeHalbe_again == FALSE)
	{
		DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
		DJG_Biff_HalbeHalbe_again = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_03"); //Mais pourquoi je vous répète ça ? Vous le savez déjà.
	};
};

func void DIA_Biff_ARBEITEN_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Biff_ARBEITEN_lebenlassen_15_00"); //Estimez-vous heureux si je vous laisse en vie.
	B_BIFF_VERARSCHEN ();
	AI_StopProcessInfos (self);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);
};


///////////////////////////////////////////////////////////////////////
//	Info Geldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_GELDEINTREIBEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 9;
	condition	 = 	DIA_Biff_GELDEINTREIBEN_Condition;
	information	 = 	DIA_Biff_GELDEINTREIBEN_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int BIFF_LABERT_GELDEINTREIBEN;
func int DIA_Biff_GELDEINTREIBEN_Condition ()
{
	if (DJG_Biff_SCGold < Npc_HasItems(hero,ItMi_Gold)-1)
		&& ((Npc_GetBodyState(hero))!= BS_INVENTORY)				//Joly: wegen Truhen		 
		&& ((Npc_GetBodyState(hero))!= BS_MOBINTERACT_INTERRUPT)
		&& (((Npc_GetBodyState(hero))!= BS_STAND)||(BIFF_LABERT_GELDEINTREIBEN == TRUE))//Joly: wegen Plündern von NSC-Invs	
		&& (((Npc_GetBodyState(hero))!= BS_ITEMINTERACT)||(BIFF_LABERT_GELDEINTREIBEN == TRUE))//Joly: wegen Geldbeutel	
		&& (DJG_Biff_HalbeHalbe == TRUE)
		&& (DJG_BiffParty == TRUE)	
		&& (DJG_Biff_Stay == FALSE)	
		{
			BIFF_LABERT_GELDEINTREIBEN = TRUE;
			return TRUE; 
		};
};

func void DIA_Biff_GELDEINTREIBEN_Info ()
{
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_07_00"); //Attendez une minute ! Ne m'avez-vous pas dit que la moitié du butin m'appartenait ? Envoyez la monnaie !

	B_BiffsAnteil_Berechnung ();
	B_BiffsAnteil_PrintScreen ();

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);

	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Je n'ai pas les moyens de vous engager.", DIA_Biff_GELDEINTREIBEN_zuTeuer );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Voici votre part.", DIA_Biff_GELDEINTREIBEN_geben );
};
func void DIA_Biff_GELDEINTREIBEN_geben ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_geben_15_00"); //Voici votre part.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_geben_07_01"); //Très bien. Allons-y.
	AI_StopProcessInfos (self);
	B_GiveInvItems (other, self, ItMi_Gold, BiffsAnteil);
	B_Biff_SetRefuseTalk ();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00"); //Vous me coûtez trop cher.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01"); //Arrêtez de vous plaindre. On s'était mis d'accord pour la moitié.

	Info_ClearChoices	(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Je crains que nous devions nous séparer maintenant.", DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen );
	Info_AddChoice	(DIA_Biff_GELDEINTREIBEN, "Voici votre part.", DIA_Biff_GELDEINTREIBEN_geben );

};
func void DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen ()
{
	AI_Output			(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00"); //Ich fürchte, ich muss mich von dir trennen.
	AI_Output			(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01"); //Si vous le dites. Je dois juste récupérer ma part.

	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_Attack (self, other, AR_NONE, 1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore +1);	
};

///////////////////////////////////////////////////////////////////////
//	Info IchBleibhier
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ICHBLEIBHIER		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 6;
	condition	 = 	DIA_Biff_ICHBLEIBHIER_Condition;
	information	 = 	DIA_Biff_ICHBLEIBHIER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_ICHBLEIBHIER_Condition ()
{
	if 		(
				((Npc_GetBodyState(hero))!= BS_INVENTORY)				//Joly: wegen Truhen
				&& ((Npc_GetBodyState(hero))!= BS_MOBINTERACT_INTERRUPT)
				&& (DJG_BiffParty == TRUE)
				&& (DJG_Biff_Stay == FALSE)	
				&& 	(
						(
							(
								//Joly: Biff stört nicht das Drachengespräch!
								((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01")<4000)	&& (Npc_IsDead(SwampDragon)== FALSE)&& (SwampDragon.flags != 0))
								||((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8")<2000)	&& (Npc_IsDead(RockDragon)== FALSE) && (RockDragon.flags != 0))
								||((Npc_GetDistToWP(self,"CASTLE_36")<4000)			&& (Npc_IsDead(FireDragon)== FALSE) && (FireDragon.flags != 0))
								||((Npc_GetDistToWP(self,"OW_ICEDRAGON_01")<4000)	&& (Npc_IsDead(IceDragon)== FALSE) 	&& (IceDragon.flags != 0))
							) 	
							&& (Npc_HasItems (hero,ItMi_InnosEye_Mis)>=1)
						)
						||(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02")<4500)//Joly: Biff kommt nicht in die Burg
					)
			)
				{
					return TRUE;
				};
};

func void DIA_Biff_ICHBLEIBHIER_Info ()
{
	AI_Output			(self, other, "DIA_Biff_ICHBLEIBHIER_07_00"); //On est dans un endroit dangereux. Passez devant. Je surveille nos arrières.

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,300);

	if (Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Swamp");
	};

	if (Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Rock");
	};

	if (Npc_GetDistToWP(self,"CASTLE_36")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Fire");
	};

	if (Npc_GetDistToWP(self,"OW_ICEDRAGON_01")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_Ice");
	};

	if (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02")<10000)
	{
		Npc_ExchangeRoutine	(self,"Stay_AwayFromOC");
	};
	DJG_Biff_Stay = TRUE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Stay_AwayFromOC
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Stay_AwayFromOC		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	condition	 = 	DIA_Biff_Stay_AwayFromOC_Condition;
	information	 = 	DIA_Biff_Stay_AwayFromOC_Info;
	nr		 	 = 3;
	permanent	 = 	TRUE;

	description	 = 	"(Reprendre Biff avec vous)";

};

func int DIA_Biff_Stay_AwayFromOC_Condition ()
{
		if 	(
				(Npc_GetDistToWP(self,"OW_PATH_298")<500)
				||(Npc_GetDistToWP(self,"LOCATION_19_01")<500)
			)
			&& (DJG_BiffParty == TRUE)	
			&& (DJG_Biff_Stay == TRUE)	
				{
					return TRUE;
				};
};

func void DIA_Biff_Stay_AwayFromOC_Info ()
{
	B_KommMit ();
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow");
	DJG_Biff_Stay = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Kohleweggeben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KOHLEWEGGEBEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	condition	 = 	DIA_Biff_KOHLEWEGGEBEN_Condition;
	information	 = 	DIA_Biff_KOHLEWEGGEBEN_Info;
	nr		 	 = 10;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_KOHLEWEGGEBEN_Condition ()
{
	if (DJG_Biff_SCGold > Npc_HasItems(hero,ItMi_Gold))
		&& (DJG_Biff_HalbeHalbe == TRUE)
		&& (DJG_BiffParty == TRUE)	
		&& (DJG_Biff_Stay == FALSE)	
		{
			//Joly:return TRUE;
		};
};

func void DIA_Biff_KOHLEWEGGEBEN_Info ()
{
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_00"); //Ne semez pas votre or partout.
	AI_Output			(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_01"); //Vous feriez mieux de me le donner.

	AI_StopProcessInfos (self);
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};


///////////////////////////////////////////////////////////////////////
//	Info BiffLosWerden
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_BIFFLOSWERDEN		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 11;
	condition	 = 	DIA_Biff_BIFFLOSWERDEN_Condition;
	information	 = 	DIA_Biff_BIFFLOSWERDEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Je crois que notre collaboration s'arrête maintenant.";
};

func int DIA_Biff_BIFFLOSWERDEN_Condition ()
{
	if (DJG_BiffParty == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Biff_BIFFLOSWERDEN_Info ()
{
	AI_Output			(other, self, "DIA_Biff_BIFFLOSWERDEN_15_00"); //Je pense que c'est ici que notre collaboration doit se terminer.
	AI_Output			(self, other, "DIA_Biff_BIFFLOSWERDEN_07_01"); //Comme vous voulez. J'ai mieux à faire également. A plus tard.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
};

///////////////////////////////////////////////////////////////////////
//	Info MehrGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_MEHRGELD		(C_INFO)
{
	npc		 	= 	DJG_713_Biff;
	nr			 = 12;
	condition	 = 	DIA_Biff_MEHRGELD_Condition;
	information	 = 	DIA_Biff_MEHRGELD_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Biff_MEHRGELD_Condition ()
{
	if 	(DJG_BiffParty == TRUE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (DJG_Biff_Stay == FALSE)	
		{
				return TRUE;
		};
};
var int DIA_Biff_MEHRGELD_Info_OneTime;
func void DIA_Biff_MEHRGELD_Info ()
{
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_00"); //Je commence à croire que vous devriez me donner plus d'argent.

	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_01"); //100 pièces d'or devraient faire l'affaire.
		if (DIA_Biff_MEHRGELD_Info_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_02"); //Pas de problème, mais je n'oublie pas que nous devons partager le butin.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_03"); //C'est pourquoi je ne vous harcèle pas pour avoir plus d'argent.
			DIA_Biff_MEHRGELD_Info_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Biff_MEHRGELD_07_04"); //Je veux 100 pièces d'or supplémentaires.
	};
	
	Info_ClearChoices	(DIA_Biff_MEHRGELD);
	
	Info_AddChoice	(DIA_Biff_MEHRGELD, "Je n'ai pas les moyens de vous engager.", DIA_Biff_MEHRGELD_zuTeuer );
	Info_AddChoice	(DIA_Biff_MEHRGELD, "D'accord. Vous le valez bien.", DIA_Biff_MEHRGELD_ok );

};

func void DIA_Biff_MEHRGELD_ok ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_ok_15_00"); //Très bien, vous les méritez.

	if (B_GiveInvItems (other, self, ItMi_Gold,100))
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_01"); //Je crois oui. Continuons.

			AI_StopProcessInfos (self);

			if (DJG_Biff_HalbeHalbe == TRUE)
			{
				DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);	// Biff schaut, wieviel Geld der Spieler jetzt hat.
			};
			B_Biff_SetRefuseTalk ();
		}
		else
		{
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_02"); //Pauvre gogo, vous n'avez même pas de quoi payer un compagnon d'armes.
			AI_Output			(self, other, "DIA_Biff_MEHRGELD_ok_07_03"); //Je pense que je vais essayer de me trouver un autre partenaire.
			
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"Start");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			DJG_Biff_HalbeHalbe = FALSE;
			DJG_BiffParty = FALSE;
			DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
		};
};

func void DIA_Biff_MEHRGELD_zuTeuer ()
{
	AI_Output			(other, self, "DIA_Biff_MEHRGELD_zuTeuer_15_00"); //Vous me coûtez trop cher.
	AI_Output			(self, other, "DIA_Biff_MEHRGELD_zuTeuer_07_01"); //Alors à partir de maintenant, débrouillez-vous tout seul.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HEILUNG		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	4;
	condition	 = 	DIA_Biff_HEILUNG_Condition;
	information	 = 	DIA_Biff_HEILUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"Avez-vous besoin d'une potion de soin ?";
};

func int DIA_Biff_HEILUNG_Condition ()
{
	if (DJG_BiffParty == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Biff_HEILUNG_Info ()
{
	AI_Output			(other, self, "DIA_Biff_HEILUNG_15_00"); //Avez-vous besoin d'une potion de soin ?
	AI_Output			(self, other, "DIA_Biff_HEILUNG_07_01"); //Bien sûr, ça ne peut pas faire de mal.

	Info_ClearChoices	(DIA_Biff_HEILUNG);
	Info_AddChoice	(DIA_Biff_HEILUNG, "Je vous donnerai quelque chose plus tard.", DIA_Biff_HEILUNG_spaeter );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(la plus petite potion de soin)", DIA_Biff_HEILUNG_heiltrankLow );
	Info_AddChoice	(DIA_Biff_HEILUNG, "(la meilleure potion de soin)", DIA_Biff_HEILUNG_heiltrank );

};
func void DIA_Biff_HEILUNG_heiltrank ()
{
	if (B_GiveInvItems (other, self, ItPo_Health_03,1))
	{
	B_UseItem (self, ItPo_Health_03);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_02,1))
	{
	B_UseItem (self, ItPo_Health_02);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_01,1))
	{
	B_UseItem (self, ItPo_Health_01);
	}
	else
	{
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrank_07_00"); //Je suppose que je vais devoir attendre que vous m'en trouviez une.
	};

	AI_StopProcessInfos (self);
};
func void DIA_Biff_HEILUNG_heiltrankLow ()
{
	if (B_GiveInvItems (other, self, ItPo_Health_01,1))
	{
	B_UseItem (self, ItPo_Health_01);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_02,1))
	{
	B_UseItem (self, ItPo_Health_02);
	}
	else if (B_GiveInvItems (other, self, ItPo_Health_03,1))
	{
	B_UseItem (self, ItPo_Health_03);
	}
	else
	{
	AI_Output			(self, other, "DIA_Biff_HEILUNG_heiltrankLow_07_00"); //Malheureusement, vous n'en avez pas pour l'instant. Je vous le rappellerai plus tard.
	};

	AI_StopProcessInfos (self);
};
func void DIA_Biff_HEILUNG_spaeter ()
{
	AI_Output			(other, self, "DIA_Biff_HEILUNG_spaeter_15_00"); //Je vous donnerai quelque chose plus tard.
	AI_Output			(self ,other, "DIA_Biff_HEILUNG_spaeter_07_01"); //N'oubliez pas.
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DRACHENTOT		(C_INFO)
{
	npc		 = 	DJG_713_Biff;
	nr		 = 	5;
	condition	 = 	DIA_Biff_DRACHENTOT_Condition;
	information	 = 	DIA_Biff_DRACHENTOT_Info;

	description	 = 	"Ça y est. Tous les dragons sont morts.";
};

func int DIA_Biff_DRACHENTOT_Condition ()
{
	if (DJG_BiffSurvivedLastDragon == TRUE) 
		{
				return TRUE;
		};
};

func void DIA_Biff_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_00"); //Voilà. Tous les dragons sont morts.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_01"); //Ouais et je suis encore debout.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_02"); //Etes-vous sûr que c'était le dernier ?
	AI_Output			(other, self, "DIA_Biff_DRACHENTOT_15_03"); //Il me semble.
	AI_Output			(self, other, "DIA_Biff_DRACHENTOT_07_04"); //Dommage, je commençais à peine à m'échauffer.
	B_GivePlayerXP (XP_BiffSurvivedLastDragon);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	DJG_713_Biff;
	nr			 = 	2;
	condition	 = 	DIA_Biff_KnowWhereEnemy_Condition;
	information	 = 	DIA_Biff_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Est-ce qu'un petit voyage autour du monde vous tente ?";
};
func int DIA_Biff_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Biff_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Biff_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Biff_KnowWhereEnemy_15_00"); //Ça vous dirait un petit voyage autour du monde ?
	AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_01"); //Quoi ?
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_02"); //Laissez tomber. Mon équipage est au complet.
		AI_Output			(self, other, "DIA_Biff_KnowWhereEnemy_07_03"); //Arrêtez de me faire rire.
	}
	else 
	{
		AI_Output			(other,self , "DIA_Biff_KnowWhereEnemy_15_04"); //Je vais quitter Khorinis pour me rendre sur une île afin d'affronter de nouveaux adversaires.

		Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"Je pensais vous l’avoir dit.",DIA_Biff_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Biff_KnowWhereEnemy,"Vous ne voulez pas venir ?",DIA_Biff_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Biff_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_00"); //Vous voulez venir avec moi ?
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01"); //Je me fiche d'affronter de nouveaux adversaires. Je veux...
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_02"); //Là où l'on va, il y aura plus d'or que vous ne pouvez en porter.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03"); //Dans ce cas, je suis partant. Où allons-nous ?
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_Yes_15_04"); //Mais d'abord on doit vous faire sortir de la Vallée des mines.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05"); //Pas de problème. J'y vais de ce pas. Rejoignez-moi au col.

	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                       
    Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                       
    B_LogEntry (TOPIC_Crew,"A la perspective de riches butins, Biff a accepté de m'accompagner. Tant qu'il a assez d'or, je peux compter sur lui."); 
    
    B_GivePlayerXP (XP_Crewmember_Success);   

	self.flags 		 = NPC_FLAG_IMMORTAL;
	Biff_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	Biff_FollowsThroughPass = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"RunsToPass"); 

	Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
};

FUNC VOID DIA_Biff_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Biff_KnowWhereEnemy_No_15_00"); //Je pensais juste devoir vous le dire.
	AI_Output (self ,other,"DIA_Biff_KnowWhereEnemy_No_07_01"); //Bon, amusez-vous bien alors.

	Biff_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Biff_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	Gleich geht´s los
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Pass		(C_INFO)
{
	npc			 = 	DJG_713_Biff;
	nr			 = 	55;
	condition	 = 	DIA_Biff_Pass_Condition;
	information	 = 	DIA_Biff_Pass_Info;
	PERMANENT 	 =  TRUE;

	description	 = 	"Franchirez-vous le col ?";
};
func int DIA_Biff_Pass_Condition ()
{	
	if (Npc_GetDistToWP(self,"START")<1000)
	&& (Biff_IsOnBoard == LOG_SUCCESS) 
		{
				return TRUE;
		};
};
func void DIA_Biff_Pass_Info ()
{
	AI_Output			(other, self, "DIA_Biff_Pass_15_00"); //N'allez-vous pas franchir le col ?
	AI_Output			(self, other, "DIA_Biff_Pass_07_01"); //Arrêtez de radoter. Allez. Je veux arriver au sommet.
	AI_StopProcessInfos (self);

};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Biff_PICKPOCKET (C_INFO)
{
	npc			= DJG_713_Biff;
	nr			= 900;
	condition	= DIA_Biff_PICKPOCKET_Condition;
	information	= DIA_Biff_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Biff_PICKPOCKET_Condition()
{
	C_Beklauen (92, 320);
};
 
FUNC VOID DIA_Biff_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Biff_PICKPOCKET);
	Info_AddChoice		(DIA_Biff_PICKPOCKET, DIALOG_BACK 		,DIA_Biff_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Biff_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Biff_PICKPOCKET_DoIt);
};

func void DIA_Biff_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Biff_PICKPOCKET);
};
	
func void DIA_Biff_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Biff_PICKPOCKET);
};

































