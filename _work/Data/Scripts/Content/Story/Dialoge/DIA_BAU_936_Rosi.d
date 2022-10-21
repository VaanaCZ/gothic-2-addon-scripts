///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rosi_EXIT   (C_INFO)
{
	npc         = BAU_936_Rosi;
	nr          = 999;
	condition   = DIA_Rosi_EXIT_Condition;
	information = DIA_Rosi_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rosi_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Rosi_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_HALLO		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	3;
	condition	 = 	DIA_Rosi_HALLO_Condition;
	information	 = 	DIA_Rosi_HALLO_Info;

	description	 = 	"Tout va bien ?";
};

func int DIA_Rosi_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rosi_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_HALLO_15_00"); //Vous allez bien ?
	AI_Output			(self, other, "DIA_Rosi_HALLO_17_01"); //Eh bien, mon dos me fait mal � cause du travail. Que faites-vous ici ? Je n'ai pas souvent l'occasion d'avoir de la visite.

	if ((hero.guild != GIL_MIL))
	{
		AI_Output			(self, other, "DIA_Rosi_HALLO_17_02"); //G�n�ralement, ce sont soit des coupeurs de gorge des montagnes, soit des membres de cette horrible milice de la ville.
		AI_Output			(self, other, "DIA_Rosi_HALLO_17_03"); //Ces derniers temps, ils viennent piller nos fermes beaucoup plus souvent. Mais vous n'avez pas l'air d'�tre l'un d'eux, je me trompe ?
	};
};


///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	4;
	condition	 = 	DIA_Rosi_WASMACHSTDU_Condition;
	information	 = 	DIA_Rosi_WASMACHSTDU_Info;

	description	 = 	"Que faites-vous ici ?";
};

func int DIA_Rosi_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_HALLO))
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Rosi_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_WASMACHSTDU_15_00"); //Que faites-vous ici ?

	if (Npc_IsDead(Sekob)== FALSE)
	{
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_01"); //C'est ce que je me demande depuis plusieurs ann�es. S�kob, mon mari, s'est brouill� avec tout le monde dans la r�gion.
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_02"); //Il a des dettes partout. Et il vole des marchandises dans les r�serves d'Onar pour les vendre en ville.
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_03"); //Il a accumul� une vraie fortune avec ses magouilles.
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_04"); //Il fait m�me travailler nos ouvriers agricoles jusqu'� ce qu'ils se brisent le dos. Ses employ�s le surnomment l'esclavagiste.
	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_05"); //Je ne suis pas tr�s fi�re d'�tre la femme de S�kob, croyez-moi. Des fois, je me dis qu'il faudrait mieux que la Barri�re soit encore l�.
	};

	AI_Output			(self, other, "DIA_Rosi_WASMACHSTDU_17_06"); //Voudriez-vous acheter quelque chose � manger ou peut-�tre de quoi chasser dans la for�t ?
	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader,"Rosi propose diff�rentes marchandises dans la ferme de S�kob.");
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_WAREZ		(C_INFO)
{
	npc			 = 	BAU_936_Rosi;
	nr			 = 	2;
	condition	 = 	DIA_Rosi_WAREZ_Condition;
	information	 = 	DIA_Rosi_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Qu'avez-vous � m'offrir ?";
};

func int DIA_Rosi_WAREZ_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
		|| ((Kapitel >= 5)	&&	(Npc_KnowsInfo(other, DIA_Rosi_FLEEFROMSEKOB)))
		||  (Npc_IsDead(Sekob))
		)
		&& (MIS_bringRosiBackToSekob != LOG_SUCCESS)
		{
				return TRUE;
		};
};
func void DIA_Rosi_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Rosi_WAREZ_15_00"); //Qu'avez-vous � me proposer ?
	AI_Output (self, other, "DIA_Rosi_WAREZ_17_01"); //Que voulez-vous ?
};

///////////////////////////////////////////////////////////////////////
//	Info barriere
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_BARRIERE		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	6;
	condition	 = 	DIA_Rosi_BARRIERE_Condition;
	information	 = 	DIA_Rosi_BARRIERE_Info;

	description	 = 	"Barri�re ?";
};

func int DIA_Rosi_BARRIERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	&& (Npc_IsDead(Sekob)== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Rosi_BARRIERE_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_BARRIERE_15_00"); //La Barri�re ?
	AI_Output			(self, other, "DIA_Rosi_BARRIERE_17_01"); //Oui, le d�me qui recouvrait la vieille Vall�e des mines.
	AI_Output			(self, other, "DIA_Rosi_BARRIERE_17_02"); //De nombreux fermiers et ouvriers qui commettaient des crimes �taient envoy�s l�-bas et ils ne revenaient jamais.

};

///////////////////////////////////////////////////////////////////////
//	Info DuInBarriere
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_DuInBarriere		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	10;
	condition	 = 	DIA_Rosi_DuInBarriere_Condition;
	information	 = 	DIA_Rosi_DuInBarriere_Info;

	description	 = 	"Etes-vous d�j� all�e � la Barri�re ?";
};

func int DIA_Rosi_DuInBarriere_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_BARRIERE))
		{
				return TRUE;
		};
};

func void DIA_Rosi_DuInBarriere_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_DuInBarriere_15_00"); //Etes-vous d�j� all�e � la Barri�re ?
	AI_Output			(self, other, "DIA_Rosi_DuInBarriere_17_01"); //Non. On en a juste entendu parler. Bengar, le fermier des hauts p�turages, pourra certainement vous en dire plus.
	AI_Output			(self, other, "DIA_Rosi_DuInBarriere_17_02"); //Sa ferme est assez proche du col qui m�ne � la Vall�e des mines.

};


///////////////////////////////////////////////////////////////////////
//	Info Bengar
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_BENGAR		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	11;
	condition	 = 	DIA_Rosi_BENGAR_Condition;
	information	 = 	DIA_Rosi_BENGAR_Info;

	description	 = 	"Comment puis-je aller � la ferme de Bengar ?";
};

func int DIA_Rosi_BENGAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_DuInBarriere))
	&& (Npc_IsDead(Balthasar)==FALSE)
		{
				return TRUE;
		};
};

func void DIA_Rosi_BENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_BENGAR_15_00"); //Comment puis-je me rendre � la ferme de Bengar ?
	AI_Output			(self, other, "DIA_Rosi_BENGAR_17_01"); //Allez demander � Balthasar. C'est notre berger. Il lui arrive de mener son troupeau sur les p�turages de Bengar.
	AI_Output			(self, other, "DIA_Rosi_BENGAR_17_02"); //Il pourra vous dire comment vous y rendre.
		
};


///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_Miliz		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	7;
	condition	 = 	DIA_Rosi_Miliz_Condition;
	information	 = 	DIA_Rosi_Miliz_Info;

	description	 = 	"Pourquoi la milice attaque-t-elle vos fermes ?";
};

func int DIA_Rosi_Miliz_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	&& ((hero.guild != GIL_MIL))
		{
				return TRUE;
		};
};

func void DIA_Rosi_Miliz_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_Miliz_15_00"); //Pourquoi la milice s'en prend-elle � vous ?
	AI_Output			(self, other, "DIA_Rosi_Miliz_17_01"); //Car personne ne peut les emp�cher de piller nos fermes au lieu d'acheter des marchandises.
	AI_Output			(self, other, "DIA_Rosi_Miliz_17_02"); //Le roi est loin et tout ce que nous pouvons faire, c'est travailler pour Onar en esp�rant qu'il nous enverra de l'aide quand on en aura vraiment besoin.
};


///////////////////////////////////////////////////////////////////////
//	Info Onar
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_ONAR		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	8;
	condition	 = 	DIA_Rosi_ONAR_Condition;
	information	 = 	DIA_Rosi_ONAR_Info;

	description	 = 	"En quoi consiste l'aide d'Onar ?";
};

func int DIA_Rosi_ONAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_Miliz))
		{
				return TRUE;
		};
};

func void DIA_Rosi_ONAR_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_ONAR_15_00"); //En quoi consiste l'aide d'Onar ?
	AI_Output			(self, other, "DIA_Rosi_ONAR_17_01"); //Des fois nous recevons des avertissements quand la milice envisage de nous rendre une petite visite pour nous voler.
	AI_Output			(self, other, "DIA_Rosi_ONAR_17_02"); //Alors on envoie quelqu'un voir le vieux propri�taire terrien pour lui demander de l'aide.
	AI_Output			(self, other, "DIA_Rosi_ONAR_17_03"); //Puis, g�n�ralement, il ne faut pas longtemps pour que les mercenaires � son service arrivent ici et chassent la milice.
	AI_Output			(self, other, "DIA_Rosi_ONAR_17_04"); //Mais, l'un dans l'autre, les mercenaires ne valent pas mieux.
};

///////////////////////////////////////////////////////////////////////
//	Info Permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	80;
	condition	 = 	DIA_Rosi_PERMKAP1_Condition;
	information	 = 	DIA_Rosi_PERMKAP1_Info;
	permanent	 =	TRUE;
	description	 = 	"Tenez le coup.";
};

func int DIA_Rosi_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	|| ((Kapitel >= 5)	&&	(Npc_KnowsInfo(other, DIA_Rosi_FLEEFROMSEKOB)))
		{
					return TRUE;
			};
};

func void DIA_Rosi_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_PERMKAP1_15_00"); //Tenez le coup !


	if ((MIS_bringRosiBackToSekob == LOG_SUCCESS))
		{
			AI_Output			(self, other, "DIA_Rosi_PERMKAP1_17_01"); //Allez vous jeter dans le lac.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rosi_PERMKAP1_17_02"); //Prenez soin de vous et ne les laissez pas vous avoir.
		};
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Rosi_KAP3_EXIT(C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 999;
	condition	= DIA_Rosi_KAP3_EXIT_Condition;
	information	= DIA_Rosi_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rosi_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rosi_KAP3_EXIT_Info()
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

INSTANCE DIA_Rosi_KAP4_EXIT(C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 999;
	condition	= DIA_Rosi_KAP4_EXIT_Condition;
	information	= DIA_Rosi_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rosi_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rosi_KAP4_EXIT_Info()
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

INSTANCE DIA_Rosi_KAP5_EXIT(C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 999;
	condition	= DIA_Rosi_KAP5_EXIT_Condition;
	information	= DIA_Rosi_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rosi_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rosi_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FleefromSekob
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_FLEEFROMSEKOB		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	50;
	condition	 = 	DIA_Rosi_FLEEFROMSEKOB_Condition;
	information	 = 	DIA_Rosi_FLEEFROMSEKOB_Info;

	description	 = 	"Que faites-vous ici en pleine nature ?";
};

func int DIA_Rosi_FLEEFROMSEKOB_Condition ()
{
	if (Kapitel == 5)	
	&& (Rosi_FleeFromSekob_Kap5 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rosi_FLEEFROMSEKOB_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_FLEEFROMSEKOB_15_00"); //Que faites-vous ici en pleine nature ?
	AI_Output			(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_01"); //Je n'en pouvais plus � la ferme de S�kob. Il devient impossible.
	AI_Output			(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_02"); //A la fin, on ne pouvait m�me plus lui parler. Il ne savait que hurler.
	AI_Output			(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_03"); //Je dois m'en aller d'ici mais je ne sais pas o� aller.
	AI_Output			(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_04"); //Une petite affaire vous int�resserait-elle ?
	B_GivePlayerXP (XP_Ambient);
	RosiFoundKap5 = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_HILFE		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	51;
	condition	 = 	DIA_Rosi_HILFE_Condition;
	information	 = 	DIA_Rosi_HILFE_Info;

	description	 = 	"Je vais vous faire sortir d'ici.";
};

func int DIA_Rosi_HILFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_FLEEFROMSEKOB))
	&& (Rosi_FleeFromSekob_Kap5 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Rosi_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_HILFE_15_00"); //Je vais vous sortir de l�.

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Till.aivar[AIV_PARTYMEMBER] = TRUE;
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Rosi_HILFE_15_01"); //Je pourrais vous conduire en ville.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Rosi_HILFE_15_02"); //Je vais vous ramener � la ferme du propri�taire terrien.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Rosi_HILFE_15_03"); //Venez au monast�re, vous y serez la bienvenue.
		};	
		
		AI_Output			(self, other, "DIA_Rosi_HILFE_17_04"); //Jamais je n'oublierai ce que vous avez fait pour moi. Je vous paierai, naturellement.

			if (Npc_IsDead(Till))
			{
				AI_Output			(self, other, "DIA_Rosi_HILFE_17_05"); //Passez devant, je vous suis.
			}
			else
			{
				AI_Output			(self, other, "DIA_Rosi_HILFE_17_06"); //Passez devant, nous suivons.
			};
		
		AI_StopProcessInfos (self);	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			Npc_ExchangeRoutine	(self,"FollowCity"); 
			B_StartOtherRoutine (Till,"FollowCity"); 
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Npc_ExchangeRoutine	(self,"FollowBigfarm"); 
			B_StartOtherRoutine (Till,"FollowBigfarm"); 
		};

		if (hero.guild == GIL_KDF)
		{
			Npc_ExchangeRoutine	(self,"FollowKloster"); 
			B_StartOtherRoutine (Till,"FollowKloster"); 
		};	
		Log_CreateTopic (TOPIC_RosisFlucht, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RosisFlucht, LOG_RUNNING);
		B_LogEntry (TOPIC_RosisFlucht,"Rosi ne supportait plus de rester dans la ferme de S�kob. Maintenant, elle ne sait pas o� aller. Je vais l'escorter vers une zone civilis�e."); 
		MIS_RosisFlucht = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info angekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_ANGEKOMMEN		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	55;
	condition	 = 	DIA_Rosi_ANGEKOMMEN_Condition;
	information	 = 	DIA_Rosi_ANGEKOMMEN_Info;
	important	 = 	TRUE;

};

func int DIA_Rosi_ANGEKOMMEN_Condition ()
{
	if 	(Kapitel == 5)
	&&	(MIS_bringRosiBackToSekob != LOG_SUCCESS)
	&& (Rosi_FleeFromSekob_Kap5 == TRUE)
	&&	(
			(	(Npc_GetDistToWP(self,"CITY2")<6000) 	&& (hero.guild == GIL_PAL)	)
		||	(	(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02")<6000) 	&& (hero.guild == GIL_DJG)	)
		||	(	(Npc_GetDistToWP(self,"KLOSTER")<6000)  && (hero.guild == GIL_KDF)	)
		)
			{
				return TRUE;
			};
};

func void DIA_Rosi_ANGEKOMMEN_Info ()
{
	AI_Output			(self, other, "DIA_Rosi_ANGEKOMMEN_17_00"); //A partir d'ici, je trouverai mon chemin.
	AI_Output			(self, other, "DIA_Rosi_ANGEKOMMEN_17_01"); //Merci. J'ignore ce que j'aurais fait sans vous.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Till.aivar[AIV_PARTYMEMBER] = FALSE;

	MIS_bringRosiBackToSekob = LOG_OBSOLETE;
	MIS_RosisFlucht = LOG_SUCCESS;
		AI_Output			(self, other, "DIA_Rosi_ANGEKOMMEN_17_02"); //S'il vous pla�t, acceptez ce modeste don en r�compense.

		CreateInvItems (Rosi, ItMi_Gold, 650);									
		B_GiveInvItems (self, other, ItMi_Gold, 450);					

		if (Npc_IsDead(Till))
		{
			B_GivePlayerXP (XP_SavedRosi);
		}
		else
		{
			var int XPForBoth;
			XPForBoth = (XP_SavedRosi + XP_Ambient);
			B_GivePlayerXP (XPForBoth);
		};

		AI_StopProcessInfos (self);
	
			if	(Npc_GetDistToWP(self,"CITY2")<8000)
			{
				Npc_ExchangeRoutine	(self,"CITY");
				B_StartOtherRoutine (Till,"CITY");
			}
			else if	(Npc_GetDistToWP(self,"BIGFARM")<8000) 
			{
				Npc_ExchangeRoutine	(self,"BIGFARM");
				B_StartOtherRoutine (Till,"BIGFARM");
			}
			else if	(Npc_GetDistToWP(self,"KLOSTER")<8000)
			{
				Npc_ExchangeRoutine	(self,"KLOSTER");
				B_StartOtherRoutine (Till,"KLOSTER");
			}; 
};

///////////////////////////////////////////////////////////////////////
//	Info trait
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_TRAIT		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	55;
	condition	 = 	DIA_Rosi_TRAIT_Condition;
	information	 = 	DIA_Rosi_TRAIT_Info;

	description	 = 	"Voil�, vous �tes de retour chez vous.";
};

func int DIA_Rosi_TRAIT_Condition ()
{
	if (MIS_bringRosiBackToSekob == LOG_SUCCESS)
	&& (Rosi_FleeFromSekob_Kap5 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Rosi_TRAIT_Info ()
{
	AI_Output			(other, self, "DIA_Rosi_TRAIT_15_00"); //Voil�, vous �tes de nouveau � la maison.
	AI_Output			(self, other, "DIA_Rosi_TRAIT_17_01"); //Vous �tes la pire ordure que j'ai jamais rencontr�e, sale porc.
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_RosisFlucht = LOG_FAILED;
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_MinenAnteil		(C_INFO)
{
	npc		 = 	BAU_936_Rosi;
	nr		 = 	3;
	condition	 = 	DIA_Rosi_MinenAnteil_Condition;
	information	 = 	DIA_Rosi_MinenAnteil_Info;

	description	 = 	"Vendre des concessions mini�res ill�gales... Vous n'avez pas honte ?";
};

func int DIA_Rosi_MinenAnteil_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
		{
				return TRUE;
		};
};

func void DIA_Rosi_MinenAnteil_Info ()
{
	AI_Output (other, self, "DIA_Rosi_Minenanteil_15_00"); //Vendre des concessions mini�res ill�gales, n'avez-vous pas honte ?
	AI_Output (self, other, "DIA_Rosi_Minenanteil_17_01"); //Non. Moi aussi j'ai besoin de vivre et ce n'est pas moi qui les ai mises en circulation.
	B_GivePlayerXP (XP_Ambient);
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


INSTANCE DIA_Rosi_KAP6_EXIT(C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 999;
	condition	= DIA_Rosi_KAP6_EXIT_Condition;
	information	= DIA_Rosi_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rosi_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rosi_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rosi_PICKPOCKET (C_INFO)
{
	npc			= BAU_936_Rosi;
	nr			= 900;
	condition	= DIA_Rosi_PICKPOCKET_Condition;
	information	= DIA_Rosi_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Rosi_PICKPOCKET_Condition()
{
	C_Beklauen (30, 75);
};
 
FUNC VOID DIA_Rosi_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rosi_PICKPOCKET);
	Info_AddChoice		(DIA_Rosi_PICKPOCKET, DIALOG_BACK 		,DIA_Rosi_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rosi_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rosi_PICKPOCKET_DoIt);
};

func void DIA_Rosi_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rosi_PICKPOCKET);
};
	
func void DIA_Rosi_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rosi_PICKPOCKET);
};


















































