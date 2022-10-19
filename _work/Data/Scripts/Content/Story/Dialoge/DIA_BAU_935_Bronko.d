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
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_00"); //Dok¹d wiêc siê udajemy?
	AI_Output			(other, self, "DIA_Bronko_HALLO_15_01"); //Jesteœ tutaj zarz¹dc¹?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_06_02"); //Zaraz dam ci po ³bie, ³ajdaku.
		};
		
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_03"); //Je¿eli chcesz spacerowaæ po mojej ziemi, musisz zap³aciæ 5 z³otych monet, albo dostaniesz niez³y wycisk.
	
	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "Zapomnij o tym. Nic ode mnie nie dostaniesz.", DIA_Bronko_HALLO_vergisses );
	Info_AddChoice	(DIA_Bronko_HALLO, "Skoro nie mam wyboru - proszê, oto twoje pieni¹dze.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "Twojej ziemi? Uprawiasz j¹?", DIA_Bronko_HALLO_deinland );

};

func void DIA_Bronko_HALLO_deinland ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_deinland_15_00"); //Twojej ziemi? Uprawiasz j¹?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_01"); //Jasne. Z jakiej innej przyczyny musia³byœ mi p³aciæ?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_02"); //Mo¿esz iœæ i popytaæ o mnie, nie mam nic przeciwko. He, he!

};

func void DIA_Bronko_HALLO_hiergeld ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_hiergeld_15_00"); //Skoro nie mam wyboru - proszê, oto twoje pieni¹dze.

	if ((Npc_HasItems (other,ItMi_Gold)) >= 5)
		{
			B_GiveInvItems (other, self, ItMi_Gold, 5);						

			AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_01"); //Dziêkujê i ¿yczê mi³ego dnia.
		
			AI_StopProcessInfos (self);	 
		}
	else
		{
		 	AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_02"); //Nie masz nawet 5 z³otych monet. Chcesz siê wykrêciæ, co?
		 	
		 	AI_StopProcessInfos (self);	 	
		 	B_Attack (self, other, AR_NONE, 1);	
		};
};

func void DIA_Bronko_HALLO_vergisses ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_vergisses_15_00"); //Zapomnij o tym. Nic ode mnie nie dostaniesz.

	if ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_01"); //W takim wypadku obawiam siê, ¿e muszê wygarbowaæ ci skórê.
		}
	else
		{
			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_02"); //Wam w stra¿y miejskiej brakuje kasy, co?
			};
	
			if (hero.guild == GIL_KDF)
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_03"); //Nie obchodzi mnie, ¿e jesteœ magiem. I tak musisz zap³aciæ. Zrozumiano?
			};		
		};

	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "Skoro nie mam wyboru - proszê, oto twoje pieni¹dze.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "No to chodŸ i spróbuj.", DIA_Bronko_HALLO_attack );
};

func void DIA_Bronko_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_attack_15_00"); //No to chodŸ i spróbuj.
	AI_Output			(self, other, "DIA_Bronko_HALLO_attack_06_01"); //No có¿, w takim wypadku...

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

	description	 = 	"Ty, wieœniak? Nie rozœmieszaj mnie.";
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
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_15_00"); //Ty, wieœniak? Nie rozœmieszaj mnie. Jesteœ nikim, naprawdê.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_06_01"); //Cooo? Mam ci daæ w gêbê?

	Info_ClearChoices	(DIA_Bronko_KEINBAUER);

	if (hero.guild == GIL_NONE)
		{
			if(Babera_BronkoKeinBauer == TRUE)
				{
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "(Postrasz Bronka najemnikami)", DIA_Bronko_KEINBAUER_SLD );
				};
			if (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
				{	
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "Sekob uprawia tê ziemiê, a ty jesteœ tylko drobnym kanciarzem.", DIA_Bronko_KEINBAUER_sekobderbauer );
				};
		};

	Info_AddChoice	(DIA_Bronko_KEINBAUER, "No to poka¿, co potrafisz.", DIA_Bronko_KEINBAUER_attack );
	Info_AddChoice	(DIA_Bronko_KEINBAUER, "Niewa¿ne.", DIA_Bronko_KEINBAUER_schongut );

};

func void DIA_Bronko_KEINBAUER_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_attack_15_00"); //No to poka¿, co potrafisz.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_attack_06_01"); //Mia³em nadziejê, ¿e to powiesz.
	
	AI_StopProcessInfos (self);	 	
	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Bronko_KEINBAUER_sekobderbauer ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_00"); //Sekob uprawia tê ziemiê, a ty jesteœ tylko drobnym kanciarzem, który chce wy³udziæ od ludzi pieni¹dze.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_01"); //Kto tak powiedzia³?
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_02"); //Ja tak mówiê. Sekob chce, ¿ebyœ wróci³ do pracy, zamiast siê tu bezczynnie pêtaæ.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_03"); //I co z tego? Co teraz zamierzasz zrobiæ?
};

func void DIA_Bronko_KEINBAUER_schongut ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_schongut_15_00"); //Niewa¿ne.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_schongut_06_01"); //Spadaj!

 	AI_StopProcessInfos (self);	 	
};

func void DIA_Bronko_KEINBAUER_SLD ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_00"); //Dobrze, zatem muszê chyba powiedzieæ zarz¹dcy Onarowi, ¿e jest tu wieœniak, który odmawia p³acenia czynszu.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_01"); //Ehem. Poczekaj chwilkê. Onar wyœle za mn¹ wszystkich swoich najemników.
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_02"); //I co z tego?
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_03"); //No dobrze, dobrze. Dam ci, co tam chcesz, ale nie mieszajmy do tego najemników, w porz¹dku?

	if (B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self,ItMi_Gold)))
	{
		AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_04"); //Masz, oddam ci nawet ca³e moje z³oto.
	};
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_05"); //Wrócê ju¿ na swoje pole. Wszystko, byleby tylko nie najemnicy.

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

	description	 = 	"(Rozdra¿nij Bronka)";
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
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_00"); //Co tam? Uwijasz siê jak pszczó³ka, co?
		}
	else
		{
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_01"); //Co tam? Dalej gêba ci siê nie zamyka?
		};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_02"); //Jesteœ najemnikiem, prawda? Mog³em siê domyœliæ.
		}
	else if (MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_03"); //Nie sprowadzisz tu tych najemników, co?
		};

	if 	(
			(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		|| 	(hero.guild == GIL_SLD) 
		|| 	(hero.guild == GIL_DJG)
		)
			{
				AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_04"); //Proszê, nie bij mnie.
			};

	AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_05"); //Bêdê nawet... pracowa³, dobrze?

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


















