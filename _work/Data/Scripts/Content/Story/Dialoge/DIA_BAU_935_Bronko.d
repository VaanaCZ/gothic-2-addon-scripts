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
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_00"); //(otcovsky) Tak kampak, co?
	AI_Output			(other, self, "DIA_Bronko_HALLO_15_01"); //Ty jsi tady ��f?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_06_02"); //N�jakou ti vraz�m, ty lot�e.
		};
		
	AI_Output			(self, other, "DIA_Bronko_HALLO_06_03"); //Jestli se chce� poflakovat po mym pozemku, zapla� mi 5 zlat�ch, jinak si koleduje� o p�knej n��ez!
	
	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "Zapome� na to. Nic ode m� nedostane�.", DIA_Bronko_HALLO_vergisses );
	Info_AddChoice	(DIA_Bronko_HALLO, "Kdy� jinak ned� - tady jsou pen�ze.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "Tv�j pozemek? Ty jsi zdej�� statk��?", DIA_Bronko_HALLO_deinland );

};

func void DIA_Bronko_HALLO_deinland ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_deinland_15_00"); //Tv�j pozemek? Ty jsi zdej�� statk��?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_01"); //To se m��e� vsadit. Pro� bych po tob� jinak cht�l m�tn�?
	AI_Output			(self, other, "DIA_Bronko_HALLO_deinland_06_02"); //Je mi jedno, jestli se na m� bude� vypt�vat ostatn�ch. He, he!

};

func void DIA_Bronko_HALLO_hiergeld ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_hiergeld_15_00"); //Kdy� jinak ned� - tady jsou pen�ze.

	if ((Npc_HasItems (other,ItMi_Gold)) >= 5)
		{
			B_GiveInvItems (other, self, ItMi_Gold, 5);						

			AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_01"); //(�kodolib�) D�ky. A hezk� den.
		
			AI_StopProcessInfos (self);	 
		}
	else
		{
		 	AI_Output			(self, other, "DIA_Bronko_HALLO_hiergeld_06_02"); //Nem� ani 5 zlat�ch. Sna�� se m� oblafnout, co?
		 	
		 	AI_StopProcessInfos (self);	 	
		 	B_Attack (self, other, AR_NONE, 1);	
		};
};

func void DIA_Bronko_HALLO_vergisses ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_vergisses_15_00"); //Zapome� na to. Nic ode m� nedostane�.

	if ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_01"); //Tak to je mi l�to. Trochu ti p�ismahnu k��i.
		}
	else
		{
			if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_02"); //Vy ho�i od m�stsk� str�e nem�te dost pen�z, co?
			};
	
			if (hero.guild == GIL_KDF)
			{
				AI_Output			(self, other, "DIA_Bronko_HALLO_vergisses_06_03"); //Je mi jedno, jestli jsi m�g. Mus� zaplatit, jasn�?
			};		
		};

	Info_ClearChoices	(DIA_Bronko_HALLO);

	Info_AddChoice	(DIA_Bronko_HALLO, "Kdy� jinak ned� - tady jsou pen�ze.", DIA_Bronko_HALLO_hiergeld );
	Info_AddChoice	(DIA_Bronko_HALLO, "Tak si je zkus vz�t.", DIA_Bronko_HALLO_attack );
};

func void DIA_Bronko_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_HALLO_attack_15_00"); //Tak si je zkus vz�t.
	AI_Output			(self, other, "DIA_Bronko_HALLO_attack_06_01"); //Fajn, v tom p��pad�...

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

	description	 = 	"Takov� sedl�k jako ty? To bys m� rozesm�l. V�dy� jsi hotov� nicka!";
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
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_15_00"); //Ty, farm��? Nenech se vysm�t. Ve skute�nosti nejsi nikdo.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_06_01"); //Cooo? Chce�, abych ti zmaloval ksicht?

	Info_ClearChoices	(DIA_Bronko_KEINBAUER);

	if (hero.guild == GIL_NONE)
		{
			if(Babera_BronkoKeinBauer == TRUE)
				{
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "(Vyhro�ovat Broncovi, �e p�ivede� �oldn��e.)", DIA_Bronko_KEINBAUER_SLD );
				};
			if (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
				{	
					Info_AddChoice	(DIA_Bronko_KEINBAUER, "Sekob je zdej�� sedl�k a ty nejsi nic jin�ho ne� druho�ad� podvodn��ek.", DIA_Bronko_KEINBAUER_sekobderbauer );
				};
		};

	Info_AddChoice	(DIA_Bronko_KEINBAUER, "Dobr�, tak se teda pod�v�me, co m�.", DIA_Bronko_KEINBAUER_attack );
	Info_AddChoice	(DIA_Bronko_KEINBAUER, "Nevad�!", DIA_Bronko_KEINBAUER_schongut );

};

func void DIA_Bronko_KEINBAUER_attack ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_attack_15_00"); //Dobr�, tak se teda pod�v�me, co m�.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_attack_06_01"); //Doufal jsem, �e to �ekne�.
	
	AI_StopProcessInfos (self);	 	
	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Bronko_KEINBAUER_sekobderbauer ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_00"); //Zdej�� farm�� je Sekob a ty nejsi nic ne� mizern� podvodn�k, co se sna�� lidem tahat pen�ze z kapes.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_01"); //To ��k� kdo?
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_02"); //To ��k�m j�. Sekob chce, aby ses vr�til k pr�ci m�sto toho, aby ses tady fl�kal.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_03"); //Tak co? Co ud�l� te�?
};

func void DIA_Bronko_KEINBAUER_schongut ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_schongut_15_00"); //Nevad�!
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_schongut_06_01"); //Zmiz!

 	AI_StopProcessInfos (self);	 	
};

func void DIA_Bronko_KEINBAUER_SLD ()
{
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_00"); //Fajn, tak to bych m�l Onarovi ��ct, �e je tady n�jakej u�van�nej farm��, co odm�t� platit n�jem.
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_01"); //Ehm. Po�kej chvilku. Onar na m� po�le v�echny svoje �old�ky.
	AI_Output			(other, self, "DIA_Bronko_KEINBAUER_SLD_15_02"); //A co?
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_03"); //Dobr�, dobr�. D�m ti, co chce�, ale netahej do toho �old�ky, fajn?

	if (B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self,ItMi_Gold)))
	{
		AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_04"); //Tady, d�m ti v�echno svoje zlato.
	};
	AI_Output			(self, other, "DIA_Bronko_KEINBAUER_SLD_06_05"); //A vr�t�m se na pole. V�echno, jen ne �old�ky.

	AI_StopProcessInfos (self);	 	
	DIA_Bronko_KEINBAUER_noPerm = TRUE;
	Npc_ExchangeRoutine	(self,"Za��t"); 
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

	description	 = 	"(Vysm�vat se Broncovi)";
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
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_00"); //Tak? Piln� jako v�eli�ka, co?
		}
	else
		{
			AI_Output			(other, self, "DIA_Bronko_FLEISSIG_15_01"); //Tak? Po��d je�t� m� tak nevym�chanou hubu?
		};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_02"); //Ty jsi �old�k, �e jo? M�l jsem to v�d�t.
		}
	else if (MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_03"); //(vystra�en�) Nevykec� to �old�k�m, �e ne?
		};

	if 	(
			(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		|| 	(hero.guild == GIL_SLD) 
		|| 	(hero.guild == GIL_DJG)
		)
			{
				AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_04"); //Nemla� m�, pros�m.
			};

	AI_Output			(self, other, "DIA_Bronko_FLEISSIG_06_05"); //Vr�t�m se ke sv� pr�ci, fajn?

	MIS_Sekob_Bronko_eingeschuechtert	= LOG_SUCCESS;
	AI_StopProcessInfos (self);	 
	Npc_ExchangeRoutine	(self,"Za��t"); 
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


















