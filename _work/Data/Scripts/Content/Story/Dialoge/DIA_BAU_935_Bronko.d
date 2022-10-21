///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bronko_EXIT   (C_INFO)
{
	npc         = BAU_935_Bronko;
	nr          = 999;
	condition   = DIA_Bronko_EXIT_Condition;
	information = DIA_Bronko_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bronko_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bronko_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_HALLO		(C_INFO)
{
	npc		 = 	BAU_935_Bronko;
	nr		 = 	1;
	condition	 = 	DIA_Bronko_HALLO_Condition;
	information	 = 	DIA_Bronko_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Bronko_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Bronko_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_00"); //(sur un ton paternel) Que va-t-il advenir de nous alors ?
	AI_Output			(other, self, "DIA_Bronko_HALLO_15_01"); //Est-ce vous le contremaître ?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_06_02"); //Je vais t'en coller une, vaurien.
		};
		
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_03"); //Si vous voulez pénétrer sur mes terres, vous devez me payer 5 pièces d'or ou je vous flanque une bonne raclée.
	
	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "N'y songez même pas. Vous n'obtiendrez rien de moi.", DIA_Bronko_HALLO_vergisses );
	Info_AddChoice	(DIA_Bronko_HALLO, "Si je n'ai pas d'autre choix. Voici votre argent.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "Votre terre ? Etes-vous le fermier du coin ?", DIA_Bronko_HALLO_deinland );

};

func void DIA_Bronko_HALLO_deinland ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_deinland_15_00"); //Vos terres ? Vous êtes le fermier ?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_01"); //Vous pouvez en être sûr. Sinon pourquoi vous ferais-je payer un droit de passage ?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_02"); //Allez demander aux autres si vous voulez. Hé hé !

};

func void DIA_Bronko_HALLO_hiergeld ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_hiergeld_15_00"); //Je n'ai pas le choix. Voici votre argent.

	if ((Npc_HasItems (other,ItMi_Gold)) >= 5)
		{
			B_GiveInvItems (other, self, ItMi_Gold, 5);						

			AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_01"); //(malicieusement) Merci. Passez une bonne journée.
		
			AI_StopProcessInfos (self);	 
		}
	else
		{
		 	AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_02"); //Vous n'avez même pas 5 pièces d'or. Vous essayez de m'arnaquer, n'est-ce pas ?
		 	
		 	AI_StopProcessInfos (self);	 	
		 	B_Attack (self, other, AR_NONE, 1);	
		};
};

func void DIA_Bronko_HALLO_vergisses ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_vergisses_15_00"); //Laissez tomber. Vous n'obtiendrez rien de moi.

	if ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_01"); //Alors, je crains de devoir vous tanner le cuir.
		}
	else
		{
			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_02"); //Vous êtes un peu à court d'argent dans la garde de la ville, hein ?
			};
	
			if (hero.guild == GIL_KDF)
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_03"); //Je me fiche de savoir si vous êtes un magicien ou non. Vous devez payer. Compris ?
			};		
		};

	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "Si je n'ai pas d'autre choix. Voici votre argent.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "Alors venez l'essayer.", DIA_Bronko_HALLO_attack );
};

func void DIA_Bronko_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_attack_15_00"); //Alors essayez !
	AI_Output			(self, other, "DIA_Bronko_HALLO_attack_06_01"); //Dans ce cas...

	AI_StopProcessInfos (self);	 	
	B_Attack (self, other, AR_NONE, 1);	
};

///////////////////////////////////////////////////////////////////////
//	Info keinBauer
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_KEINBAUER		(C_INFO)
{
	npc		 = 	BAU_935_Bronko;
	nr		 = 	2;
	condition	 = 	DIA_Bronko_KEINBAUER_Condition;
	information	 = 	DIA_Bronko_KEINBAUER_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous, le fermier ? Ne me faites pas rire.";
};

var int DIA_Bronko_KEINBAUER_noPerm;

func int DIA_Bronko_KEINBAUER_Condition ()
{
	if 	(
		((MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)	|| (Babera_BronkoKeinBauer == TRUE))
		&&  (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
		&& (DIA_Bronko_KEINBAUER_noPerm == FALSE)
		)
		{
				return TRUE;
		};
};

func void DIA_Bronko_KEINBAUER_Info ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_15_00"); //Vous, le fermier ? Ne me faites pas rire. Vous n'êtes rien.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_06_01"); //Que... quoi ? Vous voulez que je vous casse la tête ?

	Info_ClearChoices	(DIA_Bronko_KEINBAUER);

	if (hero.guild == GIL_NONE)
		{
			if(Babera_BronkoKeinBauer == TRUE)
				{
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "(menacer Bronko d'aller chercher les mercenaires)", DIA_Bronko_KEINBAUER_SLD );
				};
			if (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
				{	
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "C'est Sékob le fermier ici et vous n'êtes qu'un filou à la petite semaine.", DIA_Bronko_KEINBAUER_sekobderbauer );
				};
		};

	Info_AddChoice	(DIA_Bronko_KEINBAUER, "Alors voyons ce que vous avez dans le ventre.", DIA_Bronko_KEINBAUER_attack );
	Info_AddChoice	(DIA_Bronko_KEINBAUER, "Laissez tomber !", DIA_Bronko_KEINBAUER_schongut );

};

func void DIA_Bronko_KEINBAUER_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_attack_15_00"); //Eh bien, voyons voir ce que vous avez dans le ventre.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_attack_06_01"); //J'espérais que vous diriez ça.
	
	AI_StopProcessInfos (self);	 	
	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Bronko_KEINBAUER_sekobderbauer ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_00"); //C'est Sékob le fermier ici et vous n'êtes rien d'autre qu'un petit escroc qui essaie de détrousser les gens.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_01"); //Ah oui ?
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_02"); //Oui. Sékob veut que vous retourniez travailler au lieu de fainéanter ici.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_03"); //Et alors ? Que comptez-vous faire ?
};

func void DIA_Bronko_KEINBAUER_schongut ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_schongut_15_00"); //Laissez tomber !
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_schongut_06_01"); //Fichez le camp !

 	AI_StopProcessInfos (self);	 	
};

func void DIA_Bronko_KEINBAUER_SLD ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_00"); //Très bien, je vais donc devoir dire à Onar qu'il y a ici un fermier qui débite des sottises et qui refuse de payer son loyer.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_01"); //Ahum. Attendez une minute. Onar va m'envoyer tous ses mercenaires.
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_02"); //Et alors ?
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_03"); //Très bien, très bien. Je vous donne ce que vous voulez mais ne mêlez pas les mercenaires à cette histoire, d'accord ?

	if (B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self,ItMi_Gold)))
	{
		AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_04"); //Tenez, je vous donne même mon or.
	};
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_05"); //Et je vais retourner aux champs. Tout mais pas les mercenaires.

	AI_StopProcessInfos (self);	 	
	DIA_Bronko_KEINBAUER_noPerm = TRUE;
	Npc_ExchangeRoutine	(self,"Start"); 
	MIS_Sekob_Bronko_eingeschuechtert = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info fleissig
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_FLEISSIG		(C_INFO)
{
	npc		 = 	BAU_935_Bronko;
	nr		 = 	3;
	condition	 = 	DIA_Bronko_FLEISSIG_Condition;
	information	 = 	DIA_Bronko_FLEISSIG_Info;
	permanent	 = 	TRUE;

	description	 = 	"(se moquer de Bronko)";
};

func int DIA_Bronko_FLEISSIG_Condition ()
{
	if 	(
		(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) 
		)
			{
					return TRUE;
			};
};

func void DIA_Bronko_FLEISSIG_Info ()
{
	
	if (MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		{
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_00"); //Alors ? Aussi occupé qu'une abeille, n'est-ce pas ?
		}
	else
		{
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_01"); //Alors ? Vous avez toujours une grande gueule ?
		};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_02"); //Vous êtes un mercenaire, hein ? J'aurais dû m'en douter.
		}
	else if (MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_03"); //(craintif) Vous n'allez pas aller chercher ces mercenaires, hein ?
		};

	if 	(
			(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		|| 	(hero.guild == GIL_SLD) 
		|| 	(hero.guild == GIL_DJG)
		)
			{
				AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_04"); //Ne me frappez pas, s'il vous plaît.
			};

	AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_05"); //Je vais même retourner travailler, d'accord ?

	MIS_Sekob_Bronko_eingeschuechtert	= LOG_SUCCESS;
	AI_StopProcessInfos (self);	 
	Npc_ExchangeRoutine	(self,"Start"); 
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bronko_PICKPOCKET (C_INFO)
{
	npc			= BAU_935_Bronko;
	nr			= 900;
	condition	= DIA_Bronko_PICKPOCKET_Condition;
	information	= DIA_Bronko_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Bronko_PICKPOCKET_Condition()
{
	C_Beklauen (54, 80);
};
 
FUNC VOID DIA_Bronko_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bronko_PICKPOCKET);
	Info_AddChoice		(DIA_Bronko_PICKPOCKET, DIALOG_BACK 		,DIA_Bronko_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bronko_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bronko_PICKPOCKET_DoIt);
};

func void DIA_Bronko_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bronko_PICKPOCKET);
};
	
func void DIA_Bronko_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bronko_PICKPOCKET);
};


















