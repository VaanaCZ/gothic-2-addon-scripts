///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Maleth_EXIT   (C_INFO)
{
	npc         = BAU_954_Maleth;
	nr          = 999;
	condition   = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent   = TRUE;
	description = "Je dois y aller !";
};
FUNC INT DIA_Maleth_EXIT_Condition()
{
	if (Kapitel	< 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Maleth_ersterWolf == FALSE)
	{
		Wld_InsertNpc		(YWolf,	"NW_FARM1_PATH_CITY_SHEEP_06");
		Maleth_ersterWolf = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Hallo (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_Hallo_Condition;
	information	= DIA_Maleth_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

func int DIA_Maleth_Hallo_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Maleth_Hallo_08_00"); //Eh ! Etranger !

	if (hero.guild == GIL_NONE)
		{
		
			if (Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_01"); //Je vois que vous revenez des montagnes.
			};
			AI_Output (self, other, "DIA_Maleth_Hallo_08_02"); //Estimez-vous heureux de ne pas être passé ici il y a trois semaines.
			AI_Output (self, other, "DIA_Maleth_Hallo_08_03"); //On vous aurait pris pour un prisonnier évadé. Et ces gaillards, on n'en fait qu'une bouchée.
			
			if (Npc_HasEquippedArmor(other) == FALSE) 
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_04"); //Vous avez l'air complètement éreinté.
			}
			else
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_05"); //Vous aviez l'air complètement éreinté quand vous êtes arrivé.
				AI_Output (self, other, "DIA_Maleth_Hallo_08_06"); //Maintenant, vous avez presque l'air humain.
			};
		};

	AI_Output (self, other, "DIA_Maleth_Hallo_08_07"); //(méfiant) Qu'est-ce qui vous amène ici ?
};

///////////////////////////////////////////////////////////////////////
//	Banditen Überfall
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BANDITS		(C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BANDITS_Condition;
	information	= DIA_Maleth_BANDITS_Info;
	permanent   = FALSE;
	description	= "J'ai été attaqué par des bandits dans les montagnes.";
};

func int DIA_Maleth_BANDITS_Condition ()
{
	if (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BANDITS_15_00"); //J'ai été attaqué par des bandits dans les montagnes.
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_01"); //Maudite vermine ! Ce sont probablement les mêmes salauds qui ont volé un de nos moutons la nuit dernière !
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_02"); //Vous avez eu beaucoup de chance. La plupart des gens ne s'en tirent pas VIVANTS.
};

///////////////////////////////////////////////////////////////////////
//	Banditen tot
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsDEAD	(C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsDEAD_Condition;
	information	= DIA_Maleth_BanditsDEAD_Info;
	permanent   = FALSE;
	description	= "Ces bandits ne vous ennuieront plus.";
};

func int DIA_Maleth_BanditsDEAD_Condition ()
{
	if ( Npc_IsDead (Ambusher_1013) || (Bdt_1013_Away == TRUE) )
	&& (Npc_IsDead (Ambusher_1014)) 
	&& (Npc_IsDead (Ambusher_1015))
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_00"); //Ces bandits ne vous causeront plus d'ennuis...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_01"); //Pourquoi ? Ils sont morts ?
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_02"); //Ils ont cherché des crosses à la mauvaise personne...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_03"); //Innos soit loué ! Tenez, ce n'est pas beaucoup mais je veux que vous le preniez !
	B_GiveInvItems (self, other, ItFo_Wine, 3);
	
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_MalethKillBandits);
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_04"); //Je raconterai ça aux autres !
};

///////////////////////////////////////////////////////////////////////
//	Banditen leben noch
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsALIVE (C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsALIVE_Condition;
	information	= DIA_Maleth_BanditsALIVE_Info;
	permanent   = FALSE;
	description	= "Je sais où se trouve le repaire des bandits...";
};

func int DIA_Maleth_BanditsALIVE_Condition ()
{
	var C_NPC b13; b13 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	
	if ( (!Npc_IsDead (b13)) || (!Npc_IsDead (b14)) || (!Npc_IsDead (b15)) )
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	&& (MIS_Maleth_Bandits != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsALIVE_15_00"); //Je sais où se trouve le repaire des bandits...
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_01"); //Vous voulez les attaquer ? Ne comptez pas sur moi ! C'est beaucoup trop dangereux !
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_02"); //En plus, je dois surveiller mes moutons !
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_03"); //Mais si vous pensez pouvoir nous débarrasser de cette racaille, tous ceux de la ferme vous en seront très reconnaissants.
	MIS_Maleth_Bandits = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Maleth,LOG_RUNNING);
	B_LogEntry (TOPIC_Maleth,"Si je vaincs les bandits sur la route entre la tour de Xardas et la ferme de Lobart, tout le monde m'en sera reconnaissant.");
	
};


///////////////////////////////////////////////////////////////////////
//	Auf dem Weg in die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_ToTheCity (C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 2;
	condition	= DIA_Maleth_ToTheCity_Condition;
	information	= DIA_Maleth_ToTheCity_Info;
	permanent   = FALSE;
	description	= "Je me rends en ville.";
};

func int DIA_Maleth_ToTheCity_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info ()
{
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_00"); //Je me rends en ville.
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_01"); //Avec votre allure, vous allez devoir payer les gardes pour pouvoir entrer.
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_02"); //Et vous devez savoir ce qu'ils veulent entendre.
	}
	else
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_03"); //Ils peuvent vous laisser entrer si vous leur dites ce qu'ils veulent entendre...
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_04"); //C'est-à-dire ?
	AI_Output (self, other, "DIA_Maleth_ToTheCity_08_05"); //Disons, par exemple, que vous venez de la ferme de Lobart et que vous venez voir le forgeron de la ville.
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Pour entrer dans la ville, je peux dire aux gardes de la porte que je viens de la ferme de Lobart et que je veux voir le forgeron.");
	
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_06"); //Mais ça ne vous servira à rien. Vous n'avez pas l'air d'un fermier.
		B_LogEntry (TOPIC_City,"Bien sûr, il me faut ressembler à un fermier.");
		
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_07"); //Je vois.
};
	
	
	

///////////////////////////////////////////////////////////////////////
//	Bessere Ausrüstung
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Equipment		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_Equipment_Condition;
	information	= DIA_Maleth_Equipment_Info;
	permanent   = FALSE;
	description	= "J'ai besoin d'un meilleur équipement !";
};

func int DIA_Maleth_Equipment_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Maleth_Equipment_15_00"); //J'aurai besoin d'autres affaires !
	AI_Output (self, other, "DIA_Maleth_Equipment_08_01"); //C'est certain. Mais je vous le dis tout net, nous n'avons rien à vous donner !
	if (!Npc_IsDead(Lobart))
	{
		AI_Output (self, other, "DIA_Maleth_Equipment_08_02"); //Si vous pouvez payer, Lobart vous vendra bien quelque chose.
		AI_Output (self, other, "DIA_Maleth_Equipment_08_03"); //Sinon allez le voir et demandez-lui s'il a du travail pour vous.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Lobart
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_LOBART		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_LOBART_Condition;
	information	= DIA_Maleth_LOBART_Info;
	permanent   = FALSE;
	description	= "Où puis-je trouver Lobart ?";
};

func int DIA_Maleth_LOBART_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Equipment))
	&& (!Npc_IsDead(Lobart))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info ()
{
	AI_Output (other, self, "DIA_Maleth_LOBART_15_00"); //Où puis-je trouver Lobart ?
	AI_Output (self, other, "DIA_Maleth_LOBART_08_01"); //Eh bien, à la ferme naturellement ! Elle lui appartient !
	AI_Output (self, other, "DIA_Maleth_LOBART_08_02"); //Et ne lui cherchez pas des noises ! Il a botté les fesses à plus d'un vagabond avant de les jeter hors de sa ferme.
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

INSTANCE DIA_Maleth_KAP3_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP3_EXIT_Condition;
	information	= DIA_Maleth_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info probleme
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PROBLEME		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	30;
	condition	 = 	DIA_Maleth_PROBLEME_Condition;
	information	 = 	DIA_Maleth_PROBLEME_Info;

	description	 = 	"Il s'est passé quelque chose ces derniers jours ?";
};

func int DIA_Maleth_PROBLEME_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_PROBLEME_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_15_00"); //S'est-il passé quelque chose ces derniers jours ?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_01"); //Longez la route vers la ville.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_02"); //Si vous rencontrez un type en robe noire, vous verrez ce qu'il y a de nouveau.
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Comment vont vos moutons ?", DIA_Maleth_PROBLEME_schafe );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Les hommes en robe noire sont-ils déjà venus vous voir ?", DIA_Maleth_PROBLEME_beidir );
	
};
func void DIA_Maleth_PROBLEME_beidir ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_beidir_15_00"); //Les hommes en robe noire sont-ils déjà venus vous voir ?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_beidir_08_01"); //Ouaip. Ils sont ici depuis quelques jours. Si vous voulez mon avis, ils sortent tout droit des enfers.

};

func void DIA_Maleth_PROBLEME_schafe ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_15_00"); //Comment vont vos moutons ?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_08_01"); //(en colère) Comme si cela pouvait vous intéresser. Vous avez d'autres problèmes.
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Mes problèmes ? Que pouvez-vous en savoir ?", DIA_Maleth_PROBLEME_schafe_probleme );

};
func void DIA_Maleth_PROBLEME_schafe_probleme ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_15_00"); //Mes problèmes ? Que pouvez-vous savoir de mes problèmes ?
	
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_01"); //(brusque) Vous faites partie de la garde ou pas ? Alors faites quelque chose au sujet de ces bâtards en robe noire !
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_02"); //(en colère) Vous autres les mercenaires vous ne pensez qu'à une seule chose, prendre l'argent des autres.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_03"); //Vous autres, les nobles seigneurs du monastère, vous devriez faire quelque chose contre ces types encapuchonnés.
		};

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Hé ! Surveille tes paroles mon pote.", DIA_Maleth_PROBLEME_schafe_probleme_drohen );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Info_AddChoice	(DIA_Maleth_PROBLEME, "Quel est votre problème ?", DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag );
		};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00"); //Quel est votre problème ?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01"); //C'est à cause de ce foutu tord-boyaux que m'a refilé Vino il y a quelques semaines.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02"); //Je ne me souviens de rien. Tout ce que je sais, c'est que, depuis, je ne retrouve plus ma canne.
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03"); //Et c'est pour ça que vous faites tout ce chahut ?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04"); //On voit bien que ce n'est pas à vous.
	
	Log_CreateTopic (TOPIC_MalethsGehstock, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock, LOG_RUNNING);
	B_LogEntry (TOPIC_MalethsGehstock,"Maleth a perdu sa canne. Il était ivre. Le connaissant bien, il n'a pas dû s'éloigner beaucoup de la ferme de Lobart. Je devrais trouver son bâton dans le coin."); 

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00"); //Faites attention à ce que vous dites.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01"); //Vous avez une grande gueule mais pour le reste... Vous feriez mieux de vous en aller.
};

func void DIA_Maleth_PROBLEME_Back ()
{
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

///////////////////////////////////////////////////////////////////////
//	Info Gehstock
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_GEHSTOCK		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_GEHSTOCK_Condition;
	information	 = 	DIA_Maleth_GEHSTOCK_Info;

	description	 = 	"Je crois que cette canne vous appartient.";
};

func int DIA_Maleth_GEHSTOCK_Condition ()
{
	if (Npc_HasItems (other,ItMw_MalethsGehstock_MIS))
	&& (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
		{
				return TRUE;
		};
};

func void DIA_Maleth_GEHSTOCK_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_00"); //Je crois que cette canne vous appartient.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_01"); //Fantastique. Je...
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_02"); //Un instant. D'abord vous me payez.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_03"); //Mais... je n'ai presque rien.
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_04"); //Alors trouvez autre chose.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_05"); //D'accord. Que dites-vous de ça ? Hier, j'ai vu des bandits passer avec des sacs d'or.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_06"); //Si je vous dis où ils cachent leur butin, vous me rendrez ma canne ?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP (XP_FoundMalethsGehstock);

	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Désolé, ça ne m'intéresse pas. Je veux votre or.", DIA_Maleth_GEHSTOCK_gold );
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Très bien.", DIA_Maleth_GEHSTOCK_ok );
};
func void DIA_Maleth_GEHSTOCK_ok ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_ok_15_00"); //Très bien.
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_01"); //D'accord. Allez vers l'ouest, près de ces bois. Vous y trouverez un ravin.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_02"); //Vous devriez trouver quelque chose dans les grottes là-bas.

	B_LogEntry (TOPIC_MalethsGehstock,"Maleth m'a dit qu'il y avait un camp de bandits dans les bois à l'ouest de la ferme de Lobart."); 
	CreateInvItems 		(BDT_1024_MalethsBandit, ItMi_MalethsBanditGold,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos (self);
};

func void DIA_Maleth_GEHSTOCK_gold ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_gold_15_00"); //Désolé, ça ne m'intéresse pas. Je veux votre or.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_gold_08_01"); //Tenez, c'est tout ce que j'ai. Cela devrait suffire.
	CreateInvItems 		(self, Itmi_Gold, 35);
	B_GiveInvItems 		(self, other, Itmi_Gold,35);
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PERM3		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_PERM3_Condition;
	information	 = 	DIA_Maleth_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ne vous mettez pas dans tous vos états.";
};

func int DIA_Maleth_PERM3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
	&& (Kapitel >= 3)
			{
					return TRUE;
			};
};

func void DIA_Maleth_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PERM3_15_00"); //Ne vous mettez pas dans tous vos états.
	AI_Output			(self, other, "DIA_Maleth_PERM3_08_01"); //(énervé) Fichez le camp.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Maleth_KAP4_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP4_EXIT_Condition;
	information	= DIA_Maleth_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Maleth_KAP5_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP5_EXIT_Condition;
	information	= DIA_Maleth_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP5_EXIT_Info()
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


INSTANCE DIA_Maleth_KAP6_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP6_EXIT_Condition;
	information	= DIA_Maleth_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maleth_PICKPOCKET (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 900;
	condition	= DIA_Maleth_PICKPOCKET_Condition;
	information	= DIA_Maleth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Maleth_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Maleth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maleth_PICKPOCKET);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_BACK 		,DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};
	
func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};






































































