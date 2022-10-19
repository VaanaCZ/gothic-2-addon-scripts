///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rega_EXIT   (C_INFO)
{
	npc         = BAU_933_Rega;
	nr          = 999;
	condition   = DIA_Rega_EXIT_Condition;
	information = DIA_Rega_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rega_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rega_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_HALLO		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	3;
	condition	 = 	DIA_Rega_HALLO_Condition;
	information	 = 	DIA_Rega_HALLO_Info;

	description	 = 	"Jak se vede?";
};

func int DIA_Rega_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rega_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rega_HALLO_15_00"); //Jak se vede?
	

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_01"); //Ty jsi z m�sta, co?
		}
	else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_02"); //Jsi jeden z t�ch Onarov�ch �old�k�, co?
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_03"); //Ty jsi m�g, co?
		}
	else
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_04"); //Ty nejsi jeden z n�s, co?

		};
		
	AI_Output			(self, other, "DIA_Rega_HALLO_17_05"); //Na tv�m m�st� bych odsud p�kn� rychle vypadla.
	AI_Output			(other, self, "DIA_Rega_HALLO_15_06"); //Pro�?
	AI_Output			(self, other, "DIA_Rega_HALLO_17_07"); //Nikdy to tady nebyl ��dn� med, ale alespo� jsme m�li klid po celou dobu, co d�l�me pro Sekoba.
	AI_Output			(self, other, "DIA_Rega_HALLO_17_08"); //Ale posledn� dobu u� je to nesnesiteln�.
	if (Kapitel < 3)
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_09"); //Banditi jsou �pln� v�ude, poln� �k�dci ni�� ve�kerou �rodu a z velkostatk��e se stal p�knej kru�as.
		};
};


///////////////////////////////////////////////////////////////////////
//	Info onar
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_ONAR		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	4;
	condition	 = 	DIA_Rega_ONAR_Condition;
	information	 = 	DIA_Rega_ONAR_Info;

	description	 = 	"Tak�e se boj�te velkostatk��e?";
};

func int DIA_Rega_ONAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Rega_ONAR_Info ()
{
	AI_Output			(other, self, "DIA_Rega_ONAR_15_00"); //Tak�e se boj�te velkostatk��e?
	AI_Output			(self, other, "DIA_Rega_ONAR_17_01"); //Se vsa�. Kdy� se mu nel�b� n��� ksicht, po�le na n�j sv� �old�ky. To je taky posledn� chv�le, kdy toho nebo��ka n�kdo uvid�.
	AI_Output			(self, other, "DIA_Rega_ONAR_17_02"); //Tak�e rad�j dr��me zob�k.

};



///////////////////////////////////////////////////////////////////////
//	Info sld
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_SLD		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	5;
	condition	 = 	DIA_Rega_SLD_Condition;
	information	 = 	DIA_Rega_SLD_Info;

	description	 = 	"Copak se o ty poln� �k�dce nepostaraj� �old�ci?";
};

func int DIA_Rega_SLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Rega_SLD_Info ()
{
	AI_Output			(other, self, "DIA_Rega_SLD_15_00"); //Copak se o ty poln� �k�dce nepostaraj� �old�ci?
	AI_Output			(self, other, "DIA_Rega_SLD_17_01"); //Nev�m, za co jsou placen�, ale ur�it� ne za pomoc n�m, oby�ejn�m lidem.
	AI_Output			(self, other, "DIA_Rega_SLD_17_02"); //Probl�m s poln�mi �k�dci je te� na mal�ch farm���ch, co si pronajali od Onara p�du.

};


///////////////////////////////////////////////////////////////////////
//	Info banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_BANDITEN		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	6;
	condition	 = 	DIA_Rega_BANDITEN_Condition;
	information	 = 	DIA_Rega_BANDITEN_Info;

	description	 = 	"Jak se br�n�te proti bandit�m?";
};

func int DIA_Rega_BANDITEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rega_BANDITEN_Info ()
{
	AI_Output			(other, self, "DIA_Rega_BANDITEN_15_00"); //Jak se br�n�te proti bandit�m?
	AI_Output			(self, other, "DIA_Rega_BANDITEN_17_01"); //Nijak. Prost� ute�eme. Je�t� n�co?

};


///////////////////////////////////////////////////////////////////////
//	Info bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_BRONKO		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	7;
	condition	 = 	DIA_Rega_BRONKO_Condition;
	information	 = 	DIA_Rega_BRONKO_Info;

	description	 = 	"(Zeptat se na Bronca.)";
};

func int DIA_Rega_BRONKO_Condition ()
{
	if	( 
		(Npc_KnowsInfo(other, DIA_Bronko_HALLO))
		&& (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
		)
			{
					return TRUE;
			};
};

func void DIA_Rega_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Rega_BRONKO_15_00"); //Tak kdo je ten hnusnej chl�pek t�mhle?
	AI_Output			(self, other, "DIA_Rega_BRONKO_17_01"); //Nep�eber si to �patn�, ale nechci se dostat do pot��. Zeptej se n�koho jin�ho.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	7;
	condition	 = 	DIA_Rega_PERMKAP1_Condition;
	information	 = 	DIA_Rega_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"No tak, trochu kur�e.";
};

func int DIA_Rega_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rega_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Rega_PERMKAP1_15_00"); //No tak, trochu kur�e.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_01"); //Tob� se to mluv�. Ty p�ece bydl� ve m�st�.
		}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_02"); //Kdyby ti �old�ci nebyli takov� hajzlov�, v�echno ostatn� by se dalo p�ekousnout.
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_03"); //M�g� je tu po��d m�� a m��. Douf�m, �e ty nejsi posledn�. Pot�ebujeme v�s - v�c ne� kdykoli jindy.
		}
		else
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_04"); //Nen� to tak snadn�, kdy� mak� pro toho otrok��sk�ho Sekoba.
		};
	AI_StopProcessInfos (self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rega_PICKPOCKET (C_INFO)
{
	npc			= BAU_933_Rega;
	nr			= 900;
	condition	= DIA_Rega_PICKPOCKET_Condition;
	information	= DIA_Rega_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Rega_PICKPOCKET_Condition()
{
	C_Beklauen (25, 40);
};
 
FUNC VOID DIA_Rega_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rega_PICKPOCKET);
	Info_AddChoice		(DIA_Rega_PICKPOCKET, DIALOG_BACK 		,DIA_Rega_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rega_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rega_PICKPOCKET_DoIt);
};

func void DIA_Rega_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rega_PICKPOCKET);
};
	
func void DIA_Rega_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rega_PICKPOCKET);
};










