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
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_00"); //(väterlich) Na, wo wollen wir denn hin?
	AI_Output			(other, self, "DIA_Bronko_HALLO_15_01"); //Bist du hier der Oberaufseher?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_06_02"); //Ich geb dir gleich 'n paar hinter die Ohren, du Bengel.
		};
		
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_03"); //Wenn du auf meinem Land entlang spazieren willst, kostet dich das 5 Goldmünzen, wenn du keine Prügel kassieren willst!
	
	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "Vergiss es. Von mir kriegst du gar nichts.", DIA_Bronko_HALLO_vergisses );
	Info_AddChoice	(DIA_Bronko_HALLO, "Wenn´s sein muß, hier hast du dein Geld.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "Dein Land? Bist du hier der Bauer?", DIA_Bronko_HALLO_deinland );

};

func void DIA_Bronko_HALLO_deinland ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_deinland_15_00"); //Dein Land? Bist du hier der Bauer?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_01"); //Na, das will ich meinen, oder meinst du etwa, sonst würde ich dir Wegzoll abknöpfen?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_02"); //Von mir aus kannst du die anderen ja mal nach mir fragen. Hehe!

};

func void DIA_Bronko_HALLO_hiergeld ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_hiergeld_15_00"); //Wenn's sein muss, hier hast du dein Geld.

	if ((Npc_HasItems (other,ItMi_Gold)) >= 5)
		{
			B_GiveInvItems (other, self, ItMi_Gold, 5);						

			AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_01"); //(verschmitzt) Danke. Schönen Tag noch.
		
			AI_StopProcessInfos (self);	 
		}
	else
		{
		 	AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_02"); //Du hast keine 5 Goldmünzen. Willst mich wohl verarschen, was?
		 	
		 	AI_StopProcessInfos (self);	 	
		 	B_Attack (self, other, AR_NONE, 1);	
		};
};

func void DIA_Bronko_HALLO_vergisses ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_vergisses_15_00"); //Vergiss es. Von mir kriegst du gar nichts.

	if ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_01"); //Dann muss ich dir jetzt leider den Arsch versohlen.
		}
	else
		{
			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_02"); //Ihr Jungs von der Stadtgarde habt wohl kein Geld, was?
			};
	
			if (hero.guild == GIL_KDF)
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_03"); //Auch wenn du Magier bist, hast du hier zu bezahlen. Klar?
			};		
		};

	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "Wenn´s sein muß, hier hast du dein Geld.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "Kannst es ja mal versuchen.", DIA_Bronko_HALLO_attack );
};

func void DIA_Bronko_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_attack_15_00"); //Kannst es ja mal versuchen.
	AI_Output			(self, other, "DIA_Bronko_HALLO_attack_06_01"); //Na, dann ...

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

	description	 = 	"Du willst der Bauer sein? Dass ich nicht lache.";
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
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_15_00"); //Du willst der Bauer sein? Dass ich nicht lache. Du hast hier gar nichts zu melden.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_06_01"); //Waas? Ich soll dir wohl die Fresse polieren.

	Info_ClearChoices	(DIA_Bronko_KEINBAUER);

	if (hero.guild == GIL_NONE)
		{
			if(Babera_BronkoKeinBauer == TRUE)
				{
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "(Bronko androhen, die Söldner zu holen)", DIA_Bronko_KEINBAUER_SLD );
				};
			if (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
				{	
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "Sekob ist hier der Bauer, und du bist nur ein kleiner Gauner.", DIA_Bronko_KEINBAUER_sekobderbauer );
				};
		};

	Info_AddChoice	(DIA_Bronko_KEINBAUER, "Na dann laß mal sehen, was du drauf hast.", DIA_Bronko_KEINBAUER_attack );
	Info_AddChoice	(DIA_Bronko_KEINBAUER, "Schon gut!", DIA_Bronko_KEINBAUER_schongut );

};

func void DIA_Bronko_KEINBAUER_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_attack_15_00"); //Na, dann lass mal sehen, was du drauf hast.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_attack_06_01"); //Ich hab gehofft, dass du das sagen würdest.
	
	AI_StopProcessInfos (self);	 	
	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Bronko_KEINBAUER_sekobderbauer ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_00"); //Sekob ist hier der Bauer, und du bist nur ein kleiner Gauner, der den Leuten die Kohle aus der Tasche zieht.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_01"); //Sagt wer?
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_02"); //Ich. Sekob will, dass du wieder arbeiten gehst, anstatt hier rum zu lungern.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_03"); //Na und? Was willst du jetzt tun?
};

func void DIA_Bronko_KEINBAUER_schongut ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_schongut_15_00"); //Schon gut!
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_schongut_06_01"); //Scher dich weg!

 	AI_StopProcessInfos (self);	 	
};

func void DIA_Bronko_KEINBAUER_SLD ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_00"); //Na gut, dann werde ich wohl dem Großbauern Onar sagen müssen, dass hier ein Bauer rumpöbelt, der seine Pacht nicht zahlen will.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_01"); //Ähm. Warte mal, Onar wird mir die ganzen Söldner auf den Hals hetzen.
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_02"); //Ja und?
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_03"); //Schon gut, schon gut. Du kannst von mir haben, was du willst, aber bloß nicht die Söldner, ok?

	if (B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self,ItMi_Gold)))
	{
		AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_04"); //Hier, du kriegst auch mein ganzes Gold.
	};
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_05"); //Ich gehe auch wieder aufs Feld. Bloß nicht die Söldner.

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

	description	 = 	"(Bronko verspotten)";
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
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_00"); //Na? Bist du auch schön fleißig?
		}
	else
		{
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_01"); //Na? Immer noch große Fresse?
		};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_02"); //Du bist ein Söldner, nicht wahr? Hätte ich mir fast denken können.
		}
	else if (MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_03"); //(ängstlich) Nicht die Söldner holen, hörst du?
		};

	if 	(
			(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		|| 	(hero.guild == GIL_SLD) 
		|| 	(hero.guild == GIL_DJG)
		)
			{
				AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_04"); //Nicht schlagen, bitte.
			};

	AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_05"); //Ich geh auch wieder arbeiten, ok?

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


















